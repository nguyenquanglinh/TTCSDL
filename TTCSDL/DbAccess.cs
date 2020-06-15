using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace TTCSDL
{
    public class DbAccess
    {
        public DbAccess()
        {
            CreateConn();
        }
        public DataTable readDatathroughtAdapter(string query)
        {
            DataTable ds = new DataTable();
            try
            {
                if (connection.State == ConnectionState.Closed)
                {
                    CreateConn();
                }
                SqlDataAdapter dataadapter = new SqlDataAdapter(query, connection);

                dataadapter.Fill(ds);

            }
            catch
            {
            }
            return ds;
        }

        public bool GetTabeDSSVLop(DataGridView dataGridView1, string id)
        {
            try
            {
                string query = "select ROW_NUMBER() OVER (ORDER BY IDSinhVien) AS STT, IDSinhVien as 'Mã sinh viên',HoTen as 'Họ và tên',NgaySinh as 'Ngày sinh',GioiTinh as 'Giới tính',QueQuan as 'Quê quán',DiaChiHT as 'Địa chỉ hiện tại',KhoaDKi as 'Khoa',[IDLop] as'IDLớp',GhiChu as'Ghi chú',SoTCDaDKi as'STCDDK',SoTCDaDat as'STCDD' from SinhVien where SinhVien.IDLop='" + id + "'";
                SqlDataAdapter dataadapter = new SqlDataAdapter(query, connection);
                DataSet ds = new DataSet();
                dataadapter.Fill(ds, "data");
                dataGridView1.DataSource = ds;
                dataGridView1.DataMember = "data";
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Cảnh báo lỗi", MessageBoxButtons.OK);
            }
            return false;
        }

        public DataTable GetListLop(string s)
        {
            string query = "select IDLop as'Mã lớp',TenLop as 'Tên lớp',SiSo as 'Sĩ số',NienKhoa as'Niên khóa',IDKhoa as'Mã khoa'from Lop ";
            if (s != null)
                query += " where Lop.IDKhoa like '" + s + "'";
            return readDatathroughtAdapter(query);
        }
        public DataTable GetListKhoa(string s)
        {
            string query = "select IDKhoa as'Mã khoa', TenKhoa as 'Tên khoa' from Khoa ";
            if (s != null)
                query += "where IDKhoa=' " + s + "'";
            return readDatathroughtAdapter(query);
        }

        SqlConnection connection = new SqlConnection();
        public static string strConnString = "Data Source =" + "DESKTOP-1DLVE1Q\\SQLEXPRESS;Database = S4_N10_QLDiemSV; Integrated Security=SSPI;";
        public DataTable dataKhoa;
        public DataTable dataLop;
        #region sinhvien
        private void CreateConn()
        {
            try
            {
                if (connection.State != ConnectionState.Open)
                {
                    connection.ConnectionString = strConnString;
                    connection.Open();
                }
            }
            catch
            {

            }
        }
        public void GetDataTableSinhVien(DataGridView dataGridView1)
        {
            try
            {
                string query = "select ROW_NUMBER() OVER (ORDER BY IDSinhVien) AS STT, IDSinhVien as 'Mã sinh viên',HoTen as 'Họ và tên',NgaySinh as 'Ngày sinh',GioiTinh as 'Giới tính',QueQuan as 'Quê quán',DiaChiHT as 'Địa chỉ hiện tại',KhoaDKi as 'Khoa',[IDLop] as'IDLớp',GhiChu as'Ghi chú'from SinhVien";
                SqlDataAdapter dataadapter = new SqlDataAdapter(query, connection);
                DataSet ds = new DataSet();
                dataadapter.Fill(ds, "data");
                dataGridView1.DataSource = ds;
                dataGridView1.DataMember = "data";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Cảnh báo lỗi", MessageBoxButtons.OK);
            }
        }
        public bool UpDateSiSoKhoa(string s)
        {
            try
            {
                string sql = "update Lop set  SiSo=tt.SS from(select count(CAST(IDSinhVien as int)) as SS, Lop.IDLop from SinhVien, Lop where Lop.IDLop = SinhVien.IDLop  and SinhVien.IDLop='" + s + "' group by Lop.IDLop) as tt";
                using (SqlCommand insertCommand = new SqlCommand(sql, connection))
                {
                    if (insertCommand.ExecuteNonQuery() > 0)
                    {
                        return true;
                    }
                    sql = "update Lop set  SiSo='0' where Lop.IDLop='" + s + "'";
                   var insertCommand2 = new SqlCommand(sql, connection);
                    insertCommand2.ExecuteNonQuery();
                    return true;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                return false;
            }
        }
        public bool ThemSV(SinhVien sv)
        {
            if (!sv.CheckSvNotNull()) return false;
            try
            {
                string sql = "";
                if (sv.NgaySinh != null)
                {
                    sql = "insert into SinhVien(IDSinhVien,HoTen,NgaySinh,GioiTinh,QueQuan,DiaChiHT,KhoaDKi,IDLop,GhiChu)"
                        + "values('"
                        + sv.MaSV.ToString() + "',N'"
                        + sv.Name.ToString() + "','"
                        + sv.NgaySinh.ToString() + "',N'"
                        + sv.GioiTinh.ToString() + "',N'"
                        + sv.QueQuan.ToString() + "',N'"
                        + sv.DiaChiHT.ToString() + "',N'"
                        + sv.Khoa.ToString() + "','"
                        + sv.IdLop.ToString() + "',N'"
                        + sv.GhiChu.ToString() + "')";
                }
                else
                    sql = "insert into SinhVien(IDSinhVien,HoTen,NgaySinh,GioiTinh,QueQuan,DiaChiHT,KhoaDKi,IDLop,GhiChu)"
                           + "values('"
                           + sv.MaSV.ToString() + "',N'"
                           + sv.Name.ToString() + "','"
                           + null + "',N'"
                           + sv.GioiTinh.ToString() + "',N'"
                           + sv.QueQuan.ToString() + "',N'"
                           + sv.DiaChiHT.ToString() + "',N'"
                           + sv.Khoa.ToString() + "','"
                           + sv.IdLop.ToString() + "',N'"
                           + sv.GhiChu.ToString() + "')";
                using (SqlCommand insertCommand = new SqlCommand(sql, connection))
                {
                    if (insertCommand.ExecuteNonQuery() == 1)
                    {
                        return true;
                    }
                }
            }
            catch
            {
            }
            return false;
        }
        public bool SuaSV(SinhVien sv, string id)
        {
            if (!sv.CheckSvNotNull()) return false;
            try
            {
                string sql = "update SinhVien set "
                    + "IDSinhVien=" + sv.MaSV.ToString() + ","
                    + "HoTen=N'" + sv.Name.ToString() + "',"
                    + "NgaySinh=Cast('" + sv.NgaySinh.ToString() + "'as datetime),"
                    + "GioiTinh=N'" + sv.GioiTinh.ToString() + "',"
                    + "QueQuan=N'" + sv.QueQuan.ToString() + "',"
                    + "DiaChiHT=N'" + sv.DiaChiHT.ToString() + "',"
                    + "KhoaDKi=N'" + sv.Khoa.ToString() + "',"
                   + "IDLop='" + sv.IdLop.ToString() + "',"
                    + "GhiChu=N'" + sv.GhiChu.ToString()
                    + "'where IDSinhVien=" + id;
                using (SqlCommand updateCommand = new SqlCommand(sql, connection))
                {
                    if (updateCommand.ExecuteNonQuery() == 1)
                    {
                        return true;
                    }
                }
            }
            catch
            {
            }
            return false;
        }
        public bool XoaSV(string id)
        {
            try
            {
                String sql = "delete KetQuaHP where IDSinhVien like " + id+
                    "  delete KetQuaLopHP where IDSinhVien like " + id +
                    " delete TongKetKy where IDSinhVien like " + id +
                    " delete SinhVien where IDSinhVien like " + id ;
                using (SqlCommand insertCommand = new SqlCommand(sql, connection))
                {
                    if (insertCommand.ExecuteNonQuery() >0)
                    {
                        return true;
                    }
                }
            }
            catch
            {

            }
            return false;
        }
        #endregion

       public bool SearchSV(DataGridView view1,string text)
        {
            try
            {
                string query = "exec Search"+" N'"+text+"'";
                SqlDataAdapter dataadapter = new SqlDataAdapter(query, connection);
                DataSet ds = new DataSet();
                dataadapter.Fill(ds, "data");
                view1.DataSource = ds;
                view1.DataMember = "data";
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Cảnh báo lỗi", MessageBoxButtons.OK);
            }
            return false;
        }

    }

}
