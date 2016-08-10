#TEMP GAUGE

Temp Gauge is an app where users can simply input two dates and zip code to receive an average high, low, and mean temperature for that area between the two dates.

The app is hosted on Heroku at http://temp-gauge.herokuapp.com/

Temperature data comes from Weather Underground's API. Because the app is presently in a demo state, it utilizes a free key to Weather Underground, which means it can only handle making at most 10 calls per minute and 500 calls per day. As such, for testing purposes, please limit selected dates to a range of a total of 10 or less dates.
