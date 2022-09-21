-- Q4. When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT 
    rewardsreceiptstatus,
    SUM(purchaseditemcount) AS total_item_count
FROM
    receipt
WHERE
-- Only looking at 'REJECTED' and 'FINISHED' status in the rewardsreceiptstatus column
    rewardsreceiptstatus IN ('REJECTED' , 'FINISHED') -- Couldn't find 'Accepted' status in the column so instead using 'FINISHED' as accepted
GROUP BY rewardsreceiptstatus
ORDER BY total_item_count DESC
LIMIT 1;
