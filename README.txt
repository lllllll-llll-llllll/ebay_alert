autoit script for alerting you to new ebay listings

requires
-autoit

operation
-searches.txt contains all the search listings you want to monitor, followed by a comma, then an exact match you want to match in the listing titles to remove unrelated results, terminated with a newline. see 'searches.txt' for examples.
-run ebay-alert.au3
-you can add or delete searches within searches.txt at any time
-every 30 seconds all the ebay search results get scraped to find new listings
-a messagebox will display and show you the listing name, price, and condition, and ask if you want to view the listing in a browser
-once a new listing is found, the unique https://www.ebay.com/itm/XXXXXXXXXXXX url is added to found.txt and will never trigger an alert agin

















