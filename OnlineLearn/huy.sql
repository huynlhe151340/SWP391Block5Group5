insert into accountDetail values
(N'Admin', N'034154832114', N'Hà Nội', 0),
(N'Nguyễn Lê Huy',N'0342681254',N'Hà Nội',0),
(N'Trần Quang Khải',N'01359845685',N'Hà Nội',0),
(N'Trần Đức Tâm',N'015648752564',N'Hà Nội',0),
(N'Phùng Đặng Long Vũ',N'06566261852',N'Hà Nội',0)

--DBCC CHECKIDENT ('[accountDetail]', RESEED,0)
--DBCC CHECKIDENT ('[accountDetail]', RESEED)

insert into role values 
('admin',1),
('customer',2)
 ALTER TABLE [accountDetail] ALTER COLUMN [mobile] [nvarchar](max) NULL
 ALTER TABLE [accountDetail] ALTER COLUMN [address] [nvarchar](max) NULL
 ALTER TABLE [accountDetail] ALTER COLUMN [gender] [bit] NULL


 ALTER TABLE [accounts] ALTER COLUMN [active_code] [nvarchar](50) NULL
 ALTER TABLE [accounts] ALTER COLUMN [password] NVARCHAR(250) NOT NULL; 

 --email: mật khẩu
 --admin: admin
 --huynlhe151340@fpt.edu.vn: huy
 --khaitqhe141672@fpt.edu.vn: khai
 --tamtdse05915@fpt.edu.vn: tam
 --vupdlhe141310@fpt.edu.vn: vu
 insert into accounts(email, password, account_detailID, role_id, create_date, status) values
 (N'admin', N'admin',1,1,GETDATE(),1),
 (N'huynlhe151340@fpt.edu.vn', N'huy',2,2,GETDATE(),1),
 (N'khaitqhe141672@fpt.edu.vn', N'khai',3,2,GETDATE(),1),
 (N'tamtdse05915@fpt.edu.vn', N'tam',4,2,GETDATE(),1),
 (N'vupdlhe141310@fpt.edu.vn', N'vu',5,2,GETDATE(),1)

 select *
 from post
 where status = 1

 select count(*) as 'numberOfPost' from post where status = 1

 SELECT * FROm
 (SELECT ROW_NUMBER() OVER (ORDER BY id) AS rownum, *
 FROM post
 where status = 1) tbl
WHERE  rownum BETWEEN 1 AND 6 







