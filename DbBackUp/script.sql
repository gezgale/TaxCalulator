USE [master]
GO
/****** Object:  Database [TaxCalculatorDB]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE DATABASE [TaxCalculatorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaxCalculatorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server17\MSSQL14.SQL2017\MSSQL\DATA\TaxCalculatorDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaxCalculatorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server17\MSSQL14.SQL2017\MSSQL\DATA\TaxCalculatorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TaxCalculatorDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaxCalculatorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaxCalculatorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaxCalculatorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaxCalculatorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TaxCalculatorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaxCalculatorDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TaxCalculatorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TaxCalculatorDB] SET  MULTI_USER 
GO
ALTER DATABASE [TaxCalculatorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaxCalculatorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaxCalculatorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaxCalculatorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TaxCalculatorDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TaxCalculatorDB', N'ON'
GO
ALTER DATABASE [TaxCalculatorDB] SET QUERY_STORE = OFF
GO
USE [TaxCalculatorDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[MobilePhoneNumber] [nvarchar](20) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProvinceId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongestionTaxHours]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongestionTaxHours](
	[CongestionTaxHoursID] [int] NOT NULL,
	[TimesInString] [nvarchar](max) NULL,
	[FromTimeOfCongestion] [datetime2](7) NOT NULL,
	[ToTimeOfCongestion] [datetime2](7) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_CongestionTaxHours] PRIMARY KEY CLUSTERED 
(
	[CongestionTaxHoursID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NonTaxableMonths]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NonTaxableMonths](
	[YearDef] [int] NOT NULL,
	[MonthDef] [int] NOT NULL,
 CONSTRAINT [PK_NonTaxableMonths] PRIMARY KEY CLUSTERED 
(
	[YearDef] ASC,
	[MonthDef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[ProvinceId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleName] [nvarchar](100) NOT NULL,
	[VehicleTypeID] [int] NOT NULL,
	[Model] [nvarchar](150) NOT NULL,
	[YearModel] [int] NOT NULL,
	[LicensePlate] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleTravelRecords]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTravelRecords](
	[TravelRecordID] [int] IDENTITY(1,1) NOT NULL,
	[TravelDate] [datetime2](7) NOT NULL,
	[TravelTime] [time](7) NOT NULL,
	[VehicleID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[AmountTax] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_VehicleTravelRecords] PRIMARY KEY CLUSTERED 
(
	[TravelRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleTypes]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleTypes](
	[VehicleTypeID] [int] NOT NULL,
	[VehicleTypeName] [nvarchar](100) NOT NULL,
	[IsTollFree] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleTypes] PRIMARY KEY CLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeekdayTaxs]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeekdayTaxs](
	[WeekdayTaxId] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[HasTax] [bit] NOT NULL,
	[WeekdayTaxYear] [int] NOT NULL,
 CONSTRAINT [PK_WeekdayTaxs] PRIMARY KEY CLUSTERED 
(
	[WeekdayTaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YearHolidays]    Script Date: 6/25/2023 2:31:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YearHolidays](
	[YearHolidayID] [int] NOT NULL,
	[YearHolidaysDay] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_YearHolidays] PRIMARY KEY CLUSTERED 
(
	[YearHolidayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230624031022_CreateDatabaseTables', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230624143319_CreateSecondPartsOfTablesWithData', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230624171204_CreateLastTablesAndHitories', N'5.0.17')
GO
INSERT [dbo].[Cities] ([CityId], [Name], [ProvinceId]) VALUES (1, N'Gothenburg', 1)
GO
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (1, N'06:00–06:29', CAST(N'2023-06-24T06:00:00.0000000' AS DateTime2), CAST(N'2023-06-24T06:29:59.0000000' AS DateTime2), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (2, N'06:30–06:59', CAST(N'2023-06-24T06:30:00.0000000' AS DateTime2), CAST(N'2023-06-24T06:59:59.0000000' AS DateTime2), CAST(13.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (3, N'07:00–07:59', CAST(N'2023-06-24T07:00:00.0000000' AS DateTime2), CAST(N'2023-06-24T07:59:59.0000000' AS DateTime2), CAST(18.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (4, N'08:00–08:29', CAST(N'2023-06-24T08:00:00.0000000' AS DateTime2), CAST(N'2023-06-24T08:29:59.0000000' AS DateTime2), CAST(13.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (5, N'08:30–14:59', CAST(N'2023-06-24T08:30:00.0000000' AS DateTime2), CAST(N'2023-06-24T14:59:59.0000000' AS DateTime2), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (6, N'15:00–15:29', CAST(N'2023-06-24T15:00:00.0000000' AS DateTime2), CAST(N'2023-06-24T15:29:59.0000000' AS DateTime2), CAST(13.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (7, N'15:30–16:59', CAST(N'2023-06-24T15:30:00.0000000' AS DateTime2), CAST(N'2023-06-24T16:59:59.0000000' AS DateTime2), CAST(18.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (8, N'17:00–17:59', CAST(N'2023-06-24T17:00:00.0000000' AS DateTime2), CAST(N'2023-06-24T17:59:59.0000000' AS DateTime2), CAST(13.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (9, N'18:00–18:29', CAST(N'2023-06-24T18:00:00.0000000' AS DateTime2), CAST(N'2023-06-24T18:29:59.0000000' AS DateTime2), CAST(8.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (10, N'18:30–05:59', CAST(N'2023-06-24T18:30:00.0000000' AS DateTime2), CAST(N'2023-06-24T23:59:59.0000000' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[CongestionTaxHours] ([CongestionTaxHoursID], [TimesInString], [FromTimeOfCongestion], [ToTimeOfCongestion], [Amount], [CityId]) VALUES (11, N'18:30–05:59', CAST(N'2023-06-24T00:00:00.0000000' AS DateTime2), CAST(N'2023-06-24T05:59:59.0000000' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (1, N'Sweden')
GO
INSERT [dbo].[NonTaxableMonths] ([YearDef], [MonthDef]) VALUES (2013, 7)
GO
INSERT [dbo].[Provinces] ([ProvinceId], [Name], [CountryId]) VALUES (1, N'Västra Götaland', 1)
GO
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (0, N'Motorcycle', 1)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (1, N'Tractor', 1)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (2, N'Emergency', 1)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (3, N'Diplomat', 1)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (4, N'Foreign', 1)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (5, N'Military', 1)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (6, N'Sedan', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (7, N'SUV', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (8, N'Hatchback', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (9, N'Convertible', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (10, N'Coupe', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (11, N'Minivan', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (12, N'Pickup Truck', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (13, N'Electric', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (14, N'Hybrid', 0)
INSERT [dbo].[VehicleTypes] ([VehicleTypeID], [VehicleTypeName], [IsTollFree]) VALUES (15, N'Luxury', 0)
GO
INSERT [dbo].[WeekdayTaxs] ([WeekdayTaxId], [DayOfWeek], [HasTax], [WeekdayTaxYear]) VALUES (1, 1, 1, 2013)
INSERT [dbo].[WeekdayTaxs] ([WeekdayTaxId], [DayOfWeek], [HasTax], [WeekdayTaxYear]) VALUES (2, 2, 1, 2013)
INSERT [dbo].[WeekdayTaxs] ([WeekdayTaxId], [DayOfWeek], [HasTax], [WeekdayTaxYear]) VALUES (3, 3, 1, 2013)
INSERT [dbo].[WeekdayTaxs] ([WeekdayTaxId], [DayOfWeek], [HasTax], [WeekdayTaxYear]) VALUES (4, 4, 1, 2013)
INSERT [dbo].[WeekdayTaxs] ([WeekdayTaxId], [DayOfWeek], [HasTax], [WeekdayTaxYear]) VALUES (5, 5, 1, 2013)
INSERT [dbo].[WeekdayTaxs] ([WeekdayTaxId], [DayOfWeek], [HasTax], [WeekdayTaxYear]) VALUES (6, 6, 0, 2013)
INSERT [dbo].[WeekdayTaxs] ([WeekdayTaxId], [DayOfWeek], [HasTax], [WeekdayTaxYear]) VALUES (7, 0, 0, 2013)
GO
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (1, CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (2, CAST(N'2013-02-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (3, CAST(N'2013-03-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (4, CAST(N'2013-04-16T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (5, CAST(N'2013-05-22T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (6, CAST(N'2013-06-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (7, CAST(N'2013-08-28T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (8, CAST(N'2013-09-24T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (9, CAST(N'2013-10-29T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[YearHolidays] ([YearHolidayID], [YearHolidaysDay]) VALUES (10, CAST(N'2013-11-26T00:00:00.0000000' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cities_ProvinceId]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Cities_ProvinceId] ON [dbo].[Cities]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CongestionTaxHours_CityId]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_CongestionTaxHours_CityId] ON [dbo].[CongestionTaxHours]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Provinces_CountryId]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Provinces_CountryId] ON [dbo].[Provinces]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vehicles_VehicleTypeID]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Vehicles_VehicleTypeID] ON [dbo].[Vehicles]
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VehicleTravelRecords_CityID]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_VehicleTravelRecords_CityID] ON [dbo].[VehicleTravelRecords]
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VehicleTravelRecords_VehicleID]    Script Date: 6/25/2023 2:31:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_VehicleTravelRecords_VehicleID] ON [dbo].[VehicleTravelRecords]
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Provinces_ProvinceId] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Provinces] ([ProvinceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Provinces_ProvinceId]
GO
ALTER TABLE [dbo].[CongestionTaxHours]  WITH CHECK ADD  CONSTRAINT [FK_CongestionTaxHours_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CongestionTaxHours] CHECK CONSTRAINT [FK_CongestionTaxHours_Cities_CityId]
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD  CONSTRAINT [FK_Provinces_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Provinces] CHECK CONSTRAINT [FK_Provinces_Countries_CountryId]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_VehicleTypes_VehicleTypeID] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VehicleTypes] ([VehicleTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_VehicleTypes_VehicleTypeID]
GO
ALTER TABLE [dbo].[VehicleTravelRecords]  WITH CHECK ADD  CONSTRAINT [FK_VehicleTravelRecords_Cities_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VehicleTravelRecords] CHECK CONSTRAINT [FK_VehicleTravelRecords_Cities_CityID]
GO
ALTER TABLE [dbo].[VehicleTravelRecords]  WITH CHECK ADD  CONSTRAINT [FK_VehicleTravelRecords_Vehicles_VehicleID] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VehicleTravelRecords] CHECK CONSTRAINT [FK_VehicleTravelRecords_Vehicles_VehicleID]
GO
USE [master]
GO
ALTER DATABASE [TaxCalculatorDB] SET  READ_WRITE 
GO
