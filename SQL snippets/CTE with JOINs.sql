WITH CTE AS
(
 SELECT
  SalesId,
  SUM(LineTotal) AS SalesTotal
 FROM dbo.SalesDetails
 GROUP BY
  SalesId
)

SELECT
 SalesDetailsId,
 A.SalesId,
 SalesDate,
 ProductId,
 Price,
 Quantity,
 LineTotal,
 SalesTotal
FROM dbo.SalesDetails AS A
INNER JOIN CTE AS B
 ON A.SalesId = B.SalesId;