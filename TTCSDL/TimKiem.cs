using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TTCSDL
{
    public partial class TimKiem : UserControl
    {
        public TimKiem()
        {
            InitializeComponent();
        }
        public Dictionary<int, SinhVien> Dic { get; set; }

        public void OnClick(bool dk)
        {
            var form = new FormTimKiem();
            foreach (var item in Dic)
            {
                var value = item.Value.Infor();
                if (txtSearch.Text.Length > 0)
                {
                    if (value.IndexOf(txtSearch.Text, StringComparison.OrdinalIgnoreCase) >= txtSearch.Text.Length/2)
                    {
                        form.dataGridView1.Rows.Add(item.Key, item.Value.MaSV, item.Value.Name, item.Value.NgaySinh, item.Value.GioiTinh, item.Value.QueQuan, item.Value.DiaChiHT, item.Value.Khoa, item.Value.IdLop, item.Value.GhiChu);
                    }
                }
            }
            if (form.dataGridView1.RowCount > 1)
                form.ShowDialog();
            else
            {
                if (dk)
                    MessageBox.Show("Không tìm được kết quả trùng khớp nào", "Thông báo", MessageBoxButtons.OK);
            }
        }
        private void btnTim_Click(object sender, EventArgs e)
        {
            OnClick(true);
        }
    }
}
