USE [master]
GO
/****** Object:  Database [staj_db]    Script Date: 26.07.2025 17:36:17 ******/
CREATE DATABASE [staj_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'staj_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER1\MSSQL\DATA\staj_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'staj_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER1\MSSQL\DATA\staj_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [staj_db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [staj_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [staj_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [staj_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [staj_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [staj_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [staj_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [staj_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [staj_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [staj_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [staj_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [staj_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [staj_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [staj_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [staj_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [staj_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [staj_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [staj_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [staj_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [staj_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [staj_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [staj_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [staj_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [staj_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [staj_db] SET RECOVERY FULL 
GO
ALTER DATABASE [staj_db] SET  MULTI_USER 
GO
ALTER DATABASE [staj_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [staj_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [staj_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [staj_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [staj_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'staj_db', N'ON'
GO
ALTER DATABASE [staj_db] SET QUERY_STORE = OFF
GO
USE [staj_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [staj_db]
GO
/****** Object:  Table [dbo].[CustomerCars]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LicensePlate] [nvarchar](20) NULL,
	[PlateType] [nvarchar](50) NULL,
	[Make] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[VIN] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[EngineType] [nvarchar](50) NULL,
	[TransmissionType] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[WarrantyStartDate] [date] NULL,
	[WarrantyEndDate] [date] NULL,
	[WarrantyMaxMileage] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerContacts]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerContacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Type] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Type] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[HireDate] [date] NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[LastLogin] [datetime] NULL,
	[LastPresentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Type] [nvarchar](50) NULL,
	[Unit] [nvarchar](20) NULL,
	[Price] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryGroupItems]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryGroupItems](
	[InventoryID] [int] NOT NULL,
	[GroupID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryGroups]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryGroups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceLines]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLines](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[TaskLineID] [int] NULL,
	[InventoryID] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Quantity] [decimal](10, 2) NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[LineTotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[DateIssued] [date] NULL,
	[DueDate] [date] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
	[Notes] [nvarchar](255) NULL,
	[CustomerID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskLines]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskLines](
	[TaskLineID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[InventoryID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Quantity] [decimal](10, 2) NULL,
	[Description] [nvarchar](255) NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[LineTotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 26.07.2025 17:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CarID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[ReceivedAt] [datetime] NULL,
	[DeliveredAt] [datetime] NULL,
	[DelayReason] [nvarchar](255) NULL,
 CONSTRAINT [PK__Tasks__7C6949D1019CC99C] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerCars]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerContacts]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[InventoryGroupItems]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[InventoryGroups] ([GroupID])
GO
ALTER TABLE [dbo].[InventoryGroupItems]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD FOREIGN KEY([TaskLineID])
REFERENCES [dbo].[TaskLines] ([TaskLineID])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[TaskLines]  WITH CHECK ADD  CONSTRAINT [FK__TaskLines__TaskI__3B75D760] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[TaskLines] CHECK CONSTRAINT [FK__TaskLines__TaskI__3B75D760]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK__Tasks__CustomerI__31EC6D26] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK__Tasks__CustomerI__31EC6D26]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK__Tasks__ProjectID__30F848ED] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK__Tasks__ProjectID__30F848ED]
GO
USE [master]
GO
ALTER DATABASE [staj_db] SET  READ_WRITE 
GO
