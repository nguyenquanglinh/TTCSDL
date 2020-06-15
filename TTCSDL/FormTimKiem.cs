using System.Windows.Forms;

namespace TTCSDL
{
    public partial class FormTimKiem : Form
    {

        public FormTimKiem()
        {
            InitializeComponent();
        }

        public FormTimKiem(DataGridView dataGridView1):this()
        {
            this.Controls.Add(dataGridView1);
        }


        private void FormTimKiem_FormClosed(object sender, FormClosedEventArgs e)
        {
            new Form1().Show();
        }
    }
}
