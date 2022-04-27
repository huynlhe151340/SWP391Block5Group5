USE [onlineLearn]
GO
SET IDENTITY_INSERT [dbo].[slider] ON 
GO
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [course_id], [status]) VALUES (1, N'Kiến Thức Cơ Bản Cần Nắm Khi Bắt Đầu Học C++', N'slider1.jpg', N'Lorem ipsum, or lipsum as it is sometimes known', 1, 1)
GO
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [course_id], [status]) VALUES (3, N'7 lý do bạn nên lựa chọn lập trình Java', N'slider2.jpg', N'Lorem ipsum, or lipsum as it is sometimes known', 2, 1)
GO
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [course_id], [status]) VALUES (8, N'3 Lý Do Tại Sao Nên Học Javascript?', N'slider3.jpg', N'Lorem ipsum, or lipsum as it is sometimes known', 3, 1)
GO
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [course_id], [status]) VALUES (9, N'6 lý do tại sao các lập trình viên nên chọn học JS', N'slider4.jpg', N'Lorem ipsum, or lipsum as it is sometimes known', 4, 1)
GO
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [course_id], [status]) VALUES (10, N'7 lý do tại sao bạn nên học ngôn ngữ lập trình PHP', N'slider5.jpg', N'Lorem ipsum, or lipsum as it is sometimes known', 1, 2)
GO
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [course_id], [status]) VALUES (11, N'77777 lý do bạn nên lựa chọn lập trình C#111', N'slider6.jpg', N'Lorem ipsum, or lipsum as it is sometimes known', 1, 1)
GO
INSERT [dbo].[slider] ([id], [title], [image], [backlink], [course_id], [status]) VALUES (12, N'999997 lý do bạn nên lựa chọn lập trình C#111', N'slider1.jpg', N'Lorem ipsum, or lipsum as it is sometimes known', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[slider] OFF
GO

create table courseRegistration(
id int identity(1,1),
course_id int not null,
name nvarchar(max) not null,
email nvarchar(50) not null,
phone nvarchar(max) not null,
[registration_time] [date] NOT NULL,
[total_cost] [float] NOT NULL,
[status] [int] NOT NULL,
constraint primary_key primary key (id),
constraint fk_key foreign key (course_id) references courses(id))
