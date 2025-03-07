USE [master]
GO
/****** Object:  Database [zoo]    Script Date: 15.05.2024 11:44:44 ******/
CREATE DATABASE [zoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zoo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\zoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zoo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\zoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [zoo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zoo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zoo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zoo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zoo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zoo] SET ARITHABORT OFF 
GO
ALTER DATABASE [zoo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zoo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zoo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zoo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zoo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zoo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zoo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zoo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [zoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zoo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zoo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zoo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zoo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [zoo] SET  MULTI_USER 
GO
ALTER DATABASE [zoo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zoo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zoo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [zoo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [zoo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [zoo] SET QUERY_STORE = ON
GO
ALTER DATABASE [zoo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [zoo]
GO
/****** Object:  Table [dbo].[Gosteri]    Script Date: 15.05.2024 11:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gosteri](
	[gosterino] [int] NOT NULL,
	[gosteriadi] [varchar](25) NULL,
	[gosterisaati] [varchar](25) NULL,
	[gosteritarihi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[gosterino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bilet]    Script Date: 15.05.2024 11:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilet](
	[biletno] [int] NOT NULL,
	[fiyat] [int] NULL,
	[gosterinum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[biletno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DenemeGosterisiBiletleri]    Script Date: 15.05.2024 11:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DenemeGosterisiBiletleri] AS
SELECT fiyat
FROM Bilet, Gosteri
WHERE Bilet.gosterinum = Gosteri.gosterino
AND Gosteri.gosteriadi = 'Deneme Gösterisi';
GO
/****** Object:  Table [dbo].[AraTablo]    Script Date: 15.05.2024 11:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AraTablo](
	[gosterinum] [int] NOT NULL,
	[hayvanid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gosterinum] ASC,
	[hayvanid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Egitmen]    Script Date: 15.05.2024 11:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Egitmen](
	[egitmenno] [int] NOT NULL,
	[egitmenad] [varchar](25) NULL,
	[egitmentel] [char](25) NULL,
	[egitmenyas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[egitmenno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GosteriYeri]    Script Date: 15.05.2024 11:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GosteriYeri](
	[yernumarasi] [int] NOT NULL,
	[gosteriadres] [varchar](100) NULL,
	[gosteritel] [char](25) NULL,
	[koltukkapasitesi] [int] NULL,
	[gosterinum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[yernumarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hayvan]    Script Date: 15.05.2024 11:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hayvan](
	[hayvankodu] [int] NOT NULL,
	[hayvanadi] [varchar](25) NULL,
	[cinsiyet] [char](1) NULL,
	[hayvanyas] [int] NULL,
	[cinsi] [varchar](25) NULL,
	[egitmennum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hayvankodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bilet] ([biletno], [fiyat], [gosterinum]) VALUES (1, 50, 1)
INSERT [dbo].[Bilet] ([biletno], [fiyat], [gosterinum]) VALUES (2, 75, 2)
INSERT [dbo].[Bilet] ([biletno], [fiyat], [gosterinum]) VALUES (3, 60, 3)
INSERT [dbo].[Bilet] ([biletno], [fiyat], [gosterinum]) VALUES (4, 80, 4)
INSERT [dbo].[Bilet] ([biletno], [fiyat], [gosterinum]) VALUES (5, 70, 5)
GO
INSERT [dbo].[Egitmen] ([egitmenno], [egitmenad], [egitmentel], [egitmenyas]) VALUES (1, N'Sebile', N'5564131011               ', 48)
INSERT [dbo].[Egitmen] ([egitmenno], [egitmenad], [egitmentel], [egitmenyas]) VALUES (2, N'Hamiyet', N'5553334455               ', 36)
INSERT [dbo].[Egitmen] ([egitmenno], [egitmenad], [egitmentel], [egitmenyas]) VALUES (3, N'Yağmur', N'5551112233               ', 28)
INSERT [dbo].[Egitmen] ([egitmenno], [egitmenad], [egitmentel], [egitmenyas]) VALUES (4, N'Mehmet', N'5551234567               ', 35)
INSERT [dbo].[Egitmen] ([egitmenno], [egitmenad], [egitmentel], [egitmenyas]) VALUES (5, N'Ayşe', N'5557654321               ', 42)
GO
INSERT [dbo].[Gosteri] ([gosterino], [gosteriadi], [gosterisaati], [gosteritarihi]) VALUES (1, N'Deneme Gösterisi', N'14:00', CAST(N'2024-05-10' AS Date))
INSERT [dbo].[Gosteri] ([gosterino], [gosteriadi], [gosterisaati], [gosteritarihi]) VALUES (2, N'Akşam Gösterisi', N'19:30', CAST(N'2024-05-15' AS Date))
INSERT [dbo].[Gosteri] ([gosterino], [gosteriadi], [gosterisaati], [gosteritarihi]) VALUES (3, N'Çocuk Gösterisi', N'11:00', CAST(N'2024-05-20' AS Date))
INSERT [dbo].[Gosteri] ([gosterino], [gosteriadi], [gosterisaati], [gosteritarihi]) VALUES (4, N'Yetişkin Gösterisi', N'21:00', CAST(N'2024-05-25' AS Date))
INSERT [dbo].[Gosteri] ([gosterino], [gosteriadi], [gosterisaati], [gosteritarihi]) VALUES (5, N'Aile Gösterisi', N'15:30', CAST(N'2024-05-30' AS Date))
GO
INSERT [dbo].[GosteriYeri] ([yernumarasi], [gosteriadres], [gosteritel], [koltukkapasitesi], [gosterinum]) VALUES (1, N'Ankara Cad. No: 123', N'0312-123456              ', 100, 1)
INSERT [dbo].[GosteriYeri] ([yernumarasi], [gosteriadres], [gosteritel], [koltukkapasitesi], [gosterinum]) VALUES (2, N'İstanbul Cad. No: 456', N'0212-654321              ', 150, 2)
INSERT [dbo].[GosteriYeri] ([yernumarasi], [gosteriadres], [gosteritel], [koltukkapasitesi], [gosterinum]) VALUES (3, N'İzmir Cad. No: 789', N'0232-987654              ', 200, 3)
INSERT [dbo].[GosteriYeri] ([yernumarasi], [gosteriadres], [gosteritel], [koltukkapasitesi], [gosterinum]) VALUES (4, N'Bursa Cad. No: 012', N'0224-321654              ', 120, 4)
INSERT [dbo].[GosteriYeri] ([yernumarasi], [gosteriadres], [gosteritel], [koltukkapasitesi], [gosterinum]) VALUES (5, N'Antalya Cad. No: 345', N'0242-789123              ', 180, 5)
GO
INSERT [dbo].[Hayvan] ([hayvankodu], [hayvanadi], [cinsiyet], [hayvanyas], [cinsi], [egitmennum]) VALUES (11, N'maymuş', N'X', 2, N'maymun', 1)
INSERT [dbo].[Hayvan] ([hayvankodu], [hayvanadi], [cinsiyet], [hayvanyas], [cinsi], [egitmennum]) VALUES (22, N'Necati', N'y', 3, N'fil', 2)
INSERT [dbo].[Hayvan] ([hayvankodu], [hayvanadi], [cinsiyet], [hayvanyas], [cinsi], [egitmennum]) VALUES (33, N'Luna', N'x', 5, N'kedi', 3)
INSERT [dbo].[Hayvan] ([hayvankodu], [hayvanadi], [cinsiyet], [hayvanyas], [cinsi], [egitmennum]) VALUES (44, N'Simba', N'y', 6, N'aslan', 4)
INSERT [dbo].[Hayvan] ([hayvankodu], [hayvanadi], [cinsiyet], [hayvanyas], [cinsi], [egitmennum]) VALUES (55, N'Giraffe', N'y', 7, N'zürafa', 5)
GO
ALTER TABLE [dbo].[AraTablo]  WITH CHECK ADD FOREIGN KEY([gosterinum])
REFERENCES [dbo].[Gosteri] ([gosterino])
GO
ALTER TABLE [dbo].[AraTablo]  WITH CHECK ADD FOREIGN KEY([hayvanid])
REFERENCES [dbo].[Hayvan] ([hayvankodu])
GO
ALTER TABLE [dbo].[Bilet]  WITH CHECK ADD FOREIGN KEY([gosterinum])
REFERENCES [dbo].[Gosteri] ([gosterino])
GO
ALTER TABLE [dbo].[GosteriYeri]  WITH CHECK ADD FOREIGN KEY([gosterinum])
REFERENCES [dbo].[Gosteri] ([gosterino])
GO
ALTER TABLE [dbo].[Hayvan]  WITH CHECK ADD FOREIGN KEY([egitmennum])
REFERENCES [dbo].[Egitmen] ([egitmenno])
GO
USE [master]
GO
ALTER DATABASE [zoo] SET  READ_WRITE 
GO
