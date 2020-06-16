--1.1lấy ra danh sách thông tin  sinh viên của 1 lớp chuyên ngành nào đó
	Select count(IDSinhVien) as STT,IDSinhVien as MaSv,HoTen ,NgaySinh,GioiTinh,QueQuan
	from SinhVien where IDLop='TDH16     '
	group by IDSinhVien,HoTen,NgaySinh,GioiTinh,QueQuan
	ORDER BY  HoTen 
	go
	select * from SinhVien
--1.2lấy ra danh sách kết quả sinh viên của 1 lớp học phần nào đó
	Select count(SinhVien.IDSinhVien) as STT,SinhVien.IDSinhVien as 'Mã sinh viêm',HoTen ,TenHocPhan,DiemCC as ChuyenCan ,DiemTX as ThuongXuyen, DiemThi as CuoiKy
	from SinhVien,HocPhan,KetQuaHP where SinhVien.IDSinhVien=KetQuaHP.IDSinhVien and KetQuaHP.IDHocPhan=HocPhan.IDHocPhan and  HocPhan.IDHocPhan='MH01      '
	group by SinhVien.IDSinhVien,HoTen,NgaySinh,TenHocPhan,DiemCC,DiemTX,DiemThi
	ORDER BY  HoTen 
	go
	select * from KetQuaLopHP
--1.3Lấy ra ds kết quả kết quả sinh viên trong 1 lớp chuyên ngành(Điện tử viễn thông 16),khoa nào dó()
	Select count(SinhVien.IDSinhVien) as STT,SinhVien.IDSinhVien as MaSv,HoTen ,TenLop,TenKhoa ,DiemTBC as DiemTrungBinhChung, SoTCDKi as SoTinChiDangKy,SoTCNo as SoTinChiNo,XepLoai
	from SinhVien,Khoa,Lop,TongKetKy
	 where SinhVien.IDSinhVien=TongKetKy.IDSinhVien and SinhVien.IDLop=Lop.IDLop and Lop.IDKhoa=Khoa.IDKhoa and  Lop.TenLop=N'Điện tử viễn thông 16'
	group by SinhVien.IDSinhVien,HoTen,TenLop,TenKhoa,DiemTBC,SoTCDKi,SoTCNo,XepLoai
	ORDER BY  HoTen 


--2.1.đưa ra top 3 sinh viên có điểm cao nhất của lớp học phần thực thực tập cơ sở dữ liệu
	--b1.Tạo view hiện thị danh sách kết quả của của các lớp học phần
		go
		CREATE VIEW DanhSachSinhVienCoDiemCaoNhatTrongLopHocPhan AS
		select SinhVien.HoTen,SinhVien.IDSinhVien ,TenHocPhan  ,KetQuaLopHP.DiemHe10
		from SinhVien,LopHP,KetQuaLopHP,HocPhan
		where SinhVien.IDSinhVien=KetQuaLopHP.IDSinhVien and LopHP.IDLopHP=KetQuaLopHP.IDLopHP and HocPhan.IDHocPhan=LopHP.IDHocPhan
		group by  SinhVien.HoTen,SinhVien.IDSinhVien,KetQuaLopHP.DiemHe10,TenHocPhan
		go
	--b2.Lấy ra 3 sinh viên điểm cao nhất
		go
		select top(3) HoTen as 'Họ và tên',IDSinhVien as 'Mã sinh viên',DiemHe10 as 'Điểm hệ số 10'
		from DanhSachSinhVienCoDiemCaoNhatTrongLopHocPhan
		where TenHocPhan = N'Cơ sở dữ liệu'
		go
--2.2(view) .đưa ra top 3 sinh viên có điểm cao nhất của lớp chuyên ngành cntt
	--b1.Tạo view hiện thị danh sách kết quả của các lớp học chuyên ngành
		go
		CREATE VIEW DanhSachSinhVienCoDiemCaoNhatTrongLopChuyenNganh AS
		select SinhVien.HoTen ,SinhVien.IDSinhVien,TenLop  ,DiemTBC,SoTCDKi,SoTCNo
		from SinhVien,TongKetKy,Lop
		where SinhVien.IDSinhVien=TongKetKy.IDSinhVien  and Lop.IDLop=SinhVien.IDLop
		group by  SinhVien.HoTen,SinhVien.IDSinhVien,TenLop  ,DiemTBC,SoTCDKi,SoTCNo
		 
		go
	--b2.Lấy ra 3 sinh viên điểm cao nhất
		go
		print(N'danh sách 3 sinh vien của lớp CNTT')
		select top(3)HoTen as 'Họ và tên',IDSinhVien as 'Mã sinh viên',DiemTBC as 'Điểm trung bình trung',SoTCDKi as 'Số tín chỉ đăng ký',SoTCNo as 'Số tín chỉ nợ'
		from DanhSachSinhVienCoDiemCaoNhatTrongLopChuyenNganh
		where TenLop =N'CNTT16B'
		go
--2.3(view) .đưa ra top 3 sinh viên có điểm cao nhất của 1 khoa CNTT
	--b1.Tạo view hiện thị danh sách kết quả của các khoa
		go
		CREATE VIEW DanhSachSinhVienCoDiemCaoNhatTrongKhoa AS
		select SinhVien.HoTen ,SinhVien.IDSinhVien,TenKhoa ,DiemTBC,SoTCDKi,SoTCNo
		from SinhVien,TongKetKy,Khoa,Lop
		where SinhVien.IDSinhVien=TongKetKy.IDSinhVien  and Khoa.IDKhoa=Lop.IDKhoa and SinhVien.IDSinhVien=Lop.IDLop
		group by  SinhVien.HoTen,SinhVien.IDSinhVien,TenKhoa  ,DiemTBC,SoTCDKi,SoTCNo
		 
		go
	--b2.Lấy ra 3 sinh viên điểm cao nhất
		go
		print(N'danh sách 3 sinh vien của lớp CNTT')
		select top(3)HoTen as 'Họ và tên',IDSinhVien as 'Mã sinh viên',DiemTBC as 'Điểm trung bình trung',SoTCDKi as 'Số tín chỉ đăng ký',SoTCNo as 'Số tín chỉ nợ'
		from DanhSachSinhVienCoDiemCaoNhatTrongKhoa
		 where TenKhoa = N'CNTT'
		go
--3.1 tạo proc lấy ra các sinh viên có chỗ ở hiện tại là @choOHienTai
	--b1:Tạo proc 
		go
		CREATE PROC DanhSachSVC (@idLop char(10),@choOHienTai nvarchar(200))
			AS
			BEGIN
				select 
					SinhVien.IDSinhVien AS 'Mã sinh viên',
					SinhVien.NgaySinh AS 'Ngày sinh',
					SinhVien.KhoaDKi AS 'Khoa',
					Lop.TenLop AS 'Lớp',
					SinhVien.DiaChiHT as 'Chỗ ở hiệm tại'
				from SinhVien, Lop
				where 
				SinhVien.DiaChiHT like (@choOHienTai )
				and SinhVien.IDLop=Lop.IDLop
				and Lop.IDLop like( @idLop)
				end
		go
	--b2:Chạy proc
		exec DanhSachSVC  1 ,N'Cầu Giấy'
		DROP PROCEDURE DanhSachSVC

----3.2. Thủ tục cập nhật điểm trung bình chung (điểm số) của một học phần bất kì
go
--3.2 tao proc lây ra thông tin các học phần sinh vien có @id tham gia
	--b1:Tạo proc 
		go
		CREATE PROC DanhSachCacHocPhanCuaSinhVien (@idSv char(10))
			AS
			BEGIN
				select 
					SinhVien.HoTen as 'Tên sinh viên',
					TenHocPhan as 'Tên học phần',
					KetQuaHP.DiemCC as 'Điểm chuyên cần',
					KetQuaHP.DiemTX as 'Điểm thường xuyên',
					KetQuaHP.DiemThi as 'Điểm thi',
					KetQuaHP.DiemHe10 as'Điểm tổng kết'
				from SinhVien,HocPhan,KetQuaHP
				where SinhVien.IDSinhVien=KetQuaHP.IDSinhVien and KetQuaHP.IDHocPhan=HocPhan.IDHocPhan
				and SinhVien.IDSinhVien=@idSv
				end
		go
	--b2:Chạy proc
		exec DanhSachCacHocPhanCuaSinhVien 3

----3.3. Tạo proc lấy ra các sinh viên có điểm tổng kết cao nhất trường của học kỳ @idHocky
	--b1:Tạo proc
		go
		CREATE PROC ThongTinSinhVienCoDiemCaoNhatTruong (@idHK char(10))
		as
		begin
		select top 1 with ties
		SinhVien.IDSinhVien as 'Mã sinh viên',
		 SinhVien.HoTen as 'Họ tên sinh viên',
		Lop.TenLop as 'Tên lớp',
		SinhVien.KhoaDKi as 'Tên khoa',
		TongKetKy.DiemTBC as 'Điểm tổng kết chung'
		from SinhVien,TongKetKy,HocKy,Lop
		where SinhVien.IDSinhVien=TongKetKy.IDSinhVien and HocKy.IDHocKy=TongKetKy.IDHocKy and SinhVien.IDLop=Lop.IDLop and  HocKy.IDHocKy=@idHK
		order by [Điểm tổng kết chung] DESC
		end
		go
	--b2:Chạy
		exec ThongTinSinhVienCoDiemCaoNhatTruong 1
		go

--4.Trigger
	--tạo view hiển thị tổng sinh viên trong trường,lớp
	go
	create view TongSoSvTrongTruong
	as
		Select COUNT (t.[Tổng sinh viên trong truong]) as 'STT',t.[Tổng sinh viên trong truong]
		from (select count(SinhVien.IDSinhVien) as 'Tổng sinh viên trong truong' from SinhVien) as t
		group by t.[Tổng sinh viên trong truong]
		go
		
	create view TongSoSvTrongLopChuyenNganh
	as	
		Select SinhVien.IDLop as'Mã lớp',TenLop as 'Tên lơp',
		count(SinhVien.IDSinhVien) as 'Tổng sinh viên trong lớp'
		from SinhVien,Lop
		where SinhVien.IDLop=Lop.IDLop
		group by Lop.TenLop,SinhVien.IDLop
		go
--4.1 tạo trigger cập nhật tự động tăng số lượng sv trong trường, trong lớp mỗi khi thêm sinh viên mới vào
	create trigger CapNhatSLSVTang on SinhVien after insert as
		begin
			update TongSoSvTrongTruong
			set [Tổng sinh viên trong truong]= (select count(IDSinhVien)  from inserted where STT=1)
			from TongSoSvTrongTruong
			
			update TongSoSvTrongLopChuyenNganh
			set [Tổng sinh viên trong lớp]=(select count(IDSinhVien)  from inserted where inserted.IDLop=TongSoSvTrongLopChuyenNganh.[Mã lớp])
			from TongSoSvTrongLopChuyenNganh
			join inserted on TongSoSvTrongLopChuyenNganh.[Mã lớp]=inserted.IDLop
		end
		go
		DROP TRIGGER CapNhatSLSVTang
		go
--4.2tạo trigger cập nhật tự động số lượng sv trong trường và sinh viên 
		create trigger CapNhatSLSVGiam on SinhVien after delete as
		begin
			update TongSoSvTrongTruong
			set [Tổng sinh viên trong truong]= (select count(IDSinhVien)  from deleted where STT=1)
			from TongSoSvTrongTruong
			
			update TongSoSvTrongLopChuyenNganh
			set [Tổng sinh viên trong lớp]=(select count(IDSinhVien)  from deleted where deleted.IDLop=TongSoSvTrongLopChuyenNganh.[Mã lớp])
			from TongSoSvTrongLopChuyenNganh
			join deleted on TongSoSvTrongLopChuyenNganh.[Mã lớp]=deleted.IDLop
		end
		go
		DROP TRIGGER CapNhatSLSVGiam
		go
--4.3tạo trigger cập nhật ghi chú null
	create trigger CapNhatGhiChuNull on SinhVien after insert as
		begin
			update SinhVien
			set GhiChu=N'không có gì'
			from SinhVien
			where GhiChu is null
		end
		go
		DROP TRIGGER CapNhatGhiChuNull
--5.Biểu mẫu đưa ra thông tin sinh viên

-----------------------------------
go
drop proc bieumau_ds_sv_toan_truong
go
alter proc bieumau_ds_sv_toan_truong
as
begin
	Declare
		@STT char(5), 
		@masv char(5), 
		@hoten nvarchar(20), 
		@ngaysinh date,
		@GioiTinh nvarchar(5),
		@QueQuan nvarchar(30), 
		@DiaChiHienTai nvarchar(30),
		@Khoa nvarchar(20), 
		@TenLop nvarchar(40),
		@GhiChu nvarchar(30),
		@DAY nvarchar(2),
		@YEAR nvarchar(4),
		@MONTH nvarchar(2)

	SET @DAY = (select DAY(GETDATE()))
	SET @YEAR = (SELECT YEAR(GETDATE()))
	SET @MONTH = ( Select MONTH(GETDATE()))
	DECLARE cur_sor CURSOR GLOBAL FOR
	select
			SinhVien.IDSinhVien, 
			SinhVien.HoTen,
			SinhVien.NgaySinh,
			SinhVien.GioiTinh,
			SinhVien.QueQuan,
			SinhVien.DiaChiHT,
			SinhVien.KhoaDKi,
			Lop.TenLop,
			SinhVien.GhiChu
	from SinhVien, Lop
	where SinhVien.IDLop= Lop.IDLop 
	and HoTen is not null
	and IDSinhVien is not null
	OPEN cur_sor     --mở con trỏ
	print N' Học Viện Kỹ Thuật Quân Sự													        '
	print N' Phòng Đào Tạo																	    ' 
	PRINT N''
	print N'								       DANH SÁCH SINH VIÊN TOAN TRUONG' 
	FETCH NEXT FROM cur_sor     -- Đọc dòng đầu tiên
	INTO  @masv,@hoten, @ngaysinh, @GioiTinh, @QueQuan, @DiaChiHienTai, @Khoa, @TenLop, @GhiChu
	PRINT N''
	PRINT N' ___________________________________________________________________________________________________________________________________________________________________________________'
	print N'| STT |Mã SV|       Họ Tên       |     Ngày Sinh      | Giới tính |      Quê quán      |  Địa chỉ hiện tại  |        Khoa        |               Lớp            |      Ghi chú      |'
	PRINT N' -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

	set @STT=1
	WHILE (@@FETCH_STATUS = 0 )         
	BEGIN
		--in kết quả
	--PRINT N'________________________________________________________________________________________________________________________________________________________________________________________________________________'
			PRINT '|'+  CAST(@STT as nchar(5)) + '|' + CAST(@masv as nchar(5))+ '|' +cast(@hoten as nchar(20))+'|' +(cast(@ngaysinh as nchar(20))) + '|' + cast(@GioiTinh as nchar(11)) + '|' + cast(@QueQuan as nchar(20)) + '|' + cast(@DiaChiHienTai as nchar(20)) + '|'+ cast(@Khoa as nchar(20))+ '|'+ cast(@TenLop as nchar(30))+ '|'+cast(@GhiChu as nchar(20))+ '|'
			if @@FETCH_STATUS <> 0 
				break
			set @STT=@STT+1
			FETCH NEXT FROM cur_sor -- Đọc dòng tiếp
				  INTO @masv,@hoten, @ngaysinh, @GioiTinh, @QueQuan, @DiaChiHienTai, @Khoa, @TenLop, @GhiChu
		END	
	PRINT N' ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
	print N'                                                                                                                  Hà Nội, Ngày ' + @DAY + N' tháng ' + @MONTH + N' năm ' + @YEAR
	print N'                                                                                                                                NGƯỜI LẬP BIỂU MẪU'
	PRINT N'                                                                                                                              (ký và ghi rõ họ tên)'
	PRINT N''
	PRINT N''
	PRINT N''
	PRINT N'                                                                                                                               Nguyễn Quang Linh'
		CLOSE cur_sor              -- Đóng Cursor
		DEALLOCATE cur_sor			-- giải phóng tài nguyên
end 
	go
--in ra biểu mẫu
exec bieumau_ds_sv_toan_truong 
