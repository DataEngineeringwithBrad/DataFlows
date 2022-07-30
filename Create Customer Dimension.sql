CREATE TABLE dbo.DimCustomer
(
	CustomerKey INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_DimCustomer_CustomerKey PRIMARY KEY (CustomerKey),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DOB DATE NOT NULL,
	HomeAddressLine1 VARCHAR(50) NOT NULL,
	HomeAddressLine2 VARCHAR(50),
	HomeAddressCity VARCHAR(50) NOT NULL,
	HomeAddressPostcode VARCHAR(10) NOT NULL,
	SourceId INT NOT NULL,
	ValidFrom DATETIME2 NOT NULL,
	ValidTo DATETIME2 NOT NULL,
	IsValid BIT NOT NULL,
	CreatedDate DATETIME2 NULL,
	ModifiedDate DATETIME2 NULL
);