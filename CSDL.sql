USE [master]
GO
/****** Object:  Database [QuanLyDiemSV]    Script Date: 1/15/2020 2:41:36 AM ******/

CREATE DATABASE [QuanLyDiemSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyDiemSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyDiemSV.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyDiemSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyDiemSV_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyDiemSV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDiemSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDiemSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDiemSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDiemSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyDiemSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDiemSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyDiemSV] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDiemSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDiemSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDiemSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDiemSV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyDiemSV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyDiemSV]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 1/15/2020 2:41:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[MaQuyen] [int] NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Diem]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diem](
	[MSV] [nvarchar](50) NULL,
	[MaMon] [nvarchar](50) NULL,
	[DiemTrenLop] [float] NULL,
	[DiemThi] [float] NULL,
	[DiemThi2] [float] NULL,
	[DiemTBMon] [float] NULL,
	[DiemChu] [nvarchar](5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[MaHocKy] [nvarchar](50) NOT NULL,
	[TenHocKy] [nvarchar](50) NULL,
 CONSTRAINT [PK_HocKy] PRIMARY KEY CLUSTERED 
(
	[MaHocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [nvarchar](50) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMon] [nvarchar](50) NOT NULL,
	[TenMon] [nvarchar](50) NULL,
	[TinChi] [int] NULL,
	[MaHocKy] [nvarchar](50) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[GopY] [nchar](10) NULL,
	[BaoLoi] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MSV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DanToc] [nvarchar](10) NULL,
	[QueQuan] [nvarchar](50) NULL,
	[MaLop] [nvarchar](50) NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[MSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'admin', N'ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'dFFDSFĐF', N'ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'giangvien', N'ca4238a0b923820dcc509a6f75849b', 2)
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'giaovien', N'ca4238a0b923820dcc509a6f75849b', 2)
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'hoa', N'ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'nhom1', N'ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'sinhvien', N'c175b9c0f1b6a831c399e269772661', 3)
INSERT [dbo].[DangNhap] ([TaiKhoan], [MatKhau], [MaQuyen]) VALUES (N'tin10a2', N'ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'KPDL', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'KPDL', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'KPDL', 8, 5.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'KPDL', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'KPDL', 7, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'KTMP', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'KTMP', 5, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'KTMP', 8, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'KTMP', 5, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'KTMP', 8, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TTCK', 8, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TTCK', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TTCK', 7, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TTCK', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TTCK', 7, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TTNT', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TTNT', 7, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TTNT', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TTNT', 9, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TTNT', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'KPDL1', 10, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'KPDL1', 5, 5.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'KPDL1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'KPDL1', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'KPDL1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'KPDL', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'KPDL', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'KPDL', 8, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'KPDL', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'KPDL', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'KPDL', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'KPDL', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'KPDL', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'KPDL', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'KPDL', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'KPDL', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'KPDL1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'KPDL1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'KPDL1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'KPDL1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'KPDL1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'KPDL1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'KPDL1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'KPDL1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'KTMP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'KTMP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'KTMP', 8, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'KTMP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'KTMP', 10, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'KTMP', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'KTMP', 8, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'KTMP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'KTMP1', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'KTMP1', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'KTMP1', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'KTMP1', 5, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'KTMP1', 8, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'KTMP1', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'KTMP1', 6.7, 6.8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'KTMP1', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TTCK', 7, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TTCK', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TTCK', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TTCK', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TTCK', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TTCK', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TTCK', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TTCK', 10, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TTWEB', 1, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TTWEB', 4, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TTWEB', 4, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TTWEB', 4, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TTWEB', 7, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TTWEB', 8, 8, NULL, NULL, NULL)
GO
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TTWEB', 6, 3, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'KPDL', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'KPDL', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'KPDL', 3, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'KPDL', 9, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'KPDL1', 3, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'KPDL1', 9, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'KPDL1', 4, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'KPDL1', 7, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'KPDL1', 3, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'KPDL1', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'KPDL1', 7, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'KTMP', 8, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'KTMP', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'KTMP', 8, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'KTMP', 6, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'KTMP', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'KTMP', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'KTMP', 5, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TTCK', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TTCK', 4, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TTCK', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TTCK', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TTCK', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TTCK', 7, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TTCK', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TTNT', 8, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TTNT', 8, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TTNT', 4, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TTNT', 7, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TTNT', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TTNT', 5, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TN', 3, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TN', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TN', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TN', 4, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TN', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TN', 7, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TN', 4, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TN', 9, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TN', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TN', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TN', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'KPDL', 8.7, 8.7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'KPDL', 7.7, 2, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'KPDL', 7.7, 1, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'KPDL1', 8.7, 8.7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'KPDL1', 2, 2, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'KPDL1', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'KTMP', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'KTMP', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'KTMP', 5, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'KTMP1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'KTMP1', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'KTMP1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'KTMP1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'KTMP1', 7.5, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'KTMP1', 5, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'KTMP1', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'KTMP1', 8, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'KTMP1', 8, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'KTMP1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'KTMP1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'KTMP1', 10, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'KTMP1', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'KTMP1', 9, 8.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'KTMP1', 8, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TN', 5, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TN', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TTCK', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TTCK', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TTCK', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TTNT', 4, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TTNT', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'KPDL', 7, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'KPDL1', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'KTMP', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'KTMP1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TN', 5, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TTCK', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TTNT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TTWEB', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'KPDL', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'KPDL1', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'KTMP', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'KTMP1', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TN', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TTCK', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TTDPT', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TTNT', 7, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TTWEB', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'CSDL', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'CSDL', 5, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'CSDL', 5, 1, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'CSDL', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'CSDL', 4, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'CSDL', 9, 3, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TTDPT', 10, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TTDPT', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TTDPT', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TTDPT', 8.6, 8.6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TTDPT', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TTDPT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TTDPT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TTDPT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TTDPT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TTDPT', 8.5, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TTDPT', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TTDPT', 8, 3, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TTDPT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TTDPT', 8, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TTDPT', 7.5, 7.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TTDPT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TTWEB', 9, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TTWEB', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TTWEB', 5, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TTWEB', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TTWEB', 7, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TTWEB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TTWEB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TTWEB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TTWEB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TTWEB', 5, 2, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TTWEB', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TTWEB', 8, 0, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TTWEB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TTWEB', 5, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TTWEB', 3, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TTWEB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'CSDL', 9, 1, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'CSDL', 9, 1, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'CSDL', 9, 3, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'CSDL', 8.8, 8.8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'CSDL', 3, 3, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'CSDL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'CSDL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'CSDL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'CSDL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'CSDL', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'CSDL', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'CSDL', 8, 7.6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'CSDL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'CSDL', 7, 1.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'CSDL', 7, 1.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'CSDL', 7, 1.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'CSDL', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'CSDL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'CSDL', 5, 2, 2, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'JAVA', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'JAVA', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'JAVA', 5, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'JAVA', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'JAVA', 7, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'JAVA', 10, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'JAVA', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'JAVA', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'JAVA', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'JAVA', 8, 3, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'JAVA', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'JAVA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'JAVA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'JAVA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'JAVA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'JAVA', 10, 1, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'JAVA', 8, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'JAVA', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'JAVA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'JAVA', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'JAVA', 10, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'JAVA', 9, 7.6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'JAVA', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'JAVA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'JAVA', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'KTLT', 8, 0, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'KTLT', 7, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'KTLT', 8, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'KTLT', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'KTLT', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'KTLT', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'KTLT', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'KTLT', 5, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'KTLT', 2, 9.5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'KTLT', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'KTLT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'KTLT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'KTLT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'KTLT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'KTLT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'KTLT', 9, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'KTLT', 8.7, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'KTLT', 7, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'KTLT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'KTLT', 6, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'KTLT', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'KTLT', 5, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'KTLT', 7, 7, NULL, NULL, NULL)
GO
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'KTLT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'KTLT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'LTHDT', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'LTHDT', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'LTHDT', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'LTHDT', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'LTHDT', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'LTHDT', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'LTHDT', 6, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'LTHDT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'LTHDT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'LTHDT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'LTHDT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'LTHDT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'LTHDT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'LTHDT', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'LTNET', 8.8, 8.8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'LTNET', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'LTNET', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'LTNET', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'LTNET', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'LTNET', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'LTNET', 8.8, 8.8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'LTNET', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'LTNET', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TRR', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TRR', 7, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TRR', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TRR', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TRR', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TRR', 6, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TRR', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TRR', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TRR', 7, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TRR', 7, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TRR', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TRR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TRR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TRR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TRR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TRR', 8, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TRR', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TRR', 6, 6, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TRR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TRR', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TRR', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TRR', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TRR', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TRR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TRR', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TTQTM', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TTQTM', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TTQTM', 8, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TTQTM', 4, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TTQTM', 4, 4, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TTQTM', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TTQTM', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TTQTM', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TTQTM', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TTQTM', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TTQTM', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TTQTM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TTQTM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TTQTM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TTQTM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TTQTM', 3, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TTQTM', 5, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TTQTM', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TTQTM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TTQTM', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TTQTM', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TTQTM', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TTQTM', 7.9, 7.9, NULL, NULL, NULL)
GO
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TTQTM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TTQTM', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100026', N'TVP', 8, 5, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100027', N'TVP', 8, 0, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100061', N'TVP', 8, 0, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100063', N'TVP', 10, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100064', N'TVP', 10, 10, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100068', N'TVP', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100100', N'TVP', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100101', N'TVP', 8, 8, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100103', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100104', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100107', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100111', N'TVP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100114', N'TVP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100140', N'TVP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100147', N'TVP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100148', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100154', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100163', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100164', N'TVP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100166', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100174', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100185', N'TVP', 7, 7, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100194', N'TVP', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100199', N'TVP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Diem] ([MSV], [MaMon], [DiemTrenLop], [DiemThi], [DiemThi2], [DiemTBMon], [DiemChu]) VALUES (N'16103100346', N'TVP', 9, 9, NULL, NULL, NULL)
INSERT [dbo].[HocKy] ([MaHocKy], [TenHocKy]) VALUES (N'II 2019-20', N'Kỳ 2 2019/2020')
INSERT [dbo].[HocKy] ([MaHocKy], [TenHocKy]) VALUES (N'II 2020-21', N'Kỳ 2 2020/2021')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'TIN10A1', N'CNTT 10A1 HN')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'TIN10A2', N'CNTT 10A2 HN')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'TIN11A1', N'CNTT 11A1 HN')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'CSDL', N'Cơ sở dữ liệu', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'JAVA', N'Công nghệ JAVA', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'KPDL', N'Khai phá dữ liệu', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'KPDL1', N'Thực tập lập trình mạng', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'KTLT', N'Kỹ thuật lập trình', 2, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'KTMP', N'Lập trình di động', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'KTMP1', N'Kỹ thuật mô phỏng', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'LTHDT', N'Lập trình hướng đối tượng', 2, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'LTNET', N'Lập trình .NET', 4, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TN', N'Tin cơ sở', 4, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TRR', N'Toán rời rạc', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TTCK', N'Thực tập cuối khóa', 5, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TTDPT', N'Truyền thông đa phương tiện', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TTNT', N'Trí tuệ nhân tạo', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TTQTM', N'Thực tập quản trị mạng', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TTWEB', N'Thực tập WEB', 3, N'II 2019-20')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [TinChi], [MaHocKy]) VALUES (N'TVP', N'Tin văn phòng', 2, N'II 2019-20')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100026', N'Đặng Văn Lâm', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Thanh Hóa', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100027', N'Nguyễn Thị Nga', CAST(N'1998-01-01' AS Date), N'Nữ', N'Kinh', N'Bắc Ninh', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100061', N'Bùi Trung Hiếu', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Thái Bình', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100063', N'Nguyễn Văn Giang', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100064', N'Nguyễn Phú Quý', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100068', N'Hoàng Văn Thăng', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Thái Bình', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100100', N'Nguyễn Văn A', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100101', N'Nguyễn Văn B', CAST(N'1998-03-01' AS Date), N'Nam', N'Kinh', N'Thái Bình', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100103', N'Nguyễn Thị C', CAST(N'1998-04-10' AS Date), N'Nữ', N'Kinh', N'Nam Định', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100104', N'Nguyễn Văn D', CAST(N'1997-09-23' AS Date), N'Nữ', N'Kinh', N'Ninh Bình', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100107', N'Nguyễn Quang Hải', CAST(N'1998-04-10' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100111', N'Bùi Tiến Dũng', CAST(N'1997-09-23' AS Date), N'Nam', N'Kinh', N'Hà Nam', N'TIN10A2')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100114', N'Trần Đình Trọng', CAST(N'1997-09-05' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A2')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100140', N'Nguyễn Văn Toàn', CAST(N'1997-09-23' AS Date), N'Nam', N'Kinh', N'Hà Nam', N'TIN10A2')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100147', N'Đỗ Xuân Hòa', CAST(N'1997-09-23' AS Date), N'Nam', N'Kinh', N'Hà Nam', N'TIN10A2')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100148', N'Nguyễn Thị H', CAST(N'1998-04-10' AS Date), N'Nữ', N'Kinh', N'Đà Nẵng', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100154', N'Đỗ Xuân Hòa', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Hà Nam', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100163', N'Bằng Quang Hải', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Bắc Giang', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100164', N'Nguyễn Tiến Linh', CAST(N'1997-09-23' AS Date), N'Nam', N'Kinh', N'Hà Nam', N'TIN10A2')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100166', N'Nguyễn Đình Toàn', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Nghệ An', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100174', N'Bùi Tiến Dũng', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100185', N'Nguyễn Thị E', CAST(N'1998-01-01' AS Date), N'Nữ', N'Kinh', N'Hà Nội', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100194', N'Trần Đình Trọng', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A1')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100199', N'Đặng Văn Lâm', CAST(N'1997-09-23' AS Date), N'Nam', N'Kinh', N'Hà Nam', N'TIN10A2')
INSERT [dbo].[SinhVien] ([MSV], [HoTen], [NgaySinh], [GioiTinh], [DanToc], [QueQuan], [MaLop]) VALUES (N'16103100346', N'Lê Công Vinh', CAST(N'1998-01-01' AS Date), N'Nam', N'Kinh', N'Hà Nội', N'TIN10A1')
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_MonHoc] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonHoc] ([MaMon])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_MonHoc]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_SinhVien] FOREIGN KEY([MSV])
REFERENCES [dbo].[SinhVien] ([MSV])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_SinhVien]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc_HocKy] FOREIGN KEY([MaHocKy])
REFERENCES [dbo].[HocKy] ([MaHocKy])
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [FK_MonHoc_HocKy]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Lop]
GO
/****** Object:  StoredProcedure [dbo].[BangDiemHP]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BangDiemHP](
@MaLop nvarchar(50),
@MaMon nvarchar(50)
)

AS 
BEGIN
	SELECT SinhVien.MSV, SinhVien.HoTen, SinhVien.NgaySinh, Diem.DiemTrenLop, Diem.DiemThi, Diem.DiemThi2,(Diem.DiemTrenLop*0.4)+(Diem.DiemThi*0.6) AS 'TB Mon Hoc'  FROM SinhVien 
	INNER JOIN Diem ON SinhVien.MSV = Diem.MSV
	WHERE SinhVien.MaLop = @MaLop AND Diem.MaMon = @MaMon
END

GO
/****** Object:  StoredProcedure [dbo].[BangDiemHP_2]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BangDiemHP_2](
@MaLop nvarchar(50),
@MaMon nvarchar(50)
)

AS 
BEGIN
	SELECT SinhVien.MSV, SinhVien.HoTen, SinhVien.NgaySinh, Diem.DiemTrenLop, Diem.DiemThi, (Diem.DiemTrenLop*0.4)+(Diem.DiemThi*0.6) AS 'TB Mon Hoc'  FROM SinhVien 
	INNER JOIN Diem ON SinhVien.MSV = Diem.MSV
	WHERE SinhVien.MaLop = @MaLop AND Diem.MaMon = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[BangDiemQT]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BangDiemQT](
@MaLop nvarchar(50),
@MaMon nvarchar(50)
)

AS 
BEGIN
	SELECT SinhVien.MSV, SinhVien.HoTen, SinhVien.NgaySinh, Diem.DiemTrenLop FROM SinhVien 
	INNER JOIN Diem ON SinhVien.MSV = Diem.MSV
	WHERE SinhVien.MaLop = @MaLop AND Diem.MaMon = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[DangNhap_SelectAll]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DangNhap_SelectAll]
as
begin
select * from DangNhap
end

GO
/****** Object:  StoredProcedure [dbo].[Diem_Insert]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Diem_Insert](	
@MaMon nvarchar(50),
@MaSinhVien nvarchar (50) 
)

AS 
BEGIN
	INSERT INTO Diem(MaMon,MSV) VALUES (@MaMon,@MaSinhVien)
END

GO
/****** Object:  StoredProcedure [dbo].[Diem_Search]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Diem_Search](	
@MaMon nvarchar(50),
@MaSinhVien nvarchar (50) 
)

AS 
BEGIN
	SELECT MSV,MaMon,DiemTrenLop,DiemThi,DiemThi2,(DiemTrenLop*0.4)+(DiemTBMon*0.6) AS TrungBinh FROM Diem WHERE MaMon=@MaMon AND MSV=@MaSinhVien
END

GO
/****** Object:  StoredProcedure [dbo].[Diem_UpdateDiemThi]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Diem_UpdateDiemThi](
@DiemThi float,
@MaMon nvarchar(50),
@MSV nvarchar(50)
)

AS 
BEGIN
	UPDATE Diem SET DiemThi=@DiemThi WHERE MaMon = @MaMon AND MSV = @MSV
END

GO
/****** Object:  StoredProcedure [dbo].[Diem_UpdateDiemThi2]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Diem_UpdateDiemThi2](
@DiemThi2 float,
@MaMon nvarchar(50),
@MSV nvarchar(50)
)

AS 
BEGIN
	UPDATE Diem SET DiemThi2=@DiemThi2 WHERE MaMon = @MaMon AND MSV = @MSV
END

GO
/****** Object:  StoredProcedure [dbo].[Diem_UpdateDiemTrenLop]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Diem_UpdateDiemTrenLop](
@DiemTrenLop float,
@MaMon nvarchar(50),
@MSV nvarchar(50)
)

AS 
BEGIN
	UPDATE Diem SET DiemTrenLop=@DiemTrenLop WHERE MaMon = @MaMon AND MSV = @MSV
END

GO
/****** Object:  StoredProcedure [dbo].[Diem_UpdateTBM]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Diem_UpdateTBM](
@DiemTBMon float,
@MaMon nvarchar(50),
@MSV nvarchar(50)
)

AS 
BEGIN
	UPDATE Diem SET DiemTBMon=@DiemTBMon WHERE MaMon = @MaMon AND MSV = @MSV
END

GO
/****** Object:  StoredProcedure [dbo].[HocKy_Delete]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[HocKy_Delete](
@MaHocKy nvarchar(50)
)

AS 
BEGIN
	DELETE FROM HocKy Where MaHocKy = @MaHocKy
END

GO
/****** Object:  StoredProcedure [dbo].[HocKy_Insert]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[HocKy_Insert](
@MaHocKy nvarchar(50),
@TenHocKy nvarchar(50)
)

AS 
BEGIN
	INSERT INTO HocKy VALUES (@MaHocKy,@TenHocKy)
END

GO
/****** Object:  StoredProcedure [dbo].[HocKy_SelectAll]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[HocKy_SelectAll]
AS 
BEGIN
	SELECT * FROM HocKy
	
END

GO
/****** Object:  StoredProcedure [dbo].[HocKy_Update]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[HocKy_Update](
@MaHocKy nvarchar(50),
@TenHocKy nvarchar(50)
)

AS 
BEGIN
	update HocKy set TenHocKy = @TenHocKy Where MaHocKy = @MaHocKy
END

GO
/****** Object:  StoredProcedure [dbo].[Lop_Delete]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Lop_Delete](@MaLop nvarchar(50))

AS 
BEGIN
	DELETE FROM Lop WHERE MaLop=@MaLop
END

GO
/****** Object:  StoredProcedure [dbo].[Lop_Insert]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Lop_Insert](@MaLop nvarchar(50), @TenLop nvarchar(50))

AS 
BEGIN
	INSERT INTO Lop VALUES (@MaLop, @TenLop)
END

GO
/****** Object:  StoredProcedure [dbo].[Lop_Update]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Lop_Update](@MaLop nvarchar(50), @TenLop nvarchar(50))

AS 
BEGIN
	UPDATE Lop SET TenLop=@TenLop WHERE MaLop=@MaLop
END

GO
/****** Object:  StoredProcedure [dbo].[Lops_SelectAll]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[Lops_SelectAll]
AS
BEGIN
	SELECT * FROM Lop
	END

GO
/****** Object:  StoredProcedure [dbo].[MonHoc_Delete]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MonHoc_Delete](	
@MaMon nvarchar(50)
)

AS 
BEGIN
	DELETE FROM MonHoc WHERE MaMon = @MaMon
END

GO
/****** Object:  StoredProcedure [dbo].[MonHoc_Insert]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MonHoc_Insert](	
@MaMon nvarchar(50),
@TenMon nvarchar(50),
@TinChi int,
@MaHocKy nvarchar(50)
)

AS 
BEGIN
	INSERT INTO MonHoc VALUES (@MaMon,@TenMon,@TinChi,@MaHocKy)
END

GO
/****** Object:  StoredProcedure [dbo].[MonHoc_SelectAll]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MonHoc_SelectAll]

AS 
BEGIN
	SELECT * FROM MonHoc
END

GO
/****** Object:  StoredProcedure [dbo].[MonHoc_SelectMaHocKy]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MonHoc_SelectMaHocKy](	
@MaHocKy nvarchar(50)
)

AS 
BEGIN
	SELECT * FROM MonHoc Where MaHocKy = @MaHocKy
END

GO
/****** Object:  StoredProcedure [dbo].[MonHoc_Update]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MonHoc_Update](	
@MaMon nvarchar(50),
@TenMon nvarchar(50),
@TinChi int
)

AS 
BEGIN
	UPDATE MonHoc SET TenMon=@TenMon, TinChi = @TinChi where MaMon=@MaMon
END

GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Delete]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SinhVien_Delete](
@MSV nvarchar(50)
)

AS 
BEGIN
	DELETE FROM SinhVien
	WHERE  MSV = @MSV  
END

GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Insert]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SinhVien_Insert](
@MSV nvarchar(50),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(5),
@DanToc nvarchar(50),
@QueQuan nvarchar(50),
@MaLop nvarchar(50)


)

AS 
BEGIN
	INSERT INTO SinhVien VALUES(@MSV,@HoTen,@NgaySinh,@GioiTinh,@DanToc,@QueQuan,@MaLop); 
END

GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Search]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_Search](
@MSV nvarchar(50),
@MaLop nvarchar(50)
)

AS 
BEGIN
	SELECT * FROM SinhVien
	WHERE  MSV = @MSV AND MaLop = @MaLop
END

GO
/****** Object:  StoredProcedure [dbo].[SinhVien_SelectAll]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SinhVien_SelectAll]

AS 
BEGIN
	SELECT * FROM SinhVien
END

GO
/****** Object:  StoredProcedure [dbo].[SinhVien_SelectID]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SinhVien_SelectID](
@MSV nvarchar(50)
)
AS
BEGIN
	SELECT * FROM SinhVien WHERE MSV = @MSV
END


GO
/****** Object:  StoredProcedure [dbo].[SinhVien_SelectMaLop]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SinhVien_SelectMaLop](
@MaLop nvarchar(50)

)

AS 
BEGIN
	SELECT * FROM SinhVien WHERE MaLop=@MaLop
END

GO
/****** Object:  StoredProcedure [dbo].[SinhVien_Update]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SinhVien_Update](
@MSV nvarchar(50),
@HoTen nvarchar(50),
@NgaySinh date,
@GioiTinh nvarchar(5),
@DanToc nvarchar(50),
@QueQuan nvarchar(50)


)

AS 
BEGIN
	UPDATE SinhVien SET HoTen= @HoTen,NgaySinh=@NgaySinh,GioiTinh=@GioiTinh, DanToc = @DanToc,QueQuan = @QueQuan 
	WHERE  MSV = @MSV  
END

GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Delete]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TaiKhoan_Delete](
@TaiKhoan nvarchar(50)
)

AS 
BEGIN
	DELETE FROM DangNhap WHERE TaiKhoan = @TaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Insert]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TaiKhoan_Insert](
@TaiKhoan nvarchar(50),
@MatKhau nvarchar(50),
@MaQuyen nvarchar(50)
)

AS 
BEGIN
	INSERT INTO DangNhap VALUES (@TaiKhoan,@MatKhau,@MaQuyen)
END

GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_SelectAll]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TaiKhoan_SelectAll]

AS 
BEGIN
	SELECT * FROM DangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Update]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TaiKhoan_Update](
@TaiKhoan nvarchar(50),
@MatKhau nvarchar(50),
@MaQuyen nvarchar(50)
)

AS 
BEGIN
	UPDATE DangNhap SET MatKhau = @MatKhau,MaQuyen= @MaQuyen WHERE TaiKhoan = @TaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[ThongKe_HocLai]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongKe_HocLai](
@MaLop nvarchar(50),
@MaMon nvarchar(50)
)

AS 
BEGIN
	SELECT SinhVien.MSV, SinhVien.HoTen, SinhVien.NgaySinh, Diem.DiemTrenLop, Diem.DiemThi, Diem.DiemThi2,(Diem.DiemTrenLop*0.4)+(Diem.DiemThi2*0.6) AS 'TB Mon Hoc'  FROM SinhVien 
	INNER JOIN Diem ON SinhVien.MSV = Diem.MSV
	WHERE SinhVien.MaLop = @MaLop AND Diem.MaMon = @MaMon AND
	 (( ((Diem.DiemTrenLop*0.4)+(Diem.DiemThi2*0.6)) < 4 ) AND (Diem.DiemThi2 IS NOT NULL))
END

GO
/****** Object:  StoredProcedure [dbo].[ThongKe_ThiLai]    Script Date: 1/15/2020 2:41:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThongKe_ThiLai](
@MaLop nvarchar(50),
@MaMon nvarchar(50)
)

AS 
BEGIN
	SELECT SinhVien.MSV, SinhVien.HoTen, SinhVien.NgaySinh, Diem.DiemTrenLop, Diem.DiemThi, Diem.DiemThi2,(Diem.DiemTrenLop*0.4)+(Diem.DiemThi*0.6) AS 'TB Mon Hoc'  FROM SinhVien 
	INNER JOIN Diem ON SinhVien.MSV = Diem.MSV
	WHERE SinhVien.MaLop = @MaLop AND Diem.MaMon = @MaMon AND ((Diem.DiemTrenLop*0.4)+(Diem.DiemThi*0.6)) < 4 and
	 (( ((Diem.DiemTrenLop*0.4)+(Diem.DiemThi*0.6)) < 4 ) OR (Diem.DiemThi2 IS NOT NULL))
END

GO
USE [master]
GO
ALTER DATABASE [QuanLyDiemSV] SET  READ_WRITE 
GO
