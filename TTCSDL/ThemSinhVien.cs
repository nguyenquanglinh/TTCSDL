﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TTCSDL
{
    public partial class ThemSinhVien : Form
    {
        public ThemSinhVien()
        {
            InitializeComponent();
        }
        public SinhVien SV=new SinhVien();
        private Form1 form1;

        public DbAccess DB { get; private set; }

        public ThemSinhVien(DbAccess db):this()
        {
            this.DB = db;
            DB.dataKhoa = DB.GetListKhoa(null);
            for (int i = 0; i <DB.dataKhoa.Rows.Count; i++)
            {
                comboBoxKhoa.Items.Add(DB.dataKhoa.Rows[i]["Mã khoa"].ToString());
            }
            DB.dataLop = DB.GetListLop(null);
            for (int i = 0; i <  DB.dataLop.Rows.Count; i++)
            {
                comboBoxIDLop.Items.Add(db.dataLop.Rows[i]["Mã lớp"]);
            }
        }

        public ThemSinhVien(DbAccess db, Form1 form1) : this(db)
        {
            this.form1 = form1;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            var maSv = txtMaSV.Text;
            if (!string.IsNullOrWhiteSpace(maSv))
            {
                if (maSv.Length >7 && maSv.Length<11)
                {
                    var tenSv = txtTenSV.Text;
                    if (!string.IsNullOrWhiteSpace(tenSv))
                    {
                        if (tenSv.Length > 4 && tenSv.Length < 50)
                        {
                            var khoa = comboBoxKhoa.Text;
                            if (!string.IsNullOrWhiteSpace(khoa))
                            {
                                if (khoa.Length > 1 && khoa.Length < 50)
                                {
                                    SV = new SinhVien(maSv, tenSv, khoa);
                                    var idLop = comboBoxIDLop.Text;
                                    if (idLop.Length > 0 && idLop.Length < 11 && !string.IsNullOrWhiteSpace(idLop))
                                        SV.IdLop = idLop;
                                    var ghiChu = txtGhiChu.Text;
                                    if (ghiChu.Length > 0 && ghiChu.Length < 200 && !string.IsNullOrWhiteSpace(ghiChu))
                                        SV.GhiChu = ghiChu;
                                    var dcHT = txtDCHT.Text;
                                    if (dcHT.Length > 0 && dcHT.Length < 200 && !string.IsNullOrWhiteSpace(dcHT))
                                        SV.DiaChiHT = ghiChu;
                                    var queQuan = txtQueQuan.Text;
                                    if (queQuan.Length > 0 && queQuan.Length < 200 && !string.IsNullOrWhiteSpace(queQuan))
                                        SV.QueQuan = queQuan;
                                    var gioiTinh = txtGioiTinh.Text;
                                    if (gioiTinh.Length > 0 && gioiTinh.Length < 10 && !string.IsNullOrWhiteSpace(queQuan))
                                        SV.GioiTinh = gioiTinh;
                                    var ngaySinh = txtNgaySinh.Text;
                                    if (ngaySinh.Length > 7)
                                        try
                                        {
                                            var x = DateTime.Parse(ngaySinh);
                                            if (x.Year < 2100 && x.Year > 1950)
                                            {
                                                SV.NgaySinh = x.Day.ToString() + "/" + x.Month.ToString() + "/" + x.Year.ToString();
                                                if (DB.ThemSV(SV)) MessageBox.Show("Thêm thành công");
                                                else MessageBox.Show("Không thể thêm thông tin vui lòng kiểm tra lại dữ liệu");
                                            }
                                            else
                                                MessageBox.Show("Nhập sai năm sinh (1950-2100)", "Cảnh báo lỗi", MessageBoxButtons.OK);
                                        }
                                        catch
                                        {
                                            MessageBox.Show("Không thể định dạng ngày tháng năm", "Cảnh báo", MessageBoxButtons.OK);
                                        }
                                    this.Close();

                                }
                                else
                                    MessageBox.Show("Khoa đăng ký có độ dài nằm trong khoảng từ 2-50 ký tụ", "Cảnh báo", MessageBoxButtons.OK);
                            }
                        }
                        else
                            MessageBox.Show("Độ dài tên sinh viên lớn hơn 5 ký tự và nhỏ hơn 50 ký tụ", "Cảnh báo", MessageBoxButtons.OK);
                    }
                    else
                        MessageBox.Show("Tên sinh viên không đc null hoặc có dấu cách", "Cảnh báo", MessageBoxButtons.OK);
                }
                else
                    MessageBox.Show("Độ dài mã sinh viên bằng 8", "Cảnh báo", MessageBoxButtons.OK);
            }
            else
                MessageBox.Show("Mã sinh viên không đc để trống hoặc có dấu cách", "Cảnh báo", MessageBoxButtons.OK);

        }
        private void comboBoxKhoa_TextChanged(object sender, EventArgs e)
        {
            comboBoxIDLop.Text = "";
            comboBoxIDLop.Items.Clear();
            DB.dataLop = DB.GetListLop(comboBoxKhoa.Text);
            for (int i = 0; i < DB.dataLop.Rows.Count; i++)
            {
                comboBoxIDLop.Items.Add(DB.dataLop.Rows[i]["Mã lớp"]);
            }
        }

        private void ThemSinhVien_FormClosed(object sender, FormClosedEventArgs e)
        {
            form1.Show();
        }
    }
}
