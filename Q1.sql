-- What are the top 5 brands by receipts scanned for most recent month?
-- I'm using mysql language to query the results

SELECT *
FROM   (SELECT NAME as name,
               total_receipt_count,
               Dense_rank()
                 OVER(
                   ORDER BY total_receipt_count DESC) AS rnk
        FROM  (SELECT NAME,
                      Count(NAME) AS total_receipt_count
               FROM   (SELECT receiptid,
                              NAME,
                              Count(DISTINCT NAME) AS dist_count  -- Finding out distinct brands scanned in each receipt, if PEPSI is scanned 3 times in one receipt we'll only count it 1 
                       FROM   receipt_line_items r
                              INNER JOIN brands b
                                      ON r.barcode = b.barcode
                                          OR r.brandcode = b.brandcode
                              INNER JOIN receipt rt
                                      ON rt.id = r.receiptid
                       WHERE
                       rt.datescanned >= DATE_ADD(LAST_DAY(NOW() - INTERVAL 2 MONTH), INTERVAL 1 DAY) -- filtering it for last month
                                   AND rt.datescanned < DATE_ADD(LAST_DAY(NOW() - INTERVAL 1 MONTH), INTERVAL 1 DAY)
                       GROUP  BY r.receiptid,
                                 NAME) a
               GROUP  BY NAME
               ORDER  BY total_receipt_count DESC) b) c
WHERE  rnk < 6; 
