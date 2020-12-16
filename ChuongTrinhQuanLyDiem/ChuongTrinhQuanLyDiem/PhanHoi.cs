using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ChuongTrinhQuanLyDiem
{
    public partial class PhanHoi : Form
    {
        public PhanHoi()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Đã gửi phản hồi", "Phản hồi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
