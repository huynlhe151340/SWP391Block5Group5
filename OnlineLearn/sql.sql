USE [master]
GO
/****** Object:  Database [onlineLearn]    Script Date: 4/16/2022 2:58:56 PM ******/
CREATE DATABASE [onlineLearn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlineLearn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\onlineLearn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'onlineLearn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\onlineLearn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [onlineLearn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlineLearn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlineLearn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlineLearn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlineLearn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlineLearn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlineLearn] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlineLearn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlineLearn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlineLearn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlineLearn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlineLearn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlineLearn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlineLearn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlineLearn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlineLearn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlineLearn] SET  ENABLE_BROKER 
GO
ALTER DATABASE [onlineLearn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlineLearn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlineLearn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlineLearn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlineLearn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlineLearn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlineLearn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlineLearn] SET RECOVERY FULL 
GO
ALTER DATABASE [onlineLearn] SET  MULTI_USER 
GO
ALTER DATABASE [onlineLearn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlineLearn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlineLearn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlineLearn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [onlineLearn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [onlineLearn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'onlineLearn', N'ON'
GO
ALTER DATABASE [onlineLearn] SET QUERY_STORE = OFF
GO
USE [onlineLearn]
GO
/****** Object:  Table [dbo].[accountDetail]    Script Date: 4/16/2022 2:58:57 PM ******/
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
/****** Object:  Table [dbo].[accounts]    Script Date: 4/16/2022 2:58:57 PM ******/
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
/****** Object:  Table [dbo].[category]    Script Date: 4/16/2022 2:58:57 PM ******/
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
/****** Object:  Table [dbo].[courses]    Script Date: 4/16/2022 2:58:57 PM ******/
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
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lesson]    Script Date: 4/16/2022 2:58:57 PM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 4/16/2022 2:58:57 PM ******/
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
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 4/16/2022 2:58:57 PM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 4/16/2022 2:58:57 PM ******/
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
/****** Object:  Table [dbo].[slider]    Script Date: 4/16/2022 2:58:57 PM ******/
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
