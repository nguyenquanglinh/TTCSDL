using System;
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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private SinhVien GetSVFromTable(int i)
        {
            var sv = new SinhVien(dataGridView1.Rows[i].Cells[1].Value.ToString(),
                      dataGridView1.Rows[i].Cells[2].Value.ToString(),
                      dataGridView1.Rows[i].Cells[7].Value.ToString());
            var datetime = dataGridView1.Rows[i].Cells[3].Value.ToString();
            if (datetime.Length>0)
            {
                var date = DateTime.Parse(datetime);
                sv.NgaySinh = date.Day + "/" + date.Month + "/" + date.Year;
            }

            sv.GioiTinh = dataGridView1.Rows[i].Cells[4].Value.ToString();
            sv.QueQuan = dataGridView1.Rows[i].Cells[5].Value.ToString();
            sv.DiaChiHT = dataGridView1.Rows[i].Cells[6].Value.ToString();
            sv.IdLop = dataGridView1.Rows[i].Cells[8].Value.ToString();
            sv.GhiChu = dataGridView1.Rows[i].Cells[9].Value.ToString();
            return sv;
        }
        public void UpDateTable()
        {
            this.Db.GetDataTableSinhVien(dataGridView1);
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            Db = new DbAccess();
            UpDateTable();
        }
        private void dataGridView1_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                ContextMenuStrip contexMenu = new ContextMenuStrip();
                contexMenu.Items.Add("Thêm sinh viên mới");
                contexMenu.Items.Add("Sửa thông tin sinh viên");
                contexMenu.Items.Add("Xóa sinh viên");
                if (txtSearch.Visible==false)
                {
                    contexMenu.Items.Add("Tìm kiếm sinh viên");
                }
                else
                {
                    contexMenu.Items.Add("Ẩn tìm kiếm sinh viên");
                }
                contexMenu.Items.Add("Nghiệp vụ khoa");
                contexMenu.Show(dataGridView1, new Point(e.X, e.Y));
                contexMenu.ItemClicked += new ToolStripItemClickedEventHandler(
                    contexMenuCanHo_ItemClicked);

            }
        }
        void contexMenuCanHo_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            ToolStripItem item = e.ClickedItem;
            if (item.Text == "Thêm sinh viên mới")
            {
                this.Hide();
                var them = new ThemSinhVien(Db,this);
                them.ShowDialog();
            }
            else if (item.Text == "Sửa thông tin sinh viên")
            {
                if (s != null)
                {
                    this.Hide();
                    var sua = new SuaSinhVien(s,Db,this);
                    sua.ShowDialog();
                }
                else
                {
                    MessageBox.Show("dữ liệu rỗng");
                }
            }
            else if (item.Text == "Xóa sinh viên")
            {
                if (s != null)
                {
                    if (Db.XoaSV(s.MaSV)) MessageBox.Show("Xóa thành công");
                    else MessageBox.Show("Không thể xóa thông tin vui lòng kiểm tra lại");
                }
                else
                {
                    MessageBox.Show("dữ liệu rỗng");
                }
            }
            else if (item.Text == "Tìm kiếm sinh viên")
            {
                //timKiem1.Visible = true;
                txtSearch.Visible = true;
                btnSearch.Visible = true;
            }
            else if (item.Text == "Ẩn tìm kiếm sinh viên")
            {
                //timKiem1.Visible = false;
                txtSearch.Visible = false;
                btnSearch.Visible = false;
            }
            else if(item.Text=="Nghiệp vụ khoa")
            {
                this.Hide();
                new KhoaMNg(this,Db).ShowDialog();
            }
            UpDateTable();
        }
        SinhVien s = null;
        private DbAccess Db;

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                s = GetSVFromTable(e.RowIndex);
            }
            catch
            {
            }

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            this.Hide();
            new FormTimKiem(dataGridView1).Show();

        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (txtSearch.Text.Length == 0)
            {
                Db.GetDataTableSinhVien(dataGridView1);
            }
            else Db.SearchSV(dataGridView1, txtSearch.Text);
        }
    }
}
