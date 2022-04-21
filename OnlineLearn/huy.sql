insert into accountDetail values
(N'Admin', N'Vertu', N'Hà Nội', 0),
(N'Nguyễn Lê Huy',N'Iphone',N'Hà Nội',0),
(N'Trần Quang Khải',N'Iphone 12',N'Hà Nội',0),
(N'Trần Đức Tâm',N'Samsung',N'Hà Nội',0),
(N'Phùng Đặng Long Vũ',N'Oppo',N'Hà Nội',0)

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
 (N'admin', N'$2a$12$LY3hQ0z7ca4sKVSsR8ml3uw8uvKbkkrG1gw4llk3.TlfRr0KiiGqa',1,1,GETDATE(),1),
 (N'huynlhe151340@fpt.edu.vn', N'$2a$12$Llx4007aRvkx1E199LAT8.bl4G4AoNNf1oFRjWKoNXbUA/.T//I/e',2,2,GETDATE(),1),
 (N'khaitqhe141672@fpt.edu.vn', N'$2a$12$tvhD6NUnFTYvML0caSiC8.fIhdw/vlsfMocBuJhM86ace03N8npVi',3,2,GETDATE(),1),
 (N'tamtdse05915@fpt.edu.vn', N'$2a$12$l3FUdGLxpD5LMsRTeuX4fesT0XZDHXeovOn92.djXpSKv5.nvACH.',4,2,GETDATE(),1),
 (N'vupdlhe141310@fpt.edu.vn', N'$2a$12$B1nuTnbXI3YKv2IW.RBYJOIq24mhyFIDkTU0XW3/I7WtaQ4UdxoIq',5,2,GETDATE(),1)









