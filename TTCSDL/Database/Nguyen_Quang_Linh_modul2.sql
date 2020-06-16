--1.Nhập các bảng danh mục (mỗi table 5 bản ghi) 
--1.1.Thêm dữ liệu vào bảng Học kỳ,gia trị tương ứng là mã học kỳ, thời gian bắt đầu, thời gian kết thúc
INSERT into HocKy ( IDHocKy, ThoiGianBatDau, ThoiGianKetThuc)
values
('6','20100813','20101224'),
('7','20090115','20090511'),
('8','20080813','20081224'),
('9','20070115','20070511'),
('10','20060813','20061224')
GO
select * from HocKy


--1.2.Thêm dữ liệu vào bảng khoa , giá trị tương ứng là mã khoa và tên khoa
INSERT Khoa (IDKhoa, TenKhoa) 
VALUES (N'CK', N'Cơ khí'),
(N'CĐ', N'Cầu đường'),
(N'XD', N'Xây dựng'),
(N'KT', N'Kinh tế'),
(N'KD', N'Kinh doanh')
GO
select * from Khoa


--1.3.Thêm dữ liệu vào bảng giảng viên, giá trị tương ứng là mã gv, tên gv và mã khoa
INSERT GiangVien ([IDGV], [TenGV], [IDKhoa]) 
VALUES 
(N'GV07', N'Hoàng Trung Thông', N'XD'),
(N'GV08', N'Ngô Thị Linh', N'XD'),
(N'GV09', N'Hoàng Thái Bảo', N'KT'),
(N'GV10', N'Chu Tiến Anh', N'KD'),
(N'GV06', N'Phan Văn Đạt', N'CK')

GO
select * from GiangVien


--1.4.Thêm dữ liệu vào bảng Lớp, giá trị tương ứng là mã lớp, tên lớp, sĩ số, niên khóa, mã khoa
INSERT Lop (IDLop, TenLop, SiSo, NienKhoa, IDKhoa) 
VALUES 
(N'CĐ15', N'Cầu đường 15', NULL, N'2016-2021', N'CĐ'),
(N'XD15', N'Xây dựng 15', NULL, N'2016-2021', N'XD'),
(N'KD16', N'Kinh doanh 16', NULL, N'2017-2022', N'KD'),
(N'KT', N'Kinh tế 16', NULL, N'2017-2022', N'KT'),
(N'CK16', N'Cơ khí', NULL, N'2016-2021', N'CK')
GO
select * from Lop


--1.5.Thêm dữ liệu vào bảng Sinh viên, giá trị tương ứng là mã sinh viên, họ tên, ngày sinh, giới tính, quê, địa chỉ,
-- khoa đkí, số tín chỉ đã đạt, số tc đã đki, điểm tích lũy, mã lớp
INSERT SinhVien (IDSinhVien, HoTen, NgaySinh, GioiTinh, QueQuan, DiaChiHT, KhoaDKi,  IDLop) 
VALUES
(N'17150140', N'Mai Kim Anh', CAST(N'1997-01-29' AS Date), N'Nữ', N'Nam Định', N'KTX Mỹ Đình', N'CDT',  NULL),
(N'17150141', N'Lê Thu Thi Hương', CAST(N'1997-12-12' AS Date), N'Nữ', N'Phú Thọ', N'Trần Cung', N'CNTT',  NULL),
(N'17150142', N'Ngô Quốc Phong', CAST(N'1997-07-01' AS Date), N'Nam', N'Yên Bái', N'Trần Cung', N'DTVT',  NULL),
(N'17150143', N'Liên Doãn Bình', CAST(N'1997-04-02' AS Date), N'Nam', N'Nam Định', N'Trần Cung', N'KHMT',  NULL),
(N'17150144', N'Nguyễn Thị Hương Giang', CAST(N'1997-07-01' AS Date), N'Nữ', N'Văn Chấn', N'KTX Mỹ Đình', N'DKTDH',  NULL)
GO
select * from sinhvien


--1.6.Thêm dữ liệu vào bảng Học phần, giá trị tương ứng là mã môn học, tên môn học, số tiết, số tín chỉ, hình thức thi
INSERT HocPhan (IDHocPhan, TenHocPhan, SoTiet, SoTC, HinhThucThi) 
VALUES 
(N'MH06', N'Hiểu biết quân binh chủng', 70, 3, N'Viết'),
(N'MH07', N'Hình họa và BTL', 66, 3, N'Vấn Ðáp'),
(N'MH08', N'Vẽ kỹ thuật & BTL', 80, 3, N'Vấn Đáp'),
(N'MH09', N'Thị trường kinh doanh', 80, 4, N'Viết'),
(N'MH010', N'Cấu trúc cơ mạch', 80, 4, N'Viết')
GO
SELECT * FROM HocPhan


--1.7.Thêm dữ liệu vào bảng Lớp học phần, giá trị tương ứng là mã lớp hp, phòng học,số sv,ngày thi, mã hp, mã gv, mã hk
INSERT LopHP (IDLopHP, PhongHoc, NgayThi, TongSoSV, IDHocPhan, IDHocKy, IDGV) 
VALUES 
(N'LHP06', N'H5401', '20191224', NULL, N'MH06', N'1', N'GV06'),
(N'LHP07', N'H5501', '20191224', NULL, N'MH07', N'2', N'GV07'),
(N'LHP08', N'H5502', '20191224', NULL, N'MH08', N'3', N'GV08'),
(N'LHP09', N'H5411', '20191224', NULL, N'MH09', N'4', N'GV09'),
(N'LHP010', N'H9201', '20191224', NULL, N'MH010', N'5', N'GV10')
GO
SELECT * FROM LopHP


--1.8. Thêm dữ liệu vào bảo kết quả lớp học phần, giá trị tương ứng là mã sinh viên, mã lớp học phần, điểm chuyên cần
-- điểm thường xuyên, điểm thi, điểm hệ 10, điểm hệ 4, điểm chữ
INSERT KetQuaLopHP (IDSinhVien, IDLopHP, DiemCC, DiemTX, DiemThi, DiemHe10, DiemHe4, DiemChu) 
VALUES 
(N'17150140', N'LHP06', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150141', N'LHP07', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150142', N'LHP08', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150143', N'LHP09', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150144', N'LHP010', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SELECT * FROM KetQuaLopHP


--1.9. Thêm dữ liệu vào Tổng kết kỳ, giá trị tương ứng là mã sinh viên, mã học kỳ, 
--điểm tb chung, số tín chỉ đăng ký, số tc nợ, xếp loại
INSERT TongKetKy (IDSinhVien, IDHocKy, DiemTBC, SoTCDKi, SoTCNo, XepLoai) 
VALUES 
(N'17150140', N'1', NULL, NULL, NULL, NULL),
(N'17150141', N'2', NULL, NULL, NULL, NULL),
(N'17150142', N'3', NULL, NULL, NULL, NULL),
(N'17150143', N'4', NULL, NULL, NULL, NULL),
(N'17150144', N'5', NULL, NULL, NULL, NULL)
GO
SELECT * FROM TongKetKy


--1.10. Thêm dữ liệu vào bảo kết quả lớp học phần, giá trị tương ứng là mã sinh viên, mã lớp học phần, điểm chuyên cần
-- điểm thường xuyên, điểm thi, điểm hệ 10, điểm hệ 4, điểm chữ
INSERT KetQuaHP (IDSinhVien, IDHocPhan, DiemCC, DiemTX, DiemThi, DiemHe10, DiemHe4, DiemChu) 
VALUES 
(N'17150140', N'MH06', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150141', N'MH07', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150142', N'MH08', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150143', N'MH09', NULL, NULL, NULL, NULL, NULL, NULL),
(N'17150144', N'MH010', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SELECT * FROM KetQuaHP

--2.Nhập theo quy trình nghiệp vụ (3 bản ghi)
--2.1 Thêm dữ liệu vào bảng sinh viên
INSERT SinhVien (IDSinhVien, HoTen, NgaySinh, GioiTinh, QueQuan, DiaChiHT, KhoaDKi,  IDLop) 
VALUES
(N'17150145', N'Nguyễn Đức Mạnh', CAST(N'1999-01-29' AS Date), N'Nam', N'Nam Định', N'KTX Mỹ Đình', N'CDT',  NULL),
(N'17150146', N'Vũ Thị Hường', CAST(N'1999-12-12' AS Date), N'Nữ', N'Phú Thọ', N'Trần Cung', N'CNTT',  NULL),
(N'17150147', N'Nguyễn Thị Ngân', CAST(N'1999-07-01' AS Date), N'Nữ', N'Yên Bái', N'Trần Cung', N'DTVT',  NULL),
(N'17150148', N'Mai Kim Tuyến', CAST(N'1999-04-02' AS Date), N'Nữ', N'Nam Định', N'Trần Cung', N'KHMT',  NULL),
(N'17150149', N'Nguyễn Văn Duy', CAST(N'1999-07-01' AS Date), N'Nam', N'Văn Chấn', N'KTX Mỹ Đình', N'DKTDH',  NULL)
GO
select * from sinhvien
--2.2 Thêm dữ liệu vào bảng sinh lớp(chuyên ngành)
INSERT Lop (IDLop, TenLop, SiSo, NienKhoa, IDKhoa) 
VALUES 
(N'CĐ16', N'Cầu đường 16', NULL, N'2017-2022', N'CĐ'),
(N'XD16', N'Xây dựng 16', NULL, N'2017-2022', N'XD'),
(N'KD17', N'Kinh doanh 17', NULL, N'2018-2023', N'KD'),
(N'KT18', N'Kinh tế 18', NULL, N'2018-2023', N'KT'),
(N'CK18', N'Cơ khí 18', NULL, N'2018-2023', N'CK')
GO
select * from Lop
--2.3 Thêm dữ liệu vào bảng sinh lớp(học phần)
INSERT LopHP (IDLopHP, PhongHoc, NgayThi, TongSoSV, IDHocPhan, IDHocKy, IDGV) 
VALUES 
(N'LHP006', N'H1401', '20191224', NULL, N'MH06', N'1', N'GV06'),
(N'LHP007', N'H1501', '20191224', NULL, N'MH07', N'2', N'GV07'),
(N'LHP008', N'H1502', '20191224', NULL, N'MH08', N'3', N'GV08'),
(N'LHP009', N'H1411', '20191224', NULL, N'MH09', N'4', N'GV09'),
(N'LHP0010', N'H1201', '20191224', NULL, N'MH010', N'5', N'GV10')
GO
select * from LopHP
--3.4cập nhật sinh ghi chú cho tất cả sinh viên
begin
update SinhVien set GhiChu = N'Không có gì' where GhiChu is null
end
go
select * from sinhvien
--2.5 Thêm cột số tc đã đạt
ALTER table SinhVien add SoTCDaDat int
--2.6 Thêm cột số tc đã đky 
ALTER table SinhVien add SoTCDaDKi int
--2.7 Thêm cột số tín chỉ tích lũy
ALTER table SinhVien add SoTCTichLuy int