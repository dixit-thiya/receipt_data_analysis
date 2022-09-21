-- Q3. When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT 
    rewardsreceiptstatus,
    AVG(totalspent) AS avg_spend
FROM
    receipt
WHERE
    rewardsreceiptstatus IN ('REJECTED' , 'FINISHED')
GROUP BY rewardsreceiptstatus
ORDER BY avg_spend DESC
LIMIT 1;
