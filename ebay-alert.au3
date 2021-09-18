#include <Array.au3>
#include <File.au3>

while 1
	local $searches[0]
	local $includes[0]
	local $excludes[0]

	$queries = FileReadToArray('searches.txt')
	;form searches
	for $s = 0 to ubound($queries)-1
		$temp = stringsplit($queries[$s], ',', 3)
		_ArrayAdd($searches, $temp[0])
	next

	;form includes/escludes
	for $e = 0 to ubound($queries)-1
		$temp = stringsplit($queries[$e], ',', 3)
		if $temp[1] <> '' then
			_arrayadd($includes, $temp[1])
		else
			_arrayadd($includes, false)
		endif

		;excludes
		if $temp[2] <> '' then
			_arrayadd($excludes, $temp[2])
		else
			_arrayadd($excludes, false)
		endif

	next


	for $s = 0 to ubound($searches)-1
		$url = $searches[$s]
		inetget($url, 'response.txt')
		$html = FileReadToArray('response.txt')

		for $i = 0  to ubound($html)-1

			if StringInStr($html[$i], '</style><div class=') then
				;this is all the listings, but it's junk and messy
				$listings = stringsplit($html[$i], '<div class=s-item__image-wrapper><div class=s-item__image-helper></div><img class=s-item__image-img alt="', 3)
				_arraydelete($listings, 0)

				for $j = 0 to ubound($listings)-1
					;listing name
					$name = stringsplit($listings[$j], '"', 2)
					$name = $name[0]

					;check for included term within listing name
					$include = $includes[$s]
					if ($include <> false) then
						if not stringinstr($name, $include) then continueloop
					endif

					;check for excluded term in listing name
					$exclude = $excludes[$s]
					if ($exclude <> false) then
						if stringinstr($name, $exclude) then continueloop
					endif


					;listing url/id (should be unique)
					$id = stringsplit($listings[$j], 'item__link href=', 3)
					$id = stringsplit($id[1], '?', 3)
					$id = $id[0]

					;price
					$price = stringsplit($listings[$j], '<span class=s-item__price>', 3)
					if ubound($price) > 1 then
						$price = stringsplit($price[1], '.', 3)
						$price = stringsplit($price[0], '$', 3)
						$price = $price[1]
					else
						$price = '?'
					endif

					;condition
					$condition = stringsplit($listings[$j], '<span class=SECONDARY_INFO>', 3)
					if ubound($condition) > 1 then
						$condition = stringsplit($condition[1], '<', 3)
						$condition = $condition[0]
					else
						$condition = '?'
					endif


					;check if the listing has been found before already, in which case we dont proceed further
					$found = FileReadToArray('found.txt')
					$good = true
					for $f = 0 to ubound($found)-1
						if $found[$f] = $id then
							$good = false
							exitloop
						endif
					next

					if $good = true then
						;add listing to log
						_ArrayAdd($found, $id)
						FileWriteLine('found.txt', $id)

						;user prompt for opening listing in browser
						Beep(200, 250)
						$button = msgbox(52, 'New ebay listing found', $price & ' USD · ' & $condition &  @crlf & $name & @crlf & @crlf & 'View listing?' )
						if $button = 6 then
							Beep(100, 50)
							ShellExecute($id)
							sleep(1000)
						else
							sleep(1000)
						endif

					endif


				next ;j

				exitloop

			endif

		next ;i


	next ;s

	sleep(30000) ;30 seconds between each check

wend







































