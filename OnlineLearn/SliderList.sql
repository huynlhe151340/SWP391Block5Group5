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

alter table registration drop constraint FK_registration_accounts

ALTER TABLE registration DROP COLUMN account_id

ALTER TABLE registration DROP COLUMN valid_from

ALTER TABLE registration DROP COLUMN valid_to

ALTER TABLE registration
ADD name nvarchar(max) not null

ALTER TABLE registration
ADD email nvarchar(50) not null

ALTER TABLE registration
ADD phone nvarchar(max) not null

drop table courseRegistration

