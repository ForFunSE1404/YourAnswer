USE [master]
GO
/****** Object:  Database [YourAnswer]    Script Date: 10/24/2020 10:40:46 PM ******/
CREATE DATABASE [YourAnswer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YourAnswer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\YourAnswer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YourAnswer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\YourAnswer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [YourAnswer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YourAnswer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YourAnswer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YourAnswer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YourAnswer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YourAnswer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YourAnswer] SET ARITHABORT OFF 
GO
ALTER DATABASE [YourAnswer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YourAnswer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YourAnswer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YourAnswer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YourAnswer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YourAnswer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YourAnswer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YourAnswer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YourAnswer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YourAnswer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YourAnswer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YourAnswer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YourAnswer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YourAnswer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YourAnswer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YourAnswer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YourAnswer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YourAnswer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YourAnswer] SET  MULTI_USER 
GO
ALTER DATABASE [YourAnswer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YourAnswer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YourAnswer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YourAnswer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YourAnswer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YourAnswer] SET QUERY_STORE = OFF
GO
USE [YourAnswer]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userID] [nvarchar](20) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[isActived] [bit] NOT NULL,
	[token] [nvarchar](50) NULL,
	[infoId] [int] NULL,
	[roleId] [int] NOT NULL,
	[avartar] [nvarchar](255) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] NOT NULL,
	[userId] [nvarchar](20) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[totalprice] [float] NOT NULL,
	[status] [bit] NOT NULL,
	[note] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[cartDetailId] [int] NOT NULL,
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[productColorId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[cartDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [nvarchar](20) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[colorId] [int] IDENTITY(1,1) NOT NULL,
	[colorName] [nvarchar](10) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[colorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[imgId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
	[imgUrl] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[imgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoUser]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoUser](
	[infoId] [int] NOT NULL,
	[city] [nvarchar](20) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
 CONSTRAINT [PK_InfoUser] PRIMARY KEY CLUSTERED 
(
	[infoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [nvarchar](20) NOT NULL,
	[categoryId] [nvarchar](20) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[updateDate] [datetime] NULL,
	[price] [float] NOT NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [text] NULL,
	[visibility] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[productColorId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
	[colorId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[productColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ratingId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
	[userId] [nvarchar](20) NOT NULL,
	[value] [float] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ratingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 10/24/2020 10:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[wishListId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](20) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[wishListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'admin1', N'$2a$10$7KS4ftWeyGr2lYwunuat1uxr6uBXAb9p5c.fAOYx/isSE50KAUehS', N'nguyenxuannghiep@gmail.com', N'Nguyen Xuan Nghiep', 1, NULL, NULL, 1, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'customer1', N'$2a$10$sOkIc.NahdaI.M6HMCY3zeFxUlZLGPxasqFpMv2A/2l6cU1d2i./C', N'nguyennhan@gmail.com', N'Nguyen Nhan', 1, NULL, NULL, 3, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'customer2', N'customer2', N'nguyenanhquan@gmail.com', N'Nguyen Anh Quan', 1, NULL, NULL, 3, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'seller1', N'seller1', N'letranvietlong@gmail.com', N'Le Tran Viet Long', 1, NULL, NULL, 2, NULL)
INSERT [dbo].[Account] ([userID], [password], [email], [fullname], [isActived], [token], [infoId], [roleId], [avartar]) VALUES (N'seller2', N'aaaaaaa', N'agsa@gamail.com', N'Nhan nguyen', 0, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0001', N'a1')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C0002', N'a2')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C001', N'Iphone')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C002', N'Ipad')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C003', N'Macbook')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C004', N'Watch')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C005', N'Airpod')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'C006', N'Accessories
')
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (1, N'Red')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (2, N'Blue')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (3, N'Green')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (4, N'Gray')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (5, N'Black')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (6, N'Pink')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (7, N'Yellow')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (8, N'Purple')
INSERT [dbo].[Color] ([colorId], [colorName]) VALUES (9, N'White')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (1, N'P001', N'https://product.hstatic.net/1000253476/product/suplo-002a-03_master.jpg')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (2, N'P001', N'https://product.hstatic.net/1000253476/product/suplo-002a-02_master.jpg')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (3, N'P001', N'https://product.hstatic.net/1000253476/product/suplo-002a-04_master.jpg')
INSERT [dbo].[Image] ([imgId], [productId], [imgUrl]) VALUES (5, N'P001', N'https://product.hstatic.net/1000253476/product/suplo-002a-0111_master.jpg')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P001', N'C001', N'Iphone 7', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 7000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/iphone-7-plus-gb-ll-a-quoc-te-vang-hong-didongviet_1.jpg', N'Made by Apple', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P002', N'C001', N'Iphone 8', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 8000000, N'https://didongviet.vn/pub/media/catalog/product/cache/926507dc7f93631a094422215b778fe0/i/p/iphone-8-plus-zp-a-256gb-mau-vang-quoc-te_1.jpg', N'Made by Apple', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P003', N'C001', N'Iphone X', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 10000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/iphone-x-64gb_2.jpg', N'Made by Apple', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P004', N'C001', N'Iphone XsMax', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 12000000, N'https://maccity.com.my/image/cache/data/iphone/iphone-xs/iPhoneXsMax-Gold-2UP-Angled-SCREEN-01-450x579.jpg', N'Made by Apple', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P005', N'C001', N'Iphone 11', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 15000000, N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-red-2-400x460-400x460.png', N'Made by Apple', 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P006', N'C001', N'Iphone 11 Pro Max', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 18000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/iphone-11-pro-max-512gb-2-sim.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P011', N'C002', N'iPad Air', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 5000000, N'https://didongviet.vn/pub/media/catalog/product//u/n/untitled-2_5.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P012', N'C002', N'iPad Air 2', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 7000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-air-2-32gb-wifi-4g-cu-didongviet.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P013', N'C002', N'iPad 9.7 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 8000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-9-7inch-32gb-2018-wifi-4g-didongviet.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P014', N'C002', N'iPad 10.2 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 10000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-10-2inch-2020-ban-32gb.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P015', N'C002', N'iPad Mini 5', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 95000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-mini-64gb-2019-xam-didongviet_2.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P016', N'C002', N'iPad Pro 11 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 12000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-pro-11-2018-64gb-wifi-4g-didongviet.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P017', N'C002', N'iPad Pro 12.9 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 15000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-pro-12-9-2018-64gb-wifi-cu-likenew-didongviet_1.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P018', N'C002', N'iPad Pro 2020 11 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 24000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-pro-2020-11inch-128gb-wifi_4.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P019', N'C002', N'iPad Pro 2020 12.9 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 28000000, N'https://didongviet.vn/pub/media/catalog/product//i/p/ipad-pro-2020-12inch-128gb-ban-wifi_2.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P021', N'C003', N'Macbook Air 2015 13 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 13000000, N'https://didongviet.vn/pub/media/catalog/product//m/a/macbook-air-retina-13inch-2015-mjvg2-didongviet_2_1_2_2.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P022', N'C003', N'Macbook Air 2018 13 Inch', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 29000000, N'https://didongviet.vn/pub/media/catalog/product//m/a/macbook-air-2018-13inch-128gb-didongviet.jpg', NULL, 1)
INSERT [dbo].[Product] ([productId], [categoryId], [productName], [updateDate], [price], [thumbnail], [description], [visibility]) VALUES (N'P031', N'C004', N'Apple Watch Series 3 38mm', CAST(N'2020-10-20T00:00:00.000' AS DateTime), 5000000, N'https://didongviet.vn/pub/media/catalog/product//a/p/apple-watch-series-3-gps-38-mm_3.jpg', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (1, N'P001', 1, 10)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (2, N'P001', 2, 5)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (3, N'P001', 3, 7)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (4, N'P001', 4, 8)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (5, N'P001', 5, 12)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (6, N'P002', 1, 10)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (7, N'P002', 3, 10)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (9, N'P003', 4, 10)
INSERT [dbo].[ProductColor] ([productColorId], [productId], [colorId], [quantity]) VALUES (10, N'P003', 5, 10)
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_InfoUser] FOREIGN KEY([infoId])
REFERENCES [dbo].[InfoUser] ([infoId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_InfoUser]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Cart] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Cart]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_ProductType] FOREIGN KEY([productColorId])
REFERENCES [dbo].[ProductColor] ([productColorId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_ProductType]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductType_Product]
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Size] FOREIGN KEY([colorId])
REFERENCES [dbo].[Color] ([colorId])
GO
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductType_Size]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Account]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Product]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Account] FOREIGN KEY([userId])
REFERENCES [dbo].[Account] ([userID])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_Account]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_Product]
GO
USE [master]
GO
ALTER DATABASE [YourAnswer] SET  READ_WRITE 
GO
