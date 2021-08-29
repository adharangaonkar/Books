SELECT
 SalesDetailsId,
 SalesId,
 SalesDate,
 ProductId,
 Price,
 Quantity,
 LineTotal,
 SUM(LineTotal) OVER(PARTITION BY SalesId) AS SalesTotal,
 COUNT(SalesDetailsId) OVER(PARTITION BY SalesId) AS SalesCount,
 SUM(LineTotal) OVER(PARTITION BY SalesDate) AS DailyTotal,
 SUM(LineTotal) OVER(PARTITION BY SalesDate, ProductId) AS DailyProductSales,
 SUM(LineTotal) OVER() AS SalesGrandTotal,
 100 * SUM(LineTotal) OVER(PARTITION BY SalesId) / SUM(LineTotal) OVER() AS pcttotal
FROM dbo.SalesDetails
ORDER BY SalesId