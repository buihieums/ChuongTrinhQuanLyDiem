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
    public partial class MayTinh : Form
    {
        public MayTinh()
        {
            InitializeComponent();
        }

        private void MayTinh_Load(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\Windows\system32\calc.exe");
        }
    }
}
