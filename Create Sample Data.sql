-- set variables
DECLARE 
	@TotalRows INT = 1000000,
	@Customers INT = 10,
	@NoOfOrders INT = 30000,
	@Products INT = 8,
	@Channels INT = 3,
	@Days INT = 365;

WITH 
L0 AS (SELECT 1 AS N UNION ALL SELECT 1),
L1 AS (SELECT 1 AS N FROM L0 AS A CROSS JOIN L0 AS B),
L2 AS (SELECT 1 AS N FROM L1 AS A CROSS JOIN L1 AS B),
L3 AS (SELECT 1 AS N FROM L2 AS A CROSS JOIN L2 AS B),
L4 AS (SELECT 1 AS N FROM L3 AS A CROSS JOIN L3 AS B),
L5 AS (SELECT 1 AS N FROM L4 AS A CROSS JOIN L4 AS B),
LimitRows AS (SELECT TOP(@TotalRows) N FROM L5),
StartQuery AS
(
	SELECT
		ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS OrderLineId,
		NTILE(@Customers) OVER(ORDER BY (SELECT NULL)) AS Customer,
		CAST(ABS(CHECKSUM(NEWID())) / 1000000.00 AS DECIMAL(6, 2)) AS Amount
	FROM LimitRows
),
AddAttributes AS
(
	SELECT
		*,
		NTILE(@NoOfOrders) OVER(PARTITION BY Customer ORDER BY (SELECT NULL)) AS OrderNumber,
		NTILE(@Products) OVER(PARTITION BY Customer ORDER BY (SELECT NULL)) AS Product,
		NTILE(@Channels) OVER(PARTITION BY Customer ORDER BY (SELECT NULL)) AS Channel,
		NTILE(@Days) OVER(PARTITION BY Customer ORDER BY (SELECT NULL)) AS [Days]
	FROM StartQuery
)

SELECT
	A.OrderLineId,
	A.OrderNumber,
	CAST(DATEADD(DAY, [Days], '20201231') AS DATE) AS OrderDate,
	B.CustomerId,
	B.FirstName,
	B.LastName,
	B.DOB,
	B.HomeAddressLine1,
	B.HomeAddressLine2,
	B.HomeAddressCity,
	B.HomeAddressPostcode,
	C.ProductId,
	C.ProductName,
	D.ChannelId,
	D.Channel,
	D.SubChannel,
	A.Amount
FROM AddAttributes AS A
INNER JOIN dbo.CustomersSample AS B
	ON A.Customer = CustomerId
INNER JOIN dbo.ProductsSample AS C
	ON A.Product = C.ProductId
INNER JOIN dbo.ChannelsSample AS D
	ON A.Channel = D.ChannelId;