USE [master]
GO
/****** Object:  Database [XeDap]    Script Date: 23/03/2022 10:29:34 pm ******/
CREATE DATABASE [XeDap]
go
USE [XeDap]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[IDAccount] [varchar](64) NOT NULL,
	[UserName] [varchar](32) NULL,
	[Password] [varbinary](64) NULL,
	[Email] [varchar](64) NULL,
	[Token] [varchar](64) NULL,
	[ExpiredTokenTime] [datetime] NULL,
	[IsConfirmed] [bit] NULL,
	[IsDelete] [bit] NULL,
	[FullName] [nvarchar](64) NULL,
	[Gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountAddress]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountAddress](
	[IDAddress] [int] NOT NULL,
	[IDAccount] [varchar](64) NOT NULL,
	[IsDefault] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAddress] ASC,
	[IDAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStaff]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStaff](
	[IDStaff] [varchar](64) NOT NULL,
	[UserName] [varchar](32) NULL,
	[Password] [varbinary](64) NULL,
	[Email] [nvarchar](64) NULL,
	[Token] [varchar](64) NULL,
	[ExpiredTokenTime] [datetime] NULL,
	[IsConfirmed] [bit] NULL,
	[IsDelete] [bit] NULL,
	[FullName] [nvarchar](64) NULL,
	[Gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[IDAddress] [int] IDENTITY(1,1) NOT NULL,
	[Address][nvarchar](64) null,
	[Phone] [varchar](12) NULL,
	[Reciever] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[IDAttribute] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](64) NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAttribute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[IDCart] [uniqueidentifier] NOT NULL,
	[IsExpired] [bit] NULL,
	[IDAccount] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDCategory] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](64) NULL,
	[Isdelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[IDInvoice] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateExpired] [datetime] NULL,
	[IDCart] [uniqueidentifier] NOT NULL,
	[IDAddress] [int] NOT NULL,
	[IDStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDInvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[IDCategory] [int] NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Price] [int] NULL,
	[Stock] [int] NULL,
	[ImageURL] [nvarchar](256) NULL,
	[IsDelete] [bit] NULL,
	[Description] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[IDProduct] [int] NOT NULL,
	[IDAttribute] [int] NOT NULL,
	[AttributeValue] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC,
	[IDAttribute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCart]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCart](
	[IDCart] [uniqueidentifier] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Quantity] [int] NULL,
	[PaymentPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCart] ASC,
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IDRole] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffRole]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffRole](
	[IDRole] [uniqueidentifier] NOT NULL,
	[IDStaff] [varchar](64) NOT NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC,
	[IDStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 23/03/2022 10:29:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[IDStatus] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](64) NULL,
	[IsDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountStaff] ([IDStaff], [UserName], [Password], [Email], [Token], [ExpiredTokenTime], [IsConfirmed], [IsDelete], [FullName], [Gender]) VALUES (N'mNbfHRFl1PmI6rTotiw0753icQNSXGBIfKIJTn6cmhDGVo1Ct5uMdoEC7jLhTwbW', N'1234567', 0x37FA465AC8B330D69A8C02CF161A69B1E4573FD564E239A0B9881AB0AF4AA7BEDB1377E38FFC813FDD70BCF170108998DA269C9AFA8179C785B499C17A885434, N'Thanh.huuphungak47@gmail.com', N'74052BA6A26D6743D324E69F806FC4F2', NULL, 0, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Attribute] ON 
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (1, N'
Thông số kỹ thuật
', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (2, N'Kích cỡ/Sizes', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (3, N'Màu sắc/Colors', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (4, N'Chất liệu khung/Frame', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (5, N'Phuộc/Fork', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (6, N'Giảm xóc/Shock', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (7, N'Vành xe/Rims', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (8, N'Đùm/Hubs', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (9, N'Căm/Spokes', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (10, N'Lốp xe/Tires', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (11, N'Ghi đông/Handlebar', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (12, N'Pô tăng/Stem', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (13, N'Cốt yên/Seatpost', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (14, N'Yên/Saddle', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (15, N'Bàn đạp/Pedals', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (16, N'Tay đề/Shifters', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (17, N'Chuyển đĩa/Front Derailleur', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (18, N'Chuyển líp/Rear Derailleur', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (19, N'Bộ thắng/Brakes', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (20, N'Tay thắng/Brake Levers', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (21, N'Bộ líp/Cassette', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (22, N'Sên xe/Chain', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (23, N'Giò dĩa/Crankset', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (24, N'B.B/Bottom Bracket', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (25, N'Trọng lượng/Weight', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (26, N'Thêm/Extras', 0)
GO
INSERT [dbo].[Attribute] ([IDAttribute], [AttributeName], [IsDelete]) VALUES (27, N'Chuyển dĩa/Front Derailleur', 0)
GO
SET IDENTITY_INSERT [dbo].[Attribute] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([IDCategory], [CategoryName], [Isdelete]) VALUES (1, N'Xe đạp đường phố', 0)
GO
INSERT [dbo].[Category] ([IDCategory], [CategoryName], [Isdelete]) VALUES (2, N'Xe đạp địa hình', 0)
GO
INSERT [dbo].[Category] ([IDCategory], [CategoryName], [Isdelete]) VALUES (3, N'Xe đạp đua', 0)
GO
INSERT [dbo].[Category] ([IDCategory], [CategoryName], [Isdelete]) VALUES (4, N'Xe đạp gấp', 0)
GO
INSERT [dbo].[Category] ([IDCategory], [CategoryName], [Isdelete]) VALUES (5, N'Xe đạp nữ', 0)
GO
INSERT [dbo].[Category] ([IDCategory], [CategoryName], [Isdelete]) VALUES (6, N'Xe đạp trẻ em', 0)
GO
INSERT [dbo].[Category] ([IDCategory], [CategoryName], [Isdelete]) VALUES (7, N'Khung sườn', 0)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (1, 1, N'
	Xe Đạp Đường Phố Touring GIANT Escape 3 &#8211; Bánh 700C &#8211; 2022', 9790000, 100, N'escape-3-2022-metallic-black-600x600.jpg', 0, N'
										

Xe đạp đường phố touring Giant ESCAPE 3 mang diện mạo thu hút với kiểu dáng thể thao mạnh mẽ cùng tông màu hiện đại. Mẫu xe đạp này sẽ đồng hành cùng bạn rong ruổi trên những chuyến đi khám phá cung đường mới.

Khung sườn nhôm của xe đạp đường phố Giant Escape 3 – 2022 khá thanh mảnh nhưng không kém phần bền vững với nhiều ưu điểm như nhẹ, chịu được tải trọng cao và chống chịu va đập tốt. Bên cạnh đó, khung xe còn được sơn phủ lớp sơn nhám tĩnh điện màu xám, giúp chống ăn mòn và chống gỉ sét hiệu quả dưới sự ảnh hưởng tiêu cực của thời tiết nóng ẩm.
Điểm cộng nữa của mẫu xe này là khung sườn rộng rãi cho phép người sử dụng trang bị nhiều túi treo hoặc mang theo nhiều hành lý.

Xe đạp đường phố Giant Escape 3 – 2022 được trang bị bộ truyền động Shimano Tourney nổi tiếng từ Nhật Bản với 3 đĩa và 7 líp, mang đến khả năng chuyển đổi tốc độ dễ dàng. Tay đề Tourney Shimano ST-EF41 với 21 tốc độ giúp bạn sang số nhẹ nhàng và chính xác hơn trong quá trình di chuyển.


Thắng xe đượ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (2, 1, N'
	Xe Đạp Đường Phố Touring TRINX Free 2.0 &#8211; Phanh Đĩa, Bánh 700C &#8211; 2021', 6690000, 100, N'TRIFREE20-3007-600x600.jpg', 0, N'
										

Xe đạp đường phố TrinX Free 2.0 với khung xe được thiết kế hoàn toàn bằng chất liệu nhôm ALUX 6061 cao cấp, có thể thấy các đường dây trên xe đã được đi âm trong khung của xe, cho cảm giác liền mạch hiện đại. Khung xe được thiết kế bởi những nhà thiết kế người Italy tài hoa, đem lại cho chiếc xe một kiểu dáng, phối màu cực kì đẹp mắt.
&nbsp;
Xe được trang bị bộ chuyển động của Shimano Tourney TX 24 tốc độ (3×8). Bộ líp được trang bị 8 cấp độ thoả mãn như cầu sử dụng để di chuyển trên các địa hình một cách dễ dàng. Xe đạp đường phố Trinx Free 2.0 được trang bị đùi đĩa của Proweel với 3 tốc độ, phục vụ tốt cho việc thể dục thể thao. Niềng nhôm của xe được sản xuất 2 lớp chính hãng Trinx với thiết kế mảnh phù hợp với dòng xe city đem lại trải nghiệm tốt khi di chuyển.
&nbsp;
Xe sử dụng tay nắm TrinX, một chi tiết khá nhỏ nhưng đem lại cho chiếc xe một hình hài mới đẹp đẽ. Xe sử dụng tay đề trước và sau Shimano liền phanh giúo có độ chính xác và ổn định cao. Phanh đĩa môi trườ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (3, 1, N'
	Xe Đạp Đường Phố Touring GIANT Escape 3 &#8211; Bánh 700C &#8211; 2021', 9790000, 100, N'Escape-3-2021-Charcoal-1-600x600.jpg', 0, N'
										

Xe đạp Escape 3 2021 là dòng xe đạp thành phố với cấu hình khá ấn tượng, khung xe thanh mảnh cùng màu sắc đa dạng. Với thiết kế này người chơi Giant không chỉ mong chờ sự ra mắt mà còn muốn có cơ hội sở hữu chiếc xe đường phố của Giant.



Khung xe được được làm hoàn toàn từ vật liệu hợp kim nhôm chính hãng trên công nghệ đạt chuẩn GIANT đem lại đồ bền và siêu nhẹ. Với khả năng có thể chống chịu lại đươc những va đập và giúp tham gia các hoạt động thể thao thoải mái hơn mà không phải lo lắng về việc biến dạng của khung. Tuy khung thanh mảnh nhưng kết cấu khá bền vững và mạnh mẽ nhờ đó mà hoàn toàn có thể đạt được tốc độ cao cùng sự thoải mái.

Ngoài ra, xe đạp Escape 3 2021 còn sở hữu bộ truyền động Shimano Tourney với chất lượng uy tín từ hãng Shimano nổi tiếng trên thế giới. Bộ truyền động hoạt động bền bỉ khiến người dùng hài lòng về khả năng vận hành tốt trên cung đường trường tạo cho người dùng cảm giác êm ái và không bị mất thế khi leo dốc.

Yên xe – Giant Sport Comf')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (4, 1, N'
	Xe Đạp Đường Phố Touring TRINX Free 1.0 &#8211;  Bánh 700C &#8211; 2021', 5790000, 100, N'TRIFREE10-3005-850-600x600.jpg', 0, N'
										

Xe đạp đường phố TRINX Free 1.0 là mẫu xe đạp được săn đón trong nhiều năm qua. Được thiết kế khéo léo hài hoà bởi các kỹ sư Italy, xe này còn được yêu thích bởi trọng lượng xe rất nhẹ và chất lượng được đánh giá cao trong tầm giá.

Trinx Free 1.0 có khung xe được thiết kế hoàn toàn bằng chất liệu nhôm ALUXX cao cấp chịu lực, giảm chấn trên các con đường xấu. Thiết kế tối giản với niềng xe nhôm 2 lớp làm tối giản nhỏ gọn tạo sự thanh mảnh lịch lãm cho xe. Kích thước phù hợp cho hầu hết người Châu Á cùng những gam màu sáng, tối được phối hợp hài hoà giúp thu hút mọi ánh nhìn.

Xe đạp đường phố TRINX Free 1.0  được trang bị bộ chuyển động Shimano với 21 tốc độ mang đến khả năng chuyển đổi tốc độ dễ dàng. Hệ thống chuyển động của xe đều sử dụng của Shimano một hãng phụ kiện của Nhật Bản. Nên đảm bảo tính ổn định, độ bền của xe.
 
Ghi đông nhôm hợp kim TrinX với thiết kế thể thao giống như các phiên bản trước, dễ dàng điều khiển và tư thế thoải mái.

Yên thể thao TrinX thế hệ ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (5, 1, N'
	Xe Đạp Đường Phố Touring MOMENTUM iNeed Street &#8211; Bánh 700C &#8211; 2021', 8790000, 100, N'2105001124-Xe-Đạp-Đường-Phố-TOURING-MOMENTUM-INEED-STREET-BÁNH-700C-2021-Dark-Red_12211_4-600x600.jpg', 0, N'
										


Momentum iNeed Street 2021 mang đến cho khách hàng của mình đặc biệt là các chị em công sở, hoặc các chị em nội trợ sản phẩm giàu tính giá trị thẩm mỹ cao. Nếu như bạn là một người yêu thích sự nhẹ nhàng, hài hòa không kém phần mạnh mẽ và cổ điển thì sự kết hợp giữa 2 tone màu đỏ, xanh có thể làm vừa lòng bạn ngay lập tức.


Chiếc khung sườn của dòng iNeed Street này tạo nên sự ấn tượng mạnh mẽ cho người đối diện bởi chất liệu nhôm Aluxx nổi tiếng về độ nhẹ và bền. Hình dạng kim cương kép của chúng được nhà sản xuất biến tấu và làm mới lại một cách tinh tế và không kém phần điệu nghệ. Đặc biệt, ở lối thiết kế thẳng đứng, người dùng có thể dễ dàng kiểm soát được khả năng sử dụng triệt để mọi tính năng của chú ngựa sắt này.

Xe đạp Momentum Ineed Street còn được nhà sản xuất của mình cập nhật những tính năng thông minh, rất phù hợp với nhu cầu cần thiết trên thực tế ở chiếc khung sườn trứ danh của mình. Đáng chú ý nhất có thể kể đến như: nắp đựng được lắp sẵn, baga phía sau')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (6, 1, N'
	Xe Đạp Đường Phố Touring GIANT Escape 2 City Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 13790000, 100, N'escape-2-city-disc-2022-charcoal-600x600.jpg', 0, N'
										

Với thiết kế thể thao, nhỏ gọn và khả năng vận hành mạnh mẽ, nhiều công nghệ hiện đại tiên tiến được tích hợp trên xe, Giant Escape 2 City Disc – 2022 chắc chắn sẽ tiếp tục chiếm được tình cảm của nhiều người tiêu dùng tại Việt Nam, đặc biệt là nhóm khách hàng công sở, người trung niên và những người đam mê phượt ngao du khám phá.KHUNG SƯỜNVới khung xe Giant Escape 2 City Disc – 2022 được làm từ nhôm ALUXX-Grade Aluminum, cân bằng tốt giữa trọng lượng nhẹ và sự thoải mái. Bề mặt khung được phủ lớp sơn tĩnh điện làm tăng tính thẩm mỹ và mức gọn nhẹ của xe, đồng thời góp phần làm hạn chế oxy hóa, gỉ sét trong những điều kiện thời tiết khác nhau.
BỘ TRUYỀN ĐỘNG

Bộ chuyển đĩa Shimano cùng bộ chuyển Shimano Altus 8 líp trước và Shimano FD-TY710 2 dĩa sau có tốc độ vận hành mạnh mẽ cho phép người đạp tăng tốc, dễ dàng chuyển đĩa – líp phù hợp với từng cung đường khác nhau. Điểm đặc biệt ở Giant Escape 2 City Disc – 2022 chính là tay đề rất nhạy, khi chuyển sang tốc độ nhanh ngư')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (7, 1, N'
	Xe Đạp Đường Phố Touring MOMENTUM iNeed Latte 26 &#8211; Bánh 26 Inches &#8211; 2022', 9790000, 100, N'latte-26-2022-green-600x600.jpg', 0, N'
										

				')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (8, 1, N'
	Xe Đạp Đường Phố Touring GIANT Escape 2 Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 12790000, 100, N'escape-2-disc-rosewood-850-600x600.jpg', 0, N'
										

Xe đạp đường phố Touring Giant Escape 2 Disc – 2022 có kiểu dáng hiện đại, thể thao phù hợp với các bạn muốn rèn luyện thể thao, nâng cao sức khỏe qua các hoạt động hàng ngày như đi làm, dạo phố…
Khung xe gia công bằng nhôm Aluxx bền, bên cạnh đó trọng lượng xe tương đối nhẹ, không quá nặng nề với một chiếc xe đạp đường phố thể thao. Ngoài ra, phần khung sườn được phủ một lớp sơn nhám tĩnh điện giúp xe tránh được tác động bên ngoài như gỉ sét, ăn mòn.
&nbsp;

&nbsp;
Các mối hàn trên khung xe cũng được hàn chắc chắn, gia công tỉ mỉ. Các chi tiết lắp ráp khung cũng được trải qua quá trình kiểm nghiệm độ cứng, khả năng va đập tốt giúp bạn an tâm khi di chuyển.
Điểm cộng nữa của mẫu xe này là khung sườn rộng rãi cho phép người sử dụng trang bị nhiều túi treo hoặc mang theo nhiều hành lý.
&nbsp;

&nbsp;
Bộ truyền động của Escape 2 Disc – 2022 cho xe khả năng vận hành nhanh chóng, linh hoạt với chuyển dĩa Shimano FD-TY710 có 2 dĩa và chuyển líp Shimano Altus 8 líp giúp bạn sang ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (9, 1, N'
	Xe Đạp Đường Phố Touring LIV Alight 2 DD Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 12590000, 100, N'alight-2-dd-disc-eucalyptus-my22-850-3-600x600.jpg', 0, N'
										


Được đánh giá là dòng xe đạp Giant dành riêng cho phái nữ, xe đạp đường phố Liv Alight 2 DD Disc – 2022 nổi bật với gam màu thời trang lôi cuốn, thiết kế năng động. Đây là mẫu xe đạp hoàn hảo cho chị em đang tìm kiếm mẫu xe đạp thể thao phù hợp.
&nbsp;


&nbsp;
Sườn xe được gia công bằng nhôm với công nghệ độc quyền ALUXX-Grade Aluminium của Giant, hạn chế ăn mòn, rỉ sét, trọng lượng siêu nhẹ nhưng vẫn mang đến sự vững chắc và độ bền cao. Phần khung xe được làm khá rộng rãi, người dùng có thể sử dụng để các túi treo hay hành lý mang theo, tiện lợi trong những chuyến đi dài.
&nbsp;

&nbsp;
Xe đạp đường phố thể thao sử dụng chuyển líp Shimano Altus 8 líp cùng chuyển dĩa Shimano Tourney 2 dĩa, chuyển đổi linh hoạt giúp người dùng dễ dàng sang số, điều chỉnh tốc độ chạy phù hợp, làm cho bạn hài lòng về khả năng vận hành tốt trên đường phố tạo cảm giác êm ái và không bị mất thế khi đạp lên dốc.
&nbsp;


&nbsp;
Xe đạp đường phố Alight 2 DD Disc – 2022 với bộ thắng Tektro TKB – ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (10, 1, N'
	Xe Đạp Đường Phố Touring GIANT Escape 1 Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 17790000, 100, N'escape-1-disc-2022-hematite-600x600.jpg', 0, N'
										

Xe đạp đường phố Giant Escape 1 Disc – 2022 gây ấn tượng với cấu hình cao cùng thiết kế mang phong cách hiện đại, cá tính, thể thao. Mẫu xe đạp được nhiều bạn ưa chuộng và lựa chọn làm phương tiện di chuyển đi làm, dạo phố hay thể dục thể thao,… vừa rèn luyện thể chất vừa thể hiện được sức trẻ năng động, khỏe khoắn.
Xe đạp đường phố Giant Escape 1 Disc – 2022 sử dụng chất liệu nhôm Aluxx-Grade Aluminum cao cấp với ưu điểm độ bền cao, chống ăn mòn và gỉ sét nhưng vẫn sở hữu trọng lượng nhẹ ấn tượng. Thiết kế khung xe tạo tư thế ngồi thẳng đứng mang lại cảm giác thoải mái, tốt cho xương cột sống. 
&nbsp;

&nbsp;
Các mối hàn trên khung xe cũng được hàn chắc chắn, gia công tỉ mỉ. Các chi tiết lắp ráp khung cũng được trải qua quá trình kiểm nghiệm độ cứng, khả năng va đập tốt giúp bạn an tâm khi di chuyển. Điểm cộng nữa của mẫu xe này là khung sườn rộng rãi cho phép người sử dụng trang bị nhiều túi treo hoặc mang theo nhiều hành lý.
&nbsp;

&nbsp;
Mẫu xe đạp đường phố này sử dụ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (11, 1, N'
	Xe Đạp Đường Phố Touring GIANT FastRoad SL 3 &#8211; Phanh Đĩa, Bánh 700C &#8211; 2021', 19590000, 100, N'Xe-Đạp-Đường-Phố-TOURING-GIANT-FASTROAD-SL-3-PHANH-ÐIA-BÁNH-700C-2021_FastRoad_6436_4-600x600.jpg', 0, N'
										

Xe đạp đường phố Touring Giant FastRoad SL 3 sở hữu kiểu dáng hiện đại, sang trọng, đem đến trải nghiệm tuyệt vời cho người dùng trên mọi cung đường. Dòng xe đạp này sẽ là lựa chọn hoàn hảo cho những những bạn đam mê đạp xe đường phố, rèn luyện sức khỏe….
Khung xe được gia công bằng chất liệu nhôm Aluxx cao cấp, có trọng lượng siêu nhẹ nhưng vẫn đem lại độ bền và chắc chắn. Phần khung sườn được thiết kế theo cơ chế động học giúp người dùng hạn chế mất sức khi đạp xe.

Bên cạnh đó, lớp sơn tĩnh điện bên ngoài giúp tăng tính thẩm mỹ và bền màu hơn trong suốt quá trình sử dụng. Hơn nữa, phần khung xe được thiết kế khá rộng rãi, giúp người dùng có thể trang bị nhiều phụ kiện cho những chuyến đi dài.

Xe đạp đường phố được trang bị bộ truyền động Shimano Claris 16 tốc độ bao gồm 2 dĩa 8 líp đến từ thương hiệu uy tín Shimano của Nhật Bản, hỗ trợ sang số mượt mà khi thay đổi địa hình, không bị mất thế khi đang leo dốc.
&nbsp;


Xe đạp đường phố Touring Giant FastRoad SL 3 sở hữu ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (12, 1, N'
	Xe Đạp Đường Phố Touring GIANT FastRoad SL 2 &#8211; Phanh Đĩa, Bánh 700C &#8211; 2021', 22590000, 100, N'Xe-Đạp-Đường-Phố-TOURING-GIANT-FASTROAD-SL-2-PHANH-ÐIA-BÁNH-700C-2021_FastRoad_5967_4-1-600x600.jpg', 0, N'
										

FastRoad SL 2 là một mẫu xe đường phố hội tụ cả tốc độ và sức mạnh. Xe đạp đường phố FastRoad SL 2, đạp xe không chỉ là một môn thể thao mà trên hết đó là niềm đam mê tột đỉnh.

Chỉ với ánh nhìn đầu tiên, FastRoad SL 2 đã khiến người dùng mê mẩn trước vẻ ngoài lịch lãm, sang trọng bởi thiết kế phần khung nhôm Aluxx SL thon gọn nhẹ tạo cảm giác mềm mại, không cứng nhắc như những mẫu xe khác. Kết hợp cùng công nghệ đi dây âm sườn mang lại độ thẩm mỹ cao đồng thời tối ưu lực cản gió.

Ngoài linh hồn là bộ khung nhôm siêu nhẹ với thiết kế khí động học, thì mẫu xe mới nhất này được trang bị trái tim là bộ chuyển động Shimano Sora 2×9 tốc độ đời mới cho sự chuyển động vô cùng mượt mà và chính xác.


Hệ thống phanh đĩa thủy lực Tektro HD-R280 kiểu mới với cơ cấu đĩa tản nhiệt và gia cường độ cứng cho hiệu suất cao hơn. Kích thước đĩa nhỏ hơn, trông gọn gàng và cứng cáp.

Ống đầu áp dụng công nghệ OverDrive giúp gia tăng độ cứng khi di chuyển và độ ổn định cao, cùng hệ thống phuộc')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (13, 2, N'
	Xe Đạp Địa Hình MTB GIANT Talon 4 &#8211; Phanh Đĩa, Bánh 27.5 Inches &#8211; 2021', 10790000, 100, N'12.jpg', 0, N'
										

Đối với các tín đồ của thể loại xe đạp địa hình, cái tên Giant Talon 4 &#8211; 2021 được mệnh danh là một trong số những dòng sản phẩm có khả năng cân bằng tốt nhất về cả vận tốc lẫn sự kiểm soát an toàn tối ưu trên mọi cung đường dành cho chủ nhân sở hữu của mình.

Khung sườn thường được các tín đồ yêu thích thể loại xe đạp địa hình chú ý đặt lên trên hàng đầu. Xe đạp địa hình Giant Talon 4 chủ yếu được cấu thành nên từ chất liệu hợp kim nhôm ALUXX-grade aluminum.

Vốn là một dòng sản phẩm nằm trong thể loại xe đạp địa hình. Thế nên, hệ thống truyền động cũng chính là một trong những vấn đề rất quan tâm của người dùng đối với Giant Talon 4. Những bộ groupset của chúng thường được chọn lựa chủ yếu từ nhà cung cấp Shimano nổi tiếng trên toàn thế giới. Trong đó, tay đề Shimano SL-M315, chuyển đĩa Shimano M315, chuyển líp Shimano Tourney.


Một trong những đặc điểm riêng rất dễ dàng nhận ra trên dòng sản phẩm xe đạp địa hình Giant Talon 4 chính là ở hệ thống bánh xe. Chúng th')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (14, 2, N'
	Xe Đạp Địa Hình FORNIX X26 &#8211; Bánh 26 Inches', 4490000, 100, N'FORX26-7036-FORNIX-X26-XÁM-VÀNG-1-600x600.jpg', 0, N'
										

Đên từ thương hiệu xe đạp tầm trung nổi tiếng FORNIX, xe đạp địa hình FORNIX X26 là sản phẩm hướng tới mọi khách hàng với thiết kế trẻ trung, hiện đại cùng công năng ấn tượng đây là sự lựa chọn rất tốt cho những ai mong muốn tìm kiếm 1 chiếc xe giá rẻ nhưng vẫn đảm bảo được khả năng sử dụng.
&nbsp;
Khung sườn hợp kim thép chắc chắn, bền và khả năng chịu đựng va đạp cao. Thiết kế độc đáo khung sườn nhỏ, thấp dần về phía sau. Lớp sơn xe chống nước chống bụi giúp bạn yên tâm về tính thẩm mỹ khi di chuyển thời gian dài.
&nbsp;
Bộ truyền động 24 tốc độ với 3 đĩa và 8 líp giúp bạn chuyển số nhanh chóng đồng thời giúp xe vận hành trơn tru, mượt mà, đáp ứng được mọi địa hình với nhiều tốc độ khác nhau. Giò dĩa thiết kế tối ưu giúp xe tối ưu tốc độ, tránh mất sức trong quá trình đạp.
&nbsp;
Phuộc lò xo giúp mang lại cảm giác cân bằng thoải mái giúp nâng đỡ khung xe thông qua bánh xe trước, giảm xóc nảy và duy trì sự ổn định khi xe đi qua các địa hình gồ ghề, phức tạp.
&nbsp;
Phanh ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (15, 2, N'
	Xe Đạp Địa Hình MTB GIANT ATX 27.5 &#8211; Bánh 27.5 Inches &#8211; 2021', 8490000, 100, N'ATX-2021-Vibrant-Blue-1-600x600.jpg', 0, N'
										

Từ nhà đến công viên hay đến trường, đến nơi làm việc, hay đi phượt ATX 27.5 &#8211; 2021 có thể giúp bạn cải thiện cuộc sống và sức khoẻ. Xe đạp địa hình ATX 27.5 &#8211; 2021 là sự lựa chọn mà rất nhiều người dùng mong muốn sở hữu.


Khung nhôm nhẹ mà bền cùng với khung sườn hình học đặt người lái ở vị trí cân bằng hiệu quả mang lại cho người lái sự ổn định trên những con đường bằng phẳng hoặc đường mòn gồ ghề.

Phuộc trước SR Suntour M3030A trông chắc chắn và hoạt động tốt trên những con đường gồ ghề. Phuộc dài 100mm không nhiều nhưng đủ để bạn thoải mái khi đi lại, tham quan và đi trên những con đường gồ ghề.

Bộ truyền động Shimano Tourney hoàn hảo cho mọi mục đích sử dụng trên cả đường gồ ghề và đường thành phố cùng với một loạt các bánh răng để leo trèo và tăng tốc nhanh.


Với pô tăng Giant Sport, alloy 15-degree, ghi đông Giant Sport kiểu tay lái quen thuộc của một chiếc xe đạp leo núi truyền thống. Bạn có thể tự tin đi trên đường bằng phẳng, gồ ghề hoặc bụi bẩn.
')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (16, 2, N'
	Xe Đạp Địa Hình MTB GIANT Roam 4 Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2021', 11590000, 100, N'roam-4-disc-2021-black-600x600.jpg', 0, N'
										


Có vẻ như sở hữu riêng cho mình một mẫu xe đạp thể thao như model Giant Roam 4 Disc 2021 đang là trào lưu mới mẻ và được lan rộng trong cả cộng đồng của các tín đồ yêu thích thể thao. Bởi lẽ, chúng không những mang đến cho chủ nhân của mình những cảm giác đầy kích thích, mê hoặc mà còn đưa ra nhiều sự lợi ích quan trọng rất đặc biệt cho sức khoẻ.


Xét đến chất liệu, chiếc khung sườn của mẫu xe đạp Giant Roam 4 Disc 2021 vẫn sử dụng loại Aluxx Grade Aluminium. Nhờ đó, những tính năng vượt trội và quan trọng nhất của một mẫu xe đạp thể thao hiện đại đều được đảm bảo xuyên suốt trong cả quá trình sử dụng. Nhẹ nhàng, linh hoạt nhưng lại cực kì chắc chắn và an toàn chính là những yếu tố giúp cho phiên bản xe đạp Giant Roam 4 Disc 2021 luôn luôn giữ được xác suất thành công lớn khi được tung ra bất kì thị trường nào.

Là một mẫu xe đạp thể thao &#8220;lai&#8221; giữa xe đạp đường phố và xe đạp địa hình. Thế nên, bộ truyền động của chúng đặc biệt được quan tâm khá kỹ lưỡng. Đi ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (17, 2, N'
	Xe Đạp Địa Hình MTB GIANT Roam 3 Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 12590000, 100, N'roam-3-disc-2022-metal-600x600.jpg', 0, N'
										

Đến từ thương hiệu nổi tiếng Giant, mẫu xe Roam 3 Disc – 2022 có chất lượng và độ hoàn thiện cao. Roam 3 Disc -2022 được biết đến là mẫu xe đa năng, có kiểu dáng trẻ trung, năng động, xứng đáng là đối thủ nặng kí trong dòng xe đạp thể thao hiện nay. Đây sẽ là người bạn đồng hành cùng những người yêu thích phong cách mạnh mẽ, linh hoạt để khám phá những hành trình mới.
Riêng với dòng Roam 3 Disc – 2022 là dòng xe lại hoàn hảo giữa dòng xe đạp đường phố và xe đạp địa hình, phù hợp di chuyển trên nhiều cung đường khác nhau từ cung đường phố, hay đạp đường làng cho tới các con đường mòn hay địa hình nhẹ.Phiên bản Roam 3 Disc – 2022 sở hữu bộ khung chế tác từ nhồm Aluxx có trọng lượng siêu nhẹ giúp linh hoạt di chuyển trên mọi địa hình, khả năng chịu lực tốt. Trên bề mặt khung xe được phủ lớp sơn tĩnh điện gia tăng thêm tuổi thọ của bộ khung, hạn chế ăn mòn hay gỉ sét trong điều kiện thời tiết nóng ẩm ở Việt Nam.Roam 3 Disc – 2022 được trang bị bộ chuyển líp Shimano Acera 8 líp')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (18, 2, N'
	Xe Đạp Địa Hình MTB TRINX TX16 Disc &#8211; Phanh Đĩa, Bánh 26 Inches &#8211; 2021', 5290000, 100, N'YB0476501-850-600x600.jpg', 0, N'
										

Dòng xe đạp địa hình MTB TRINX TX16 Disc bánh 26 inches là một mẫu xe đạp địa hình giá tầm trung với thiết kế khá đẹp, tinh tế và đậm chất nam tính phù hợp cho các hoạt động thể thao và di chuyển trên những cung đồng gồ ghề, nhiều ổ gà.

Với chất liệu khung TRINX Alloy bền bỉ và có trọng lượng nhẹ, kích thước phù hợp cho hầu hết người Châu Á. Khung xe được sơn tĩnh điện 3 lớp với công nghệ sơn cao cấp cho các chi tiết trên khung xe được sắc nét. Phong cách phối màu cho dòng xe đạp địa hình TRINX TX16 Disc bánh 26 inches đơn giản nhưng lại khá bắt mắt và trẻ trung.
Sử dụng bộ truyền động Shimano là một trong những thương hiệu bộ truyền động được ưa chuộng nhất thế giới. Bộ truyền động Shimano cao cấp với 21 cấp độ (3 dĩa, 7 líp). Xe đạp địa hình TRINX TX16 Disc bánh 26 inches giúp người điều khiển an tâm về sự bền bỉ và độ chính xác cao.
Đùi đĩa trước được làm từ thép và được sơn phủ lớp sơn tĩnh điện chống han gỉ.

Người điều khiển có thể dễ dàng điều chỉnh thay đổi tốc độ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (19, 2, N'
	Xe Đạp Địa Hình MTB TRINX M136 &#8211; Phanh Đĩa, Bánh 26 Inches &#8211; 2021', 5590000, 100, N'TRIM136-9023-´`´850-1-600x600.jpg', 0, N'
										

Xe đạp địa hình MTB Trinx M136 sở hữu ngoại hình năng động, cá tính. Mẫu xe này phù hợp với các tín đồ đam mê thể thao, vượt địa hình và tập luyện thể thao hằng ngày.

Xe đạp địa hình MTB Trinx M136 được trang bị cặp phuộc trước Lock-out Suspension, 100mm có trọng lượng nhẹ với khả năng giảm xóc tốt, giúp xe di chuyển êm ái trên những địa hình gồ ghề, sỏi đá.

Vành xe TRINX Alloy Double Wall tạo sự vững vàng cho cặp bánh xe 26 inches. Bề mặt lốp xe nhiều gai và rãnh giúp tăng độ ma sát, bám đường tốt hơn trong những điều kiện mặt đường trơn trượt.

&nbsp;
Xe đạp được trang bị hệ thống phanh đĩa cùng tay đề Shimano ST-EF500 , giúp xe luôn hoạt động an toàn và phản ứng nhanh nhạy trong những tình huống bất ngờ, mang lại khả năng dừng xe khẩn cấp. Điểm cộng của hệ thống phanh này là hoạt động tốt trong bất kể điều kiện thời tiết, giúp người dùng có những trải nghiệm tốt nhất.

Phần ghi đông TrinX Flat dạng thẳng kết hợp sừng trâu cùng thiết kế tay nắm chống trơn trượt là ưu đ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (20, 2, N'
	Xe Đạp Địa Hình MTB FORNIX Climber &#8211; Phanh Đĩa, Bánh 26 Inches', 4690000, 100, N'FORBCB26-7036-climber-xam-vang-850-600x600.jpg', 0, N'
										

FORNIX CLIMBER là một trong những sản phẩm siêu hot thu hút các tay cua rơ yêu thích các hoạt động đạp xe địa hình đầy mạnh mẽ, được chăm chút kỹ lưỡng về thiết kế và mẫu mã, cùng màu sắc ấn tượng chậm chất chuyên nghiệp mà bạn không thể bỏ qua.

FORNIX CLIMER được trang bị theo thiết kế tiêu chuẩn chuyên nghiệp cùng công nghệ cao cấp, hiện đại giúp cho người đạp trải nghiệm hoàn hảo về tốc độ trên mỗi hành trình tốc độ. Với trọng lượng chỉ 17kg kết hợp với phần khung sườn được làm bằng hợp kim thép cao cấp, CLIMBER có khả năng hấp thu lực sóc tốt, phù hợp với những ai yêu thích sự thách thức về tốc độ trên mọi địa hình.

Là phiên bản mạnh mẽ FORNIX CLIMBER được trang bị với kích cỡ vượt trội hơn khi vòng bánh xe 26 inches, phù hợp với các thể thao mạnh của leo đèo dốc, xe được đạp vững trên mọi địa hình.


Luôn quan tâm đến sự an toàn cho người đạp, FORNIX còn trang bị thêm tấm phản quang tại bánh trước và bánh sau, giúp bạn thuận tiện khi tham gia giao thông vào bên đêm.')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (21, 2, N'
	Xe Đạp Địa Hình MTB GIANT Talon 3 &#8211; Phanh Đĩa, Bánh 27.5 Inches &#8211; 2021', 11790000, 100, N'talon-3-2021-black-850-1-1-600x600.jpg', 0, N'
										


Đối với các tín đồ của thể loại xe đạp địa hình, cái tên Talon 3 – 2021 được mệnh danh là một trong số những dòng sản phẩm có khả năng cân bằng tốt nhất về cả vận tốc lẫn sự kiểm soát an toàn tối ưu trên mọi cung đường dành cho chủ nhân sở hữu của mình.


Khung sườn thường được các tín đồ yêu thích thể loại xe đạp địa hình chú ý đặt lên trên hàng đầu. Series Giant Talon chủ yếu được cấu thành nên từ chất liệu hợp kim nhôm Aluxx Grade Aluminium.

Một trong những đặc điểm riêng khác rất dễ dàng nhận ra trên dòng sản phẩm xe đạp Giant Talon 3 chính là ở hệ thống bánh xe. Chúng thường được thiết kế theo kích cỡ 27.5 inches rất đặc trưng và thường thấy trên thể loại mountain bike.

Trên những bất kì chuyến hành trình nào, đây chính là một lợi thế rất đáng kể giúp cho những tay biker lao về phía trước một cách dễ dàng mà vẫn đảm bảo được sự an toàn cao nhất cho họ. Bên cạnh đó, các bộ phận phuộc SR Suntour XCE 27.5, với thông số kỹ thuật 80mm – 100mm

Vốn là một dòng sản phẩm n')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (22, 2, N'
	Xe Đạp Địa Hình MTB GIANT Talon 3 &#8211; Phanh Đĩa, Bánh 27.5 Inches &#8211; 2022', 11990000, 100, N'Talon-3-2022-amber-glow-850-600x600.jpg', 0, N'
										

Xe đạp địa hình Giant Talon 3 – 2022 sở hữu ngoại hình thể thao, mạnh mẽ cùng tông màu đơn giản, phù hợp với các bạn trẻ có yêu thích bộ môn thể thao mạo hiểm, đam mê khám phá các cung đường đầy thử thách. 
&nbsp;

&nbsp;
Xe đạp địa hình Giant Talon 3 – 2022 có khung sườn từ chất liệu nhôm Aluxx – Grade Aluminium mang đến sự chắc chắn, bền bỉ cũng như trọng lượng nhẹ, giúp xe dễ dàng băng băng trên các cung đường sườn dốc mà không quá nặng nề và cồng kềnh. Khung sườn xe cũng được được đi dây âm sườn tăng mức độ tinh gọn và đẹp của mẫu xe đạp này.
&nbsp;

&nbsp;
Xe đạp địa hình Giant Talon 3 – 2022 sử dụng chuyển dĩa MicroSHIFT FD-M282 có 2 dĩa, chuyển líp Shimano Altus M310 có 8 líp, mang lại cho xe khả năng vận hành linh hoạt với nhiều cấp độ chạy khác nhau và cảm giác nhanh chóng, mượt mà mỗi khi chuyển cấp số. 
&nbsp;


&nbsp;
Xe đạp địa hình Giant Talon 3 – 2022 sử dụng phuộc SR Suntour XCE người dùng hoàn toàn có thể yên tâm về khả năng giảm xóc, hành trình phuộc 80mm')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (23, 2, N'
	Xe Đạp Địa Hình MTB TRINX TX18 Disc &#8211; Phanh Đĩa, Bánh 26 Inches &#8211; 2021', 5690000, 100, N'YB0476514-850-600x600.jpg', 0, N'
										

Không thể nào bỏ qua dòng xe đạp địa hình TRINX TX18 Disc &#8211; Bánh 26 inches &#8211; 2021 bởi ngoại hình bắt mắt, cấu hình tốt. Thích hợp cho người dùng mới muốn trải nghiệm những sản phẩm xe đạp với chất lượng tốt và giá không quá đắc.
Với chất liệu khung Nhôm TRINX Alloy bền nhẹ, kích thước phù hợp cho hầu hết người Châu Á. Khung xe được sơn tĩnh điện 3 lớp với công nghệ sơn cao cấp cho các chi tiết trên khung xe được sắc nét. Những gam màu sáng, tối được phối hợp hài hoà giúp thu hút mọi ánh nhìn.

Sử dụng bộ truyền động Shimano cao cấp (3 dĩa x 7 líp) với 21 cấp độ. Xe đạp địa hình TRINX TX18 Disc &#8211; Bánh 26 inches luôn hoạt động với sự bền bỉ và độ chính xác cao.

Ghi đông ngang kết hợp sừng trâu 2 bên ghi đông giúp tăng thêm độ nam tính và giúp người điều khiển có thể thay đổi tư thế điều khiển xe một cách linh hoạt. 
Phanh đĩa cơ học và hệ thống phuộc Suspension chất lượng tốt có chức năng  giúp xe hoạt động ổn định, an toàn, thách thức mọi điều kiện thời t')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (24, 2, N'
	Xe Đạp Địa Hình MTB TRINX TX04 Disc &#8211; Phanh Đĩa, Bánh 24 Inches &#8211; 2021', 4390000, 100, N'trinx-tx04-den-xám-600x600.jpg', 0, N'
										

Đối với bé trên 10 tuổi, xe đạp trẻ em sẽ có kích thước gần giống với xe đạp của người lớn. Xe đạp địa hình TrinX TX04 Disc &#8211; 2021 với kiểu dáng mạnh mẽ, màu sắc phong phú chắc chắn các bé sẽ rất thích.

Khung sườn được xem là yếu tố quan trọng để tạo nên một chiếc xe hoàn chỉnh. Với khung sườn thép cường lực được sơn tĩnh điện từ tính 3 lớp với nước sơn đẹp và sắc nét.

Cấu hình tốt với group chuyển động Shimano 21 tốc độ . Được trang bị thêm phanh đĩa trước và sau giúp các bé mới vừa tập tễnh làm quen với người bạn mới của mình sẽ cảm thấy thoải mái, tự tin hơn.

Về tay lái bộ phận điều hướng của những chiếc xe cũng khá đa dạng và phong phú. Tuy nhiên, ở chiếc Trinx TX04 Disc được làm bằng hợp kim nhôm, với lối thiết kế riêng biệt, phục vụ cho độ tuổi từ 10 tuổi trở lên, các bé sẽ cảm thấy tiện dụng và dễ dàng điều chỉnh theo ý muốn.

Yên xe TrinX được thiết kế vừa vặn, không quá cứng, giúp bé thoải mái hơn khi đạp xe mà không sợ đau hay ê mông.

Kích thước bánh xe')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (25, 3, N'
	Xe Đạp Đua Đường Trường Road TRINX Tempo 1.0 &#8211; Bánh 700C &#8211; 2021', 0, 100, N'YB0517281-850.jpg', 0, N'
										

Với sự đột phá về màu sắc, lẫn thiết kế so với model 2020, mẫu Xe Đạp Đua Đường Trường Road TRINX Tempo 1.0 &#8211; 2021 ngày càng chứng tỏ vị trí của mình trên thị trường xe đạp đua. Mẫu xe đạp này được xem là một trong những mẫu xe đạp đua giá tầm trung có cấu hình mạnh mẽ, năng động và khá chuyên nghiệp dành cho các tay đua.
Khung xe được làm từ hợp kim Nhôm TRINX Alloy chắc chắn, có khả năng chịu va đập tốt và có kích thước 700cc*46cm phù hợp với những người có chiều cao từ 1m55 đến 1m80. Thiết kế của khung xe tạo cảm giác mạnh mẽ, mang phong cách rất chuyên nghiệp nhưng không kém phần năng động. 
Ghi đông cong đặc trưng dành cho dòng xe đua giúp các tay đua luôn có tư thế chuyên nghiệp và thoải mái nhất để điều khiển xe với tốc độ tốt nhất. 
Bộ truyền động Shimano cao cấp với 21 tốc độ với khả năng chuyển đề linh hoạt. Đề trước SHIMANO FD-TZ31, Đề sau SHIMANO RD-TZ21 rất chuẩn và nhạy đảm bảo mang đến cho bạn những trải nghiệm tuyệt vời trong suốt hành trình đua.
Thiế')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (26, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Contend 3 &#8211; Bánh 700C &#8211; 2021', 17390000, 100, N'Xe-Đạp-Đua-Đường-Trường-ROAD-GIANT-CONTEND-3-BÁNH-700C-2021_Xe-Ð?p-Ðua_6353_4-600x600.jpeg', 0, N'
										


Xe đạp đua thể thao Giant Contend 3 &#8211; 2021 thuộc dòng xe đạp đua trong tầm trung của Giant cũng được rất nhiều người mong ước sở hữu. Thiết kế bởi những chuyên gia hàng đầu có nhiều kinh nghiệm, mẫu xe này mang tới một cấu hình vô cùng mạnh mẽ với những trải nghiệm đặc biệt trong những chuyến đi đường dài hay cuộc đua mang tính cạnh tranh.

Xe đạp đua Contend 3 2021 ngoài được phủ lên mình màu đỏ, còn có màu xanh khá thanh lịch, mang tới một phong cách hoàn toàn mới lạ.

Khung xe với chất liệu từ ALUXX-Grade Aluminum vô cùng chắc chắn, mạnh mẽ với khả năng chống chịu lại va đập tốt. Tuy vậy khung mang trọng lượng khá nhẹ với khả năng chống lại được những va đập mạnh từ môi trường cũng như ngăn cản những biến dạng cho khung. Thiết kế tiêu chuẩn chất lượng cao đem tới ưu điểm khí động học giúp cho những cuộc đua đạt kết quả tốt hơn và sự tự tin trong quá trình đi xe.

Shimano Claris là hệ thống đề truyền động của chiếc Contend 3 2021, với sự kiểm nghiệm nghiêm ngặt để')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (27, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Contend 3 &#8211; Bánh 700C &#8211; 2022', 17390000, 100, N'contend-3-cold-iron-2022-600x600.jpg', 0, N'
										

Xe đạp đua thể thao Giant Contend 3 &#8211; 2022 thuộc dòng xe đạp đua trong tầm trung của Giant cũng được rất nhiều người mong ước sở hữu. Thiết kế bởi những chuyên gia hàng đầu có nhiều kinh nghiệm, mẫu xe này mang tới một cấu hình vô cùng mạnh mẽ với những trải nghiệm đặc biệt trong những chuyến đi đường dài hay cuộc đua mang tính cạnh tranh.

Xe đạp đua thể thao Giant Contend 3 &#8211; 2022 được trang bị khung xe có chất liệu từ ALUXX-Grade Aluminum bền bỉ, mạnh mẽ với khả năng chống va đập mạnh, khả năng chịu tải ấn tượng lên đến 150kg. Khung xe được phủ lớp sơn tĩnh điện, hạn chế tình trạng ăn mòn, góp phần tăng tính thẩm mỹ và tăng tuổi thọ xe. Thiết kế tiêu chuẩn chất lượng cao đem tới ưu điểm khí động học giúp cho những cuộc đua đạt kết quả tốt hơn và sự tự tin trong quá trình đi xe.

Shimano Claris là hệ thống đề truyền động của chiếc Giant Contend 3 &#8211; 2022, với sự kiểm nghiệm nghiêm ngặt để mang lại hiệu suất tốt, và đem tới khả năng chuyển đề linh hoạt, n')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (28, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Contend 1 &#8211; Bánh 700C &#8211; 2021', 22790000, 100, N'Contend-1-2021-White-1-600x600.jpg', 0, N'
										


Xe đạp đua thể thao Giant Contend 1 2021  thuộc dòng xe đạp đua trong tầm trung cấp của Giant được nhiều người mong ước sở hữu. Thiết kế bởi những chuyên gia hàng đầu với nhiều kinh nghiệm, chiếc xe mang tới một cấu hình vô cùng mạnh mẽ với những trải nghiệm đặc biệt trong những chuyến đi đường dài hay cuộc đua mang tính cạnh tranh.

Xe đạp đua Contend 1 2021 được phủ lên mình màu xanh và màu trắng khá năng động và trẻ trung, đem đến một phong cách hoàn toàn mới lạ.

Khung bằng ALUXX-grade aluminum vô cùng chắc chắn, mạnh mẽ với khả năng chống chịu lại va đập tốt. Tuy vậy khung mang trọng lượng khá nhẹ với khả năng chống lại được những va đập mạnh từ môi trường cũng như ngăn cản những biến dạng cho khung.

Thiết kế tiêu chuẩn chất lượng cao đem tới ưu điểm khí động học giúp cho những cuộc đua đạt kết quả tốt hơn và sự tự tin trong quá trình đi xe.

Shimano Sora là hệ thống đề truyền động của chiếc Contend 1 2021, với sự kiểm nghiệm nghiêm ngặt để mang lại hiệu suất tốt, v')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (29, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Propel Advanced 2 &#8211; Bánh 700C &#8211; 2021', 58390000, 100, N'Xe-Đạp-Đua-Đường-Trường-ROAD-GIANT-PROPEL-ADVANCED-2-BÁNH-700C-2021_Propel_6360_4-600x600.jpg', 0, N'
										

				')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (30, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Contend AR 3 &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 28790000, 100, N'contend-ar-3-2022-amber-glow-600x600.jpg', 0, N'
										

Xe đạp đua thể thao Giant Contend AR 3 – 2022 thuộc dòng xe đạp đua trong tầm trung cấp của Giant được nhiều người mong ước sở hữu. Thiết kế bởi những chuyên gia hàng đầu với nhiều kinh nghiệm, chiếc xe mang tới một cấu hình vô cùng mạnh mẽ với những trải nghiệm đặc biệt trong những chuyến đi đường dài hay cuộc đua mang tính cạnh tranh.

Xe đạp đua thể thao Giant Contend AR 3 – 2022 có khung bằng ALUXX-grade aluminum vô cùng chắc chắn, mạnh mẽ với khả năng chống chịu lại va đập tốt. Tuy vậy khung mang trọng lượng khá nhẹ với khả năng chống lại được những va đập mạnh từ môi trường cũng như ngăn cản những biến dạng cho khung. Thiết kế tiêu chuẩn chất lượng cao đem tới ưu điểm khí động học giúp cho những cuộc đua đạt kết quả tốt hơn và sự tự tin trong quá trình đi xe.

Shimano Sora với 2 dĩa, 9 líp là hệ thống đề truyền động của chiếc Contend AR 3 – 2022, với sự kiểm nghiệm nghiêm ngặt để mang lại hiệu suất tốt, và đem tới khả năng chuyển đề linh hoạt, nhịp nhàng hơn. Bạn hoà')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (31, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Propel Advanced 2 Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2021', 69790000, 100, N'Xe-Đạp-Đua-Đường-Trường-ROAD-GIANT-PROPEL-ADVANCED-2-DISC-PHANH-ÐIA-BÁNH-700C-2021_Propel_6361_4-600x600.jpg', 0, N'
										

				')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (32, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Contend 2 &#8211; Bánh 700C &#8211; 2021', 19790000, 100, N'Xe-Đạp-Đua-Đường-Trường-ROAD-GIANT-CONTEND-2-BÁNH-700C-2021_Contend_6351_4-600x600.jpeg', 0, N'
										


Xe đạp đua thể thao Giant Contend 2 &#8211; 2021 thuộc dòng xe đạp đua trong tầm trung của Giant cũng được rất nhiều người mong ước sở hữu. Thiết kế bởi những chuyên gia hàng đầu có nhiều kinh nghiệm, mẫu xe này mang tới một cấu hình vô cùng mạnh mẽ với những trải nghiệm đặc biệt trong những chuyến đi đường dài hay cuộc đua mang tính cạnh tranh.

Khung xe với chất liệu từ ALUXX-Grade Aluminum vô cùng chắc chắn, mạnh mẽ với khả năng chống chịu lại va đập tốt. Tuy vậy khung mang trọng lượng khá nhẹ với khả năng chống lại được những va đập mạnh từ môi trường cũng như ngăn cản những biến dạng cho khung. Thiết kế tiêu chuẩn chất lượng cao đem tới ưu điểm khí động học giúp cho những cuộc đua đạt kết quả tốt hơn và sự tự tin trong quá trình đi xe.

Shimano Claris là hệ thống đề truyền động của chiếc Contend 2 2021, với sự kiểm nghiệm nghiêm ngặt để mang lại hiệu suất tốt, và đem tới khả năng chuyển đề linh hoạt, nhịp nhàng hơn. Bạn hoàn toàn có thể tự tin với những trải nghiệm t')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (33, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT TCR Advanced Pro 1 &#8211; Bánh 700C &#8211; 2021', 85990000, 100, N'Xe-Đạp-Đua-Đường-Trường-ROAD-GIANT-TCR-ADVANCED-PRO-1-BÁNH-700C-2021_TCR_5994_4-600x600.jpg', 0, N'
										

Xe Đạp Đua Đường Trường Road GIANT TCR Advanced Pro 1 – Bánh 700C – 2021 với cấu hình ấn tượng, thiết kế nổi bật. Đạt được sự cân bằng ấn tượng giữa kỹ thuật, công nghệ và giá trị.

Xe Đạp Đua Đường Trường Road GIANT TCR Advanced Pro 1 – Bánh 700C – 2021 sở hữu dàn khung sườn từ chất liệu Carbon, được áp dụng công nghệ Advanced-Grade Composite, giúp xe đạt trọng lượng siêu nhẹ, siêu bền bỉ và vô cùng cứng cáp.

Xe Đạp Đua Đường Trường Road GIANT TCR Advanced Pro 1 – Bánh 700C – 2021 có khả năng chống chịu lại những va đập mạnh. Với trọng lượng xe nhẹ, người lái có khả năng dễ dàng mang vác cũng như tận dụng được khả năng khí động học tốt hơn trong quá trình đua cạnh tranh.

Xe Đạp Đua Đường Trường Road GIANT TCR Advanced Pro 1 – Bánh 700C – 2021 được trang bị bộ groupset Shimano Ultegra, 22 tốc độ có khả năng tùy biến linh hoạt cung cấp trải nghiệm không giới hạn cho người đạp.


Phuộc Advanced-Grade Composite, full-composite OverDrive 2 steerer, gia tăng độ cứng và độ ổn ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (34, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Propel Advanced SL 1 Disc (Limited Edition) &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 179790000, 100, N'propel-advanced-sl-1-disc-my22-limited-edition-850jpg-600x600.jpg', 0, N'
										

				')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (35, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT TCR Advanced 1 Disc Pro Compact &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 72490000, 100, N'tcr-advanced-1-disc-pro-compact-2022-amber-glow-600x600.jpg', 0, N'
										


Xe đạp đua Giant TCR Advanced 1 Disc Pro Compact – 2022 với cấu hình khá ấn tượng, thiết kế nổi bật. Đạt được sự cân bằng ấn tượng giữa đặc điểm kỹ thuật, công nghệ và giá trị giúp chiếc xe hoàn toàn không hề kém cạnh với các đối thủ cạnh tranh.
&nbsp;
Xe đạp đua Giant TCR Advanced 1 Disc Pro Compact – 2022 sở hữu dàn khung sườn từ chất liệu Carbon, được áp dụng công nghệ Advanced-Grade Composite, giúp xe đạt trọng lượng siêu nhẹ, siêu bền bỉ và vô cùng cứng cáp.
&nbsp;
Xe đạp đua Giant TCR Advanced 1 Disc Pro Compact – 2022 có khả năng chống chịu lại những va đập mạnh khi xảy ra tai nạn hoặc khi chơi thể thao. Với trọng lượng nhẹ, người lái có khả năng dễ dàng mang vác cũng như tận dụng được khả năng khí động học tốt hơn trong quá trình đua cạnh tranh.
&nbsp;
Xe đạp đua Giant TCR Advanced 1 Disc Pro Compact – 2022 được trang bị bộ groupset SHIAMNO ULTEGRA 22 tốc độ có khả năng tùy biến linh hoạt cung cấp trải nghiệm không giới hạn cho người đạp.
Phuộc Advanced-Grade Comp')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (36, 3, N'
	Xe Đạp Đua Đường Trường Road GIANT Contend 2 &#8211; Bánh 700C &#8211; 2022', 19790000, 100, N'contend-2-2022-black-600x600.jpg', 0, N'
										

Xe đạp đua Giant Contend 2 – 2022 gây ấn tượng với vẻ ngoài thể thao, năng động cùng phiên bản 2 màu đen, xám thời thượng. Mẫu xe này sẽ là người bạn đồng hành giúp bạn rèn luyện sức khỏe, tập luyện thể thao và tham gia vào các cuộc đua.


Khung sườn nhôm ALUXX-Grade aluminum có khả năng chịu tải lớn, siêu nhẹ, giúp xe nhẹ nhàng hơn với những chuyến đi đồi, núi nhưng vẫn giữ được độ ổn định, bền bỉ trên những con đường mòn gồ ghề hay đường bằng phẳng.
Phần khung xe được phủ lớp sơn tĩnh điện hạn chế quá trình rỉ sét, oxy hóa trong quá trình sử dụng, góp phần tăng tính thẩm mỹ của xe. Đồng thời, các mối hàn trên khung được hàn chắc chắn, tỉ mỉ, chi tiết lắp ráp khung cũng được trải qua quá trình kiểm nghiệm độ cứng, khả năng va đập tốt giúp bạn an tâm khi di chuyển. 

Bộ truyền động Shimano Claris 18 tốc độ bao gồm 2 dĩa trước, 9 líp sau, Giant Contend 2 hứa hẹn sẽ mang đến cho bạn trải nghiệm di chuyển tuyệt vời với khả năng sang số mượt mà, nhanh nhạy, phù hợp với nhiều k')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (37, 4, N'
	Xe Đạp Gấp Folding TRINX Life Flybird 1.0 &#8211; Phanh Đĩa, Bánh 20 Inches &#8211; 2021', 5990000, 100, N'TRILFB10-2009-850-600x600.jpg', 0, N'
										

Xe đạp gấp Folding TRINX Life Flybird 1.0 &#8211; 2021 được ra mắt với 3 phiên màu đa dạng, có vẻ ngoài năng động, cá tính, đáp ứng nhu cầu đa dạng của người sử dụng khi muốn di chuyển linh hoạt khắp mọi nơi mà không sợ cồng kềnh.
&nbsp;
Khung xe được sơn tĩnh điện và gia công bằng hợp kim thép cao cấp, hạn chế gỉ sét trong quá trình sử dụng, đảm bảo an toàn và bền bỉ cho người dùng khi lái xe trong điều kiện thời tiết mưa gió và ẩm ướt.
&nbsp;
Xe đạp gấp Trinx được trang bị bánh xe có kích thước 20 inches, đem đến kiểu dáng xe nhẹ nhàng, năng động với vành xe TRINX Alloy Double Wall giúp di chuyển linh hoạt hơn và hạn chế bánh xe bị cong. Bề mặt lốp xe có gai giúp xe bám đường tốt, không lo bị trơn trượt trên mặt đường ẩm ướt hay bo cua.
&nbsp;
Xe đạp gấp Folding TRINX Life Flybird 1.0 &#8211; 2021 với thiết kế ghi đông TRINX Alloy Flat thẳng, không sừng hạn chế tình trạng va chạm trên đường hẹp hay đông người, đem đến sự an toàn cho người dùng.
&nbsp;
Xe đạp gấp đem đến ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (38, 4, N'
	Xe Đạp Gấp Folding GIANT FD-806 &#8211; Bánh 20 Inches &#8211; 2022', 8790000, 100, N'fd-806-blue-fix-1-600x600.jpg', 0, N'
										

				')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (39, 5, N'
	Xe Đạp Đường Phố Touring LIV Alight 2 DD Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 12590000, 100, N'alight-2-dd-disc-eucalyptus-my22-850-3-600x600.jpg', 0, N'
										


Được đánh giá là dòng xe đạp Giant dành riêng cho phái nữ, xe đạp đường phố Liv Alight 2 DD Disc – 2022 nổi bật với gam màu thời trang lôi cuốn, thiết kế năng động. Đây là mẫu xe đạp hoàn hảo cho chị em đang tìm kiếm mẫu xe đạp thể thao phù hợp.
&nbsp;


&nbsp;
Sườn xe được gia công bằng nhôm với công nghệ độc quyền ALUXX-Grade Aluminium của Giant, hạn chế ăn mòn, rỉ sét, trọng lượng siêu nhẹ nhưng vẫn mang đến sự vững chắc và độ bền cao. Phần khung xe được làm khá rộng rãi, người dùng có thể sử dụng để các túi treo hay hành lý mang theo, tiện lợi trong những chuyến đi dài.
&nbsp;

&nbsp;
Xe đạp đường phố thể thao sử dụng chuyển líp Shimano Altus 8 líp cùng chuyển dĩa Shimano Tourney 2 dĩa, chuyển đổi linh hoạt giúp người dùng dễ dàng sang số, điều chỉnh tốc độ chạy phù hợp, làm cho bạn hài lòng về khả năng vận hành tốt trên đường phố tạo cảm giác êm ái và không bị mất thế khi đạp lên dốc.
&nbsp;


&nbsp;
Xe đạp đường phố Alight 2 DD Disc – 2022 với bộ thắng Tektro TKB – ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (40, 5, N'
	Xe Đạp Mini Nhật MARUISHI WEA 2633 &#8211; Bánh 26 Inches', 7490000, 100, N'MARWEA2633-5017-850-1.jpg', 0, N'
										

Với kiểu dáng tương tự dòng xe đạp Mini Nhật MARUISHI WEA 2611 thì dòng xe đạp Mini Nhật MARUISHI WEA 2633 không chỉ khác nhau về tên mà còn khác nhau về các phụ kiện và phụ tùng của xe. Khiến cho giá trị của xe đạp Mini Nhật MARUISHI WEA 2633 cũng cao hơn. 
Với chất liệu là hợp kim Nhôm giúp khung xe nhẹ, bền và khó han gỉ. Khung xe được thiết kế uốn cong tạo cảm giác mềm mại, nhẹ nhàng và nữ tính. Kiểu dáng của xe đạp Mini Nhật MARUISHI WEA 2633 phù hợp cho hầu hết các bạn nữ với các hoạt động như đi học, đi dạo phố và cả đi làm.
Các mối nối của xe được hàn với nhau rất chắc chắn nhờ vậy mẫu xe đạp Mini Nhật MARUISHI WEA 2633 nhìn rất chắc chắn, gọn nhẹ và an toàn.
Tay lái dạng rộng là tạo cảm giác mềm mại, tinh tế cho các dòng xe đạp nữ giúp tư thế đi xe đạp luôn thẳng lưng và có thể điều hướng xe một cách dễ dàng. Với tay lái inox chất lượng cao, luôn sáng bóng và chống rỉ sét. 
Kết hợp giỏ xe OGK nhựa của Nhật Bản không chỉ tiện lợi cho người sử dụng chứa, đựng những ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (41, 5, N'
	Xe Đạp Đường Phố Touring LIV Flourish 4 &#8211; Bánh 700C &#8211; 2021', 7190000, 100, N'2100204223-Xe-Đạp-Đường-Phố-TOURING-LIV-FLOURISH-4-BÁNH-700C-2021-Pale-Mauve-XS-1427kg_11619_4-600x600.jpg', 0, N'
										

Với phong cách thanh lịch, xe đạp đường phố Liv Flourish 4 phù hợp để di chuyển xung quanh thành phố. Nhẹ, đa năng cùng thiết kế độc đáo làm cho những chuyến đi của bạn trở nên thú vị hơn.


Liv Flourish 4 có khung sườn nhôm ALUXX nhẹ, với các đường cong trên khung sườn mang phong cách cổ điển, có phần tinh tế, sang trọng giúp cho các chị em vui tươi, tư tin xuống phố.

Với chuyển líp Shimano Tourney cùng tay đề Shimano Revoshift được tích hợp trong xe đạp Flourish 4 cung cấp khả năng chuyển số mượt, chỉ với một thao tác xoay tay để chuyển số lên hoặc xuống.


Xe được trang bị phuộc cùng chân chống bạn có thể thoải mái di chuyển trên những con đường gồ ghề. Với thiết kế tiện dụng nhưng thanh lịch phù hợp mọi giới tính, Flourish sẽ đưa bạn từ nhà đến nơi làm việc hay từ chợ đến trung tâm thành phố một cách dễ dàng.


Yên xe Liv Comfort được bọc da êm ái, thiết kế bản rộng phù hợp với xương hông của chi em giảm khả năng chèn mạch máu và đau mỏi khi ngồi với thời gian.

Thiết')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (42, 5, N'
	Xe Đạp Đường Phố Touring LIV Alight 3 DD Disc &#8211; Phanh Đĩa, Bánh 700C &#8211; 2022', 11390000, 100, N'alight-3-dd-disc-pistachio-2022-850-600x600.jpg', 0, N'
										

Xe đạp đường phố LIV Alight 3 DD Disc – 2022 là dòng xe phổ biến nhất cho mục đích sử dụng hàng ngày, mẫu xe được thiết kế và phối màu nhẹ nhàng nhưng năng động. Đây sẽ là một người bạn đồng hành của các bạn nữ dùng xe đạp để đi học, đi làm, thể dục thể thao hay vi vu dạo phố. 


Sườn xe được gia công bằng nhôm với công nghệ độc quyền ALUXX-Grade Aluminium của Giant, hạn chế ăn mòn, rỉ sét, trọng lượng siêu nhẹ nhưng vẫn mang đến sự vững chắc và độ bền cao. Phần khung xe được làm khá rộng rãi, người dùng có thể sử dụng để các túi treo hay hành lý mang theo, tiện lợi trong những chuyến đi dài.

Xe đạp đường phố thể thao sử dụng bộ truyền động Shimano Tourney linh hoạt với chuyển líp 7 líp, 3 dĩa, giúp người dùng dễ dàng sang số, điều chỉnh tốc độ chạy phù hợp.

Bộ truyền động hoạt động bền bỉ khiến người dùng hài lòng về khả năng vận hành tốt trên đường phố tạo cho người dùng cảm giác êm ái và không bị mất thế khi đạp lên dốc.

Xe đạp đường phố Alight 3 DD Disc – 2022 với b')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (43, 5, N'
	Xe Đạp Đường Phố Touring LIV Alight 2 DD &#8211; Bánh 700C &#8211; 2021', 11590000, 100, N'Alight-2-dd-2021-Grayish-Blue.jpg', 0, N'
										


Dòng xe đạp Alight 2 DD chính là sự lựa chọn hoàn hảo cho mọi mong muốn của bạn. Với mức giá phải chăng, thiết kế thời trang và độ bền cao, Alight 2 DD là dòng xe phổ biến nhất cho mục đích sử dụng hàng ngày. Với phiên bản màu xanh toát lên nét nhẹ nhàng, thanh lịch, không quá điệu đà, không quá thô cứng.

Khung sườn của Alight 2 DD được làm bằng nhôm với công nghệ độc quyền ALUXX của Giant đảm bảo cho sản phẩm sự vững chắc và độ bền cao  nhưng vẫn giữ được trọng lượng siêu nhẹ cho dòng xe này.

Điểm cộng nữa của dòng xe này là khung sườn rộng rãi cho phép người sử dụng trang bị nhiều túi treo hoặc mang theo nhiều hành lí mà không hề cảm thấy cồng kềnh nặng nề. Cùng với thiết kế kiểu dáng trang nhã, màu sắc thanh nhã, có thể dùng để tập thể dục, đi làm đều phù hợp.

Ngoài ra, dòng xe Alight 2 DD còn sở hữu chuyển líp Shimano Altus cùng với chuyển đĩa Shimano Tourney.

Bộ truyền động hoạt động bền bỉ khiến người dùng hài lòng về khả năng vận hành tốt trên đường phố tạo cho')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (44, 5, N'
	Xe Đạp Đường Phố Touring MOMENTUM iNeed Street &#8211; Bánh 700C &#8211; 2022', 8790000, 100, N'2105001324-Xe-Đạp-Đường-Phố-TOURING-MOMENTUM-INEED-STREET-BÁNH-700C-2021-Blue_12212_4-600x600.jpg', 0, N'
										

Momentum iNeed Street 2022 mang đến cho khách hàng của mình đặc biệt là các chị em công sở, hoặc các chị em nội trợ sản phẩm giàu tính giá trị thẩm mỹ cao. Nếu như bạn là một người yêu thích sự nhẹ nhàng, hài hòa không kém phần mạnh mẽ và cổ điển thì sự kết hợp giữa 3 tone màu đỏ, xanh, xám có thể làm vừa lòng bạn ngay lập tức.

Khung sườn của dòng iNeed Street này tạo nên sự ấn tượng mạnh mẽ cho người đối diện bởi chất liệu nhôm Aluxx nổi tiếng về độ nhẹ và bền. Mẫu xe đạp này còn được trang bị thêm cho xe các phụ tùng tiện ích: baga và dây ràng yên sau để vận chuyển hàng hóa dễ dàng hơn, bình kẹp giữ nước để bạn có thể dạo chơi trên đường phố mà không bị mất sức.

Đáng kể nhất lại là bộ truyền động Shimano Tourney với 7 líp mang đến cho người dùng trải nghiệm tốt nhất. Chúng thật sự phát huy được toàn bộ tính năng vượt trội của mình. Dù trời có nắng hay mưa, đường phố có khô ráo hay ẩm ướt, chúng vẫn mang đến sự tin tưởng tuyệt đối cho chủ nhân của mình ở mức độ an toàn ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (45, 6, N'
	Xe Đạp Trẻ Em Youth TRINX Junior 1.0 Disc 20 &#8211;  Phanh Đĩa, Bánh 20 Inches &#8211; 2021', 3590000, 100, N'YB0458261-850-1.jpg', 0, N'
										

Xe đạp trẻ em Youth TRINX Junior 1.0 Disc &#8211; Bánh 20 inches &#8211; 2021 là mẫu xe đạp được phụ huynh và các bé trai từ 6 đến 9 tuổi ưa chuộng. Dòng Xe đạp trẻ em Youth TRINX Junior 1.0 Disc với thiết kế phong cách mạnh mẽ, thể thao mang nhiều đặc điểm của xe địa hình.
Với cấu hình tương tự những dòng xe địa hình của người lớn, Xe đạp trẻ em Youth TRINX Junior 1.0 Disc &#8211; Bánh 20 inches là một lựa chọn tuyệt vời cho các bé trai năng động, yêu thích thể thao và có cá tính.
Khung xe là thép cường lực rất chắc chắn an toàn cho bé khi di chuyển. Độ cao của xe phù hợp cho các bé có chiều cao từ 1m25 trở nên. 
Hệ thống phuộc cũng được làm từ thép cường lực, hệ cơ rất êm giúp bé di chuyển nhẹ nhàng và dễ dàng.
Bộ truyền động cao cấp, tay gạt đề Shimano 6 số giúp bé sang số một cách dễ dàng. Bé có thể thay đổi tốc độ đạp phù hợp với những địa hình khác nhau.
Vành bánh xe cực kỳ chắc chắn với nhôm hai lớp chính hãng TrinX. Lốp xe địa hình 20”x2.215 Rubber bản lớn giúp bám')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (46, 6, N'
	Xe Đạp Trẻ Em Youth ROYALBABY Jenny Princess &#8211; Bánh 12 Inches', 2490000, 100, N'ROYRB12G4-3015-850-2-600x600.jpg', 0, N'
										

Xe Đạp Trẻ Em Youth ROYALBABY Jenny Princess là mẫu xe đạp được thiết kế độc quyền lấy cảm hứng từ nàng tiên cá xinh đẹp mang đến cho bé cảm giác kiêu sa, lộng lẫy như công chúa khi sở hữu mẫu xe này. Đây là siêu phẩm cho các nàng “công chúa&#8221; nhỏ từ 2 đến 5 tuổi dạo phố, khám phá thế giới xinh đẹp xung quanh mình. 

Màu chủ đạo của Xe Đạp Trẻ Em Youth ROYALBABY Jenny Princess là Trắng và Hồng cùng những hoạ tiết đáng yêu chắc chắn các bé yêu sẽ không thể rời mắt khỏi mẫu xe đạp này.

Khung thép cường lực thấm Carbon siêu cứng, có khả năng tải được 2 người lớn. Ba mẹ có thể tuyệt đối an tâm về độ an toàn của xe khi cho bé điều khiển. Khung xe được phun tĩnh điện 2 lớp cao cấp tuyệt đối an toàn và không chứa chì độc hại cho bé. 

Yên xe bằng da mềm, lót bông dày tạo nên sự đàn hồi êm ái thoải mái cho bé khi di chuyển, có thể điều chỉnh độ cao cốt yên để phù hợp với chiều cao của bé. 

Tay phanh của xe đạp Trẻ Em Youth ROYALBABY Jenny Princess được thiết kế giúp bé dễ s')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (47, 6, N'
	Xe Đạp Trẻ Em Youth ROYALBABY Freestyle &#8211; Bánh 12 Inches', 2390000, 100, N'ROYRB1286-2009-850-600x600.jpg', 0, N'
										

Xe đạp trẻ em Youth ROYALBABY Freestyle 12 inches với thiết kế mang phong cách thể thao thích hợp cho cả bé trai và bé gái. Với các màu sắc sinh động và thiết kế bắt mắt sẽ làm các bé thích thú, không thể rời mắt. 

Với size bánh 12 inches, xe đạp trẻ em Youth ROYALBABY Freestyle là sự lựa chọn hoàn hảo cho các bé từ 2 đến 5 tuổi và tập đi xe đạp lần đầu nhờ có bổ trợ 2 bánh phụ. Ba mẹ có thể hoàn toàn yên tâm các bé yêu sẽ không bị ngã khi vẫn chưa quen với cách điều khiển xe đạp.

Bánh xe là bánh cao su bản rộng giúp bám đường tốt và giúp trẻ dễ dàng di chuyển trong các cuộc phiêu lưu.  

Ngoài ra, khung sườn Xe đạp trẻ em Youth ROYALBABY Freestyle với chất liệu thép vô cùng chắc chắn và an toàn tuyệt đối cho bé.

Yên xe cũng được thiết kế nhiều đệm mềm mại, tự do điều chỉnh chiều cao phù hợp với chiều cao của bé yêu.

Đặc biệt, điểm nhấn của Xe đạp trẻ em Youth ROYALBABY Freestyle là bình nước được thiết kế sau yên cực “ngầu” và tiện lợi, đảm bảo bé yêu của bạn thích mê')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (48, 6, N'
	Xe Đạp Trẻ Em Youth ROYALBABY Jenny Princess &#8211; Bánh 16 Inches', 2890000, 100, N'ROYRB16G4-3015-850-600x600.jpg', 0, N'
										

Xe Đạp Trẻ Em Youth ROYALBABY Jenny Princess &#8211; 16 inches là mẫu xe đạp được thiết kế độc quyền lấy cảm hứng từ nàng tiên cá xinh đẹp mang đến cho bé cảm giác kiêu sa, lộng lẫy như công chúa khi sở hữu mẫu xe này. Đây là siêu phẩm cho các nàng “công chúa&#8221; nhỏ từ 4 đến 7 tuổi dạo phố, khám phá thế giới xinh đẹp xung quanh mình. 
Khung thép cường lực thấm Carbon siêu cứng, có khả năng tải được 2 người lớn. Ba mẹ có thể tuyệt đối an tâm về độ an toàn của xe khi cho bé điều khiển. Khung xe được phun tĩnh điện 2 lớp cao cấp tuyệt đối an toàn và không chứa chì độc hại cho bé. 
Yên xe bằng da mềm, lót bông dày tạo nên sự đàn hồi êm ái thoải mái cho bé khi di chuyển, có thể điều chỉnh độ cao cốt yên để phù hợp với chiều cao của bé. 
Tay phanh của xe đạp Trẻ Em Youth ROYALBABY Jenny Princess được thiết kế giúp bé dễ sử dụng và an toàn tuyệt đối khi tham gia giao thông. 
Lốp xe cao su bản rộng, có khắc hoa văn trái tim mang lại cảm giác đáng yêu, xinh xắn cũng như giúp bá')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (49, 6, N'
	Xe Đạp Trẻ Em Youth VINBIKE Robo 16 &#8211; Bánh 16 Inches &#8211; 2021', 1990000, 100, N'2131390021-850-1-600x600.jpg', 0, N'
										

Xe đạp trẻ em Youth Vinbike Robo 16 sở hữu phong cách hiện đại, thời trang và sành điệu phù hợp cho các bé đạp xe vui chơi hằng ngày và vận động thể chất. Mẫu xe đạp trẻ em này sẽ là người bạn đồng hành cùng các bé trong giai đoạn tập làm quen với việc đạp xe, giúp các bé tăng cường sức khỏe và có những giờ vui chơi thú vị.

Xe đạp trẻ em Youth Vinbike Robo 16 sở hữu khung sườn Vinbike STL 16″ được làm bằng hợp kim không gỉ, cứng cáp tạo độ chắc chắn, giúp xe có độ bền cao hơn, đảm bảo an toàn cho bé trong quá trình tập luyện. Xe cũng sở hữu bàn đạp nhựa được thiết kế tối ưu phù hợp với chiều cao của từng bé.

Với size bánh xe 16 inches, xe đạp trẻ em này sẽ là sự lựa chọn hoàn hảo cho các bé từ 3 đến 5 tuổi và tập đi xe đạp lần đầu nhờ có bổ trợ 2 bánh phụ. Ba mẹ có thể hoàn toàn yên tâm các bé yêu sẽ không bị ngã khi vẫn chưa quen với cách điều khiển xe đạp.

Ngoài ra, xe đạp trẻ em Youth Vinbike Robo 16 được trang bị bộ thắng V-Brake, giúp bảo vệ bé an toàn trong những ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (50, 6, N'
	Xe Đạp Trẻ Em Youth STITCH JY903-16 &#8211; Bánh 16 Inches', 2490000, 100, N'STIJY90316-7031-850-600x600.jpg', 0, N'
										

Xe Đạp Trẻ Em Youth STITCH JY903 &#8211; Bánh 16 Inches là dòng xe đạp được thiết kế với phong cách thể thao, năng động và mạnh mẽ như những dòng xe đạp của người lớn. Với những tính năng nổi bật giúp bé vận động và phát triển thể chất một cách tốt nhất. Xe Đạp Trẻ Em Youth STITCH JY903 &#8211; Bánh 16 Inches người bạn đồng hành tốt nhất cùng bé yêu phát triển từng ngày.
Khung xe thép phủ sơn tĩnh điện cao cấp tạo nên một chiếc xe đạp chắc chắn và an toàn tuyệt đối cho trẻ trong lúc vận động. 
Phanh tay được thiết kế đặc biệt phù hợp với kích thước và lực bóp của các bé giúp bé dễ dàng sử dụng và tăng thêm tính an toàn cho các hành trình của bé. Phụ kiện chuông tạo ra âm thanh vui tay giúp bé phát ra tín hiệu nếu cảm thấy sắp có chướng ngại vật hay tình huống nguy hiểm
Vành xe bằng kim loại cứng cáp, chắc chắn giúp bé tự tin di chuyển trên mọi cung đường. Lốp xe cao su có bản rộng giúp bám đường tốt và vượt các địa hình khó một cách dễ dàng. Bánh xe có kích thước 16 inches')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (51, 6, N'
	Xe Đạp Trẻ Em Youth SOMINGS Lion Bird &#8211; Bánh 20 Inches', 2690000, 100, N'Somings-lion-bird-red-SOMLB20-3020-600x600.jpg', 0, N'
										

Xe Đạp Trẻ Em Youth SOMINGS Lion Bird là thương hiệu xe đạp có xuất xứ từ Anh Quốc luôn đáp ứng được nhu cầu của khách hàng về chất lượng và giá cả. Với size bánh 20 inches Xe Đạp Trẻ Em Youth SOMINGS Lion Bird thích hợp cho các bé đã tự tin để tự điều khiển một chiếc xe đạp 2 bánh mà không cần bánh phụ.


Khung sườn chắc chắn bằng hợp kim thép được thiết kế ấn tượng và độc đáo phủ sơn tĩnh điện phủ men chống xước. Chắc chắn rằng Xe Đạp Trẻ Em Youth SOMINGS Lion Bird sẽ thu hút các bé từ cái nhìn đầu tiên.


Bánh xe 20 inches phù hợp cho các bé từ 6 đến 9 tuổi đã biết đi xe đạp 2 bánh (không cần bánh phụ). Bánh xe Kenda màu trắng là điểm nhấn kết hợp vành nhôm bóng giúp bánh xe trở nên vừa ấn tượng vừa vượt mọi địa hình tốt.

Ghi đông với kiểu dáng cánh én giúp tư thế của trẻ luôn thẳng lưng, thoải mái và dễ dàng điều khiển xe.

Yên xe cũng được thiết kế êm ái với tông màu sáng thu hút để giúp trẻ tự tin trên những chặng đường dài mà không lo mỏi mông và hông. Yên xe nâng ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (52, 6, N'
	Xe Đạp Trẻ Em Youth GIANT XTC Jr 20 &#8211; Bánh 20 Inches &#8211; 2021', 5590000, 100, N'xtc-jr-20-2021-pure-red-600x600.jpg', 0, N'
										


Xe đạp trẻ em XTC JR 20 là món quà đặc biệt của các bậc cha mẹ dành cho đứa con thân yêu. Giúp bé phát triển về thể chất cũng như tinh thần. Hơn nữa, cho bé chạy xe đạp chính là cách tạo cho bé có trách nhiệm từ nhỏ và học cách tự lập.

Cũng như tất cả những dòng sản phẩm khác, chiếc khung sườn được xem là yếu tố quan trọng, là nền tảng để có thể hình thành nên một mẫu xe đạp thể thao hoàn chỉnh. Và khung sườn của xe đạp trẻ em XTC JR 20 – 2021 được cấu thành từ chất liệu nhôm hoàn toàn cứng cáp và rất đáng tin cậy.

Đối với bất kì một mẫu xe đạp thể thao nào, các bộ phận líp, xích, giò dĩa hay hệ thống tay thắng đều có vai trò, nhiệm vụ quan trọng như nhau. Với xe đạp trẻ em XTC JR 20, mọi thứ có vẻ dễ dàng hơn hẳn. Các bé mới vừa tập tễnh làm quen với người bạn mới của mình sẽ cảm thấy thoải mái, tự tin hơn khi thương hiệu Giant đã tranh thủ, tích hợp một số tính năng hoàn hảo vào bên trong bộ truyền động của sản phẩm.

Về tay lái bộ phận điều hướng của những chú ngựa s')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (53, 6, N'
	Xe Đạp Trẻ Em Youth ROYALBABY Freestyle &#8211; Bánh 16 Inches', 2790000, 100, N'16-inches-blue-600x600.jpg', 0, N'
										

Đối với các bé từ 4 đến 7 tuổi, đây là giai đoạn các các bé yêu tò mò và muốn khám phá thế giới xung quanh. Vì thế việc chọn lựa cho bé một chiếc xe đạp phù hợp vừa giúp bé vận động nâng cao sức khoẻ vừa giúp bé tự do khám phá thế giới xung quanh. Xe đạp trẻ em Youth ROYALBABY Freestyle &#8211; 16 inches sẽ là người bạn đồng hành tốt nhất của các bé yêu.
Với thiết kế mang phong cách thể thao thích hợp cho cả bé trai và bé gái. Với các màu sắc sinh động và thiết kế bắt mắt sẽ làm các bé thích thú, không thể rời mắt.
Size bánh 16 inches, xe đạp trẻ em Youth ROYALBABY Freestyle là sự lựa chọn hoàn hảo cho các bé từ 4 đến 7 tuổi. 2 bánh phụ được trang bị cho các bé vẫn chưa quen với cách điều khiển xe đạp và có thể tháo rời khi các bé đã tự tin để điều khiển chiếc xe đạp yêu thích của mình. 
Lốp xe cao su bản rộng giúp bám đường tốt và giúp trẻ dễ dàng di chuyển trong các cuộc phiêu lưu.
Ngoài ra, khung sườn Xe đạp trẻ em Youth ROYALBABY Freestyle &#8211; 16 inches với chất li')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (54, 6, N'
	Xe Đạp Trẻ Em Youth LIV Adore F/W 16 &#8211; Bánh 16 Inches &#8211; 2022', 5390000, 100, N'adore-fw-16-2022-plum-850-600x600.jpg', 0, N'
										

Xe đạp trẻ em Giant Adore F/W 16 – 2022 sở hữu thiết kế nhỏ gọn cùng diện mạo đáng yêu, màu sắc dễ thương. Dành riêng cho các bé ở độ tuổi 4-7 tuổi. Mẫu xe này sẽ là người bạn đồng hành cùng các bé trong những buổi tập luyện đạp xe, rèn luyện sức khỏe.

Xe đạp trẻ em Giant Adore F/W 16 – 2022 chủ yếu được cấu thành nên từ chất liệu hợp kim nhôm Aluxx – Grade Aluminium nhẹ và bền, có khả năng chịu lực tốt. Hơn nữa, bàn đạp được thiết kế phù hợp với chiều cao của trẻ, giúp các bé luôn cảm thấy thoải mái và ngồi đúng tư thế khi đạp xe.

Một trong số những đặc điểm riêng giúp cho chúng ta có thể rất dễ dàng nhận ra ngay Giant Adore F/W 16 nằm trong một dòng xe đạp trẻ em chính là nhờ vào kích thước nhỏ bé của chúng. Ngay cả hệ thống bánh xe cũng chỉ có size chuẩn là 16 inches, giúp bé an toàn hơn trên đường di chuyển.
Bên cạnh đó, Giant Adore F/W 16 còn được trang bị bộ thắng Alloy, 2 bánh phụ phía sau giúp bé yêu mới tập tễnh đạp xe sẽ cảm thấy thoải mái, tự tin hơn.

Yên xe ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (55, 6, N'
	Xe Đạp Trẻ Em Youth ROYALBABY Space &#8211; Bánh 16 Inches', 3290000, 100, N'ROYRB1617-3007-850-fix-600x600.jpg', 0, N'
										

Với thiết kế độc đáo và ấn tượng mang đậm phong cách thể thao, Xe Đạp Trẻ Em Youth ROYALBABY Space – Bánh 16 Inches là dòng xe đạp dành riêng cho các bé trai từ 3 đến 5 tuổi. Được thiết kế với ngoại hình mang sự năng động, mạnh mẽ chắc chắn các bé yêu sẽ thích thú. 
Sở hữu cho bé một chiếc xe đạp có bánh phụ giúp bé tự tin trong lần đầu tiên đi xe đạp của mình. Bánh phụ giúp giữ thăng bằng và tạo cảm giác yên tâm cho các bé yêu. Đồng thời, bánh phụ giúp bé yêu quen với xe đạp và sẽ nhanh chóng học được cách đi xe đạp một mình một cách an toàn.
Khung xe được làm từ hợp kim Nhôm siêu nhẹ, phù hợp với cân nặng của các bé giúp bé xử lý và di chuyển xe dễ dàng. Với thiết kế độc đáo hình tam giác tạo cảm giác gọn nhẹ cho khung xe. Xe sử dụng công nghệ hàn bằng robot đảm bảo các mối hàn bền và đẹp. Màu đỏ và màu đen là màu chủ đạo khiến dòng Xe Đạp Trẻ Em Youth ROYALBABY Space mang lại cảm giác mạnh mẽ và tinh tế.
Yên xe mềm, mang nét đặc trưng của RoyalBaby giúp bảo vệ mông và h')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (56, 6, N'
	Xe Đạp Địa Hình MTB TRINX TX14 Disc &#8211; Phanh Đĩa, Bánh 24 Inches &#8211; 2021', 5190000, 100, N'YB046482-850-600x600.jpg', 0, N'
										

Xe đạp địa hình MTB TRINX TX14 Disc &#8211; 2021 là một trong những mẫu xe đạp địa hình phong cách thể thao cỡ nhỏ được khách hàng nhỏ tuổi yêu chuộng.
TRINX TX14 là sự lựa chọn hoàn hảo cho các bé trai thể hiện sự “cool ngầu” trên đường đến trường hay trên đường đi chơi. Đặc biệt, một chiếc xe đạp thích hợp cho bé tự tin thể hiện cá tính cũng sẽ giúp bé chăm luyện tập hơn giúp cơ thể khoẻ mạnh hơn mỗi ngày.

Dòng xe đạp địa hình MTB TRINX TX14 Disc với kích thước bánh 24 inches thích hợp cho các bé trai cao từ 1m35 đến 1m55. Lốp xe CST 24×1.95 27TPI chính hãng, độ bám cao mang lại sự an toàn khi điều khiển xe.

Khung xe được làm từ hợp kim Nhôm (TRINX Alloy) gọn nhẹ dễ dàng sử dụng với thiết kế bo tròn tạo cảm giác lịch lãm nhưng vẫn rất chắc chắn và độ bền cao.
Tuy có kích thước nhỏ nhưng xe đạp địa hình MTB TRINX TX14 vẫn sở hữu bộ truyền động 21 tốc độ dễ dàng sang số, tùy chỉnh các cấp độ nhanh, chậm tùy vào địa hình và mục đích sử dụng.
Ghi đông (tay lái) ngang giúp ')
GO
INSERT [dbo].[Product] ([IDProduct], [IDCategory], [Name], [Price], [Stock], [ImageURL], [IsDelete], [Description]) VALUES (57, 7, N'
	Khung Sườn Xe Đạp GIANT TCR Advanced Pro Disc Frame And Fork &#8211; 2022', 49890000, 100, N'tcr-advanced-pro-disc-frameset-2022-phantom-green-600x600.jpg', 0, N'
										

				')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 3, N'Metallic Black, Blue Ashes, White')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 5, N'High-tensile steel, rack mount')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 7, N'Giant double wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 8, N'Alloy, 32h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 10, N'Giant S-X3, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 11, N'Giant Sport XC, 25.4mm (S: 640mm, M: 640mm, L: 680mm, XL: 680mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 12, N'Giant Sport, 15-degree, 25.4mm (S:75mm, M:75mm, L:90mm, XL:90mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 13, N'Giant Sport, alloy, 27.2mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 14, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 15, N'Giant Urban Fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 16, N'Shimano ST-EF41, 3×7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 17, N'Shimano Tourney')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 18, N'Shimano Tourney')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 19, N'Linear pull, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 20, N'Shimano ST-EF41')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 21, N'Shimano MF-TZ500-7, 14×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 23, N'Forged alloy, 28/38/48 (S:170mm, M:170mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (1, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 3, N'Matte Gray/Black, Matte Black/Red/Silver, Matte Black/Blue/Silver, Orange/Black/Gray')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 4, N'TRINX Alloy 700Cx470, 510mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 5, N'Hi-Ten Steel 700C')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 7, N'TRINX Double Wall 700C')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 8, N'Alloy Disc Hub')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 10, N'700C')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 11, N'TRINX Alloy Flat')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 12, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 13, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 16, N'Shimano ST-EF500 24-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 17, N'Shimano 3-speed hoặc Microshift 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 18, N'Shimano RD-TX800 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 19, N'Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 21, N'CS-M3008, 8-speed, 11-32T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 22, N'KMC 8S')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 23, N'Prowheel 3-speed 28/38/48T x 170L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (2, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 3, N'Charcoal, Blue Ashes')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 5, N'High-tensile steel, rack mount')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 7, N'Giant double-wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 8, N'Alloy, 32h loose ball bearing')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 10, N'Giant S-X3, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 11, N'Giant Sport XC, 25.4')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 12, N'Giant Sport, 15-degree, 25.4')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 13, N'Giant Sport, 27.2')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 14, N'Giant Sport Comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 15, N'Giant Urban Fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 16, N'Shimano ST-EF41 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 17, N'Shimano Tourney 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 19, N'Linear pull, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 20, N'V-Brake')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 21, N'Shimano MF-TZ500-7, 14&#215;34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 23, N'Forged alloy, 28/38/48')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (3, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 3, N'Grey/Orange, Black/Blue, Black White/Blue, Black White/Red')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 4, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 5, N'Hi-Ten Steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 8, N'Steel Hub')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 10, N'700C')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 11, N'TRINX Alloy Flat')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 12, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 13, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 16, N'SHIMANO ST-EF500-7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 17, N'Shimano 3-speed hoặc Microshift 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 18, N'SHIMANO RD-TY300D 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 19, N'Alloy V-Brake')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 20, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 21, N'7-speed, 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 22, N'KMC 7S')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 23, N'3-speed, 28/38/48T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (4, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 2, N'S')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 3, N'Dark Red, Blue')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 4, N'ALUXX-grade aluminum, with integrated rear carrier and cup holder')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 5, N'High tensile steel fork')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 7, N'Giant double wall, 6061 aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 8, N'Alloy, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 9, N'Stainless steel, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 10, N'Kenda K1098, 700x32c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 11, N'Alloy city raise 25mm, 600mm long')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 12, N'Alloy quill')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 13, N'Alloy post, 30.9x300mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 14, N'Momentum Street comfort saddle')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 15, N'Anti-slip, 9/16&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 16, N'Shimano Revo, Twist 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 19, N'Alloy, direct pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 20, N'Alloy comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 21, N'Shimano MF-TZ500 14-34, 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 23, N'ProWheel, 42T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 24, N'Sealed cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (5, 27, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 3, N'Charcoal')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 4, N'ALUXX-Grade Aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 5, N'Alloy, rack mount, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 7, N'Giant double wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 8, N'Alloy, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 10, N'Giant S-X2, puncture protect, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 11, N'Giant Sport XC, 31.8mm (XS:600mm, S:640mm, M:640mm, L:680mm, XL:680mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 12, N'Giant Sport, 15-degree, 31.8mm (XS:80mm, S:90mm, M:90mm, L:100mm, XL:100mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 13, N'Giant D-Fuse, alloy (XS:300mm, S:300mm, M:350mm, L:350mm, XL:350mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 14, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 15, N'Giant Urban Fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 16, N'Shimano Altus, 2×8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 17, N'Shimano FD-TY710 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 18, N'Shimano Altus 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 19, N'Tektro HD-R280, Giant MPH rotors [F]160mm, [R]160mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 20, N'Tektro')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 21, N'Shimano CS-HG31, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 22, N'KMC Z8.3')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 23, N'Forged alloy, 30/46 (XS:170mm, S:170mm, M:170mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (6, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 3, N'White, Mushroom, Mineral Green')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 4, N'GIANT ALUXX aluminum alloy frame')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 5, N'GIANT steel fork')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 7, N'Alloy 32h/28')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 8, N'Alloy 32h/28')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 9, N'Stainless steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 10, N'CST 26&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 11, N'Aluminum alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 12, N'Aluminum alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 13, N'Aluminum alloy 30.9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 14, N'Selle Royal')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 15, N'Giant City pedal')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 16, N'Shimano Revoshift 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 17, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 19, N'ARTEK NT210')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 20, N'70KGF-CM')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 21, N'14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 22, N'KMC')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 23, N'42T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 24, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (7, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 3, N'Charcoal, Rosewood')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 4, N'ALUXX-Grade Aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 5, N'Alloy, rack mount, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 7, N'Giant double wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 8, N'Alloy, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 10, N'Giant S-X2, puncture protect, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 11, N'Giant Sport XC, 31.8mm (S:640mm, M:640mm, L:680mm, XL:680mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 12, N'Giant Sport, 15-degree, 31.8mm (S:90mm, M:90mm, L:100mm, XL:100mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 13, N'Giant D-Fuse Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 14, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 15, N'Giant Urban Fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 16, N'Shimano Altus, 2×8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 17, N'Shimano FD-TY710')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 18, N'Shimano Altus')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 19, N'Tektro HD-R280, Giant MPH rotors')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 20, N'Tektro HD-R280')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 21, N'Shimano CS-HG31, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 22, N'KMC Z8.3')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 23, N'Forged alloy, 30/46 (S:170mm, M:170mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (8, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 2, N'XS, S, M')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 3, N'Purple Ash, Eucalyptus')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 5, N'ALUXX-Grade Aluminum fork, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 7, N'Giant GX Disc Wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 8, N'Alloy disc, 32h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 10, N'Giant S-X2, puncture protect, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 11, N'Giant Sport, 31.8mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 12, N'Giant Sport, alloy, 7-degree')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 13, N'Giant Sport, 27.2mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 14, N'Liv Sport Comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 15, N'Urban fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 16, N'Shimano SL-M315 2&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 17, N'Shimano Tourney 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 18, N'Shimano Altus 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 19, N'Tektro HD-R280 hydraulic disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 20, N'Tektro, hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 21, N'Shimano CS-HG31, 11&#215;34, 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 22, N'KMC Z8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 23, N'Forged alloy, 30/46, 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 24, N'Sealed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (9, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 3, N'Charcoal, Hematite')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 4, N'ALUXX-Grade Aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 5, N'Advanced-Grade Composite, composite OverDrive steerer, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 7, N'Giant double wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 8, N'Alloy, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 10, N'Giant S-X2, puncture protect, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 11, N'Giant Sport XC, 31.8mm (S:640mm, M:640mm, L:680mm, XL:680mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 12, N'Giant Sport, 15-degree, 31.8mm (S:90mm, M:90mm, L:100mm, XL:100mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 13, N'Giant D-Fuse Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 14, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 15, N'Giant Urban Fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 16, N'Shimano Altus, 2×9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 17, N'Shimano Acera 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 18, N'Shimano Alivio 9-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 19, N'Tektro HD-R280, Giant MPH rotors [F]160mm, [R]160mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 20, N'Tektro HD-R280')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 21, N'Shimano CS-HG200-9, 11×36')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 22, N'KMC X9 with missing link')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 23, N'Shimano MT-210, 30/46 (S:170mm, M:170mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 24, N'Shimano SM-BB52')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (10, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 2, N'S, M, ML, L ,XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 3, N'Metallic Black/Chrome')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 4, N'ALUXX SL-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 5, N'Advanced-Grade Composite, alloy OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 7, N'Giant GX wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 8, N'Giant GX wheelset, 12mm thru-axle')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 9, N'Giant GX wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 10, N'Giant S-R3 AC, puncture protect, 700x32c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 11, N'Giant Sport, flat')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 12, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 13, N'Giant D-Fuse, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 15, N'Platform pedal')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 16, N'Shimano Claris 2×8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 17, N'Shimano Claris 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 18, N'Shimano Claris 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 19, N'Tektro HD-R280')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 20, N'Tektro')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 21, N'Shimano CS-HG41, 8-speed, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 22, N'KMC Z8.3')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 23, N'ProWheel Ounce 521C, 2-speed, 34/50')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (11, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 2, N'XS, S, M, ML, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 3, N'Eclipse')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 4, N'ALUXX SL-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 5, N'Advanced-Grade Composite, alloy OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 7, N'Giant GX wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 8, N'Giant GX wheelset, 12mm thru-axle')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 9, N'Giant GX wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 10, N'Giant S-R3 AC, puncture protect, 700x32c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 11, N'Giant Sport, flat')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 12, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 13, N'Giant D-Fuse Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 16, N'Shimano Sora 2&#215;9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 18, N'Shimano Sora 9-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 19, N'Tektro HD-R280')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 20, N'Tektro')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 21, N'Shimano CS-HG201, 9-speed, 11&#215;34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 22, N'KMC X9 with missing link')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 23, N'FSA Omega, 2-speed, 34/50')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (12, 27, N'Shimano Sora 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 2, N'XS, S, M, L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 3, N'Trekking Green, Metallic Black')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 4, N'ALUXX-grade aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 5, N'SR Suntour XCE 27.5, coil spring, 100mm or 80mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 7, N'Giant GX03V 27.5, alloy, double wall, 21mm inner width')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 8, N'[F] Giant Tracker Giant Sport QR, loose ball [R] Giant Tracker Giant Sport QR, loose ball')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 10, N'Maxxis Ikon 27.5×2.2, wire bead')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 11, N'Giant Connect Trail, 670×31.8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 12, N'Giant Sport, 7-degree')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 13, N'Giant Sport, 30.9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 14, N'Giant custom')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 15, N'MTB caged')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 16, N'Shimano SL-M315 2&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 19, N'Tektro TKD 172, mechanical')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 20, N'RS360A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 21, N'Shimano MF-TZ500, 7-speed, 14×28')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 22, N'KMC Z8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 23, N'ProWheel forged, 2-speed, 22/36')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (13, 27, N'Shimano M315 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 2, N'One Size (Phù hợp chiều cao 1m55 trở lên)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 3, N'Đen đỏ, đen vàng, đen xanh dương, xám vàng')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 4, N'Hợp kim thép')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 5, N'Phuộc lò xo, hợp kim thép')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 7, N'Hợp kim nhôm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 10, N'26&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 12, N'Hợp kim nhôm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 14, N'Fornix')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 16, N'Fornix 3&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 17, N'Fornix 3 speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 18, N'Fornix 8 speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 19, N'Phanh đĩa nhôm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 23, N'Hợp kim thép')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (14, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 3, N'Vibrant Blue, Black')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 5, N'SR Suntour M3030A, 100mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 7, N'Giant CH17 alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 8, N'Alloy, sealed bearing')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 10, N'Giant Quickcross 27.5×2.1')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 11, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 12, N'Giant Sport, alloy, 15-degree')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 13, N'Giant Sport, 30.9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 14, N'Giant Custom')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 16, N'EF413 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 19, N'MTB linear pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 20, N'Shimano EF41')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 21, N'Shimano MF-TZ500, 7-speed, 14×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 23, N'ProWheel forged, 3-speed, 24/34/42')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (15, 27, N'Shimano Tourney 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 3, N'Moss Green, Black')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 4, N'ALUXX-Grade Aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 5, N'SR Suntour NEX 700C, 63mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 7, N'Giant GX Disc Wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 8, N'Giant GX Disc Wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 9, N'Giant GX Disc Wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 10, N'Giant CrossCut, 700x42c, anti-puncture')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 11, N'Giant Sport XC, 25.4')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 12, N'Giant Sport, 15-degree, 25.4')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 13, N'Giant D-Fuse Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 14, N'Giant Sport Comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 16, N'Shimano Altus 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 17, N'Shimano Tourney 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 18, N'Shimano Altus 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 19, N'Tektro HD-M275 hydraulic disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 20, N'Tektro HD-M275 hydraulic disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 21, N'Shimano HG200, 7-speed, 12×32')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 23, N'Forged alloy, 3-speed, 28/38/44')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 24, N'Threaded')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (16, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 2, N'S, M, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 3, N'Phantom Green, Metal')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 4, N'ALUXX-Grade Aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 5, N'SR Suntour NEX HLO 700C, 63mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 7, N'Giant double wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 8, N'Alloy, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 10, N'Giant CrossCut, anti-puncture, 700x42c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 11, N'Giant Sport XC, 31.8mm (S:640mm, M:680mm, L:680mm, XL:680mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 12, N'Giant Sport, 7-degree (S:60mm, M:70mm, L:80mm, XL:90mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 13, N'Giant D-Fuse, alloy, 350mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 14, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 16, N'Shimano Altus, 2×8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 17, N'Shimano Tourney 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 18, N'Shimano Acera 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 19, N'Tektro TKD-143 hydraulic, [F]160mm, [R]160mm rotors')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 20, N'Tektro TKD-143')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 21, N'Shimano CS-HG31, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 22, N'KMC Z8.3')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 23, N'Forged alloy, 30/46 (S:170mm, M:170mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 24, N'Threaded')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (17, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 3, N'Black/Gray/Red, Gray/Black/Red, White/Black/Red, Matte Black/White/Blue')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 4, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 5, N'Suspension')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 8, N'TRINX Disc Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 10, N'Kenda 26&#215;1.95')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 11, N'TRINX Alloy 31.8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 12, N'TRINX Alloy 31.8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 13, N'Alloy 27.2')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 15, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 16, N'Shimano 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 18, N'Shimano 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 19, N'TRINX Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 20, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 21, N'7-speed 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 22, N'Maya')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 23, N'TRINX 3-speed 170L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (18, 27, N'Shimano 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 3, N'Matte Black/White/Blue, Matte Black/Gray/Red, Matte Gray/Orange/Gray')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 4, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 5, N'Lock-out Suspension, 100mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 8, N'Alloy Double Sealed Bearing')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 10, N'26 x 1.95&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 11, N'TRINX Flat')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 12, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 13, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 16, N'Shimano ST-EF500 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 17, N'Shimano TZ500 3 speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 18, N'Shimano TZ500 7 speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 19, N'TRINX Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 21, N'7-speed, 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 22, N'M30 7S')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 23, N'3-speed, 24/34/42T*170L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (19, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 2, N'One size (Phù hợp chiều cao 1m55 trở lên)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 3, N'Đen đỏ, Đen xanh dương, Đen xanh lá, Xám vàng')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 4, N'Hợp kim thép')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 5, N'Phuộc lò xo, hợp kim thép')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 7, N'Hợp kim nhôm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 10, N'Fornix 26&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 12, N'Hợp kim nhôm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 14, N'Fornix')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 16, N'Fornix 3&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 17, N'Fornix 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 18, N'Fornix 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 19, N'Phanh đĩa nhôm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 23, N'Hợp kim thép')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (20, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 2, N'XS, S, M, L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 3, N'Trekking Green, Metallic Black')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 4, N'ALUXX-grade aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 5, N'SR Suntour XCE 27.5, 100mm or 80mm, coil spring, QR, alloy steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 7, N'Giant GX03V 27.5, alloy, double wall, 21mm inner width')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 8, N'[F]Giant Tracker Giant Sport QR, loose ball [R] Giant Tracker Giant Sport QR, loose ball')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 10, N'Maxxis Ikon 27.5&#215;2.2, wire bead')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 11, N'Giant Connect Trail, 670&#215;31.8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 12, N'Giant Sport, 7-degree')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 13, N'Giant Sport, 30.9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 14, N'Giant custom')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 15, N'MTB caged')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 16, N'Shimano SL-M315 2&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 19, N'Tektro TKD 143, hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 20, N'Tektro TKD 143, hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 21, N'Shimano MF-TZ500, 7-speed, 14&#215;28')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 23, N'ProWheel forged, 2-speed, 22/36')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (21, 27, N'Shimano M315 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 2, N'XS, S, M')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 3, N'Good Grey, Amber Glow, Black Chrome')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 4, N'ALUXX-Grade Aluminium, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 5, N'SR Suntour XCE, QR, alloy steerer, 80mm travel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 7, N'Giant GX03V 27.5, alloy, double wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 8, N'Alloy, sealed bearing')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 10, N'Kenda Booster 27.5&#215;2.2&#8243;, wire bead')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 11, N'Giant Connect Trail, 31.8mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 12, N'Giant Sport, 7-degree')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 13, N'Giant Sport, 30.9mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 14, N'Giant custom')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 15, N'MTB caged')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 16, N'MicroSHIFT TS39, 2&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 17, N'MicroSHIFT FD-M282 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 18, N'Shimano Altus M310 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 19, N'Tektro, hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 20, N'Tektro')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 21, N'Shimano Deore HG200, 12&#215;32')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 22, N'KMC 8.3')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 23, N'Shimano FC-M315, 22/36')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (22, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 3, N'Gray/Black/Red, White/Black/Red, Black/Cyan/White, Matte Black/Gray/Red')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 4, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 5, N'Suspension')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 8, N'TRINX Disc Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 10, N'Kenda 26&#215;1.95')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 11, N'TRINX Alloy 31.8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 12, N'TRINX Alloy 31.8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 13, N'Alloy 27.2')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 15, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 16, N'Shimano 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 17, N'Shimano Tourney TZ 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 18, N'Shimano Tourney TZ 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 19, N'TRINX Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 20, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 21, N'7-speed 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 22, N'Maya')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 23, N'TRINX 3-speed 170L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (23, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 3, N'Đen/Đỏ, Đen/Xanh dương, Xám')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 4, N'TRINX Hi-Ten Steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 5, N'Suspension')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 8, N'Disc Hub')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 10, N'Kenda 24&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 11, N'TRINX Flat')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 12, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 13, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 16, N'Shimano 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 17, N'TRINX 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 18, N'TRINX 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 19, N'TRINX Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 20, N'V-Brake')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 21, N'7-speed 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 22, N'Maya')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 23, N'3-speed, 24/34/42T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (24, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 3, N'Black/Orange/White, Black/Gray/Blue, Black/Red/Blue,  Matte Black/Green Yellow')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 4, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 5, N'Hi-ten Steel 700C')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 8, N'Steel Hubs')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 10, N'CST-C1406 700x25C')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 11, N'TRINX Steel Road')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 12, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 13, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 14, N'Cionlli Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 16, N'Shimano Tourney 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 18, N'Shimano Tourney TZ 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 19, N'Alloy side pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 20, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 21, N'7-speed 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 22, N'Maya')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 23, N'3-speed, 28/38/48Tx170L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (25, 27, N'Shimano Tourney TZ 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 2, N'XS, S, M, ML, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 3, N'Black, Racing Red')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 5, N'Alloy, OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 7, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 8, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 9, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 10, N'Giant S-R3 AC, 700x28c, folding')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 11, N'Giant Connect')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 12, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 13, N'Giant D-Fuse Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 16, N'Shimano Claris 2&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 17, N'Shimano Claris 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 18, N'Shimano Claris 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 19, N'Tektro TK-B177')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 20, N'Shimano Claris')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 21, N'CS-HG50-8, 8-speed, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 22, N'KMC Z72')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 23, N'FSA Tempo, 2-speed, 34/50')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (26, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 2, N'XS, S, M, M/L, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 3, N'Black, Cold Iron')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 5, N'Alloy, OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 7, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 8, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 9, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 10, N'Giant S-R3-AC, 700x28c (30mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 11, N'Giant Connect (XS:400mm, S:400mm, M:420mm, M/L:420mm, L:440mm, XL:440mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 12, N'Giant Sport (XS:80mm, S:90mm, M:100mm, M/L:110mm, L:110mm, XL:110mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 13, N'Giant D-Fuse Alloy, 14mm offset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 16, N'Shimano Claris 2×8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 17, N'Shimano Claris 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 18, N'Shimano Claris 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 19, N'Tektro TK-B177')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 20, N'Shimano Claris')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 21, N'Shimano CS-HG50, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 22, N'KMC Z72')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 23, N'FSA Tempo, 34/50 (XS:170mm, S:170mm, M:172.5mm, M/L:172.5mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (27, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 2, N'XS, S, M, ML, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 3, N'Metallic Navy, White')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 5, N'Advanced-Grade Composite, full-composite OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 7, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 8, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 9, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 10, N'Giant S-R3 AC, 700x28c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 11, N'Giant Connect')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 12, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 13, N'Giant D-Fuse, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 16, N'Shimano Sora 2&#215;9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 18, N'Shimano Sora 9-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 19, N'Tektro TK-B177')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 20, N'Shimano Sora')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 21, N'Shimano CS-HG400, 9-speed, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 22, N'KMC X9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 23, N'Shimano Sora, 2-speed, 34/50')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (28, 27, N'Shimano Sora 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 2, N'XS, S, M, ML, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 3, N'Carbon/Chameleon Neptune/Reflective Black')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 4, N'Advanced-Grade Composite')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 5, N'Advanced-Grade Composite, hybrid OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 7, N'Giant P-A2 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 8, N'Giant P-A2 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 9, N'Giant P-A2 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 10, N'Giant Gavia Course AC 1, tubeless, 700x25c, folding')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 11, N'Giant Contact')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 12, N'Giant Contact')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 13, N'Giant Vector, composite')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 15, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 16, N'Shimano 105 2&#215;11')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 17, N'Shimano 105 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 18, N'Shimano 105 11-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 19, N'Giant SpeedControl')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 20, N'Shimano 105')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 21, N'Shimano 105, 11-speed, 11&#215;30')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 22, N'KMC X11EL-1')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 23, N'Shimano 105, 2-speed, 36/52')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 24, N'Shimano, press fit')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (29, 26, N'Tubeless prepared')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 2, N'XS, S, M, M/L, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 3, N'Black Chrome, Amber Glow')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 4, N'ALUXX-Grade Aluminium, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 5, N'Advanced-Grade Composite, full-composite OverDrive steerer, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 7, N'Giant S-R2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 8, N'Giant S-R2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 9, N'Giant S-R2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 10, N'Giant S-R3 AC, 700x32c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 11, N'Giant Connect (XS:40cm, S:40cm, M:42cm, M/L:42cm, L:44cm, XL:44cm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 12, N'Giant Sport (XS:80mm, S:90mm, M:100mm, M/L:100mm, L:110mm, XL:110mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 13, N'Giant D-Fuse Alloy, 14mm offset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 16, N'Shimano Sora 2×9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 17, N'Shimano Sora 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 18, N'Shimano Sora 9-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 19, N'Tektro MD-C550 mechanical, MPH Rotors [F]160mm, [R]160mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 20, N'Shimano Sora')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 21, N'Shimano CS-HG400, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 22, N'KMC X9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 23, N'Shimano Sora, 34/50 (XS:170mm, S:170mm, M:172.5mm, M/L:172.5mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (30, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 2, N'XS, S, M, ML, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 3, N'Metallic Black/Black/Reflective Black')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 4, N'Advanced-Grade Composite, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 5, N'Advanced-Grade Composite, hybrid OverDrive steerer, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 7, N'Giant P-A2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 8, N'Giant P-A2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 9, N'Giant P-A2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 10, N'Giant Gavia Course AC 1, tubeless, 700x25c, folding')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 11, N'Giant Contact SL Aero')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 12, N'Giant Contact SL Aero')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 13, N'Giant Vector, composite')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 15, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 16, N'Shimano 105 2&#215;11')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 17, N'Shimano 105 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 18, N'Shimano 105 11-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 19, N'Shimano 105 hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 20, N'Shimano 105 hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 21, N'Shimano 105, 11-speed, 11&#215;30')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 22, N'KMC X11EL-1')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 23, N'Shimano 105, 2-speed, 36/52')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 24, N'Shimano, press fit')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (31, 26, N'Tubeless prepared')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 2, N'XS, S, M, ML, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 3, N'Black, Racing Red')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 5, N'Advanced-Grade Composite, full-composite OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 7, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 8, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 9, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 10, N'Giant S-R3 AC, 700x28c, folding')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 11, N'Giant Connect')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 12, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 13, N'Giant D-Fuse, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 16, N'Shimano Claris 2&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 17, N'Shimano Claris 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 18, N'Shimano Claris 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 19, N'Tektro TK-B177')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 20, N'Shimano Claris')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 21, N'CS-HG50-8, 8-speed, 11&#215;34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 22, N'KMC Z72')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 23, N'FSA Tempo, 2-speed, 34/50')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (32, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 2, N'XS, S, M, ML, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 3, N'Carbon/Chrome')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 4, N'Advanced-Grade Composite')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 5, N'Advanced-Grade Composite, full-composite OverDrive 2 steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 7, N'Giant SLR-1 42 Carbon WheelSystem (F:42mm, R:42mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 8, N'Giant SLR-1 42 Carbon WheelSystem')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 9, N'Giant SLR-1 42 Carbon WheelSystem')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 10, N'Giant Gavia AC 1, tubeless, 700x25c (28mm), folding')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 11, N'Giant Contact SL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 12, N'Giant Contact SL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 13, N'Giant Variant, composite')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 14, N'Giant Fleet SL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 15, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 16, N'Shimano Ultegra 2&#215;11')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 18, N'Shimano Ultegra 11-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 19, N'Shimano Ultegra')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 20, N'Shimano Ultegra')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 21, N'Shimano Ultegra, 11-speed, 11&#215;30')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 22, N'KMC X11SL-1')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 23, N'Shimano Ultegra, 2-speed, 36/52 with Giant PowerPro power meter')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 24, N'Shimano, press fit')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 26, N'Đế gắn đồng hồ')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (33, 27, N'Shimano Ultegra 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 2, N'S, M, M/L, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 3, N'Carbon')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 4, N'GIANT Advanced SL Carbon frame, 12&#215;142 mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 5, N'GIANT Advanced SL full carbon fork, OD2 steerer tube, 12&#215;100 mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 7, N'Giant SLR 1 Carbon Disc WheelSystem')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 8, N'Giant SLR 1 Carbon Disc WheelSystem')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 9, N'Giant SLR 1 Carbon Disc WheelSystem')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 10, N'CADEX Race 25, tubeless,700x25c (26.5mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 11, N'Giant Contact SLR Aero')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 12, N'Giant Contact SL Aero')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 13, N'Advanced SL-Grade composite, integrated design')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 14, N'Giant Fleet SLR')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 15, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 16, N'SRAM Force eTap AXS 2&#215;12')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 17, N'SRAM Force eTap AXS 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 18, N'SRAM Force eTap AXS 12-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 19, N'SRAM Force eTap AXS hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 20, N'SRAM Force eTap AXS hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 21, N'SRAM Force, 12-speed, 10&#215;28')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 22, N'SRAM Force D1')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 23, N'SRAM Force D1 DUB, 35/48 with Quarq DZero power meter')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 24, N'SRAM DUB, press fit')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (34, 26, N'Đế gắn đồng hồ')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 2, N'XS, S, M, M/L, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 3, N'Black Chrome, Amber Glow')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 4, N'Advanced-Grade Composite, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 5, N'Advanced-Grade Composite, full-composite OverDrive steerer, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 7, N'Giant P-R2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 8, N'Giant P-R2 Disc wheelset, 12mm thru-axle')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 9, N'Giant P-R2 Disc wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 10, N'Giant Course 1, tubeless, 700x25c (28mm), folding')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 11, N'Giant Contact (XS:400mm, S:400mm, M:420mm, M/L:420mm, L:440mm, XL:440mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 12, N'Giant Contact (XS:80mm, S:90mm, M:100mm, M/L:110mm, L:110mm, XL:120mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 13, N'Giant Variant, composite, -5/+15mm offset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 15, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 16, N'Shimano Ultegra 2×11')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 17, N'Shimano Ultegra 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 18, N'Shimano Ultegra 11-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 19, N'Shimano Ultegra hydraulic, Shimano rotors')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 20, N'Shimano Ultegra hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 21, N'Shimano Ultegra, 11-speed, 11×30')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 22, N'KMC X11EL-1')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 23, N'Shimano Ultegra, 36/52 (XS:170mm, S:170mm, M:172.5mm, M/L:172.5mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 24, N'Shimano, press fit')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (35, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 2, N'XS, S, M, M/L, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 3, N'Black, Cold Iron')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 4, N'ALUXX-Grade aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 5, N'Advanced-Grade Composite, full-composite OverDrive steerer')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 7, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 8, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 9, N'Giant S-R3 wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 10, N'Giant S-R3-AC, 700x28c (30mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 11, N'Giant Connect (XS:400mm, S:400mm, M:420mm, M/L:420mm, L:440mm, XL:440mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 12, N'Giant Sport (XS:80mm, S:90mm, M:100mm, M/L:110mm, L:110mm, XL:110mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 13, N'Giant D-Fuse Alloy, 14mm offset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 14, N'Giant Approach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 16, N'Shimano Claris 2×9')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 17, N'Shimano Claris 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 18, N'Shimano Claris 9-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 19, N'Tektro TK-B177')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 20, N'Shimano Claris')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 21, N'Shimano CS-HG50, 11×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 22, N'KMC Z72')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 23, N'FSA Tempo, 34/50 (XS:170mm, S:170mm, M:172.5mm, M/L:172.5mm, L:175mm, XL:175mm)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (36, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 2, N'One size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 3, N'Matte Black/Gray/Red, Matte Blue/White/Black, Matte Red/White/Orange')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 4, N'TRINX Alloy 20&#8243;×290MM Folding')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 5, N'Hi-Ten Steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 8, N'Alloy Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 10, N'20*1.75&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 11, N'TRINX Alloy Flat')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 12, N'TRINX Alloy Folding, 8°')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 13, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 16, N'Shimano SL-RS35, 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 17, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 18, N'Shimano RD-TZ500, 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 19, N'TrinX Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 20, N'TrinX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 21, N'TrinX 7S 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 22, N'KMC 7S')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 23, N'Prowheel alloy 52T*170L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (37, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 2, N'One Size (20&#8243;)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 3, N'Metallic Blue, Metallic Black, Pearl White')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 4, N'GIANT aluminum alloy folding frame')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 5, N'High tensile steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 7, N'Giant alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 8, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 9, N'Stainless steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 10, N'Kenda 20×1.5″')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 11, N'Aluminum alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 12, N'Aluminum alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 13, N'Aluminum alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 14, N'Giant saddle')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 15, N'FDLD50')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 16, N'Shimano Revoshift 6-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 17, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 18, N'Shimano Tourney 6-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 19, N'TX120')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 20, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 21, N'Shimano MF-TZ500-6')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 22, N'KMC HV500')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 23, N'PRO-552 52T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (38, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 2, N'XS, S, M')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 3, N'Purple Ash, Eucalyptus')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 5, N'ALUXX-Grade Aluminum fork, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 7, N'Giant GX Disc Wheelset')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 8, N'Alloy disc, 32h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 10, N'Giant S-X2, puncture protect, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 11, N'Giant Sport, 31.8mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 12, N'Giant Sport, alloy, 7-degree')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 13, N'Giant Sport, 27.2mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 14, N'Liv Sport Comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 15, N'Urban fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 16, N'Shimano SL-M315 2&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 17, N'Shimano Tourney 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 18, N'Shimano Altus 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 19, N'Tektro HD-R280 hydraulic disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 20, N'Tektro, hydraulic')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 21, N'Shimano CS-HG31, 11&#215;34, 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 22, N'KMC Z8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 23, N'Forged alloy, 30/46, 2-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 24, N'Sealed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (39, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 2, N'One Size (Phù hợp chiều cao 1m5 trở lên)')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 3, N'Silver, Red, Blue')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 4, N'Aluminum alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 5, N'Steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 7, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 10, N'Kenda 26&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 11, N'Maruishi alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 12, N'Maruishi alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 13, N'Maruishi alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 14, N'Maruishi')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 15, N'VP')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 16, N'Shimano Nexus 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 18, N'Shimano Nexus 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 19, N'V-Brake')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 20, N'V-Brake lever')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 21, N'Shimano 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 23, N'Maruishi')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (40, 26, N'Baga, giỏ xe, chắn bùn, đèn')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 2, N'XS, S, M')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 3, N'Trekking Green, Pale Mauve')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 5, N'High-tensile steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 7, N'Giant alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 8, N'Alloy, 36h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 10, N'Kenda K-192, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 11, N'Alloy, 25.4, low rise')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 12, N'MTS-291')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 13, N'Suspension')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 14, N'Liv Comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 16, N'Shimano Revoshift 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 19, N'Alloy, direct pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 20, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 21, N'Shimano MF-TZ500, 7-speed, 14×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 23, N'Alloy, 42t')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 24, N'Sealed cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (41, 27, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 2, N'XS, S, M')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 3, N'Figuier, Pistachio')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 4, N'ALUXX-Grade aluminum, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 5, N'Alloy, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 7, N'Giant double wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 8, N'Alloy, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 10, N'Giant S-X3, 700x38c, puncture protect')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 11, N'Giant Sport XC, 25.4mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 12, N'Giant Sport, 25.4mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 13, N'Giant D-Fuse Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 14, N'Liv Sport Comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 16, N'Shimano Tourney 3×7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 17, N'Shimano Tourney 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 19, N'Tektro TKB-172 mechanical [F]160mm, [R]160mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 20, N'Tektro TKB-172')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 21, N'Shimano MF-TZ500-7, 14×34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 22, N'KMC Z7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 23, N'Prowheel, 28/38/48')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (42, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 2, N'XS, S, M, L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 3, N'Grayish Blue')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 5, N'Alloy, rack mounts')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 7, N'Giant double-wall aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 8, N'Alloy, loose ball bearing')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 10, N'Giant S-X3, 700x38c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 11, N'Giant Sport, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 12, N'Giant Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 13, N'Giant Sport, 27.2')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 14, N'Liv Sport Comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 15, N'Giant Urban Fitness')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 16, N'Shimano Altus 3&#215;8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 18, N'Shimano Altus 8-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 19, N'Alloy, linear pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 20, N'Tektro')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 21, N'Shimano CS-HG200, 8-speed, 12×33')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 22, N'KMC Z8.3')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 23, N'Forged alloy, 3-speed, 28/38/48')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (43, 27, N'Shimano Tourney 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 2, N'S, M')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 3, N'Dark Red, Dark Gray, Light Green')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 4, N'ALUXX-grade aluminum, with integrated rear carrier and cup holder')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 5, N'High tensile steel fork')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 7, N'Giant double wall, 6061 aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 8, N'Alloy, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 9, N'Stainless steel, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 10, N'Kenda K1098, 700x32c')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 11, N'Alloy city raise 25mm, 600mm long')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 12, N'Alloy quill')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 13, N'Alloy post, 30.9mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 14, N'Momentum Street comfort saddle')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 15, N'Anti-slip, 9/16″')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 16, N'Shimano Revoshift 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 17, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 19, N'Alloy, direct pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 20, N'Alloy comfort')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 21, N'Shimano MF-TZ500-7, 14-34')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 22, N'KMC')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 23, N'ProWheel, 42T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 24, N'Sealed cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (44, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 3, N'Blue, Black/Red, Red')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 4, N'TRINX Hi-Ten Steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 5, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 7, N'TRINX Alloy double-deck')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 8, N'Steel Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 10, N'20&#8243;x2.125 Rubber')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 11, N'TRINX Small Rise')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 12, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 13, N'TRINX Hi-Ten Steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 16, N'Shimano Tourney TZ 6-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 18, N'TRINX RD-HG-18A 6-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 19, N'TRINX Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 20, N'Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 21, N'6-speed 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 22, N'Maya OE-6')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 23, N'TRINX 40Tx152L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (45, 27, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 3, N'Đen/Vàng, Xanh lam/Vàng')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 4, N'Vinbike STL 16&#8243;')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 5, N'Vinbike STL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 7, N'Single wall, 28h, Schrader valve')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 10, N'Eakia 16*2.125')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 11, N'STL 520*22.2')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 12, N'25.4*22.2*130mm STL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 13, N'25.4*220mm STL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 14, N'Vinbike')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 15, N'9/16&#8243; Black PP Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 16, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 17, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 18, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 19, N'V-Brake')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 20, N'V-Brake')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 21, N'16T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 22, N'1/2*1/8*72L')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 23, N'28T*110mm STL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (49, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 2, N'One size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 3, N'Pure Red')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 5, N'HL steel, 50mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 7, N'Giant Kids 20″, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 8, N'Nutted, 28h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 9, N'Stainless, 14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 10, N'Giant Junior Sport, 20×2.1, 22 tpi')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 11, N'Giant Sport, alloy, 31.8')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 12, N'Forged alloy Ahead, 8-degree')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 13, N'Alloy, 27.2')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 14, N'Giant Jr. Sports')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 16, N'Shimano RevoShifter 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 18, N'Shimano Tourney 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 19, N'Alloy, linear pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 20, N'Alloy, junior MTB')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 21, N'7-speed, 14×28')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 22, N'KMC HV500')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 23, N'32t, 127mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 24, N'Semi-cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 26, N'Chân chống, chuông')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (52, 27, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 3, N'Ice Green, Plum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 4, N'ALUXX-Grade Aluminum')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 5, N'High-tensile steel')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 6, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 7, N'Giant Kids 16″, alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 8, N'Nutted, 20h')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 9, N'14g')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 10, N'Innova IA-2094, 16×2.25″')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 11, N'Giant Kids, middle high, 520mm width')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 12, N'Alloy quill')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 13, N'Alloy, 25.4x200mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 14, N'Giant Kids')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 15, N'Platform')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 16, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 17, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 18, N'N/A')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 19, N'Alloy, linear pull')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 20, N'Alloy junior, adjustable reach')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 21, N'18t')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 22, N'KMC C410')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 23, N'High-tensile steel, 28t, 89mm')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 24, N'Cartridge')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (54, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 2, N'One Size')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 3, N'Black/Red/Gray, Matte Black/Blue/White, Matte Black/White/Green')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 4, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 5, N'Suspension')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 7, N'TRINX Alloy Double Wall')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 8, N'Disc Hub')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 9, N'Stainless')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 10, N'CST 24&#215;1.95 27TPI')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 11, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 12, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 13, N'TRINX Alloy')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 14, N'TRINX Sport')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 16, N'Shimano 3&#215;7')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 18, N'Shimano 7-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 19, N'TRINX Alloy Mechanical Disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 20, N'V-Brake')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 21, N'7S 14-28T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 22, N'Maya')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 23, N'24/34/42T')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 25, N'Trọng lượng có thể thay đổi dựa trên kích cỡ, chất liệu hoàn thiện, chi tiết kim loại và các phụ kiện.')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 26, N'Chân chống')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (56, 27, N'Sunrun 3-speed')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (57, 2, N'XS, S, M, M/L, L, XL')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (57, 3, N'Carbon, Phantom Green')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (57, 4, N'Advanced-Grade Composite, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (57, 5, N'Advanced-Grade Composite, full-composite OverDrive 2 steerer, disc')
GO
INSERT [dbo].[ProductAttribute] ([IDProduct], [IDAttribute], [AttributeValue]) VALUES (57, 13, N'Giant Variant, composite, -5/+15mm offset')
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD FOREIGN KEY([IDAccount])
REFERENCES [dbo].[Account] ([IDAccount])
GO
ALTER TABLE [dbo].[AccountAddress]  WITH CHECK ADD FOREIGN KEY([IDAddress])
REFERENCES [dbo].[Address] ([IDAddress])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([IDAccount])
REFERENCES [dbo].[Account] ([IDAccount])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([IDAddress])
REFERENCES [dbo].[Address] ([IDAddress])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([IDCart])
REFERENCES [dbo].[Cart] ([IDCart])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([IDStatus])
REFERENCES [dbo].[Status] ([IDStatus])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([IDCategory])
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD FOREIGN KEY([IDAttribute])
REFERENCES [dbo].[Attribute] ([IDAttribute])
GO
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([IDProduct])
GO
ALTER TABLE [dbo].[ProductCart]  WITH CHECK ADD FOREIGN KEY([IDCart])
REFERENCES [dbo].[Cart] ([IDCart])
GO
ALTER TABLE [dbo].[ProductCart]  WITH CHECK ADD FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([IDProduct])
GO
ALTER TABLE [dbo].[StaffRole]  WITH CHECK ADD FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([IDRole])
GO
ALTER TABLE [dbo].[StaffRole]  WITH CHECK ADD FOREIGN KEY([IDStaff])
REFERENCES [dbo].[AccountStaff] ([IDStaff])
GO
USE [master]
GO
ALTER DATABASE [XeDap] SET  READ_WRITE 
GO
