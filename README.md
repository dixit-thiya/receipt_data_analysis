# Analysis

Assumptions:
1. receiptItemId is a the primary key in the receiptItem table which is linked to receiptID
2. If the deleted field is Yes then the item will not counted as a purchased product (When a product is returned)
3. We have considered counting one brand only once in one reciept becuase if that defines the popularity of the brands.
	-If one receipt has 50 items of same brands and other hand one brand is present on 50 receipt that means 2nd case has more popularity.
4. In the first question were not actually looking at points are or any revenue related metric so we are not applyin the filter rewardsreceiptstatus = 'Finished' if the question was related to revenue  or bonus points we would apply the filter


Construct an email or slack message that is understandable to a product or business leader who isn’t familiar with your day to day work. This part of the exercise should show off how you communicate and reason about data with others. Commit your answers to the git repository along with the rest of your exercise.

### 1. What questions do you have about the data?
A:	The different date fields captured in the receipts dataset such as dateScanned, finishDate, createDate,etc. why do we have different types of dates and how are they significant to the business?

### 2.	How did you discover the data quality issues?
A: 1. During the exploratory data analysis stage I found out that the users data has key value pair of '_id' that stores the user id for each user. I found out duplicate dictiories for mulitple user ids in the user data file. Given that I am using the userID as the primary key for the users table. The userid should be unique and in the users data file.\
\
2. Querying the brands table I found out that many items in the brand table have null values in the category column. Category is a curcial data point that helps us understand the customer purchases and it is extremely imporant to have category associated to each item.\
\
3. When I dig into the rewardsReceiptItemList dictionary in the receipts dataset. I found out there were multiple items missing key value pair for barcode and brandcode. If we are not able to retrieve brandcode or barcode for items on the list, It doesn't actually show us the whole picture of purhcase history and the customer purchase behavior for that specific customer. So every item on the receipt should have barcode and brandcode associated to it to understand customer purchase pattern for different categories and brands.

### 3. What do you need to know to resolve the data quality issues?
A:	Understanding the process of the data collection and the reason behind why we have a lot of missing data points can help us find solution on how to make the process better in order to collect more data points for receipts and brands dataset.

### 4. What other information would you need to help you optimize the data assets you're trying to create?
A: 

### 5. What performance and scaling concerns do you anticipate in production and how do you plan to address them?
A: If we don't remove duplicates from the users dataset, It might lead us to wrong direction. Removing duplicates increases one more step to achieve data integrity of the database. 
