
As we continue designing the CSVs, I suggest we adopt one consistent principle:

**Master Data**
customer.csv
driver.csv
vehicle.csv
city.csv
promotion.csv

Contain only attributes of that entity.

**Transaction Data**
trip.csv
payment.csv
rating.csv

Contain relationships between entities.
