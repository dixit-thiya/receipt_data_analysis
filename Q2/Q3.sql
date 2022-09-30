-- Q3. When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT 
    rewardsreceiptstatus,
    AVG(totalspent) AS avg_spend
FROM
    receipt
WHERE
-- Only looking at 'REJECTED' and 'FINISHED' status in the rewardsreceiptstatus column
    rewardsreceiptstatus IN ('REJECTED' , 'FINISHED') -- Couldn't find 'Accepted' status in the column so instead using 'FINISHED' as accepted
GROUP BY rewardsreceiptstatus
ORDER BY avg_spend DESC
LIMIT 1;
