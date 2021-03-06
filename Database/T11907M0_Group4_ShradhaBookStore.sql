USE [ShradhaBookStore]
GO
ALTER TABLE [dbo].[Shipping] DROP CONSTRAINT [FK_Shipping_ToTable]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Publisher]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Category(CategoryCode) ]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Category ]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_ToTable]
GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 25/12/2020 19:34:26 ******/
DROP INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 25/12/2020 19:34:26 ******/
DROP INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[UserInfo]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Shipping]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Reply]
GO
/****** Object:  Table [dbo].[RatingReview]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[RatingReview]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Publisher]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[FeedBack]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Contact]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Cart]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 25/12/2020 19:34:26 ******/
DROP TABLE [dbo].[Banner]
GO
USE [master]
GO
/****** Object:  Database [ShradhaBookStore]    Script Date: 25/12/2020 19:34:26 ******/
DROP DATABASE [ShradhaBookStore]
GO
/****** Object:  Database [ShradhaBookStore]    Script Date: 25/12/2020 19:34:26 ******/
CREATE DATABASE [ShradhaBookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShradhaBookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShradhaBookStore.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShradhaBookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShradhaBookStore_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShradhaBookStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShradhaBookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShradhaBookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShradhaBookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShradhaBookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShradhaBookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShradhaBookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShradhaBookStore] SET  MULTI_USER 
GO
ALTER DATABASE [ShradhaBookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShradhaBookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShradhaBookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShradhaBookStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShradhaBookStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShradhaBookStore]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerCode] [int] IDENTITY(101,1) NOT NULL,
	[Image] [varchar](max) NULL,
	[CreateAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](50) NULL,
	[UserID] [int] NULL,
	[Amount] [int] NULL,
	[Price] [float] NULL,
	[Picture] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryCode] [varchar](2) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[YourName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Message] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedBackID] [int] IDENTITY(100,1) NOT NULL,
	[UserID] [int] NULL,
	[FullName] [varchar](60) NULL,
	[Email] [varchar](50) NULL,
	[Title] [varchar](150) NULL,
	[Message] [varchar](max) NULL,
	[FeedBackAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderNo] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NULL,
	[ZipCode] [varchar](10) NOT NULL,
	[State] [varchar](10) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](25) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[OrderPlaced] [datetime2](7) NOT NULL,
	[Fee] [float] NULL,
	[From] [nvarchar](max) NOT NULL,
	[To] [nvarchar](max) NOT NULL,
	[note] [varchar](50) NULL,
	[ordertype] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NOT NULL,
	[ProductCode] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[order_number] [varchar](50) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductCode] [varchar](50) NOT NULL,
	[ProductName] [varchar](150) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[AuthorName] [varchar](150) NULL,
	[ReleaseYear] [varchar](4) NULL,
	[Ver] [float] NULL,
	[Used] [bit] NULL,
	[Review] [varchar](1000) NULL,
	[CategoryCode] [varchar](2) NOT NULL,
	[PublisherCode] [varchar](3) NOT NULL,
	[Picture] [varchar](max) NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_Product_ProductCode] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherCode] [varchar](3) NOT NULL,
	[PublisherName] [varchar](150) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RatingReview]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RatingReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](50) NULL,
	[UserId] [int] NULL,
	[Rate] [int] NULL,
	[Context] [varchar](1500) NULL,
	[CreateAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reply](
	[ReplyID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[MailTo] [varchar](50) NULL,
	[ReplyTitle] [varchar](50) NULL,
	[ReplyMessage] [varchar](max) NULL,
	[ReplyAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Delivering] [bit] NULL,
	[Delivered] [bit] NULL,
	[OrderNo] [int] NULL,
	[Delivered_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 25/12/2020 19:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](60) NULL,
	[UserName] [varchar](50) NULL,
	[PassWord] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Adress] [varchar](150) NULL,
	[IsAdmin] [bit] NULL,
	[Status] [bit] NULL,
	[CreateAt] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerCode], [Image], [CreateAt]) VALUES (101, N'banner-books.jpg', CAST(N'2020-12-18 22:49:36.780' AS DateTime))
INSERT [dbo].[Banner] ([BannerCode], [Image], [CreateAt]) VALUES (102, N'banner-books-3.jpg', CAST(N'2020-12-18 22:53:25.120' AS DateTime))
INSERT [dbo].[Banner] ([BannerCode], [Image], [CreateAt]) VALUES (103, N'banner-books-2.jpg', CAST(N'2020-12-18 22:53:44.453' AS DateTime))
INSERT [dbo].[Banner] ([BannerCode], [Image], [CreateAt]) VALUES (104, N'banner4.jpg', CAST(N'2020-12-20 09:03:18.777' AS DateTime))
INSERT [dbo].[Banner] ([BannerCode], [Image], [CreateAt]) VALUES (105, N'131940926_2834353050220793_1672012579023021838_n.jpg', CAST(N'2020-12-20 09:03:31.033' AS DateTime))
INSERT [dbo].[Banner] ([BannerCode], [Image], [CreateAt]) VALUES (106, N'banner5.jpg', CAST(N'2020-12-20 09:03:43.410' AS DateTime))
SET IDENTITY_INSERT [dbo].[Banner] OFF
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'B1', N'Novel Books')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'B3', N'Foreign Language Learning Books')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'C0', N'CDs Readable')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'C1', N'CDs Re Writable')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'DL', N'Dictionaries & Languages')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'F0', N'Food & Drink')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'H0', N'Health ')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'S0', N'Sports')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'U1', N'Utilities Pen')
INSERT [dbo].[Category] ([CategoryCode], [CategoryName]) VALUES (N'U2', N'Utilities Pencil')
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([FeedBackID], [UserID], [FullName], [Email], [Title], [Message], [FeedBackAt]) VALUES (134, 15, N' Hung Dinh', N' LikeSpring0104@gmail.com', N'Book Very Nice !', N' Nice clean book, fast delivery.                   ', CAST(N'2020-12-23 00:23:00.000' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBackID], [UserID], [FullName], [Email], [Title], [Message], [FeedBackAt]) VALUES (135, 15, N' Hung Dinh', N' LikeSpring0104@gmail.com', N'Thanks Shop!', N'    I will buy some book again!                    ', CAST(N'2020-12-23 00:24:08.000' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBackID], [UserID], [FullName], [Email], [Title], [Message], [FeedBackAt]) VALUES (136, 17, N' Nguyen Dinh Huy', N' huygin012@gmail.com', N'Beatifull !', N'      There is a compliment about the store''s service. Thanks Shop.            ', CAST(N'2020-12-23 00:27:33.000' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBackID], [UserID], [FullName], [Email], [Title], [Message], [FeedBackAt]) VALUES (137, 18, N' Pham Huy Hieu', N' huyhieu023@gmail.com', N'Extremely satisfied', N'                        Fast delivery, good product', CAST(N'2020-12-23 00:30:38.000' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBackID], [UserID], [FullName], [Email], [Title], [Message], [FeedBackAt]) VALUES (138, 19, N' Lai Tan Duy', N' laitanduy02@gmail.com', N'FeedBack', N'Consistent with the price, simplicity and ease of use, the sharpness of details is not high due to low cost          ', CAST(N'2020-12-23 00:32:35.000' AS DateTime))
INSERT [dbo].[FeedBack] ([FeedBackID], [UserID], [FullName], [Email], [Title], [Message], [FeedBackAt]) VALUES (139, 20, N' Hoang Minh Tam', N' hoangminhtam23@gmail.com', N'Nice vs cheap goods', N'       A good product.                  ', CAST(N'2020-12-23 00:33:48.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (106, N'trungksdoa', N'trungksdoa', N'cachmangthang8', NULL, N'727700', N'trungksdoa', N'trung', N'0767468441', N'trung@gmail.com', CAST(N'2020-12-25 13:57:21.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cacia Downs, South Australia, Australia', N'2312321', N'Payment after delivery', N'Order being cancle')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (107, N'213213', N'trungksdoa', N'cachmangthang8', NULL, N'727700', N'trungksdoa', N'trungksdoa', N'0767468441', N'trungksdoa@gmail.com', CAST(N'2020-12-25 14:01:00.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Đường Cách Mạng Tháng Tám, Phường Tân Đồng, Binh Phuoc, Vietnam', N'2222', N'Payment after delivery', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (108, N'trungksdoa', N'trung', N'cachmangthang8', NULL, N'727700', N'trungksdoa', N'trung', N'0767468441', N'trungksdoa@gmail.com', CAST(N'2020-12-25 14:35:36.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Đường Cách Mạng Tháng Tám, Phường Tân Đồng, Binh Phuoc, Vietnam', N'2222', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (109, N'trungksdoa', N'trungksdoa', N'anh', NULL, N'727700', N'trungksdoa', N'727700', N'0767468441', N'trungksdoa@gmail.com', CAST(N'2020-12-25 14:42:07.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cache Creek, British Columbia, Canada', N'dasdsda', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (110, N'213213', N'trung', N'7159sadsadsa', NULL, N'727700', N'trungksdoa', N'trung', N'0767468441', N'trungksdoa@gmail.com', CAST(N'2020-12-25 14:44:18.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Caboolture, Queensland, Australia', N'sadsadsa', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (111, N'213213', N'trung', N'7159sadsadsa', NULL, N'727700', N'trungksdoa', N'trung', N'0767468441', N'trungksdoa@gmail.com', CAST(N'2020-12-25 14:44:18.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Caboolture, Queensland, Australia', N'sadsadsa', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (112, N'213213', N'trungksdoa', N'sdsads', NULL, N'727700', N'trungksdoa', N'trung', N'0767468441', N'admin2@gmail.com', CAST(N'2020-12-25 14:45:46.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cáceres, Cáceres, Spain', N'213213', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (113, N'213213', N'OrderNo', N'dsadssadsa', NULL, N'727700', N'trungksdoa', N'trungksdoa', N'0767468441', N'trungksdsddaoa@gmail.com', CAST(N'2020-12-25 14:57:29.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cacuppa Station, South Australia, Australia', N'sdsadsadas', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (114, N'trungksdoa', N'trung', N'cascsadsa', NULL, N'727700', N'trungksdoa', N'312132', N'0767468441', N'trung@gmail.com', CAST(N'2020-12-25 15:01:57.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cáceres, Cáceres, Spain', N'2321321', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (115, N'trungksdoa', N'trung', N'Parkway', NULL, N'727700', N'23232', N'trungksdoa', N'0767468441', N'trung@gmail.com', CAST(N'2020-12-25 15:02:49.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cáceres, Cáceres, Spain', N'23213', N'Payment after delivery', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (116, N'trungksdoa', N'trung', N'caParkway', NULL, N'727700', N'trung', N'727700', N'0767468441', N'admin2@gmail.com', CAST(N'2020-12-25 15:03:23.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'CC Newman Park, East Gosford, New South Wales, Australia', N'sdad', N'Payment after delivery', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (117, N'trungksdoa', N'trungksdoa', N'sdsadsad', NULL, N'727700', N'trungksdoa', N'trungksdoa', N'0767468441', N'admindsad@gmail.com', CAST(N'2020-12-25 15:25:20.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cache Creek, British Columbia, Canada', N'23213', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (118, N'trungksdoa', N'trungksdoa', N'sadsadsa', NULL, N'727700', N'trungksdoa', N'OrderNo', N'0767468441', N'trung@gmail.com', CAST(N'2020-12-25 15:32:54.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Đường Cách Mạng Tháng Tám, Binh Phuoc, Vietnam', N'23213', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (119, N'trungksdoa', N'trungksdoa', N'Parkway', NULL, N'727700', N'trung', N'727700', N'0767468441', N'trungksdsddaoa@gmail.com', CAST(N'2020-12-25 15:35:15.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cache Creek, British Columbia, Canada', N'2222', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (120, N'trungksdoa', N'trung', N'Parkway', NULL, N'727700', N'23232', N'trung', N'0767468441', N'trungksdoa@gmail.com', CAST(N'2020-12-25 15:37:33.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Venice, Venice, Italy', N'TEST', N'Payment Before Order', N'Order is confirm')
INSERT [dbo].[Order] ([OrderNo], [FirstName], [LastName], [AddressLine1], [AddressLine2], [ZipCode], [State], [Country], [PhoneNumber], [Email], [OrderPlaced], [Fee], [From], [To], [note], [ordertype], [Status]) VALUES (121, N'213213', N'trungksdoa', N'Parkway', NULL, N'727700', N'213213', N'trung', N'0767468441', N'admin2@gmail.com', CAST(N'2020-12-25 15:42:33.0000000' AS DateTime2), 30, N'FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh', N'Cát Tiên National Park, Vietnam', N'2312321', N'Payment Before Order', N'Order is confirm')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (162, 106, N'C0RBO26', 115, 2675, N'00000106', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (163, 107, N'B1KD003', 1, 43.99, N'00000107', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (164, 107, N'C0RBO25', 1, 50, N'00000107', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (165, 108, N'C0RBO24', 1, 49, N'00000108', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (166, 108, N'C0RBO25', 2, 70, N'00000108', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (167, 108, N'C0RBO23', 1, 53, N'00000108', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (168, 108, N'C0RBO26', 1, 53, N'00000108', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (169, 108, N'B1KD003', 1, 43.99, N'00000108', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (170, 108, N'B1KD001', 99, 1119, N'00000108', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (171, 109, N'B1KD001', 99, 1119, N'00000109', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (172, 110, N'B1KD001', 123, 1383, N'00000111', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (173, 111, N'B1KD001', 123, 1383, N'00000111', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (174, 112, N'B1KD001', 99, 1119, N'00000112', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (175, 113, N'C0RBO24', 1, 49, N'00000113', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (176, 114, N'B1KD001', 30, 360, N'00000114', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (177, 114, N'B1KD002', 100, 1530, N'00000114', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (178, 114, N'B1KD003', 94, 1345.06, N'00000114', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (179, 115, N'B1KD006', 1, 47, N'00000115', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (180, 116, N'B1KD006', 56, 47, N'00000116', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (181, 117, N'B1KD001', 8280, 91110, N'00000117', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (182, 117, N'B1KD002', 9699, 145515, N'00000117', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (183, 117, N'B1KD003', 9711, 135886.89, N'00000117', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (184, 118, N'B1KD001', 8280, 91110, N'00000118', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (185, 118, N'B1KD002', 9699, 145515, N'00000118', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (186, 119, N'B1KD001', 1, 41, N'00000119', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (187, 120, N'B1KD001', 8280, 91110, N'00000120', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderNo], [ProductCode], [Amount], [Price], [order_number], [UserID]) VALUES (188, 121, N'B1KD001', 8280, 91110, N'00000121', 2)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD001', N'The Dark Duet Series', 11, 100, N'C.J. Roberts', N'2011', 1, 0, N'Revenge! is Caleb''s sole target. Kidnapped by a power-hungry bandit as a child, he was sold as a slave. Living a humiliating life left him with no other intentions but revenge.

Twelve years as a slave, he infiltrated this world, searching for the man who had caused his painful life.

Although that person changes his identity and lives a different life, the nature cannot be repaired.

Caleb wants to get close enough to act, to be the thing he hates most, to kidnap pretty and train to be what he used to be, a slave.

Olivia Ruiz, 18, just woke up in a strange place. When she opened her eyes, the voice of the stranger entered her ears. His name is Caleb but he made her call him master.

Olivia is young, beautiful, innocent and extremely stubborn. The dark desire for the pleasure of the body is concealed or denied, but still tries to do so. Though afraid of the strong, ruthless and arrogant man', N'B1', N'KD0', N'the-dark-duet-series.jpg', CAST(N'2020-12-24 21:41:35.010' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD002', N'The Kiss Of The Devil', 15, 100, N'Barbara Cartland', N'2016', 1, 1, N'BCCCC', N'B1', N'KD0', N'the-kiss-of-the-devil.jpg', CAST(N'2020-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD003', N'The Penniless Peer', 13.99, 96, N'Barbara Cartland', N'1974', 1, 1, N'The charming red-haired girl Fenella Lambert has been in love with her handsome cousin since childhood. When Lord Perequine Corbury returned from the battle of Napoleon''s army, he was in a difficult situation. It is she who comes up with a daring solution to help him restore his entire estate - even though the answer is that the person he loves will marry another woman. Together with Perequine, Fenella embarked on an adventure filled with more danger than ever', N'B1', N'KD0', N'the-penniless-peer.jpg', CAST(N'2020-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD004', N'The Accidental Wedding', 13, 97, N'Anne Gracie', N'2010', 1, 1, N'When Nash Renfrew woke up in the bed of the cute Maddy Woodford, he lost his memory. The days that followed his accident, he was drawn to her bright outlook on life, with the nights he spent in her bed, with her, but innocent - more or less. When his memory returned, Nash asked for just one more night before he left. But one night was too much and it created a scandal where he had no choice but to ask her to marry him.', N'B1', N'KD0', N'the-accidental-wedding.jpg', CAST(N'2020-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD005', N'Juliet', 13, 99, N' Anne Fortier', NULL, 1, 1, N'Juliet began to fear that the terrible curse "both families were destroyed by heaven" was the predestination for her fate. And only the strong, courageous Romeo was able to turn the curse into meaninglessness. Suddenly meeting his life Romeo, together through many events, even dangerous to his life, but in the end, the modern Romeo-Juliet couple have come together with the same grievances. dissolved in perfect happiness', N'B1', N'KD0', N'juliet.jpg', CAST(N'2020-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD006', N'Three weeks in Paris', 17, 99, N'Barbara Taylor Bradford', NULL, 1, 0, N'The sky was pale blue, the sun soggy as it passed through the rooftops, almost white in the cold and warm northern light. But whatever the weather is, Paris is always beautiful; Even in the rain, Paris still has its own characteristics.
When he spotted a taxi, he called and as it slowed and stopped completely, he quickly got into the car and told to take it to the post office. When he got there, he flipped through a pack of pre-stamped envelopes and put them in the mailbox, then headed back to the car.

Then he told the driver to drive to the FedEx office, then sat still in his seat, glancing occasionally out the door. How happy he was to return to the city of Light, but no matter what, he could not help wishing it would be warmer today.', N'B1', N'KD0', N'ba-tuan-o-paris.jpg', CAST(N'2020-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD007', N'His Very Personal Assistant', 15, 99, N'Carole Mortimer', NULL, 1, 0, N'When Kit was admitted to Marcus Maitland''s Private Secretary, she was ready to resist him. If her high-walled outfit, glasses, and simple hair couldn''t do that, her cold temper and cold demeanor would do it.

However, during the past week of work, Marcus became too private with his Secretary. Without that pair of glasses and rigid clothes, Kit felt stripped naked in front of him - fit or well suited to Marcus.', N'B1', N'KD0', N'his-very-personal-assistant.jpg', CAST(N'2020-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B1KD008', N'His chrismas Virgin', 14, 99, N'Carole Mortimer', NULL, 1, 0, N'''For me it''s a whole world difference,'' he said harshly.

'' Why? Most men would be very pleased when he was the girl''s first lover, ''she retorted.

"But not with this man." He replied with a boil.

Mac couldn''t believe Jonas wouldn''t make love to her just because she was a virgin!

''Why is that, Jonas? ''she defied. ''Do you think I did such a big thing because I imagined that I loved you? Or, according to me, are you trying to trap me in some way? ''''

Her eyes widened as she saw his stiff, cold expression, a chill in her eyes, which was exactly what he thought - and clearly frightened …', N'B1', N'KD0', N'his-christmas-virgin.jpg', CAST(N'2020-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B3DT001', N'Miracle English Prefixes', 15, 99, N'Jang Heok suh', NULL, 1, 0, N'Miracle English Prefixes - Great New Words From The Author Information
Jang Heok Suh
Go to the author''s own page
See all author''s books
If you are struggling with memorizing hundreds of long and difficult words. Then this is the secret you are looking for!

Learning vocabulary has never been easier with the word-based learning method - an extremely effective method that helps learners easily guess the meaning and understand English words that have never been seen before.', N'B3', N'DT0', N'361625_p92266mprefix.jpg', CAST(N'2020-12-18 11:05:17.030' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'B3TG001', N'Toeic All In One', 17, 0, N'Hackers Language Research Institue, Inc.', NULL, 1, 0, N'Currently, most universities / colleges in Vietnam as well as businesses consider the TOEIC degree an important criterion for graduation and recruiting staff. Education organization IIG Vietnam - national representative of the American Educational Testing Service (ETS) announced that the TOEIC test will officially be updated with a new structure from June 1, 2019 in Vietnam. The new exam structure will have some changes compared to the current TOEIC test, appearing some new question types along with the number of questions in some sections has changed. In order to help readers avoid the initial surprise when becoming familiar with the new exam format, TOEIC ALL-IN-ONE LC + RC book is born to provide readers with certain understanding of the topic structure. exam, as well as details about the number of questions and features of each section.
', N'B3', N'TG0', N'344222_p88290mtoiec.jpg', CAST(N'2020-12-18 20:35:52.557' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0MDF01', N'Big English 2Ed PTE Level 5 (5CD)', 3.66, 99, N'Flexoffice', N'2007', 1, 0, N'Big English 2Ed PTE Level 5 (5CD) It''s a BIG world out there and today''s young learners have BIG goals. BIG ENGLISH engages students with fun topics and activities that motivate them to learn English. BIG ENGLISH aims to make sure that every student has the tools they need to succeed. Balanced development of language skills and CLIL lessons are the core of this course, but it has so much more! Critical thinking about BIG ideas and Culture Connections challenge students to learn and think about the BIG wide world around them, helping them build 21st century skills. Assessment for Learning encourages self-efficacy and develops learner confidence to think BIG.', N'C0', N'MDF', N'DVD01.jpg', CAST(N'2020-12-23 11:36:50.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0MDF02', N'Big English 2Ed PTE Level 4 (5CD)', 2.64, 99, N'Flexoffice', N'2002', 1, 0, N'"Big English 2Ed PTE Level 4 (5CD)
It''s a BIG world out there and today''s young learners have BIG goals. BIG ENGLISH engages students with fun topics and activities that motivate them to learn English. BIG ENGLISH aims to make sure that every student has the tools they need to succeed.
Balanced development of language skills and CLIL lessons are the core of this course, but it has so much more! Critical thinking about BIG ideas and Culture Connections challenge students to learn and think about the BIG wide world around them, helping them build 21st century skills. Assessment for Learning encourages self-efficacy and develops learner confidence to think BIG."
', N'C0', N'MDF', N'DVD02.jpg', CAST(N'2020-12-23 11:37:51.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0MDF03', N' Big English 2Ed PTE Level 3 (4CD)', 3.12, 99, N'Flexoffice', N'2002', 1, 0, N'"Big English 2Ed PTE Level 4 (5CD)
It''s a BIG world out there and today''s young learners have BIG goals. BIG ENGLISH engages students with fun topics and activities that motivate them to learn English. BIG ENGLISH aims to make sure that every student has the tools they need to succeed.
Balanced development of language skills and CLIL lessons are the core of this course, but it has so much more! Critical thinking about BIG ideas and Culture Connections challenge students to learn and think about the BIG wide world around them, helping them build 21st century skills. Assessment for Learning encourages self-efficacy and develops learner confidence to think BIG."
', N'C0', N'MDF', N'DVD03.jpg', CAST(N'2020-12-23 11:38:42.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0MDF04', N'Big English 2Ed PTE Level 2 (4CD)', 3.65, 99, N'Flexoffice', N'2002', 1, 0, N'"Big English 2Ed PTE Level 4 (5CD)
It''s a BIG world out there and today''s young learners have BIG goals. BIG ENGLISH engages students with fun topics and activities that motivate them to learn English. BIG ENGLISH aims to make sure that every student has the tools they need to succeed.
Balanced development of language skills and CLIL lessons are the core of this course, but it has so much more! Critical thinking about BIG ideas and Culture Connections challenge students to learn and think about the BIG wide world around them, helping them build 21st century skills. Assessment for Learning encourages self-efficacy and develops learner confidence to think BIG."
', N'C0', N'MDF', N'DVD04.jpg', CAST(N'2020-12-23 11:39:27.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0OS001', N'Objective Key Audio (x2CD)', 2.56, 99, N'Cambridge', N'2007', 1, 0, N'The second edition of the Objective learning system prepares for the Cambridge Key English Test certificate exam. Provides material for 70 hours, which can be extended to 90 hours.

The course combines systematic preparation for the exam with a strengthening of the level achieved by the students. Interactive discs provide tasks and games, and encourage students to study at home.

The teacher manual offers tips for active use of school time, additional materials for work, tests.', N'C0', N'OS0', N'DVD05.jpg', CAST(N'2020-12-23 11:42:07.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0PM001', N'The Business Advanced: Student''s Book DVD ROM Pack', 10, 99, N'Business', N'1999', 1, 0, N'The business
', N'C0', N'PM0', N'The_Business .jpg', CAST(N'2020-12-23 12:01:36.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO01', N'Ali Zaoua', 20, 99, N'Arts Entertainment', N'2003', 1, 0, N'Ali, Kwita, Omar and Boubker are a group of street urchins living on the hard streets of Casablanca. Their everyday lives are filled with violence, begging, and indifference. In order to survive, they create a bond of friendship and family between them. The bond is cut short when Ali is senselessly killed by a blow to the head, his life taken by a single act of a rival gang. Ali''s friends decide not to report his death to the police, who would have the boy buried in a potter''s field. Instead they decide to give him a worthy burial, to bury Ali on the private island he so often dreamed.', N'C0', N'RBO', N'Ali_Zaoua.jpg', CAST(N'2020-12-23 12:03:28.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO02', N'OT: Our Town', 20, 99, N'Arts Entertainment', N'2003', 1, 0, N'Against all odds, students at Manuel Dominguez High School set out to put on school''s first theatrical production in over 20 years. But what does Thornton Wilder''s famous play about life in rural Grover''s Corners have to do with Compton, California? OT: Our Town follows the students on their discovery of the power of art and the human spirit.
', N'C0', N'RBO', N'OurTown.jpg', CAST(N'2020-12-23 12:07:25.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO03', N'The Great Works of Sacred Music', 20, 99, N'Arts Entertainment', N'2016', 1, 0, N'Western classical music is one of humanity''s most sublime artistic traditions. Significantly, this great musical language-encompassing genres from symphonic and instrumental music to choral works and opera-was created through the meeting of art and faith. The first music schools in Europe were associated with the Catholic Church. Originally, the Church commissioned music, as composers and the clergy used the power of music to exalt God. The lineage of sacred works not only forms a glorious tradition within Western music, but also ultimately produced some of the greatest masterpieces in Western art, and created the foundation of the Western musical canon as we now know it. This phenomenal tradition includes works of genius such as: - Josquin des Prez''s Ave Maria, gratia plena, an exquisite polyphonic motet, and one of the first masterworks of sacred music; - Claudio Monteverdi''s Vespro della Beata Virgini, whose vocal pyrotechnics evoke the immensity of heaven; - Mozart''s Requiem, the f', N'C0', N'RBO', N'TheGreatWorksofSacredMusic.jpg', CAST(N'2020-12-23 12:08:31.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO04', N'Light of My Eyes', 20, 99, N'Arts Entertainment', N'2003', 1, 0, N'Release Venice Film Festival award winner for Best Actor and Best Actress, Light of My Eyes follows the precarious romance between two people cast adrift in a lonely urban landscape. Antonio is a "fallen angel", an ordinary man without direction or ambition. Maria is a single mother whose life is slipping out of her control. As Antonio is drawn deeper into her fragile situation, he discovers a sense of hope they both might not be ready for yet.
', N'C0', N'RBO', N'LightofMyEyes.jpg', CAST(N'2020-12-23 12:10:25.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO05', N'Carol''s Journey', 20, 99, N'Arts Entertainment', N'2004', 1, 0, N'Carol''s Journey
', N'C0', N'RBO', N'Carol''sJourney.jpg', CAST(N'2020-12-23 13:54:08.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO06', N'A Peck on the Cheek', 29, 99, N'Arts Entertainment', N'2003', 1, 0, N'A little girl''s search for her biological mother, who had abandoned her as a newborn baby, is brought out poignantly in A Peck on the Cheek. Amudha, adopted by Thiru and Indira and growing up with the couple''s two sons, is blissfully unaware of her parentage, until the couple decides to inform her of it on her ninth birthday. At first shocked into disbelief, Amudha then expresses her determination to seek her biological mother. The search takes the family to strife-torn Sri Lanka, where Amudha comes face-to-face with reality, and reconciles herself to it. With films like Mouna Ragam, Alaipayuthe and now A Peck on the Cheek, director Mani Ratnam proves once again that he is at his best when tackling human emotions and relationships.
', N'C0', N'RBO', N'a-peck-on-the-cheek_cover.jpg', CAST(N'2020-12-23 13:57:35.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO07', N'Three Men on a Plane', 25, 99, N'Arts Entertainment', N'2019', 1, 0, N'A single mom finds her romantic life is up in the air—and getting turbulent—in this "intelligent, hard-nosed comedy" (The Observer). Pamela Pryor is free. Her son has, at last, left home. Her business is thriving. But she''s feeling strangely restless, and there''s the small matter of the missing Mr. Right. There have been three significant men in her life: her ex-husband, Peter; Douglas, the style guru turned perfect post-divorce romance; and Dean, the younger man as wildly handsome as he is completely inappropriate. All three are suddenly back in Pamela''s life and, as luck and air travel would have it, about to board the same flight. Pamela felt she was ready for a new man, but not three, not now . . . and not on one plane. "An ingenious story-line affording ample scope for the sly humor at which Mavis Cheek excels." —The Observer "A marvellous writer whose characters are beautifully drawn, whose observations on the absurd behavior of the middle aged invariably hit the mark and who mak', N'C0', N'RBO', N'ThreeMenona Plane.jpg', CAST(N'2020-12-23 13:58:41.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO08', N'Long Life, Happiness and Prosperity', 34, 99, N'Arts Entertainment', N'2007', 1, 0, N'In Long Life, Happiness and Prosperity, twelve-year old Mindy Ho (Valerie Tian) tries Taoist magic to fix her single mother''s (Sandra Oh) financial situation and seemingly hopeless romantic prospects. Mindy''s misdirected charms appear to cause an aging security guard to lose his job and a local butcher to win the lottery. The guard, the butcher and her mother''s stories all intersect, bound together by Mindy''s attempts at magic intervention. Set in the Chinese Canadian community, Long Life, Happiness and Prosperity is a story of hope and the importance of keeping faith in this sometimes difficult world.
', N'C0', N'RBO', N'longlife.jpg', CAST(N'2020-12-23 14:00:39.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO09', N'Rage in Placid Lake', 23, 99, N'Arts Entertainment', N'2004', 1, 0, N'Placid Lake (played by rock-n-roll star Ben Lee) has always been different. His crayon-eating, scientific genius of a best friend, Gemma (Rose Byrne) also has a few issues with blending in. As an odd fish in a sea of mediocrity, his brilliant ideas are bound to get him into more trouble than success. So when he finds himself in a tight spot with the school bullies who have been after him all his life, Placid decides to make a bid for the elusive normal life. To his parents'' horror, he gets a low-level office job and is soon embracing conformity on the fast track to corporate success. But can Placid finally retire his rage in the pursuit of being just like everyone else? Or will his plan backfire?
', N'C0', N'RBO', N'therageinplacidlake.jpg', CAST(N'2020-12-23 14:02:28.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO10', N'Angel Has Fallen', 34, 99, N'Arts Entertainment', N'2019', 1, 0, N'Set against the backdrop of the 1960s-free love, the Cold War, and the dawn of feminism-Falling Angels is a wickedly funny story of three sisters coming of age in a wildly dysfunctional family. Based on Barbara Gowdy''s novel, Falling Angels is a keen observation of the destructive effects of secrecy and the bonds of duty between parents and children.
', N'C0', N'RBO', N'angel-has-fallen-movie-poster.jpg', CAST(N'2020-12-23 14:05:49.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO11', N'The Man of the Year', 23, 99, N'Arts Entertainment', N'2003', 1, 0, N'Maiquel has lost a bet and dyed his hair blond. This little event triggers a head-on collision with destiny in which Maiquel goes from nobody to hero to outlaw.all in 24 hours. Based on the award-winning novel by Patricia Melo "O Matador", this vibrant and brazen crime saga follows in the vein of recent Brazilian Cinema such as Vincente Amorim''s Middle of the World, Walter Salles'' Central Station and Fernando Meirelles'' City of God.
', N'C0', N'RBO', N'TheManoftheYear.jpg', CAST(N'2020-12-23 14:06:35.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO12', N'Drifters', 20, 99, N'Arts Entertainment', N'2005', 1, 0, N'Hong Yunsheng, also called "er di" meaning "young brother," illegally enters the United States and takes a job at a Chinese restaurant. After he impregnates his boss'' daughter, he is forced to disown his son. When he violates the agreement, however, his boss reports him to the authorities, and he is sent back to his Chinese birthplace. Years later, Hong''s son arrives at the same village as Hong, uniting with his mother''s family. Hong yearns to see his child, and his attempts spark a dispute between the two families. Moving and beautifully shot, Drifters offers a glimpse of the complex consequences of migration.
', N'C0', N'RBO', N'Drifters.jpg', CAST(N'2020-12-23 14:07:29.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO13', N'Buddy', 32, 99, N'Arts Entertainment', N'2002', 1, 0, N'Kristoffer''s love life is on the rocks. But what can you expect from a guy who likes to videotape himself and his friends pulling outrageous stunts? So when Kristoffer''s video diary winds up at a popular TV show, it''s not just his love life that turns upside down. A vibrant young cast explores the true meaning of friendship and love in a heartwarming story about hi jinks, crazy roommates and reality television.
', N'C0', N'RBO', N'Buddy.jpg', CAST(N'2020-12-23 14:08:24.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO14', N'The Republic of Love', 20, 99, N'Arts Entertainment', N'2007', 1, 0, N'Basing this film on the novel by Pulitzer Prize-winning author Carol Shields, Deepa Mehta brings us her remarkable and deeply mature look at the awkward road to love. Fay is a young, brighteyed museum curator with near impossible standards for a romance. Tom is a three-time divorcE and radio show host who ruminates with his listeners on the possibility (or not) of enduring love. Although they live in the same building and their paths seem bound to cross, they continually miss each other by a hair. When these two shell-shocked veterans of wars of the heart finally meet, will love at first sight conquer all rational expectations?
', N'C0', N'RBO', N'TheRepublicofLove.jpg', CAST(N'2020-12-23 14:09:23.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO15', N'Inch''Allah Dimanche', 25, 99, N'Arts Entertainment', N'2009', 1, 0, N'Zouina is a woman who is torn from her home in Algeria. With her 3 children and her mother-in-law, she rejoins her husband in a foreign, unaccommodating land. She finds herself feeling imprisoned between a distant husband, a hostile mother-in-law and a neighbor who is afraid of Zouina''s otherness. But Zouina finally feels a sense of acceptance when she meets a cosmetics factory worker who sparks in Zouina an interest in French culture. This curiosity, and her longing for freedom, drives Zouina to take secret excursions with her children on Sundays, the one day that her husband and mother-in-law are out of the house. Through these little adventures, she comes to terms with the difficulties of change & adaptation to a new culture.
', N'C0', N'RBO', N'Inch''Allah Dimanche.jpg', CAST(N'2020-12-23 14:12:01.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO16', N'Be With Me', 22, 99, N'Arts Entertainment', N'2006', 1, 0, N'Be with Me is a tapestry of three stories woven around the themes of love, hope and destiny. Although the main characters come from different backgrounds and lead different lives, they all long to be with their loved ones. Unknown to them, these different souls will share the same stage in a play written by Fate, one that involves tragedy and redemption. The characters in the movie are fictitious except for Theresa Chan. Deaf and blind since she was 14,Theresa-who is now 61-is a remarkable woman who has triumphed over her disabilities to live an amazing life. She is the film''s beacon, a symbol of strength and hope. ". we love this film because Be with Me confirms that the best minimalist films can capture immense perspectives, which are those of the heart and soul." Oliver Pere, Artistic Director for The Festival de Cannes Directors'' Fortnight
', N'C0', N'RBO', N'BeWithMe.jpg', CAST(N'2020-12-23 14:13:17.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO17', N'The Great Match', 15, 99, N'Arts Entertainment', N'2002', 1, 0, N'The Great Match tells the adventurous story of three soccer fans, none of whom have ever met, but who nevertheless have two things in common: first, they all live in the farthest-flung corners of the planet and, second, they are all determined to watch the TV broadcast of the 2002 World Cup final between Germany and Brazil. The protagonists in this "global" comedy are a family of Mongolian nomads, a camel caravan of Tuareg in the Sahara, and a group of Indios in the Amazon. They all live 300 miles away from the next town-and the next television-making their task a particularly daunting one. Nevertheless, these inventive people possess the resourcefulness and the willpower to achieve their goal.
', N'C0', N'RBO', N'TheGreatMatch.jpg', CAST(N'2020-12-23 14:14:07.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO18', N'The Bothersome Man', 27, 99, N'Arts Entertainment', N'2003', 1, 0, N'Forty-year-old Andreas arrives in a strange city with no memory of how he got there. He is presented with a job, an apartment-even a wife. But before long, Andreas notices that something is wrong. The people around him seem cut off from any real emotion, and communicate only in superficialities. The ominous "Caretakers," who make sure the city runs smoothly, keep a close watch over Andreas when they realize he doesn''t fit in. Andreas makes an attempt to escape the city, or his life, but he discovers there''s no way out-not even suicide. Then Andreas meets Hugo, who has the same longings as himself. Hugo has found a crack in the wall in his cellar from which beautiful music streams out. In hopes that the crack leads to "the other side," Andreas and Hugo hatch a new plan of escape.
', N'C0', N'RBO', N'thebrother.jpg', CAST(N'2020-12-23 14:19:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO19', N'Mother of Mine', 20, 99, N'Arts Entertainment', N'2002', 1, 0, N'During World War II, more than 70,000 Finnish children were evacuated to neutral Sweden to avoid the conflict. Mother of Mine, the latest from the award-winning Klaus HArO (Elina), tackles that painful patch of history in the tale of nine-year-old Eero, a child who increasingly feels abandoned by his biological Finnish mother and yet not attached to his Swedish surrogate mom. When he is returned to Finland, his confusion intensifies.
', N'C0', N'RBO', N'MotherOfmine.jpg', CAST(N'2020-12-23 14:19:42.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO20', N'Ben X', 21, 99, N'Arts Entertainment', N'2007', 1, 0, N'Ben is a bit different. His life is full of strange rituals, and a mild form of autism prevents normal communication with others. As a result, he often seems to be living in another universe-while he is a courageous hero in the computer gaming world that consumes him, Ben is tormented by classmates and ignored by apathetic teachers in his daily life. As the bullies'' relentless attacks push him over the edge and out of control, his online dreamgirl, Scarlite, steps in to help him devise a perfect plan to make them pay for their persecution. Director Nic Balthazar''s dazzling debut blends fantasy and harsh social realism to bring us an utterly original and important film. "A galvanizing portrait of autism and its profound impact on both the autistic person and their families and community, Ben X boldly melds virtual reality with live-action vEritE style and docudrama to create what may be a new film grammar. Inspired by actual events-the suicide of a mildly autistic Belgian student who wa', N'C0', N'RBO', N'BenX.jpg', CAST(N'2020-12-23 14:20:22.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO21', N'The Pope''s Toilet', 26, 99, N'Arts Entertainment', N'2007', 1, 0, N'It''s 1988, and Melo, a Uruguayan town on the Brazilian border, awaits the visit of Pope John Paul II. Fifty thousand people are expected to attend, and the most humble locals believe that selling food and drink to the multitude will just about make them rich. Petty smuggler Beto thinks he has the best idea of all-he decides he will build a WC in front of his house and charge for its use. His efforts bring about unexpected consequences, and the final results will surprise everyone. "FernAndez and Charlone have achieved something . with . visual and dramatic intensity."-Screen Daily
', N'C0', N'RBO', N'ThePope''sToilet.jpg', CAST(N'2020-12-23 14:21:10.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO22', N'1981', 33, 99, N'Arts Entertainment', N'2010', 1, 0, N'Filmmaker Ricardo Trogi recalls the events surrounding his family moving to a new neighborhood when he was 11-years-old.
', N'C0', N'RBO', N'1981.jpg', CAST(N'2020-12-23 14:22:01.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO23', N'Great Minds of the Eastern Intellectual Tradition', 23, 99, N'Arts Entertainment', N'2017', 1, 0, N'"Western philosophy is a vast intellectual tradition, the product of thousands of years of revolutionary thought built up by a rich collection of brilliant minds. When most of us study philosophy, we''re focusing only on the Western intellectual tradition brought about by people such as Aristotle, Descartes, and Nietzsche. But to understand the Western intellectual tradition is to only get half of the story. Just as important, and just as valid a contribution to philosophy, is the Eastern intellectual tradition. Eastern philosophy is also the product of thousands of years of thought and was also built up by a distinct group of brilliant thinkers. Among these are the Buddha, Confucius, Gandhi, and Zarathustra. Their ideas demonstrate fascinating, wholly different ways of approaching, understanding, and solving the same fundamental questions that concerned the West''s greatest thinkers, such as the existence of God, the meaning of life, the nature of truth and reality, the organization of ', N'C0', N'RBO', N'GreatMindsoftheEasternIntellectualTradition.jpg', CAST(N'2020-12-23 14:22:49.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO24', N'Sacred Texts of the World', 19, 99, N'Arts Entertainment', N'2019', 1, 0, N'"Throughout history, religious expression has been an essential human activity, deeply influencing the development of cultures and civilizations. Today, even after centuries of scientific empiricism, the world''s major religions are as active as ever, continuing to speak profoundly to their believers'' self-conception and ways of living. With few exceptions, humanity''s religions are grounded in their sacred texts-foundational writings that crystallize the principles and vision of the faiths, forming the basis of belief and action. The worldwide library of sacred texts is a vast and extraordinary canon that includes a large number of the most impactful books ever written. Beyond the Hebrew and Christian scriptures and Islam''s Qur''an, jewels of the world''s sacred writings include the Hindu Vedas, the Buddhist Sutras, Daoism''s Daodejing, and the Analects of Confucius, as well as the revered texts of traditions such as Zoroastrianism and Jainism, and modern faiths such as Baha''i. These are t', N'C0', N'RBO', N'SacredTextsoftheWorld.jpg', CAST(N'2020-12-23 14:23:41.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO25', N'How to Play Piano', 20, 99, N'Arts Entertainment', N'2019', 1, 0, N'"The piano is one of the most gratifying instruments to play, and an excellent introduction to the theory and practice of music. From folk melodies and holiday tunes to challenging classical forms or jazzy improvisation, the piano is also one of the most versatile instruments, allowing both melodic lead and harmonic accompaniment. Yet, too many people who want to play don''t know where to begin-or believe playing requires too much work-so they miss out on the joys that playing even a simple melody can bring. How to Play Piano is your opportunity to pick up this marvelous skill. Taught by acclaimed pianist Professor Pamela D. Pike of Louisiana State University, these 36 accessible lessons give you the building blocks you need to go from an interested novice to expressive and talented player. Blending music theory and history with hands-on examples and step-by-step instruction, Professor Pike takes you on a journey from learning how to sit at the piano in the first place to inverting chor', N'C0', N'RBO', N'HowtoPlayPiano.jpg', CAST(N'2020-12-23 14:24:18.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C0RBO26', N'The Irish Identity', 23, 99, N'Arts Entertainment', N'2004', 1, 0, N'"1902: Yeats''s play Cathleen ni-Houlihan debuts in Dublin, spreading a mythic story that inspires Irish nationalists. 1916: A group of rebels takes over key landmarks throughout Dublin in a failed attempt to spark a revolution across the country. 1916: James Joyce publishes A Portrait of the Artist as a Young Man, a deeply personal reflection of his own exploration of identity, mirroring Ireland''s struggle to define its national identity. 1921: Michael Collins returns from England with a treaty by which the transition to an independent Ireland can finally begin, but back home, nationalists are extremely displeased. These are just a few of the monumental occurrences and artistic events that rocked the world in the late 19th and early 20th centuries as Ireland gradually shook off the shackles of British rule. Alongside a long and painful political process arose one of the greatest flourishings of literature in modern times-a spirited discourse among those who sought to shape their nation', N'C0', N'RBO', N'theirishidentity.jpg', CAST(N'2020-12-23 14:26:15.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'C1MDF01', N'Combo 50 blank CD / DVD, blank DVD / CD', 9.43, 99, N'PRO-OFFICE', N'2009', 1, 0, N'Capacity: 4.7Gb data - Recording speed: 16x
', N'C1', N'MDF', N'DVD06.jpg', CAST(N'2020-12-23 11:43:07.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLHC001', N'Cutting Edge 3rd Edition Upper Intermediate Students'' Book and DVD Pack', 48, 99, N'Jonathan Bygrave', N'2019', 1, 0, N'New World culture lessons encourage the exploration of contemporary topics and develop online research skills. Language live lessons provide light-hearted contexts for practising functional language and writing.
', N'DL', N'HC0', N'CuttingEdge3rdEditionUpperIntermediateStudents''BookandDVDPack.jpg', CAST(N'2020-12-22 20:30:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLHD001', N'Essential Grammar in Use', 53, 99, N'Olga Sands', N'2017', 1, 0, N'The world''s best-selling grammar series for learners of English. Essential Grammar in Use Russian edition is a self-study reference and practice book for elementary-level learners (A1-B1). The book is simple, easy-to-use and is perfect for independent study, covering all the areas of grammar you need at this level

', N'DL', N'HD0', N'Essentia GrammarinUse.jpg', CAST(N'2020-12-22 20:23:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLHD002', N'Grammar in Use Intermediate', 51, 99, N'Raymond Murphy', N'2018', 1, 0, N'The world''s best-selling grammar series for learners of English. Grammar in Use Intermediate with Answers and Interactive eBook, authored by Raymond Murphy, is the first choice for intermediate (B1-B2) learners of American English and covers all the grammar required at this level
', N'DL', N'HD0', N'GrammarinUseIntermediate.jpg', CAST(N'2020-12-22 20:24:49.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLHD003', N'Cutting Edge 3rd Edition Pre-Intermediate Students'' Book and DVD Pack', 47, 98, N'Araminta Crace', N'2020', 1, 0, N'New World culture lessons encourage the exploration of contemporary topics and develop online research skills. Language live lessons provide light-hearted contexts for practising functional language and writing.
', N'DL', N'HD0', N'CuttingEdge3rdEditionPre-IntermediateStudents''BookandDVDPack.jpg', CAST(N'2020-12-22 20:28:38.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLJC001', N'Business Vocabulary in Use', 38, 99, N'Bill Mascull', N'2018', 1, 0, N'The essential book for professionals and students looking to expand their business vocabulary. Bringing learners up to date with the language they need for business today, this book explains words and expressions, provides practice in using the new language, and also reflects recent developments in technology and business practice
', N'DL', N'JC0', N'BusinessVocabularyinUse.jpg', CAST(N'2020-12-22 20:27:18.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLJC002', N'The Elements of Style', 47, 99, N'William Strunk', N'2019', 1, 0, N'The original edition of the most trusted writer''s guide to American English, this is the book that generations of writers have relied upon for timeless advice on grammar, diction, syntax, sentence construction, and many other writing essentials. In brief concise terms, author William Strunk Jr
', N'DL', N'JC0', N'TheElementsofStyle.jpg', CAST(N'2020-12-22 20:31:27.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLJC003', N'Norwegian-English Dictionary', 38, 99, N'Einar Haugen', N'2020', 1, 0, N'The original edition of the most trusted writer''s guide to American English, this is the book that generations of writers have relied upon for timeless advice on grammar, diction, syntax, sentence construction, and many other writing essentials. In brief concise terms, author William Strunk Jr
', N'DL', N'JC0', N'Norwegian-EnglishDictionary.jpg', CAST(N'2020-12-22 20:32:29.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'DLKD001', N'How to Own the Room', 21, 99, N'Viv Groskop', N'2019', 1, 0, N'Most books about public speaking don''t tell you what to do when you open your mouth and nothing comes out. And they don''t tell you how to get over the anxiety about performance that most people naturally have. They don''t tell you what to do in the moments when you are made, as a woman, to feel small. They don''t tell you how to own the room. This book does.
', N'DL', N'KD0', N'HowtoOwntheRoom.jpg', CAST(N'2020-12-22 20:34:16.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'F0HD001', N'The Hand & Flowers Cookbook', 18.56, 89, N'Tom Kerridge', N'2020', 1, 0, N'The long-awaited cookbook from Tom Kerridge''s legendary two-Michelin-star pub.

The Hand & Flowers is the first (and only) pub in the world to acquire two Michelin stars. At this relaxed and accessible dining space in the heart of Buckinghamshire, Tom Kerridge serves up innovative, sophisticated dishes that masterfully reinvent and elevate British classics for the twenty-first century.', N'F0', N'HD0', N'TheHand &Flowers Cookbook.jpg', CAST(N'2020-12-20 13:10:26.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'F0HD002', N'How to Eat Better', 20.12, 98, N'James Wong', N'2017', 1, 0, N'THE SUNDAY TIMES BESTSELLER

''James Wong brings some welcome sanity to the world of healthy eating...its genius is his advice on how to get more nutrition from fruit and veg. It''s fascinating, and better than cutting out food groups or paying for so-called superfoods'' - delicious. magazine.', N'F0', N'HD0', N'HowtoEat Better.jpg', CAST(N'2020-12-20 13:12:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'F0IP001', N'Dishoom', 16, 99, N'Shamil Thakrar', N'2019', 1, 0, N'THE SUNDAY TIMES BESTSELLER

''A love letter to Bombay told through food and stories, including their legendary black daal'' Yotam Ottolenghi

At long last, Dishoom share the secrets to their much sought-after Bombay comfort food: the Bacon Naan Roll, Black Daal, Okra Fries, Jackfruit Biryani, Chicken Ruby and Lamb Raan, along with Masala Chai, coolers and cocktails.', N'F0', N'IP0', N'Dishoom.jpg', CAST(N'2020-12-20 13:07:50.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'F0IP002', N'Comfort: food to soothe the soul', 18.25, 99, N'John Whaite', N'2017', 1, 0, N'Comfort food is enjoying a renaissance as people start to shy away from exclusion diets and `clean eating'' and embrace the balance of nourishing homemade meals. With the concept of hygge emphasising the importance of enjoying the sensual, warming things in life, cosy cooking has taken on a new life.', N'F0', N'IP0', N'Comfortfoodto soothethe soul.jpg', CAST(N'2020-12-20 13:14:09.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'F0IP003', N'The Ritz London', 21.23, 99, N'John Williams', N'2018', 1, 0, N'AS SEEN ON TV
As featured on ITV''s ''Inside the Ritz'' series



''When you look at the dishes in this book, the photographs - it''s beyond beautiful. You wouldn''t need to cook a thing. You could just flick through these pages - it is a proper feast for the eyes.'' - Graham Norton

''As sumptuous as Williams''s exquisite cooking, this is a magnificent volume. And a fitting tribute to one of the world''s great restaurants. The recipes aren''t simple but this is one of those books to immerse yourself in. Five-star brilliance.'' - Tom Parker Bowles, Mail on Sunday', N'F0', N'IP0', N'TheRitz London.jpg', CAST(N'2020-12-20 13:15:34.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'F0JC001', N'Cycling In Ireland', 22, 99, N'David Flanagan', N'2018', 1, 0, N'This book documents the best cycling that Ireland has to offer. With eighty routes spread across the entire island, there is something for everyone; from gentle, traffic-free cycles, ideal for the whole family, to long challenging routes packed with relentless climbs.

The routes range in length from 8km to 207km on a variety of surfaces including tarmac roads, gravel tracks, canal towpaths and singletrack.

Each route description includes:
- A full-colour map.
- Turn-by-turn directions.
- A route profile.
- A detailed description of the route.
- Advice on variations, extensions and shortcuts.
- A downloadable GPX navigation file.', N'F0', N'JC0', N'CyclingIn Ireland.jpg', CAST(N'2020-12-20 13:03:39.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'F0JC002', N'Nordic Bakery Cookbook', 16, 99, N'Miisa Mink', N'2018', 1, 0, N'"Mink''s effortless recipes, peppered with foodie reminiscing and mouthwatering photos, will cement this book as your go-to bakery manual all year round." Making magazine



Revel in the delights of baking from Scandinavia and the Nordic region with this treasure trove of the tastiest and most traditional recipes.', N'F0', N'JC0', N'NordicBakery Cookbook.jpg', CAST(N'2020-12-20 13:04:50.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0DT001', N'The Happy Health Plan', 31, 11, N'David Flynn', N'2020', 1, 0, N'Want to improve your health, lose weight or gain more energy? A plant-based diet might be the answer you''re looking for.
', N'H0', N'DT0', N'TheHappyHealthPlan.jpg', CAST(N'2020-12-22 20:52:01.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0EP001', N'Hold on to Your Kids', 14, 150, N'Dr Gabor Mate', N'2020', 1, 0, N'"Mate''s book will make you examine your behaviour in a new light'' Guardian

''bold, wise and deeply moral. [Mate] is a healer to be cherished'' Naomi Klein, author of No Logo and The Shock Doctrine

Children take their lead from their friends: being ''cool'' matters more than anything else. Shaping values, identity and codes of behaviour, peer groups are often far more influential than parents."
', N'H0', N'EP0', N'HoldontoYourKids.jpg', CAST(N'2020-12-22 20:51:05.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0HD001', N'When the Body Says No', 24, 88, N'Dr Gabor Mate', N'2018', 1, 0, N'"Can a person literally die of loneliness? Is there a connection between the ability to express emotions and Alzheimer''s disease? Is there such a thing as a ''cancer personality''?

Drawing on deep scientific research and Dr Gabor Mate''s acclaimed clinical work, When the Body Says No provides the answers to critical questions about the mind-body link - and the role that stress and our emotional makeup play in an array of common diseases"
', N'H0', N'HD0', N'WhentheBodySaysNo.jpg', CAST(N'2020-12-22 20:49:55.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0IP001', N'Untamed', 23, 130, N'Glennon Doyle', N'2018', 1, 0, N'"This book will shake your brain and make your soul scream. I am so ready for myself after reading this book!'' Adele

''Untamed will liberate women - emotionally, spiritually, and physically. It is phenomenal.'' Elizabeth Gilbert, author of City of Girls and Eat Pray Love"
', N'H0', N'IP0', N'Untamed.jpg', CAST(N'2020-12-22 20:48:56.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0JC001', N'Women Don''t Owe You Pretty', 21, 99, N'Florence Given', N'2020', 1, 0, N'"THE BEAUTY MYTH'' FOR THE INSTAGRAM GENERATION

Women Don''t Owe You Pretty is the ultimate book for anyone who wants to challenge the out-dated narratives supplied to us by the patriarchy.

Through Florence''s story you will learn how to protect your energy, discover that you are the love of your own life, and realise that today is a wonderful day to dump them."
', N'H0', N'JC0', N'WomenDontOweYouPretty.jpg', CAST(N'2020-12-22 20:45:26.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0JC002', N'The Body Keeps the Score', 20, 99, N'Bessel van der Kolk', N'2020', 1, 0, N'Dr. van der Kolk''s masterpiece combines the boundless curiosity of the scientist, the erudition of the scholar, and the passion of the truth teller'' Judith Herman, author of Trauma and Recovery
', N'H0', N'JC0', N'TheBodyKeepstheScore.jpg', CAST(N'2020-12-22 20:46:19.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0MC001', N'Becoming', 25, 120, N'Michelle Obama', N'2019', 1, 0, N'What''s your journey of becoming? Based on Michelle Obama''s bestselling memoir, this gorgeous journal contains more than 150 inspiring questions and quotes to help you discover your story.
', N'H0', N'MC0', N'Becoming.jpg', CAST(N'2020-12-22 20:47:09.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'H0OS001', N'Thera-pets', 24, 110, N'Kate Allan', N'2018', 1, 0, N'"Make Every Day a Little Easier
#1 Best Seller in Mental Health, Anxiety Disorders, Depression, and Phobias


Affirmations of self-love to brighten your day: Fans of Kate Allan and her colorful, inspirational illustrations will treasure this collection of daily affirmations of self-love. She draws from her own experiences with anxiety and depression to create therapeutic and soothing works of art"
', N'H0', N'OS0', N'Thera-pets.jpg', CAST(N'2020-12-22 20:48:07.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'S0EP001', N'The Wim Hof Method', 23, 99, N'Wim Hof', N'2020', 1, 0, N'THE SUNDAY TIMES BESTSELLER

''This book will change your life'' BEN FOGLE

''Positive and persuasive'' ANT MIDDLETON

My hope is to inspire you to retake control of your body and life by unleashing the immense power of the mind.

The ''Iceman'' Wim Hof shares his remarkable life story and powerful method for supercharging your strength, health and happiness.

Wim Hof is widely celebrated for his astounding achievements, breaking world records withstanding extreme temperatures and running barefoot marathons over deserts and ice fields. Most of all, he''s shown us that these feats are not superhuman - but that all of us have the ability to be stronger, healthier and happier than we''ve ever imagined.

In The Wim Hof Method, this trailblazer of human potential shares his simple three-pillar approach that anyone can use to improve health and performance - and see real results within just a few days. Refined over forty years and championed by scientists across the globe.', N'S0', N'EP0', N'TheWimHof Method.jpg', CAST(N'2020-12-20 12:47:05.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'S0IP001', N'Range', 22, 99, N'David Epstein', N'2020', 1, 0, N'SHORTLISTED FOR THE FINANCIAL TIMES/MCKINSEY BUSINESS BOOK OF THE YEAR AWARD 2019

A Financial Times Essential Reads of 2019 pick

''I loved Range'' - Malcolm Gladwell

''Urgent and important. . . an essential read for bosses, parents, coaches, and anyone who cares about improving performance.'' - Daniel H. Pink

''So much crucial and revelatory information about performance, success, and education.'' - Susan Cain, bestselling author of Quiet

A powerful argument for how to succeed in any field: develop broad interests and skills while everyone around you is rushing to specialize.

From the ''10,000 hours rule'' to the power of Tiger parenting, we have been taught that success in any field requires early specialization and many hours of deliberate practice. And, worse, that if you dabble or delay, you''ll never catch up with those who got a head start.', N'S0', N'IP0', N'Range.jpg', CAST(N'2020-12-20 12:52:09.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'S0JC001', N'The Salt Path', 22, 99, N'Raynor Winn', N'2020', 1, 0, N'Just days after Raynor learns that Moth, her husband of 32 years, is terminally ill, their home is taken away and they lose their livelihood. With nothing left and little time, they make the brave and impulsive decision to walk the 630 miles of the sea-swept South West Coast Path, from Somerset to Dorset, via Devon and Cornwall.

Carrying only the essentials for survival on their backs, they live wild in the ancient, weathered landscape of cliffs, sea and sky. Yet through every step, every encounter and every test along the way, their walk becomes a remarkable journey.', N'S0', N'JC0', N'TheSaltPath.jpg', CAST(N'2020-12-20 12:55:47.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'S0JC002', N'Llama Drama', 19, 100, N'Anna McNuff', N'2020', 1, 0, N'Why take the shortest, most direct route through life, when you could choose the wiggliest, most mountainous one possible?




Armed with a limited grasp of Spanish and determined to meet as many llamas as possible, Anna and her friend Faye set off on a 6-month journey along the spine of the largest mountain range in the world - the Andes.




Beginning in the bustling city of La Paz, the duo pedal south - through dense jungle, across pristine white salt flats and past towering volcanoes, following the path of thundering glacial rivers to the snow-tipped peaks of Patagonia.




Sleeping wild in their tents most nights, they endure 50-mph crosswinds and catastrophic crashes, and go head to head with one very determined saddle sore called Sally. By the time they make it to the southernmost tip of the continent, they have cycled 5,500 miles and ascended over 100,000 metres through the mighty Andes - equivalent to 11 times the height of Everest.', N'S0', N'JC0', N'LlamaDrama.jpg', CAST(N'2020-12-20 13:00:59.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'S0TG001', N'Young Bucks', 26, 99, N'Matt Jackson', N'2020', 1, 0, N'The electric and daring independent wrestling tag team share their inspiring story of how two undersized, ambitious athletes from Southern California became the idols of millions of popular sports fans, coveted among the ranks of AEW''s elite wrestling lineup.

Featuring over 60 photographs and alternating between each brother''s perspective, this entertaining memoir is a complete portrait of what it means to grow into-and give back to-wrestling, the sport and profession they embody and love.', N'S0', N'TG0', N'YoungBucks.jpg', CAST(N'2020-12-20 12:57:43.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'S0TG002', N'Match Annual 2021', 22, 99, N'Match', N'2020', 1, 0, N'From the makers of the UK''s best football magazine!

MATCH is the UK''s bestselling football annual and is top of Christmas wishlists for footy fans everywhere.

Inside the Match Annual 2021 you can find the ultimate guide to Euro 2020, epic interviews with the stars, plus the UK and Ireland dream team and also discover everything you need to know about Messi, Ronaldo, Kane, Salah, Mbappe, Maguire, Hazard, Pogba and all the other top footballers.

Plus, it''s packed with legendary Prem No.7s, craziest hair of 2019, brain-busting quizzes, the greatest Premiership team ever, bonkers pics, footy stars emojis, cool cartoons and loads more!

Don''t miss it!', N'S0', N'TG0', N'MatchAnnual 2021.jpg', CAST(N'2020-12-20 12:59:19.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1EP001', N'Blister of 5 Pens of Glow in the Glow Faster HP878A F-HP878A-5M', 3.82, 99, N'Faster', N'2009', 1, 0, N'Blister of 5 Pens of Glow in the Glow Faster HP878A F-HP878A-5M High quality luminous pen. The pen tip is durable, can be used for most types of paper. Used to highlight text that needs attention, memo. With ink on your hands, easy to clean with soap or water. Is a must-have product of students, students and office workers.', N'U1', N'EP0', N'PEN10.jpg', CAST(N'2020-12-23 11:29:54.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1KD001', N'Combo 12 Wrote My-Gel Dong A - Purple Ink', 6.01, 99, N'OEM', N'2003', 1, 0, N'"My-Gel Dong A Writing - Purple Ink is designed with a sleek and compact design.
Pen with small handwriting helps the writing smooth, the ink down is not clogged.
The pen tip and body are made of plastic to help avoid slippery, making it easier to write.
In particular, convenient plastic pen clips to insert or mark pages of books and notebooks.
The product is suitable for use by office workers or students."', N'U1', N'KD0', N'PEN05.jpg', CAST(N'2020-12-23 11:22:28.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1KD002', N'Erase Gel Pen GP01-DL - Blue Ink', 1.26, 99, N'PRO-OFFICE', N'2002', 1, 0, N'GP01-DL Erase Gel Pen Designed with a slim body, fit for the handle, light weight, making it easy to use anytime anywhere. Quality ink colors will give inspiration to your notes. The pen uses ink that dries quickly, does not wet, tears the paper surface when writing, providing maximum convenience and comfort when using. The ball head size is small, giving you a slender, sharp handwriting on each page. In addition, the small ball tip also helps to keep the pen from wasting ink, so you can comfortably take notes and write', N'U1', N'KD0', N'PEN07.jpg', CAST(N'2020-12-23 11:24:40.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1TL001', N'2-Head Oil Marker PO-TM101 - Blue Ink', 1.43, 99, N'PRO-OFFICE', N'2007', 1, 0, N'2-Head Oil Marker PO-TM101 The product has a modern design with 2 different pen tips: The small tip and the large tip help to diversify the writing style, convenient to use. The ink color is bold, the ink is even and continuous. Ink is not toxic The pen tip is made of Polyester material, the pen body holds firmly in the hand Good adhesion of ink to materials: Paper, wood, leather, plastic, glass, metal, ceramic, porcelain, CD Suitable for: Office workers, students, students.
', N'U1', N'TL0', N'PEN01.jpg', CAST(N'2020-12-23 11:12:46.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1TL002', N'Blister of 2 Gel Pens Thien Long TP-GEL01 - Blue Ink', 1.52, 99, N'Thien Long Hoan Cau', N'2007', 1, 0, N'Blister of 2 Gel Pens Thien Long TP-GEL01 High-end pen tip with ball is made of new technology in the world to help the pen to write smoother, ink evenly and reduce ink clogging Pen design is tapered, the lid is sturdy There is a grip handle, which makes holding the pen comfortable for a long time The pen can be replaced after the ink has been used up
', N'U1', N'TL0', N'PEN02.jpg', CAST(N'2020-12-23 11:14:15.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1TL003', N'Blister 2 Feather Oil Thien Long PM-09 - Black Ink', 1.91, 99, N'Thien Long Hoan Cau', N'2009', 1, 0, N'"Blister of 2 Thien Long Oil Brushes PM-09
Thien Long oil quill pen PM-09 is a new product in the group of office tools, produced by Thien Long Group.
The product is manufactured under modern technology, meets international quality standards, has an impressive improved design, the pen body is firm, easy to hold, does not cause fatigue when using.
 The outstanding features:
- The product has a modern design, including 2 different pen tips: The small tip and the large tip help to diversify the writing style, convenient to use.
- The ink color is dark fresh, the ink is even and continuous.
- The pen tip is made of Polyester material, the pen body holds firmly
- Good adhesion of ink on materials: paper, wood, leather, plastic, glass, metal, ceramic, porcelain, CD ...
- Suitable for: Office workers, students, students.
- 2 pen heads size: 0.8 mm and 6mm
-Inks are not toxic
- Storage: dry, cool place, cover immediately after using."
', N'U1', N'TL0', N'PEN03.jpg', CAST(N'2020-12-23 11:15:36.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1TL004', N'Sunlight Pen 022 - Red', 4.33, 99, N'Anh Duong', N'2002', 1, 0, N'Anh Duong Sharpening Pen 022
With the original pen nib used for smooth nibs, and sharpened according to the habits of users with beautiful, bold and sharp lettering pen codes.
The nib can be replaced with a pen easily and very conveniently, just like the replacement of pens in general.
To replace the nib we need to clean the pen, then take out the soft paper, pull out the old nib and the chicken gut from the pen tip, and install the new nib with the same entry.
The pen body is compact, the paint is different from the regular pen, smooth and smooth, without any decoration, so it is very simple, but still emphasizes the sophistication, elegance and courtesy of the pen.', N'U1', N'TL0', N'PEN04.jpg', CAST(N'2020-12-23 11:20:54.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1TL005', N'Cello Fine Lead 0.5mm Cello Pencil', 1.22, 99, N'Thien Long Hoan Cau', N'2004', 1, 0, N'Cello Fine Lead 0.5mm Cello Pencil Characteristics: + 0.5mm diameter lead core is manufactured from good lead material. + The handwriting is thin, clear, beautiful, long-lasting and not blurred. Preservation: + Avoid places where the temperature is too high. + Avoid dropping the product many times. + Avoid strong impact on hard objects by the product.
', N'U1', N'TL0', N'PEN11.jpg', CAST(N'2020-12-23 11:30:49.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U1TL006', N'G-1 Pilot BL-G1-5T-B Gel Pen - Black Ink', 2.73, 99, N'Pilot', N'2002', 1, 0, N'G-1 Pilot BL-G1-5T-B Gel Pen - Black Ink The Pilot G-1 gel pen is a capping Gel pen, so after using it you need to close the cap to protect the pen tip. The pen tip is 0.5mm in size, is a small tip that helps to write thin and stick. Pilot gel pen body is slim, compact and fits well for all hand sizes. So when handling or using for a long time does not cause hand fatigue. In addition, the pen grip is designed in a ripple shape to help avoid slippery when in use The nib design uses a super durable Tungsten Carbide alloy, which makes the pen operate smoothly and comfortably even under harsh conditions, which makes it difficult to damage the pen tip. The Pilot G-1 gel pen uses liquid gel ink, the ink is smooth and feels extremely smooth when writing at high speed. Retailer''s G-1 Pilot gel pen is replaceable to removable ink tanks, both saving and protecting the environment. Pilot Gel Pen G-1 is a special type to take notes or sign, can record on many different paper surfaces, the ink does', N'U1', N'TL0', N'PEN12.jpg', CAST(N'2020-12-23 11:31:45.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U2KD001', N'Combo 12 Staedtler 134 HB Pencil', 2.87, 99, N'Staedtler', N'2007', 1, 0, N'"Staedtler Pencil 134 HB
Staedtler 134 HB has a durable lead core that is hard to break when in use, helping users to make seamless, unbroken lines. HB lead has sharp, bold drawing.
The body of the pen is cast straight from 70% of the fine milled wood pulp, so the lead is hard to break and can last longer. The pen body is designed to be small, tapered to help children easily paint and draw; suitable for both adults.
The pencil tail has an eraser attached, making it convenient for users to erase. The product is already peeled, convenient to use. The wood and paint in the pen body do not contain harmful chemicals, safe for health, even when children have a habit of biting the pen."', N'U2', N'KD0', N'PEN06.jpg', CAST(N'2020-12-23 11:23:22.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U2TL001', N'Box of 12 HB Flexoffice FO-GP01 Wooden Pencils', 2.56, 99, N'Flexoffice', N'2014', 1, 0, N'HB Flexoffice FO-GP01 Wooden Pencil The HB Flexoffice FO-GP01 wooden pencil is suitable for activities such as taking notes, drafting, and studying. Characteristics: Wooden pencil is available with eraser, hexagonal body, easy to hold when writing. The body has a simple design, painted in yellow. Black and hard HB type lead. Moderately bold, less broken, easy to erase. Suitable for activities such as taking notes, drafting, studying. Storage & preservation: Limit multiple falls and strong impacts when transporting and using. Store and display in a cool place. Keep away from heat sources and direct sunlight.
', N'U2', N'TL0', N'PEN08.jpg', CAST(N'2020-12-23 11:26:33.000' AS DateTime))
INSERT [dbo].[Product] ([ProductCode], [ProductName], [Price], [Quantity], [AuthorName], [ReleaseYear], [Ver], [Used], [Review], [CategoryCode], [PublisherCode], [Picture], [CreateAt]) VALUES (N'U2TL002', N'Sakura Pigma Micron PN 8 Stroke Pen', 13.04, 99, N'Sakura', N'2007', 1, 0, N'Sakura Pigma Micron PN 8 Stroke Pen - Pigma Micron line pen is imported from Japanese Sakura company. Pen comes in different sizes of nibs and ink colors, and nibs with the same PN stroke size. - Specialized pens for drawing art lines, strokes, manga drawing are preferred by artists, architects, students .... - Exquisite design, comfortable to use - The pen evenly ink, the stroke is soft so you do not need to change the hand force much when writing and drawing. Ink color is long lasting, does not fade, is not waterproof. - Diversity of colors to meet many needs of use', N'U2', N'TL0', N'PEN09.jpg', CAST(N'2020-12-23 11:28:03.000' AS DateTime))
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'CG0', N'Chair of Econometrics Department of Business Administration and Economics University of Duisburg-Essen Essen, Germany ')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'CW0', N'CruxWoodshop')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'DT0', N'Dan Tri Publishing House')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'EP0', N'Ebury Publishing
')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'HC0', N'Ho Chi Minh City General Publishing House')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'HD0', N'Hong Duc Publishing House')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'IP0', N'Independently Published ')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'JC0', N'Journal Citation Reports ')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'KD0', N'Kim Dong')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'MC0', N'McGraw-Hill Companies,Incorporated, 2006 - Business & Economics')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'MDF', N'Manufacturing-XB Department Fahasa Company')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'ME0', N'Macmillan Education')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'OS0', N'Oregon State University')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'PM0', N'Pan MacMillan
')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'RBO', N'Recorded Books, Inc.')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'TG0', N'The Gioi')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'TL0', N'Thien Long Publisher')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'WP0', N'World Publishing House')
INSERT [dbo].[Publisher] ([PublisherCode], [PublisherName]) VALUES (N'YP0', N'Youth Publishing House')
SET IDENTITY_INSERT [dbo].[RatingReview] ON 

INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (1, N'B1KD003', 1, 4, N'This product great', CAST(N'2020-12-21 00:00:00.000' AS DateTime))
INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (2, N'B1KD003', 12, 5, N'Great', CAST(N'2020-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (3, N'B1KD003', 13, 5, N'Nice,I like this product', CAST(N'2020-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (4, N'B1KD005', 1, 5, N'I love this', CAST(N'2020-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (14, N'B1KD001', 1, 3, N'AAA', CAST(N'2020-12-22 16:29:01.243' AS DateTime))
INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (15, N'B1KD001', 1, 5, N'Great', CAST(N'2020-12-22 16:33:35.507' AS DateTime))
INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (16, N'B1KD001', 1, 5, N'Great!! I love it!!', CAST(N'2020-12-22 17:04:40.960' AS DateTime))
INSERT [dbo].[RatingReview] ([Id], [ProductCode], [UserId], [Rate], [Context], [CreateAt]) VALUES (17, N'H0DT001', 1, 4, N'Great!!!', CAST(N'2020-12-23 08:59:28.300' AS DateTime))
SET IDENTITY_INSERT [dbo].[RatingReview] OFF
SET IDENTITY_INSERT [dbo].[Reply] ON 

INSERT [dbo].[Reply] ([ReplyID], [UserID], [MailTo], [ReplyTitle], [ReplyMessage], [ReplyAt]) VALUES (17, 134, N'  LikeSpring0104@gmail.com', N'Thanks For Your Feed Back !', N'Dear, I am very glad to tell you that, you have become our customer! We just want to thank you for being a part of ShradhaBookStore. We are grateful for your continued support and loyalty to the store. Thank you again and have a great day! Best regards.', CAST(N'2020-12-23 00:38:05.000' AS DateTime))
INSERT [dbo].[Reply] ([ReplyID], [UserID], [MailTo], [ReplyTitle], [ReplyMessage], [ReplyAt]) VALUES (18, 135, N'  LikeSpring0104@gmail.com', N'We will try !', N'Dear, I am very glad to tell you that, you have become our customer! We just want to thank you for being a part of ShradhaBookStore. We are grateful for your continued support and loyalty to the store. Thank you again and have a great day! Best regards.', CAST(N'2020-12-23 00:39:10.000' AS DateTime))
INSERT [dbo].[Reply] ([ReplyID], [UserID], [MailTo], [ReplyTitle], [ReplyMessage], [ReplyAt]) VALUES (19, 136, N'  huygin012@gmail.com', N'Thanks you very muck!', N'Dear, I am very glad to tell you that, you have become our customer! We just want to thank you for being a part of ShradhaBookStore. We are grateful for your continued support and loyalty to the store. Thank you again and have a great day! Best regards.', CAST(N'2020-12-23 00:39:51.000' AS DateTime))
INSERT [dbo].[Reply] ([ReplyID], [UserID], [MailTo], [ReplyTitle], [ReplyMessage], [ReplyAt]) VALUES (20, 137, N'  huyhieu023@gmail.com', N'We will improve further', N'Dear, I am very glad to tell you that, you have become our customer! We just want to thank you for being a part of ShradhaBookStore. We are grateful for your continued support and loyalty to the store. Thank you again and have a great day! Best regards.', CAST(N'2020-12-23 00:40:41.000' AS DateTime))
INSERT [dbo].[Reply] ([ReplyID], [UserID], [MailTo], [ReplyTitle], [ReplyMessage], [ReplyAt]) VALUES (21, 138, N'  laitanduy02@gmail.com', N'We are very pleased with this.', N'Dear, I am very glad to tell you that, you have become our customer! We just want to thank you for being a part of ShradhaBookStore. We are grateful for your continued support and loyalty to the store. Thank you again and have a great day! Best regards.', CAST(N'2020-12-23 00:41:30.000' AS DateTime))
INSERT [dbo].[Reply] ([ReplyID], [UserID], [MailTo], [ReplyTitle], [ReplyMessage], [ReplyAt]) VALUES (22, 139, N'  hoangminhtam23@gmail.com', N'We will pay attention to further improvement', N'Dear, I am very glad to tell you that, you have become our customer! We just want to thank you for being a part of ShradhaBookStore. We are grateful for your continued support and loyalty to the store. Thank you again and have a great day! Best regards.', CAST(N'2020-12-23 00:42:29.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reply] OFF
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (87, 1, 1, 106, CAST(N'2020-12-25 13:57:21.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (88, 1, 1, 107, CAST(N'2020-12-25 14:01:00.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (89, 0, 0, 108, CAST(N'2020-12-25 14:35:36.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (90, 0, 0, 109, CAST(N'2020-12-25 14:42:07.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (91, 0, 0, 110, CAST(N'2020-12-25 14:44:18.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (92, 0, 0, 111, CAST(N'2020-12-25 14:44:18.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (93, 0, 0, 112, CAST(N'2020-12-25 14:45:46.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (94, 0, 0, 113, CAST(N'2020-12-25 14:57:29.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (95, 0, 0, 114, CAST(N'2020-12-25 15:01:57.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (96, 0, 0, 115, CAST(N'2020-12-25 15:02:49.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (97, 0, 0, 116, CAST(N'2020-12-25 15:03:23.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (98, 0, 0, 117, CAST(N'2020-12-25 15:25:20.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (99, 0, 0, 118, CAST(N'2020-12-25 15:32:54.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (100, 0, 0, 119, CAST(N'2020-12-25 15:35:15.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (101, 0, 0, 120, CAST(N'2020-12-25 15:37:33.000' AS DateTime))
INSERT [dbo].[Shipping] ([Id], [Delivering], [Delivered], [OrderNo], [Delivered_date]) VALUES (102, 0, 0, 121, CAST(N'2020-12-25 15:42:33.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shipping] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserID], [FullName], [UserName], [PassWord], [Email], [Phone], [Adress], [IsAdmin], [Status], [CreateAt]) VALUES (1, N'Hùng ??nh', N'hung0000', N'123456789', N'LikeSpring@gmail.com', N'033777353', N'BMT - LAK', 0, 0, CAST(N'2020-12-09 09:55:24.000' AS DateTime))
INSERT [dbo].[UserInfo] ([UserID], [FullName], [UserName], [PassWord], [Email], [Phone], [Adress], [IsAdmin], [Status], [CreateAt]) VALUES (2, N'Bui Dinh Hung', N'hung01', N'1234567890', N'Nhokli210@gmail.com', N'01212121', N'HCM', 0, 0, CAST(N'2020-12-09 09:55:24.000' AS DateTime))
INSERT [dbo].[UserInfo] ([UserID], [FullName], [UserName], [PassWord], [Email], [Phone], [Adress], [IsAdmin], [Status], [CreateAt]) VALUES (12, N'an', N'an123', N'123456', N'an2GMAIL.COM', N'54545', N'GHJGJH', 0, 1, CAST(N'2020-12-09 09:55:24.000' AS DateTime))
INSERT [dbo].[UserInfo] ([UserID], [FullName], [UserName], [PassWord], [Email], [Phone], [Adress], [IsAdmin], [Status], [CreateAt]) VALUES (13, N'Bùi ??nh Hùng', N'Student1215631', N'1234512345', N'nhokli210@gmail.com', N'+844337770782', N'33443sds12312r3ewqw', 0, 1, CAST(N'2020-12-09 09:55:24.000' AS DateTime))
INSERT [dbo].[UserInfo] ([UserID], [FullName], [UserName], [PassWord], [Email], [Phone], [Adress], [IsAdmin], [Status], [CreateAt]) VALUES (14, N'Eric Tran', N'admin', N'123456', N'admin@gmail.com', N'0867467838', N'HCM city', 1, 1, CAST(N'2020-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[UserInfo] ([UserID], [FullName], [UserName], [PassWord], [Email], [Phone], [Adress], [IsAdmin], [Status], [CreateAt]) VALUES (15, N'Hoa Nguyen Van Tran', N'adadad', N'123456', N'mmosuper25@gmail.com', N'0358818164', N'HCM', 0, 1, CAST(N'2020-12-25 10:58:35.547' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 25/12/2020 19:34:26 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 25/12/2020 19:34:26 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_ToTable] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Product] ([ProductCode])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_ToTable]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderNo])
REFERENCES [dbo].[Order] ([OrderNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Category ] FOREIGN KEY([CategoryCode])
REFERENCES [dbo].[Category] ([CategoryCode])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category ]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Category(CategoryCode) ] FOREIGN KEY([CategoryCode])
REFERENCES [dbo].[Category] ([CategoryCode])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category(CategoryCode) ]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Publisher] FOREIGN KEY([PublisherCode])
REFERENCES [dbo].[Publisher] ([PublisherCode])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Publisher]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_ToTable] FOREIGN KEY([OrderNo])
REFERENCES [dbo].[Order] ([OrderNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_ToTable]
GO
USE [master]
GO
ALTER DATABASE [ShradhaBookStore] SET  READ_WRITE 
GO
