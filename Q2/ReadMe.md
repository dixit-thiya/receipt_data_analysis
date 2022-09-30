Assumptions:
1. `receiptItemId` is a the primary key in the `receiptItem` table which is linked to `receiptID`.
2. We have considered counting distinct brands in each reciept becuase that defines the popularity of the brands.
	-If one receipt has 50 items of same brands and on the other hand one brand is present on 50 different receipt that means 2nd case has more popularity.
3. In the first question were not actually looking at points are or revenue related metric that is the reason we are not applying the filter `rewardsreceiptstatus = 'Finished'` if the question was related to revenue  or bonus points we would apply this filter in the query.
