USE [master]
GO
/****** Object:  Database [onlineLearn]    Script Date: 4/20/2022 12:06:35 PM ******/
CREATE DATABASE [onlineLearn]
GO
USE [onlineLearn]
GO
/****** Object:  Table [dbo].[accountDetail]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[mobile] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[gender] [bit] NOT NULL,
 CONSTRAINT [PK_accountDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[account_detailID] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[create_date] [date] NOT NULL,
	[status] [int] NOT NULL,
	[active_code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_accounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[thumbnail] [nvarchar](max) NOT NULL,
	[category_id] [int] NOT NULL,
	[fearture] [int] NOT NULL,
	[owner] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[price] [float] NOT NULL,
	[sale_price] [float] NOT NULL,
	[status] [int] NOT NULL,
	[duration] [nvarchar](max) NULL,
	[skill_level] [nvarchar](max) NULL,
	[language] [nvarchar](max) NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[belonging_topic] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[video_link] [nvarchar](max) NOT NULL,
	[type] [int] NOT NULL,
	[status] [int] NOT NULL,
	[course_id] [int] NOT NULL,
 CONSTRAINT [PK_lesson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[author] [nvarchar](max) NOT NULL,
	[update_date] [date] NOT NULL,
	[category_id] [int] NOT NULL,
	[post_detail] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[registration_time] [date] NOT NULL,
	[total_cost] [float] NOT NULL,
	[status] [int] NOT NULL,
	[valid_from] [date] NOT NULL,
	[valid_to] [date] NOT NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 4/20/2022 12:06:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slider]    Script Date: 4/20/2022 12:06:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[backlink] [nvarchar](max) NOT NULL,
	[course_id] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_slider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accountDetail] ON 

INSERT [dbo].[accountDetail] ([id], [name], [mobile], [address], [gender]) VALUES (7, N'KhaiTQHE141672', N'0921282198', N'Ha Noi', 1)
INSERT [dbo].[accountDetail] ([id], [name], [mobile], [address], [gender]) VALUES (11, N'Tran Quang Khai', N'0921282198', N'Ha Noi', 1)
INSERT [dbo].[accountDetail] ([id], [name], [mobile], [address], [gender]) VALUES (12, N'phung dang long vu', N'0921282198', N'Ha Noi', 0)
SET IDENTITY_INSERT [dbo].[accountDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[accounts] ON 

INSERT [dbo].[accounts] ([id], [email], [password], [account_detailID], [role_id], [create_date], [status], [active_code]) VALUES (3, N'khaitqhe141672@fpt.edu.vn', N'123456789', 7, 1, CAST(N'2022-04-16' AS Date), 2, N'MpVPTY')
INSERT [dbo].[accounts] ([id], [email], [password], [account_detailID], [role_id], [create_date], [status], [active_code]) VALUES (7, N'khaitran30062000@gmail.com', N'123456', 11, 2, CAST(N'2022-04-17' AS Date), 2, N'GcnXyy')
INSERT [dbo].[accounts] ([id], [email], [password], [account_detailID], [role_id], [create_date], [status], [active_code]) VALUES (8, N'pdlv2k@gmail.com', N'123456', 12, 2, CAST(N'2022-04-18' AS Date), 2, N'QHZHIU')
SET IDENTITY_INSERT [dbo].[accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name], [status]) VALUES (1, N'IT', 1)
INSERT [dbo].[category] ([id], [name], [status]) VALUES (2, N'Programming', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [name], [thumbnail], [category_id], [fearture], [owner], [description], [price], [sale_price], [status], [duration], [skill_level], [language]) VALUES (1, N'Web Design', N'pic1.jpg', 1, 1, N'Owner', N'hay', 100, 100, 1, NULL, NULL, NULL)
INSERT [dbo].[courses] ([id], [name], [thumbnail], [category_id], [fearture], [owner], [description], [price], [sale_price], [status], [duration], [skill_level], [language]) VALUES (2, N'Java', N'pic5.jpg', 1, 2, N'TamTD', N'b', 100, 0.1, 1, N'c', N'1', N'e')
INSERT [dbo].[courses] ([id], [name], [thumbnail], [category_id], [fearture], [owner], [description], [price], [sale_price], [status], [duration], [skill_level], [language]) VALUES (3, N'C#', N'pic2.jpg', 1, 2, N'TamTD', N'b', 200, 0.2, 1, N'c', N'1', N'a')
INSERT [dbo].[courses] ([id], [name], [thumbnail], [category_id], [fearture], [owner], [description], [price], [sale_price], [status], [duration], [skill_level], [language]) VALUES (4, N'C++', N'pic4.jpg', 1, 2, N'TamTD', N'b', 300, 0.3, 1, N'c', N'1', N'b')
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[lesson] ON 

INSERT [dbo].[lesson] ([id], [title], [belonging_topic], [content], [video_link], [type], [status], [course_id]) VALUES (4, N'Lesson1', N'HTML', N'HTML, or HyperText Markup Language, allows web users to create and structure sections, paragraphs, and links using elements, tags, and attributes. However, it’s worth noting that HTML is not considered a programming language as it can’t create dynamic functionality.', N'linkvideo', 2, 1, 1)
INSERT [dbo].[lesson] ([id], [title], [belonging_topic], [content], [video_link], [type], [status], [course_id]) VALUES (5, N'Lesson12', N'CSS', N'CSS (Cascading Style Sheets) allows you to create great-looking web pages, but how does it work under the hood? This article explains what CSS is with a simple syntax example and also covers some key terms about the language.', N'linkvideo', 22, 1, 1)
INSERT [dbo].[lesson] ([id], [title], [belonging_topic], [content], [video_link], [type], [status], [course_id]) VALUES (7, N'Java', N'Base', N'acb', N'asd', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (4, N'10 lý do cho thấy tại sao bạn nên theo học ngôn ngữ lập trình Java', N'TamTD', CAST(N'2022-04-17' AS Date), 1, N'Chính sức hút từ cái tên ngôn ngữ lập trình Java đã mở ra một cơ hội cực kì lớn cho những ai đã và đang đi theo con đường lập trình', 0, 3, N'pic1.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (5, N'7 lý do bạn nên lựa chọn lập trình C#', N'TamTD', CAST(N'2022-04-18' AS Date), 2, N'Sự thật là bạn có thể học một vài ngôn ngữ lập trình trong sự nghiệp của mình nhưng bắt đầu với C# là một ý tưởng cực kỳ không tồi. Tại sao lại là C#?', 0, 3, N'pic2.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (6, N'Kiến Thức Cơ Bản Cần Nắm Khi Bắt Đầu Học C++', N'TamTD', CAST(N'2022-04-19' AS Date), 2, N'Nếu như làm chủ được ngôn ngữ nền tảng như C/C++ thì sau này học các ngôn ngữ khác trở nên dễ dàng hơn, do đó rất phù hợp với người mới bắt đầu.', 1, 3, N'pic3.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (7, N'9 Lý do TẠI SAO nên chọn JAVA để Lập trình WEB', N'TamTD', CAST(N'2022-04-17' AS Date), 1, N'Chính sức hút từ cái tên ngôn ngữ lập trình Java đã mở ra một cơ hội cực kì lớn cho những ai đã và đang đi theo con đường lập trình', 0, 3, N'pic4.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (8, N'7 lý do bạn nên lựa chọn lập trình C#', N'TamTD', CAST(N'2022-04-18' AS Date), 1, N'Sự thật là bạn có thể học một vài ngôn ngữ lập trình trong sự nghiệp của mình nhưng bắt đầu với C# là một ý tưởng cực kỳ không tồi. Tại sao lại là C#?', 0, 3, N'pic5.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (9, N'Kiến Thức Cơ Bản Cần Nắm Khi Bắt Đầu Học C++', N'TamTD', CAST(N'2022-04-19' AS Date), 2, N'Nếu như làm chủ được ngôn ngữ nền tảng như C/C++ thì sau này học các ngôn ngữ khác trở nên dễ dàng hơn, do đó rất phù hợp với người mới bắt đầu.', 1, 3, N'pic6.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (10, N'TẠI SAO PHẢI HỌC JAVA - WHY? HỌC NHƯ THẾ NÀO - HOW?', N'TamTD', CAST(N'2022-04-17' AS Date), 1, N'Chính sức hút từ cái tên ngôn ngữ lập trình Java đã mở ra một cơ hội cực kì lớn cho những ai đã và đang đi theo con đường lập trình', 0, 3, N'pic7.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (11, N'7 lý do bạn nên lựa chọn lập trình C#', N'TamTD', CAST(N'2022-04-18' AS Date), 2, N'Sự thật là bạn có thể học một vài ngôn ngữ lập trình trong sự nghiệp của mình nhưng bắt đầu với C# là một ý tưởng cực kỳ không tồi. Tại sao lại là C#?', 0, 3, N'pic8.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (12, N'Kiến Thức Cơ Bản Cần Nắm Khi Bắt Đầu Học C++', N'TamTD', CAST(N'2022-04-19' AS Date), 1, N'Nếu như làm chủ được ngôn ngữ nền tảng như C/C++ thì sau này học các ngôn ngữ khác trở nên dễ dàng hơn, do đó rất phù hợp với người mới bắt đầu.', 1, 3, N'pic9.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (13, N'Vì Sao Sinh Viên Ngành Khoa Học Máy Tính Học C++', N'TamTD', CAST(N'2022-04-17' AS Date), 2, N'Chính sức hút từ cái tên ngôn ngữ lập trình Java đã mở ra một cơ hội cực kì lớn cho những ai đã và đang đi theo con đường lập trình', 0, 3, N'pic1.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (14, N'7 lý do bạn nên lựa chọn lập trình C#', N'TamTD', CAST(N'2022-04-18' AS Date), 2, N'Sự thật là bạn có thể học một vài ngôn ngữ lập trình trong sự nghiệp của mình nhưng bắt đầu với C# là một ý tưởng cực kỳ không tồi. Tại sao lại là C#?', 0, 3, N'pic2.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (15, N'Vì Sao Tôi Chọn C++ Là Ngôn Ngữ Lập Trình Chính', N'TamTD', CAST(N'2022-04-19' AS Date), 1, N'Nếu như làm chủ được ngôn ngữ nền tảng như C/C++ thì sau này học các ngôn ngữ khác trở nên dễ dàng hơn, do đó rất phù hợp với người mới bắt đầu.', 1, 3, N'pic3.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (16, N'10 lý do cho thấy tại sao bạn nên theo học ngôn ngữ lập trình Java', N'TamTD', CAST(N'2022-04-17' AS Date), 2, N'Chính sức hút từ cái tên ngôn ngữ lập trình Java đã mở ra một cơ hội cực kì lớn cho những ai đã và đang đi theo con đường lập trình', 0, 3, N'pic4.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (17, N'7 lý do bạn nên lựa chọn lập trình C#', N'TamTD', CAST(N'2022-04-18' AS Date), 2, N'Sự thật là bạn có thể học một vài ngôn ngữ lập trình trong sự nghiệp của mình nhưng bắt đầu với C# là một ý tưởng cực kỳ không tồi. Tại sao lại là C#?', 0, 3, N'pic5.jpg')
INSERT [dbo].[post] ([id], [title], [author], [update_date], [category_id], [post_detail], [status], [account_id], [image]) VALUES (18, N'Tầm quan trọng của việc học ngôn ngữ lập trình C/C++', N'TamTD', CAST(N'2022-04-19' AS Date), 1, N'Nếu như làm chủ được ngôn ngữ nền tảng như C/C++ thì sau này học các ngôn ngữ khác trở nên dễ dàng hơn, do đó rất phù hợp với người mới bắt đầu.', 1, 3, N'pic6.jpg')
SET IDENTITY_INSERT [dbo].[post] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name], [status]) VALUES (1, N'Admin', 1)
INSERT [dbo].[role] ([id], [name], [status]) VALUES (2, N'Customer', 2)
SET IDENTITY_INSERT [dbo].[role] OFF
GO
ALTER TABLE [dbo].[accounts] ADD  CONSTRAINT [DF_accounts_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF_post_update_date]  DEFAULT (getdate()) FOR [update_date]
GO
ALTER TABLE [dbo].[registration] ADD  CONSTRAINT [DF_registration_registration_time]  DEFAULT (getdate()) FOR [registration_time]
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_accounts_accountDetail] FOREIGN KEY([account_detailID])
REFERENCES [dbo].[accountDetail] ([id])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_accounts_accountDetail]
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_accounts_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_accounts_role]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_category]
GO
ALTER TABLE [dbo].[lesson]  WITH CHECK ADD  CONSTRAINT [FK_lesson_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[lesson] CHECK CONSTRAINT [FK_lesson_courses]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_accounts]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_category]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [FK_registration_accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [FK_registration_accounts]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [FK_registration_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [FK_registration_courses]
GO
ALTER TABLE [dbo].[slider]  WITH CHECK ADD  CONSTRAINT [FK_slider_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[slider] CHECK CONSTRAINT [FK_slider_courses]
GO
USE [master]
GO
ALTER DATABASE [onlineLearn] SET  READ_WRITE 
GO
