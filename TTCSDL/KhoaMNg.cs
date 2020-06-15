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
    public partial class KhoaMNg : Form
    {
        private DbAccess db;
        private Dictionary<string, string> dic;

        public KhoaMNg()
        {
            InitializeComponent();
        }

        public KhoaMNg(DbAccess db) : this()
        {
            this.db = db;
            db.dataKhoa = db.GetListKhoa(null);
            this.dic = new Dictionary<string, string>();
            for (int i = 0; i < db.dataKhoa.Rows.Count; i++)
            {
                var makhoa = db.dataKhoa.Rows[i]["Mã khoa"].ToString();
                var teKhoa = db.dataKhoa.Rows[i]["Tên khoa"].ToString();
                comboBoxKhoa.Items.Add(makhoa);
                dic.Add(makhoa, teKhoa);
            }
        }

        public KhoaMNg(Form1 form1, DbAccess db) : this(db)
        {
            this.form1 = form1;
        }

        void UpDateData()
        {
            db.dataLop = db.GetListLop(comboBoxKhoa.Text);
            if (db.dataLop.Rows.Count > 0)
            {
                dataGridView1.Rows.Clear();
                dataGridView1.Visible = true;
                label2.Visible = true;
                txtTenKhoa.Visible = true;
                txtSiSo.Visible = true;
                txtSiSo.Text = db.dataLop.Rows.Count.ToString();
            }
            for (int i = 0; i < db.dataLop.Rows.Count; i++)
            {
                dataGridView1.Rows.Add(i + 1, db.dataLop.Rows[i]["Mã lớp"], db.dataLop.Rows[i]["Tên lớp"], db.dataLop.Rows[i]["Sĩ số"], db.dataLop.Rows[i]["Niên khóa"]);
            }
        }

        private void dataGridView1_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                ContextMenuStrip contexMenuCanHo = new ContextMenuStrip();
                contexMenuCanHo.Items.Add("Xem danh sách lớp");
                contexMenuCanHo.Items.Add("Cập nhật sĩ số lớp hiện tại");
                contexMenuCanHo.Items.Add("Cập nhật sĩ số lớp của tất cả các lớp");
                contexMenuCanHo.Show(dataGridView1, new Point(e.X, e.Y));
                contexMenuCanHo.ItemClicked += new ToolStripItemClickedEventHandler(
                    contexMenuCanHo_ItemClicked);

            }
        }

        private void contexMenuCanHo_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            ToolStripItem item = e.ClickedItem;
            if (item.Text == "Xem danh sách lớp")
            {
                if (id != null)
                {
                    this.Hide();
                    new DanhSachSV(this, db, id, tenLop, niemKhoa).Show();
                }
            }
            else if (item.Text == "Cập nhật sĩ số lớp hiện tại")
            {
                if (db.UpDateSiSoKhoa(id))
                    MessageBox.Show("Cập nhật sĩ số lớp " + tenLop + " thành công", "Thông báo", MessageBoxButtons.OK);
                else MessageBox.Show("Cập nhật không thành công", "Thông báo", MessageBoxButtons.OK);

            }
            else if (item.Text == "Cập nhật sĩ số lớp của tất cả các lớp")
            {
                for (int i = 0; i < db.dataLop.Rows.Count; i++)
                {
                    db.UpDateSiSoKhoa(db.dataLop.Rows[i]["Mã lớp"].ToString());
                }
                MessageBox.Show("Cập nhật sĩ số lớp tất cả các lớp thành công", "Thông báo", MessageBoxButtons.OK);

            }
            UpDateData();
        }

        private void comboBoxKhoa_TextChanged(object sender, EventArgs e)
        {
            dataGridView1.Rows.Clear();
            foreach (var item in dic)
            {
                if (item.Key == comboBoxKhoa.Text)
                {
                    txtTenKhoa.Text = item.Value;
                    break;
                }
            }
            if (comboBoxKhoa.Text.Length == 0)
            {
                MessageBox.Show("Chưa chọn khoa để xử lý");
                return;
            }
            UpDateData();
        }
        string id;
        string tenLop;
        string niemKhoa;
        private Form1 form1;

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                id = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
                tenLop = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                niemKhoa = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            }
            catch { }

        }

        private void button1_Click_1(object sender, EventArgs e)
        {

        }

        private void KhoaMNg_FormClosed(object sender, FormClosedEventArgs e)
        {
            form1.Show();
        }
    }
}
