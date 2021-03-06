USE [master]
GO
/****** Object:  Database [EMetro]    Script Date: 6/17/2021 4:22:09 PM ******/
CREATE DATABASE [EMetro]



 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMetro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMetro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EMetro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EMetro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EMetro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMetro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMetro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMetro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMetro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMetro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMetro] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMetro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMetro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMetro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMetro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMetro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMetro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMetro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMetro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMetro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMetro] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EMetro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMetro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMetro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMetro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMetro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMetro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMetro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMetro] SET RECOVERY FULL 
GO
ALTER DATABASE [EMetro] SET  MULTI_USER 
GO
ALTER DATABASE [EMetro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMetro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMetro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMetro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EMetro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EMetro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EMetro', N'ON'
GO
ALTER DATABASE [EMetro] SET QUERY_STORE = OFF
GO
USE [EMetro]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Website] [nvarchar](max) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthlyTicket]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyTicket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdType] [int] NULL,
	[RailwayID] [int] NULL,
	[ClientName] [nvarchar](max) NULL,
	[CLientIdentity] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[StartDate] [varchar](50) NULL,
	[ExpireDate] [varchar](50) NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RailWay]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RailWay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[DepartureID] [int] NULL,
	[DestinationID] [int] NULL,
	[Price] [money] NULL,
	[OwnedCompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandarTicket]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandarTicket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RailwayID] [int] NULL,
	[DepartDate] [smalldatetime] NULL,
	[DepartHour] [time](7) NULL,
	[IdType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Station](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Address] [nvarchar](100) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketSold]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketSold](
	[SoldID] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NULL,
	[RailwayID] [int] NULL,
	[IdType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketType](
	[Id] [int] NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 4:22:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NULL,
	[IdRole] [int] NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [DisplayName], [Website], [Address], [Phone]) VALUES (1, N'Ullrich-Lind', N'timesonline.co.uk', N'80599 School Center', N'947-781-3345')
INSERT [dbo].[Company] ([Id], [DisplayName], [Website], [Address], [Phone]) VALUES (2, N'Swaniawski-Rohan', N'blogtalkradio.com', N'6 Linden Terrace', N'755-663-8965')
INSERT [dbo].[Company] ([Id], [DisplayName], [Website], [Address], [Phone]) VALUES (3, N'McGlynn, Hilpert and Ratke', N'bandcamp.com', N'867 Acker Avenue', N'950-661-3028')
INSERT [dbo].[Company] ([Id], [DisplayName], [Website], [Address], [Phone]) VALUES (4, N'Hermiston, Feeney and Donnelly', N'nps.gov', N'32512 Hoard Street', N'753-824-7416')
INSERT [dbo].[Company] ([Id], [DisplayName], [Website], [Address], [Phone]) VALUES (5, N'Weber and Sons', N'hud.gov', N'3 Talisman Trail', N'386-770-7992')
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[MonthlyTicket] ON 

INSERT [dbo].[MonthlyTicket] ([Id], [IdType], [RailwayID], [ClientName], [CLientIdentity], [Phone], [StartDate], [ExpireDate], [Price]) VALUES (1, 2, 12, N'Nguyen The Dan', N'195213121', N'09966830889', N'14/06/2021', N'14/07/2021', NULL)
SET IDENTITY_INSERT [dbo].[MonthlyTicket] OFF
GO
SET IDENTITY_INSERT [dbo].[RailWay] ON 

INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (1, N'Miller', 1, 2, 50000.0000, 1)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (2, N'Corry', 2, 3, 80000.0000, 3)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (3, N'Blue Bill Park', 6, 1, 60000.0000, 2)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (4, N'Meadow Ridge', 20, 5, 20000.0000, 5)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (5, N'Shopko', 8, 16, 90000.0000, 4)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (6, N'Twin Pines', 8, 9, 90000.0000, 5)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (7, N'Merry', 5, 9, 60000.0000, 4)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (8, N'Armistice', 13, 20, 100000.0000, 5)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (9, N'Waywood', 6, 16, 80000.0000, 5)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (10, N'Ryan', 17, 18, 60000.0000, 1)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (11, N'Mccormick', 3, 16, 40000.0000, 4)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (12, N'Sachtjen', 14, 17, 100000.0000, 5)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (13, N'Annamark', 12, 2, 90000.0000, 5)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (14, N'Reindahl', 4, 19, 60000.0000, 1)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (15, N'Hollow Ridge', 18, 13, 100000.0000, 5)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (16, N'Stang', 17, 18, 80000.0000, 2)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (17, N'Continental', 17, 7, 30000.0000, 2)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (18, N'Eastwood', 13, 8, 40000.0000, 3)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (19, N'Fallview', 12, 13, 90000.0000, 3)
INSERT [dbo].[RailWay] ([Id], [DisplayName], [DepartureID], [DestinationID], [Price], [OwnedCompanyId]) VALUES (20, N'Talmadge', 3, 11, 40000.0000, 1)
SET IDENTITY_INSERT [dbo].[RailWay] OFF
GO
SET IDENTITY_INSERT [dbo].[StandarTicket] ON 

INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (1, 8, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'20:17:07' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (2, 5, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'21:08:27' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (3, 9, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'17:59:27' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (4, 20, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'09:12:57' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (5, 16, CAST(N'2021-06-10T00:00:00' AS SmallDateTime), CAST(N'08:09:59' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (6, 9, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'16:27:14' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (7, 18, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'01:40:39' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (8, 3, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'14:23:09' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (9, 16, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'16:34:04' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (10, 17, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'01:40:29' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (11, 4, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'09:55:23' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (12, 12, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'20:08:33' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (13, 18, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'06:26:38' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (14, 10, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'22:01:54' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (15, 10, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'21:11:22' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (16, 3, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'05:23:47' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (17, 2, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'18:34:27' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (18, 1, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'04:52:07' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (19, 13, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'11:40:08' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (20, 5, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'10:42:12' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (21, 10, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'03:27:24' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (22, 18, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'17:33:33' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (23, 17, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'20:15:56' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (24, 2, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'21:50:30' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (25, 12, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'09:46:12' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (26, 12, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'01:58:16' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (27, 2, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'11:55:32' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (28, 9, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'21:34:13' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (29, 8, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'22:05:08' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (30, 11, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'12:46:23' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (31, 19, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'15:54:59' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (32, 10, CAST(N'2021-06-10T00:00:00' AS SmallDateTime), CAST(N'18:52:56' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (33, 5, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'03:48:11' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (34, 14, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'02:14:13' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (35, 10, CAST(N'2021-06-11T00:00:00' AS SmallDateTime), CAST(N'02:33:16' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (36, 13, CAST(N'2021-06-10T00:00:00' AS SmallDateTime), CAST(N'23:35:01' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (37, 6, CAST(N'2021-06-10T00:00:00' AS SmallDateTime), CAST(N'02:59:51' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (38, 14, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'07:34:01' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (39, 14, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'17:12:55' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (40, 20, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'08:28:36' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (41, 6, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'21:25:20' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (42, 9, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'19:50:32' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (43, 11, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'14:45:06' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (44, 2, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'00:42:14' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (45, 19, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'18:03:28' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (46, 20, CAST(N'2021-06-08T00:00:00' AS SmallDateTime), CAST(N'21:56:57' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (47, 2, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'02:44:07' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (48, 19, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'23:57:38' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (49, 11, CAST(N'2021-06-07T00:00:00' AS SmallDateTime), CAST(N'09:40:52' AS Time), 1)
INSERT [dbo].[StandarTicket] ([Id], [RailwayID], [DepartDate], [DepartHour], [IdType]) VALUES (50, 2, CAST(N'2021-06-09T00:00:00' AS SmallDateTime), CAST(N'19:48:57' AS Time), 1)
SET IDENTITY_INSERT [dbo].[StandarTicket] OFF
GO
SET IDENTITY_INSERT [dbo].[Station] ON 

INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (1, N'NEOMYCIN AND POLYMYXIN B SULFATES AND HYDROCORTISONE', N'4 Leroy Drive', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (2, N'Notatum-Quentans', N'13722 Haas Drive', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (3, N'Rite Aid Cold and Hot Medicated', N'45027 Atwood Hill', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (4, N'Lady Speed Stick', N'1947 Doe Crossing Way', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (5, N'Dr. Jart Rejuvenating Beauty Balm', N'7 Lakeland Drive', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (6, N'Nicotine', N'8 Elka Court', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (7, N'Red Oak', N'08713 Village Park', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (8, N'Desert Beige', N'59 Westend Drive', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (9, N'SULPHUR', N'7895 Kennedy Center', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (10, N'Neutrogena Oil Free Acne Stress Control Triple Action Toner', N'9862 Hoffman Circle', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (11, N'Aurum 30', N'0 Chinook Parkway', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (12, N'Amlodipine Besylate and Benazepril Hydrochloride', N'462 Golf View Terrace', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (13, N'omeprazole', N'3348 4th Plaza', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (14, N'Blackberry', N'4 Transport Street', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (15, N'VENTOLIN', N'4416 Donald Pass', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (16, N'Mucus Relief', N'2 Erie Court', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (17, N'Famotidine', N'03 Lotheville Avenue', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (18, N'Prednisolone', N'22 Vidon Circle', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (19, N'WHITENING MILK AND GREEN TEA SERUM', N'4598 Express Hill', N'Available')
INSERT [dbo].[Station] ([Id], [DisplayName], [Address], [Status]) VALUES (20, N'NightRelief DayRelief', N'6 Glendale Place', N'Available')
SET IDENTITY_INSERT [dbo].[Station] OFF
GO
INSERT [dbo].[TicketType] ([Id], [DisplayName]) VALUES (1, N'Standar Ticket')
INSERT [dbo].[TicketType] ([Id], [DisplayName]) VALUES (2, N'Monthly Ticket')
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (2, N'Nhan Vien So Giao Thong')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (3, N'Nhan Vien Cong Ty')
INSERT [dbo].[UserRole] ([Id], [DisplayName]) VALUES (4, N'Nhan vien ban ve')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (1, N'admin', N'admin', N'db69fc039dcbd2962cb4d28f5891aae1', 1, NULL)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (2, N'TheDan', N'NVSGT', N'87d9bb400c0634691f0e3baaf1e2fd0d', 2, NULL)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (3, N'AuDuy', N'NVCT', N'cf7dc7415a0a59a33bece48a3658fc9c', 3, NULL)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (4, N'ThaiDuong', N'NVBV', N'8ba4e72d7a48e8cc4fc88e42be23e04c', 4, NULL)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (5, N'TheDan', N'NVSGT', N'59c92e450e92e02944afedce877ca8f6', 2, NULL)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (6, N'AuDuy1', N'NVCT1', N'cf7dc7415a0a59a33bece48a3658fc9c', 3, 1)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (7, N'AuDuy2', N'NVCT2', N'cf7dc7415a0a59a33bece48a3658fc9c', 3, 2)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (8, N'AuDuy3', N'NVCT3', N'cf7dc7415a0a59a33bece48a3658fc9c', 3, 3)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (9, N'AuDuy4', N'NVCT4', N'cf7dc7415a0a59a33bece48a3658fc9c', 3, 4)
INSERT [dbo].[Users] ([Id], [DisplayName], [Username], [Password], [IdRole], [CompanyID]) VALUES (10, N'AuDuy5', N'NVCT5', N'cf7dc7415a0a59a33bece48a3658fc9c', 3, 5)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[MonthlyTicket]  WITH CHECK ADD FOREIGN KEY([IdType])
REFERENCES [dbo].[TicketType] ([Id])
GO
ALTER TABLE [dbo].[MonthlyTicket]  WITH CHECK ADD FOREIGN KEY([RailwayID])
REFERENCES [dbo].[RailWay] ([Id])
GO
ALTER TABLE [dbo].[RailWay]  WITH CHECK ADD FOREIGN KEY([DepartureID])
REFERENCES [dbo].[Station] ([Id])
GO
ALTER TABLE [dbo].[RailWay]  WITH CHECK ADD FOREIGN KEY([DestinationID])
REFERENCES [dbo].[Station] ([Id])
GO
ALTER TABLE [dbo].[RailWay]  WITH CHECK ADD FOREIGN KEY([OwnedCompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[StandarTicket]  WITH CHECK ADD FOREIGN KEY([IdType])
REFERENCES [dbo].[TicketType] ([Id])
GO
ALTER TABLE [dbo].[StandarTicket]  WITH CHECK ADD FOREIGN KEY([RailwayID])
REFERENCES [dbo].[RailWay] ([Id])
GO
ALTER TABLE [dbo].[TicketSold]  WITH CHECK ADD FOREIGN KEY([IdType])
REFERENCES [dbo].[TicketType] ([Id])
GO
ALTER TABLE [dbo].[TicketSold]  WITH CHECK ADD FOREIGN KEY([RailwayID])
REFERENCES [dbo].[RailWay] ([Id])
GO
ALTER TABLE [dbo].[TicketSold]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [dbo].[StandarTicket] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
GO
USE [master]
GO
ALTER DATABASE [EMetro] SET  READ_WRITE 
GO
