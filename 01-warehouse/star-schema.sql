-- Warehouse tables for the Retail BI System (SQL Server 2025).
-- Built from Access Make Table queries and loaded with the SQL Server Import and Export Wizard,
-- which creates tables without constraints. Primary keys and fact-to-dimension relationships
-- are defined as logical keys in the SSAS data source views (04-cubes/*.dsv).

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DIM_Customer](
	[CustomerID] [int] NOT NULL,
	[BusinessName] [nvarchar](200) NULL,
	[CustomerType] [nvarchar](30) NULL,
	[CustomerAddress] [nvarchar](200) NULL,
	[PaymentTerms] [nvarchar](50) NULL,
	[CreditLimit] [money] NULL,
	[DiscountRate] [float] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DIM_Date](
	[DateID] [nvarchar](max) NULL,
	[FullDate] [datetime] NULL,
	[Day] [smallint] NULL,
	[Month] [smallint] NULL,
	[MonthName] [nvarchar](max) NULL,
	[Quarter] [nvarchar](max) NULL,
	[Year] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DIM_Delivery](
	[DeliveryID] [int] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[DeliveryStatus] [nvarchar](30) NULL,
	[VehicleNO] [nvarchar](20) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DIM_Employee](
	[EmployeeID] [int] NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[role] [nvarchar](30) NULL,
	[HireDate] [datetime] NULL,
	[salary] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DIM_Payment](
	[PaymentID] [int] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentMethod] [nvarchar](30) NULL,
	[ReceiptNO] [nvarchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DIM_Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[category] [nvarchar](50) NULL,
	[ProductType] [nvarchar](30) NULL,
	[UnitPrice] [money] NULL,
	[SupplierName] [nvarchar](100) NULL,
	[SupplierAddress] [nvarchar](200) NULL,
	[ShelfLifeDays] [smallint] NULL,
	[ShelfLifeMonths] [smallint] NULL,
	[ExpiryDate] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FACT_OrderFulfillment](
	[DateID] [nvarchar](255) NULL,
	[DeliveryID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[OrderRevenue] [money] NULL,
	[Mileage] [float] NULL,
	[PaymentAmount] [money] NULL,
	[PaymentGap] [money] NULL,
	[EmployeeID] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FACT_Sales](
	[DateID] [nvarchar](max) NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[quantity] [float] NULL,
	[UnitPrice] [money] NULL,
	[Revenue] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

