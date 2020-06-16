USE [S4_N10_QLDiemSV]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiangVien](
	[IDGV] [char](10) NOT NULL,
	[TenGV] [nvarchar](50) NULL,
	[IDKhoa] [char](10) NULL,
 CONSTRAINT [IDGV_pk] PRIMARY KEY CLUSTERED 
(
	[IDGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HeDT]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeDT](
	[MaHeDT] [char](10) NOT NULL,
	[TenHeDT] [nvarchar](50) NULL,
 CONSTRAINT [PK_HeDT] PRIMARY KEY CLUSTERED 
(
	[MaHeDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocKy](
	[IDHocKy] [char](10) NOT NULL,
	[ThoiGianBatDau] [date] NULL,
	[ThoiGianKetThuc] [date] NULL,
 CONSTRAINT [IDHocKy_pk] PRIMARY KEY CLUSTERED 
(
	[IDHocKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocPhan]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocPhan](
	[IDHocPhan] [char](10) NOT NULL,
	[TenHocPhan] [nvarchar](100) NULL,
	[SoTiet] [float] NULL,
	[SoTC] [int] NULL,
	[HinhThucThi] [nvarchar](50) NULL,
 CONSTRAINT [IDMonHoc_pk] PRIMARY KEY CLUSTERED 
(
	[IDHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQuaHP]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQuaHP](
	[IDSinhVien] [char](10) NOT NULL,
	[IDHocPhan] [char](10) NOT NULL,
	[DiemCC] [float] NULL,
	[DiemTX] [float] NULL,
	[DiemThi] [float] NULL,
	[DiemHe10] [float] NULL,
	[DiemHe4] [float] NULL,
	[DiemChu] [char](10) NULL,
 CONSTRAINT [IDSinhVien_IDHocPhan_pk] PRIMARY KEY CLUSTERED 
(
	[IDHocPhan] ASC,
	[IDSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQuaLopHP]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQuaLopHP](
	[IDSinhVien] [char](10) NOT NULL,
	[IDLopHP] [char](10) NOT NULL,
	[DiemCC] [float] NULL,
	[DiemTX] [float] NULL,
	[DiemThi] [float] NULL,
	[DiemHe10] [float] NULL,
	[DiemHe4] [float] NULL,
	[DiemChu] [char](10) NULL,
 CONSTRAINT [IDSinhVien_IDLopHP_pk] PRIMARY KEY CLUSTERED 
(
	[IDLopHP] ASC,
	[IDSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoa](
	[IDKhoa] [char](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
 CONSTRAINT [IDKhoa_pk] PRIMARY KEY CLUSTERED 
(
	[IDKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[IDLop] [char](10) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
	[SiSo] [int] NULL,
	[NienKhoa] [varchar](50) NULL,
	[IDKhoa] [char](10) NULL,
 CONSTRAINT [IDLop_pk] PRIMARY KEY CLUSTERED 
(
	[IDLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LopHP]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LopHP](
	[IDLopHP] [char](10) NOT NULL,
	[PhongHoc] [nvarchar](50) NULL,
	[NgayThi] [date] NULL,
	[TongSoSV] [int] NULL,
	[IDHocPhan] [char](10) NULL,
	[IDHocKy] [char](10) NULL,
	[MaHeDT] [char](10) NULL,
	[IDGV] [char](10) NULL,
 CONSTRAINT [IDLopHP_pk] PRIMARY KEY CLUSTERED 
(
	[IDLopHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[IDSinhVien] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[QueQuan] [nvarchar](200) NULL,
	[DiaChiHT] [nvarchar](200) NULL,
	[KhoaDKi] [nvarchar](200) NULL,
	[IDLop] [char](10) NULL,
	[GhiChu] [nvarchar](200) NULL,
	[SoTCDaDat] [int] NULL,
	[SoTCDaDKi] [int] NULL,
	[SoTCTichLuy] [int] NULL,
 CONSTRAINT [IDSinhVien_pk] PRIMARY KEY CLUSTERED 
(
	[IDSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TongKetKy]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TongKetKy](
	[IDSinhVien] [char](10) NOT NULL,
	[IDHocKy] [char](10) NOT NULL,
	[DiemTBC] [float] NULL,
	[SoTCDKi] [int] NULL,
	[SoTCNo] [int] NULL,
	[XepLoai] [nvarchar](50) NULL,
 CONSTRAINT [IDSinhVien_IDHocKy_pk] PRIMARY KEY CLUSTERED 
(
	[IDHocKy] ASC,
	[IDSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[DanhSachSinhVienCoDiemCaoNhatTrongKhoa]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE VIEW [dbo].[DanhSachSinhVienCoDiemCaoNhatTrongKhoa] AS
		select SinhVien.HoTen ,SinhVien.IDSinhVien,TenKhoa ,DiemTBC,SoTCDKi,SoTCNo
		from SinhVien,TongKetKy,Khoa,Lop
		where SinhVien.IDSinhVien=TongKetKy.IDSinhVien  and Khoa.IDKhoa=Lop.IDKhoa and SinhVien.IDSinhVien=Lop.IDLop
		group by  SinhVien.HoTen,SinhVien.IDSinhVien,TenKhoa  ,DiemTBC,SoTCDKi,SoTCNo
		 

GO
/****** Object:  View [dbo].[DanhSachSinhVienCoDiemCaoNhatTrongLopChuyenNganh]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DanhSachSinhVienCoDiemCaoNhatTrongLopChuyenNganh] AS
		select SinhVien.HoTen ,SinhVien.IDSinhVien,TenLop  ,DiemTBC,SoTCDKi,SoTCNo
		from SinhVien,TongKetKy,Lop
		where SinhVien.IDSinhVien=TongKetKy.IDSinhVien  and Lop.IDLop=SinhVien.IDLop
		group by  SinhVien.HoTen,SinhVien.IDSinhVien,TenLop  ,DiemTBC,SoTCDKi,SoTCNo
		 
GO
/****** Object:  View [dbo].[DanhSachSinhVienCoDiemCaoNhatTrongLopHocPhan]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DanhSachSinhVienCoDiemCaoNhatTrongLopHocPhan] AS
		select SinhVien.HoTen,SinhVien.IDSinhVien ,TenHocPhan  ,KetQuaLopHP.DiemHe10
		from SinhVien,LopHP,KetQuaLopHP,HocPhan
		where SinhVien.IDSinhVien=KetQuaLopHP.IDSinhVien and LopHP.IDLopHP=KetQuaLopHP.IDLopHP and HocPhan.IDHocPhan=LopHP.IDHocPhan
		group by  SinhVien.HoTen,SinhVien.IDSinhVien,KetQuaLopHP.DiemHe10,TenHocPhan

GO
/****** Object:  View [dbo].[TongSoSvTrongLopChuyenNganh]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		
	create view [dbo].[TongSoSvTrongLopChuyenNganh]
	as	
		Select SinhVien.IDLop as'Mã lớp',TenLop as 'Tên lơp',
		count(SinhVien.IDSinhVien) as 'Tổng sinh viên trong lớp'
		from SinhVien,Lop
		where SinhVien.IDLop=Lop.IDLop
		group by Lop.TenLop,SinhVien.IDLop

GO
/****** Object:  View [dbo].[TongSoSvTrongTruong]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create view [dbo].[TongSoSvTrongTruong]
	as
		Select COUNT (t.[Tổng sinh viên trong truong]) as 'STT',t.[Tổng sinh viên trong truong]
		from (select count(SinhVien.IDSinhVien) as 'Tổng sinh viên trong truong' from SinhVien) as t
		group by t.[Tổng sinh viên trong truong]

GO
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV01      ', N'Hoàng Anh', N'CNTT      ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV02      ', N'Khuất Văn Thành', N'CNTT      ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV03      ', N'Lưu Hồng Dũng', N'CNTT      ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV04      ', N'Chu Thị Hường', N'CDT       ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV05      ', N'Hoàng Đức Dũng', N'KHMT      ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV06      ', N'Phan Văn Đạt', N'CK        ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV07      ', N'Hoàng Trung Thông', N'CÐ        ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV08      ', N'Ngô Thị Linh', N'XD        ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV09      ', N'Hoàng Thái Bảo', N'KT        ')
INSERT [dbo].[GiangVien] ([IDGV], [TenGV], [IDKhoa]) VALUES (N'GV10      ', N'Chu Tiến Anh', N'KD        ')
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'1         ', CAST(N'2019-08-13' AS Date), CAST(N'2019-12-24' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'10        ', CAST(N'2006-08-13' AS Date), CAST(N'2006-12-24' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'2         ', CAST(N'2020-01-15' AS Date), CAST(N'2020-05-11' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'3         ', CAST(N'2020-08-13' AS Date), CAST(N'2020-12-24' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'4         ', CAST(N'2021-01-15' AS Date), CAST(N'2021-05-11' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'5         ', CAST(N'2021-08-13' AS Date), CAST(N'2021-12-24' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'6         ', CAST(N'2010-08-13' AS Date), CAST(N'2010-12-24' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'7         ', CAST(N'2009-01-15' AS Date), CAST(N'2009-05-11' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'8         ', CAST(N'2008-08-13' AS Date), CAST(N'2008-12-24' AS Date))
INSERT [dbo].[HocKy] ([IDHocKy], [ThoiGianBatDau], [ThoiGianKetThuc]) VALUES (N'9         ', CAST(N'2007-01-15' AS Date), CAST(N'2007-05-11' AS Date))
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH01      ', N'Toán Rời Rạc', 70, 3, N'Viết')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH010     ', N'Cấu trúc cơ mạch', 80, 4, N'Viết')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH02      ', N'Thực Tập Nhóm', 66, 3, N'Vấn Ðáp')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH03      ', N'Dung sai & BTL', 80, 3, N'Vấn Đáp')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH04      ', N'Giải Tích 2', 80, 4, N'Viết')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH05      ', N'Vật Lý Đại Cương 1', 80, 4, N'Viết')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH06      ', N'Hiểu biết quân binh chủng', 70, 3, N'Viết')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH07      ', N'Hình họa và BTL', 66, 3, N'Vấn Ðáp')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH08      ', N'Vẽ kỹ thuật & BTL', 80, 3, N'Vấn Đáp')
INSERT [dbo].[HocPhan] ([IDHocPhan], [TenHocPhan], [SoTiet], [SoTC], [HinhThucThi]) VALUES (N'MH09      ', N'Thị trường kinh doanh', 80, 4, N'Viết')
INSERT [dbo].[KetQuaHP] ([IDSinhVien], [IDHocPhan], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150144  ', N'MH010     ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaHP] ([IDSinhVien], [IDHocPhan], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'16150131  ', N'MH05      ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaHP] ([IDSinhVien], [IDHocPhan], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150140  ', N'MH06      ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaHP] ([IDSinhVien], [IDHocPhan], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150141  ', N'MH07      ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaHP] ([IDSinhVien], [IDHocPhan], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150142  ', N'MH08      ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaHP] ([IDSinhVien], [IDHocPhan], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150143  ', N'MH09      ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaLopHP] ([IDSinhVien], [IDLopHP], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150144  ', N'LHP010    ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaLopHP] ([IDSinhVien], [IDLopHP], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'16150131  ', N'LHP05     ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaLopHP] ([IDSinhVien], [IDLopHP], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150140  ', N'LHP06     ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaLopHP] ([IDSinhVien], [IDLopHP], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150141  ', N'LHP07     ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaLopHP] ([IDSinhVien], [IDLopHP], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150142  ', N'LHP08     ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KetQuaLopHP] ([IDSinhVien], [IDLopHP], [DiemCC], [DiemTX], [DiemThi], [DiemHe10], [DiemHe4], [DiemChu]) VALUES (N'17150143  ', N'LHP09     ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'CDT       ', N'Kỹ thuật cơ điện tử')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'CK        ', N'Cơ khí')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'CNTT      ', N'Công nghệ thông tin')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'CÐ        ', N'Cầu đường')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'DKTDH     ', N'Kỹ thuật điều khiển và tự động hóa')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'DTVT      ', N'Kỹ thuật điện tử - viễn thông')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'KD        ', N'Kinh doanh')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'KHMT      ', N'Khoa học máy tính')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'KT        ', N'Kinh tế')
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa]) VALUES (N'XD        ', N'Xây dựng')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'CDT15     ', N'Cơ điện tử 15', 2, N'2016-2021', N'CDT       ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'CK16      ', N'Cơ khí', 2, N'2016-2021', N'CK        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'CK18      ', N'Cơ khí 18', 2, N'2018-2023', N'CK        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'CNTT15    ', N'Công nghệ thông tin 15', 2, N'2016-2021', N'CNTT      ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'CÐ15      ', N'Cầu đường 15', 2, N'2016-2021', N'CÐ        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'CÐ16      ', N'Cầu đường 16', 0, N'2017-2022', N'CÐ        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'DTVT16    ', N'Điện tử viễn thông 16', 2, N'2017-2022', N'DTVT      ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'KD16      ', N'Kinh doanh 16', 2, N'2017-2022', N'KD        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'KD17      ', N'Kinh doanh 17', 2, N'2018-2023', N'KD        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'KHMT16    ', N'Khoa học máy tính 16', 2, N'2017-2022', N'KHMT      ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'KT        ', N'Kinh tế 16', 2, N'2017-2022', N'KT        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'KT18      ', N'Kinh tế 18', 2, N'2018-2023', N'KT        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'TDH16     ', N'Tự động hóa 15', 2, N'2016-2021', N'DKTDH     ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'XD15      ', N'Xây dựng 15', 2, N'2016-2021', N'XD        ')
INSERT [dbo].[Lop] ([IDLop], [TenLop], [SiSo], [NienKhoa], [IDKhoa]) VALUES (N'XD16      ', N'Xây dựng 16', 2, N'2017-2022', N'XD        ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP0010   ', N'H1201', CAST(N'2019-12-24' AS Date), NULL, N'MH010     ', N'5         ', NULL, N'GV10      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP006    ', N'H1401', CAST(N'2019-12-24' AS Date), NULL, N'MH06      ', N'1         ', NULL, N'GV06      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP007    ', N'H1501', CAST(N'2019-12-24' AS Date), NULL, N'MH07      ', N'2         ', NULL, N'GV07      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP008    ', N'H1502', CAST(N'2019-12-24' AS Date), NULL, N'MH08      ', N'3         ', NULL, N'GV08      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP009    ', N'H1411', CAST(N'2019-12-24' AS Date), NULL, N'MH09      ', N'4         ', NULL, N'GV09      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP01     ', N'H9301', CAST(N'2019-12-24' AS Date), NULL, N'MH01      ', N'1         ', NULL, N'GV01      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP010    ', N'H9201', CAST(N'2019-12-24' AS Date), NULL, N'MH010     ', N'5         ', NULL, N'GV10      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP02     ', N'H9501', CAST(N'2019-12-24' AS Date), NULL, N'MH02      ', N'2         ', NULL, N'GV02      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP03     ', N'H9302', CAST(N'2019-12-24' AS Date), NULL, N'MH03      ', N'3         ', NULL, N'GV03      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP04     ', N'H5311', CAST(N'2019-12-24' AS Date), NULL, N'MH04      ', N'4         ', NULL, N'GV04      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP05     ', N'H5211', CAST(N'2019-12-24' AS Date), NULL, N'MH05      ', N'5         ', NULL, N'GV05      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP06     ', N'H5401', CAST(N'2019-12-24' AS Date), NULL, N'MH06      ', N'1         ', NULL, N'GV06      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP07     ', N'H5501', CAST(N'2019-12-24' AS Date), NULL, N'MH07      ', N'2         ', NULL, N'GV07      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP08     ', N'H5502', CAST(N'2019-12-24' AS Date), NULL, N'MH08      ', N'3         ', NULL, N'GV08      ')
INSERT [dbo].[LopHP] ([IDLopHP], [PhongHoc], [NgayThi], [TongSoSV], [IDHocPhan], [IDHocKy], [MaHeDT], [IDGV]) VALUES (N'LHP09     ', N'H5411', CAST(N'2019-12-24' AS Date), NULL, N'MH09      ', N'4         ', NULL, N'GV09      ')
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'16150131  ', N'Hương Giang', CAST(N'1998-01-07' AS Date), N'Nữ', N'Văn Chấn', N'Hà nội', N'DKTDH', N'TDH16     ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150140  ', N'Mai Kim Anh', CAST(N'1997-02-01' AS Date), N'Nữ', N'Nam Định', N'Hà nội', N'CK        ', N'CK16      ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150141  ', N'Lê Thu Thi Hương', CAST(N'1997-12-12' AS Date), N'Nữ', N'Phú Thọ', N'Hà nội', N'CNTT', N'CNTT15    ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150142  ', N'Ngô Quốc Phong', CAST(N'1997-01-07' AS Date), N'Nam', N'Yên Bái', N'Hà nội', N'DTVT', N'DTVT16    ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150143  ', N'Liên Doãn Bình', CAST(N'1997-04-02' AS Date), N'Nam', N'Nam Định', N'Hà nội', N'KHMT', N'KHMT16    ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150144  ', N'Nguyễn Thị Hương Giang', CAST(N'1997-07-01' AS Date), N'Nữ', N'Văn Chấn', N'Hà nội', N'DKTDH', N'TDH16     ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150145  ', N'Nguyễn Đức Mạnh', CAST(N'1999-09-09' AS Date), N'Nam', N'Nam Định', N'Hà nội', N'CDT', N'CDT15     ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150146  ', N'Vũ Thị Hường', CAST(N'1999-12-12' AS Date), N'Nữ', N'Phú Thọ', N'Hà nội', N'CNTT', N'CNTT15    ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[SinhVien] ([IDSinhVien], [HoTen], [NgaySinh], [GioiTinh], [QueQuan], [DiaChiHT], [KhoaDKi], [IDLop], [GhiChu], [SoTCDaDat], [SoTCDaDKi], [SoTCTichLuy]) VALUES (N'17150147  ', N'Nguyễn Thị Ngân', CAST(N'1999-07-01' AS Date), N'Nữ', N'Yên Bái', N'Hà nội', N'DTVT', N'DTVT16    ', N'Không có gì', NULL, NULL, NULL)
INSERT [dbo].[TongKetKy] ([IDSinhVien], [IDHocKy], [DiemTBC], [SoTCDKi], [SoTCNo], [XepLoai]) VALUES (N'17150140  ', N'1         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TongKetKy] ([IDSinhVien], [IDHocKy], [DiemTBC], [SoTCDKi], [SoTCNo], [XepLoai]) VALUES (N'17150141  ', N'2         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TongKetKy] ([IDSinhVien], [IDHocKy], [DiemTBC], [SoTCDKi], [SoTCNo], [XepLoai]) VALUES (N'17150142  ', N'3         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TongKetKy] ([IDSinhVien], [IDHocKy], [DiemTBC], [SoTCDKi], [SoTCNo], [XepLoai]) VALUES (N'17150143  ', N'4         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TongKetKy] ([IDSinhVien], [IDHocKy], [DiemTBC], [SoTCDKi], [SoTCNo], [XepLoai]) VALUES (N'16150131  ', N'5         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TongKetKy] ([IDSinhVien], [IDHocKy], [DiemTBC], [SoTCDKi], [SoTCNo], [XepLoai]) VALUES (N'17150144  ', N'5         ', NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [fk_IDKhoa_GV] FOREIGN KEY([IDKhoa])
REFERENCES [dbo].[Khoa] ([IDKhoa])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [fk_IDKhoa_GV]
GO
ALTER TABLE [dbo].[KetQuaHP]  WITH CHECK ADD  CONSTRAINT [fk_IDHocPhan_KQHP] FOREIGN KEY([IDHocPhan])
REFERENCES [dbo].[HocPhan] ([IDHocPhan])
GO
ALTER TABLE [dbo].[KetQuaHP] CHECK CONSTRAINT [fk_IDHocPhan_KQHP]
GO
ALTER TABLE [dbo].[KetQuaHP]  WITH CHECK ADD  CONSTRAINT [fk_IDSinhVien_KQHP] FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[SinhVien] ([IDSinhVien])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KetQuaHP] CHECK CONSTRAINT [fk_IDSinhVien_KQHP]
GO
ALTER TABLE [dbo].[KetQuaLopHP]  WITH CHECK ADD  CONSTRAINT [fk_IDLopHP_KQLHP] FOREIGN KEY([IDLopHP])
REFERENCES [dbo].[LopHP] ([IDLopHP])
GO
ALTER TABLE [dbo].[KetQuaLopHP] CHECK CONSTRAINT [fk_IDLopHP_KQLHP]
GO
ALTER TABLE [dbo].[KetQuaLopHP]  WITH CHECK ADD  CONSTRAINT [fk_IDSinhVien_KQLHP] FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[SinhVien] ([IDSinhVien])
GO
ALTER TABLE [dbo].[KetQuaLopHP] CHECK CONSTRAINT [fk_IDSinhVien_KQLHP]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [fk_IDKhoa_Lop] FOREIGN KEY([IDKhoa])
REFERENCES [dbo].[Khoa] ([IDKhoa])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [fk_IDKhoa_Lop]
GO
ALTER TABLE [dbo].[LopHP]  WITH CHECK ADD  CONSTRAINT [fk_IDGV_LHP] FOREIGN KEY([IDGV])
REFERENCES [dbo].[GiangVien] ([IDGV])
GO
ALTER TABLE [dbo].[LopHP] CHECK CONSTRAINT [fk_IDGV_LHP]
GO
ALTER TABLE [dbo].[LopHP]  WITH CHECK ADD  CONSTRAINT [fk_IDHocKy_LHP] FOREIGN KEY([IDHocKy])
REFERENCES [dbo].[HocKy] ([IDHocKy])
GO
ALTER TABLE [dbo].[LopHP] CHECK CONSTRAINT [fk_IDHocKy_LHP]
GO
ALTER TABLE [dbo].[LopHP]  WITH CHECK ADD  CONSTRAINT [fk_IDHocPhan_LHP] FOREIGN KEY([IDHocPhan])
REFERENCES [dbo].[HocPhan] ([IDHocPhan])
GO
ALTER TABLE [dbo].[LopHP] CHECK CONSTRAINT [fk_IDHocPhan_LHP]
GO
ALTER TABLE [dbo].[LopHP]  WITH CHECK ADD  CONSTRAINT [FK_LopHP_HeDT] FOREIGN KEY([MaHeDT])
REFERENCES [dbo].[HeDT] ([MaHeDT])
GO
ALTER TABLE [dbo].[LopHP] CHECK CONSTRAINT [FK_LopHP_HeDT]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Lop] FOREIGN KEY([IDLop])
REFERENCES [dbo].[Lop] ([IDLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Lop]
GO
ALTER TABLE [dbo].[TongKetKy]  WITH CHECK ADD  CONSTRAINT [fk_IDHocKy_TKK] FOREIGN KEY([IDHocKy])
REFERENCES [dbo].[HocKy] ([IDHocKy])
GO
ALTER TABLE [dbo].[TongKetKy] CHECK CONSTRAINT [fk_IDHocKy_TKK]
GO
ALTER TABLE [dbo].[TongKetKy]  WITH CHECK ADD  CONSTRAINT [fk_IDSinhVien_TKK] FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[SinhVien] ([IDSinhVien])
GO
ALTER TABLE [dbo].[TongKetKy] CHECK CONSTRAINT [fk_IDSinhVien_TKK]
GO
/****** Object:  StoredProcedure [dbo].[bieumau_ds_sv_toan_truong]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bieumau_ds_sv_toan_truong]
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

GO
/****** Object:  StoredProcedure [dbo].[DanhSachCacHocPhanCuaSinhVien]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROC [dbo].[DanhSachCacHocPhanCuaSinhVien] (@idSv char(10))
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

GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Search] @txt nvarchar(50)
 as
 select ROW_NUMBER() OVER (ORDER BY IDSinhVien) AS STT, IDSinhVien as 'Mã sinh viên',HoTen as 'Họ và tên',NgaySinh as 'Ngày sinh',GioiTinh as 'Giới tính',QueQuan as 'Quê quán',DiaChiHT as 'Địa chỉ hiện tại',KhoaDKi as 'Khoa',[IDLop] as'IDLớp',GhiChu as'Ghi chú'
 from SinhVien 
 where   IDSinhVien like '%'+@txt+'%' or HoTen like '%'+@txt+'%' or NgaySinh like '%'+@txt+'%' or GioiTinh like '%'+@txt+'%' or DiaChiHT like '%'+@txt+'%' or KhoaDKi like '%'+@txt+'%' or IDLop like '%'+@txt+'%' or GhiChu like '%'+@txt+'%'


GO
/****** Object:  StoredProcedure [dbo].[ThongTinSinhVienCoDiemCaoNhatTruong]    Script Date: 6/16/2020 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROC [dbo].[ThongTinSinhVienCoDiemCaoNhatTruong] (@idHK char(10))
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

GO
