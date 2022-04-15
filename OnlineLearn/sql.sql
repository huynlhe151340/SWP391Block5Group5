USE [master]
GO
/****** Object:  Database [onlineLearn]    Script Date: 4/15/2022 9:45:20 AM ******/
CREATE DATABASE [onlineLearn]
GO
USE [onlineLearn]
GO
/****** Object:  Table [dbo].[accountDetail]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[mobile] [nvarchar](10) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[gender] [bit] NOT NULL,
 CONSTRAINT [PK_accountDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 4/15/2022 9:45:21 AM ******/
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
	[status] [int] NOT NULL,
	[create_date] [date] NOT NULL,
	[active_code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_accounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courseCategory]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courseCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](500) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_subjectCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[thumbnail] [nvarchar](max) NOT NULL,
	[category_id] [int] NOT NULL,
	[feature] [int] NOT NULL,
	[owner_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[package_id] [int] NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson]    Script Date: 4/15/2022 9:45:21 AM ******/
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
	[type] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[course_id] [int] NOT NULL,
 CONSTRAINT [PK_lesson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[registration_time] [date] NOT NULL,
	[package_id] [int] NOT NULL,
	[total_cost] [float] NOT NULL,
	[status] [int] NOT NULL,
	[valid_from] [date] NOT NULL,
	[valid_to] [date] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[package]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[access_duration] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[price] [float] NOT NULL,
	[sale_price] [float] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_package] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[author] [nvarchar](500) NOT NULL,
	[update_date] [date] NOT NULL,
	[category_id] [int] NOT NULL,
	[post_detail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[lesson_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[media] [nvarchar](max) NOT NULL,
	[answer_option] [nvarchar](max) NOT NULL,
	[explanation] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[course_id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[level] [int] NOT NULL,
	[duration] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_quiz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quizResult]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quizResult](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
	[result] [float] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_quizResult] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setting]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](max) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[note] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_setting] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slider]    Script Date: 4/15/2022 9:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[backlink] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_slider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts] ADD  CONSTRAINT [DF_accounts_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_registration_time]  DEFAULT (getdate()) FOR [registration_time]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_valid_from]  DEFAULT (getdate()) FOR [valid_from]
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF_post_update_date]  DEFAULT (getdate()) FOR [update_date]
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
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_subject_subjectCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[courseCategory] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_subject_subjectCategory]
GO
ALTER TABLE [dbo].[lesson]  WITH CHECK ADD  CONSTRAINT [FK_lesson_subject] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[lesson] CHECK CONSTRAINT [FK_lesson_subject]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_accounts]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_package] FOREIGN KEY([package_id])
REFERENCES [dbo].[package] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_package]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_subject] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_subject]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_subjectCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[courseCategory] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_subjectCategory]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_lesson] FOREIGN KEY([lesson_id])
REFERENCES [dbo].[lesson] ([id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_lesson]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_subject] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_subject]
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD  CONSTRAINT [FK_quiz_subject] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[quiz] CHECK CONSTRAINT [FK_quiz_subject]
GO
ALTER TABLE [dbo].[quizResult]  WITH CHECK ADD  CONSTRAINT [FK_quizResult_accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[quizResult] CHECK CONSTRAINT [FK_quizResult_accounts]
GO
ALTER TABLE [dbo].[quizResult]  WITH CHECK ADD  CONSTRAINT [FK_quizResult_quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[quiz] ([id])
GO
ALTER TABLE [dbo].[quizResult] CHECK CONSTRAINT [FK_quizResult_quiz]
GO
ALTER TABLE [dbo].[setting]  WITH CHECK ADD  CONSTRAINT [FK_setting_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[setting] CHECK CONSTRAINT [FK_setting_orders]
GO
USE [master]
GO
ALTER DATABASE [onlineLearn] SET  READ_WRITE 
GO
