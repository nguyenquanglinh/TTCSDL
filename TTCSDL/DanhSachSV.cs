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
    public partial class DanhSachSV : Form
    {
        public DanhSachSV()
        {
            InitializeComponent();
        }
        public DanhSachSV(DbAccess db, string id) : this()
        {
            db.GetTabeDSSVLop(dataGridView1, id);
            if (dataGridView1.RowCount == 1)
            {
                MessageBox.Show("Lớp chưa có sinh viên .","Thông báo",MessageBoxButtons.OK);
                label2.Text = "Sĩ số: 0";
            }
            else
                label2.Text = "Sĩ số: "+(dataGridView1.RowCount-1).ToString();
        }
        public DanhSachSV(DbAccess db,string id,string tenLop,string nienKhoa) : this(db, id)
        {
            label3.Text+=  "Lớp " + tenLop+" Niên khóa: "+nienKhoa;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
