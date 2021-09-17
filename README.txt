autoit script for alerting you to new ebay listings

requires
-autoit

operation
-searches.txt contains all the search listings you want to monitor, separated by new lines (use ebay to search for something, apply search filters, then just copy/paste the url into searches.txt)
-run ebay-alert.au3
-you can add or delete searches within searches.txt at any time
-every 30 seconds all the ebay search results get scraped to find new listings
-a messagebox will display and show you the listing name, price, and condition, and ask if you want to view the listing in a browser
-once a new listing is found, the unique https://www.ebay.com/itm/XXXXXXXXXXXX url is added to found.txt and will never trigger an alert agin

















