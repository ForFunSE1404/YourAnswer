USE [master]
GO
/****** Object:  Database [YourAnswer]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[CartDetail]    Script Date: 10/26/2020 1:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[cartDetailId] [int] NOT NULL,
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [nvarchar](20) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[cartDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[InfoUser]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/26/2020 1:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [nvarchar](20) NOT NULL,
	[categoryId] [nvarchar](20) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[updateDate] [datetime] NULL,
	[quantity] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Rating]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 10/26/2020 1:40:50 PM ******/
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
/****** Object:  Table [dbo].[WishList]    Script Date: 10/26/2020 1:40:50 PM ******/
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
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Product]
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
