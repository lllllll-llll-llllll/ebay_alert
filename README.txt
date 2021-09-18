autoit script for alerting you to new ebay listings

requires
-autoit

operation
-add searches you wish to monitor to search.txt, syntax is as follows:
<REQUIRED: URL OF EBAY SEARCH>,<OPTIONAL: INCLUDE THIS TERM IN LISTING TITLE>,<OPTIONAL: EXCLUDE THIS TERM IN LISTING TITLE>
-examples:
https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw=10tb+hdd&_sacat=0,, (include/exclude both omitted)
https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw=10tb+hdd&_sacat=0,enclosure, (include: 
'enclosure', exclude omitted)
https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw=10tb+hdd&_sacat=0,enclosure,bay (include: 'enclosure', exclude: 'bay')

-run ebay-alert.au3
-you can add or delete searches within searches.txt at any time
-every 30 seconds all the ebay search results get scraped to find new listings
-a messagebox will display and show you the listing name, price, and condition, and ask if you want to view the listing in a browser
-once a new listing is found, the unique https://www.ebay.com/itm/XXXXXXXXXXXX url is added to found.txt and will never trigger an alert agin

















