CREATE TABLE dbo.CustomersSample
(
	CustomerId INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_CustomersSample_CustomerId PRIMARY KEY (CustomerId),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	DOB DATE NOT NULL,
	HomeAddressLine1 VARCHAR(50),
	HomeAddressLine2 VARCHAR(50),
	HomeAddressCity VARCHAR(50),
	HomeAddressPostcode VARCHAR(10)
);

INSERT INTO dbo.CustomersSample (FirstName, LastName, DOB, HomeAddressLine1, HomeAddressLine2, HomeAddressCity, HomeAddressPostcode)
VALUES
	('Domenic', 'Durrant', '19790620', '1 The Glens', 'Solihull', 'Birmingham', 'B1 6AZ'),
	('Joseph', 'Donnelly', '19920916', '56 Holmecroft Road', 'Tettenhall', 'Wolverhampton', 'WV10 9PY'),
	('Chester', 'Cattell', '19651127', '288 Spire Avenue', 'Langley', 'Telford', 'TF1 6ZD'),
	('Jacqueline', 'Judd', '19840208', 'The Stables', 'Jewellery Quarter', 'Birmingham', 'B6 9RP'),
	('Noah', 'Williams', '19481225', 'Flat 4, Priory Building', 'Sutton Coldfield', 'Birmingham', 'B16 5LP'),
	('Carter', 'Wren', '19820401', '100 Main Street', 'Perton', 'Wolverhampton', 'WV6 3RW'),
	('Ellen', 'Parker', '19680718', '5 South Street', 'Priory', 'Telford', 'TF6 1BV'),
	('Martin', 'Penn', '19560410', 'Apartment 20, The Square', 'Codsall', 'Wolverhampton', 'WV8 0AZ'),
	('Chris', 'Parsons', '19910101', '17 Field Avenue', 'Great Barr', 'Birmingham', 'B27 1FG'),
	('Eve', 'Cameron', '19880630', '16 The Crescent', 'Rawley', 'Telford', 'TF8 3BN');

CREATE TABLE dbo.ProductsSample
(
	ProductId INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_ProductsSample_ProductId PRIMARY KEY (ProductId),
	ProductName VARCHAR(50) NOT NULL
);

INSERT INTO dbo.ProductsSample (ProductName)
VALUES
	('Monitor'),
	('Laptop'),
	('PC'),
	('Tablet'),
	('Mobile Phone'),
	('Printer'),
	('Scanner'),
	('Headset');

CREATE TABLE dbo.ChannelsSample
(
	ChannelId INT NOT NULL IDENTITY(1, 1)
		CONSTRAINT PK_ChannelsSample_ChannelId PRIMARY KEY (ChannelId),
	Channel VARCHAR(50) NOT NULL,
	SubChannel VARCHAR(50) NULL
);

INSERT INTO dbo.ChannelsSample (Channel, SubChannel)
VALUES
	('Store', NULL),
	('Online', 'Website'),
	('Online', '3rd Party');