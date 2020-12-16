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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //Khai báo chuỗi tên tài khoản
        public string getUsername;
        public string getUsername2;


        private void toolStripLabel1_Click(object sender, EventArgs e)
        {
            Form_SinhVien DSKH = new Form_SinhVien();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel2_Click(object sender, EventArgs e)
        {
            
            Form_CapNhatDiem DSKH = new Form_CapNhatDiem();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel3_Click(object sender, EventArgs e)
        {
            Form_BangDiem DSKH = new Form_BangDiem();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel4_Click(object sender, EventArgs e)
        {
            Form_LopHoc DSKH = new Form_LopHoc();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel5_Click(object sender, EventArgs e)
        {
            Form_HocKi DSKH = new Form_HocKi();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel8_Click(object sender, EventArgs e)
        {
            TrangChu DSKH = new TrangChu();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            lb_getNamea.Text = getUsername;
            lb_getName2a.Text = getUsername2;

            Form_DangNhap dn = new Form_DangNhap();
            //GiaoDienBatDau dn = new GiaoDienBatDau();

            if (dn.TK ==  1)// Admin
            {

                xinchao.Text += "Quản trị viên";
                btnNhapDiemQt.Visible = false;
                //Ts_Btn_Diem.Visible = false;
            }
            else if (dn.TK == 2 )
            {
                xinchao.Text += "Giảng viên";
                //Hệ thống
                btnHocKy.Visible = false;
                btnLopHoc.Visible = false;
                btnMonHoc.Visible = false;
                btnSinhVien.Visible = false;
                btnQLTK.Visible = false;
                btnNhapDiem.Visible = false;
                btnThiLai.Visible = false;
                
            }
            else if (dn.TK == 3)
            {
                xinchao.Text += "Sinh viên";
                //Hệ thống
                btnHocKy.Visible = false;
                btnLopHoc.Visible = false;
                btnMonHoc.Visible = false;
                btnSinhVien.Visible = false;
                btnThiLai.Visible = false;
                //btnCapNhatDiem2.Visible = false;
                btnNhapDiem.Visible = false;
                btnQLTK.Visible = false;
                btnNhapDiemQt.Visible = false;

            }

            TrangChu DSKH = new TrangChu();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void thôngTinPhầnMềmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThongTinPhanMem frm = new ThongTinPhanMem();
            frm.ShowDialog();
        }

        private void giớiThiệuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GioiThieu frm = new GioiThieu();
            frm.ShowDialog();
        }

        private void toolStripLabel6_Click(object sender, EventArgs e)
        {
            Form_MonHoc DSKH = new Form_MonHoc();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel7_Click(object sender, EventArgs e)
        {
            Form_QuanLyTaiKhoan DSKH = new Form_QuanLyTaiKhoan();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void đổiMậtKhẩuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DoiMatKhau a = new DoiMatKhau();
            a.ShowDialog();
        }

        private void thoátToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult hoi;
            hoi = MessageBox.Show("Ban có muốn thoát khỏi chương trình không?", "Thoát chương trình", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (hoi == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void toolStripLabel9_Click(object sender, EventArgs e)
        {
            Form_ThongKe DSKH = new Form_ThongKe();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel11_Click(object sender, EventArgs e)
        {
            Form_WebDaoTao DSKH = new Form_WebDaoTao();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            DialogResult hoi;
            hoi = MessageBox.Show("Ban có muốn thoát khỏi chương trình không?", "Thoát chương trình", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (hoi == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void ứngDụngMáyTínhToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\Windows\system32\calc.exe");
        }

        private void microsoftExcelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Excel 2013");
        }

        private void microsoftWordToolStripMenuItem_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start(@"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Word 2013");
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString("HH:mm:ss");
            lblDate.Text = DateTime.Now.ToString("dd.MM.yyyy");
            lblDay.Text = DateTime.Now.ToString("dddd");
            if (lblDay.Text == "Monday")
            {
                lblDay.Text = "Thứ hai";
            }
            if (lblDay.Text == "Tuesday")
            {
                lblDay.Text = "Thứ ba";
            }
            if (lblDay.Text == "Wednesday")
            {
                lblDay.Text = "Thứ tư";
            }
            if (lblDay.Text == "Thursday")
            {
                lblDay.Text = "Thứ năm";
            }
            if (lblDay.Text == "Friday")
            {
                lblDay.Text = "Thứ sáu";
            }
            if (lblDay.Text == "Saturday")
            {
                lblDay.Text = "Thứ bảy";
            }
            if (lblDay.Text == "Sunday")
            {
                lblDay.Text = "Chủ nhật";
            }
        }

        private void liênHệToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LienHe a = new LienHe();
            a.ShowDialog();
        }

        private void phảnHồiNgườiDùngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            PhanHoi a = new PhanHoi();
            a.ShowDialog();
        }

        private void đăngNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            this.Close();
            Form_DangNhap a = new Form_DangNhap();
            a.ShowDialog();
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            this.Close();
            Form_DangNhap a = new Form_DangNhap();
            a.ShowDialog();
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            if (lbTruong.Left <= this.Width)
            {
                lbTruong.Left = lbTruong.Left + 10;
            }
            else
            {
                lbTruong.Left = -lbTruong.Width;
            }
        }

        private void dtgv_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void NhapDiemb_Click(object sender, EventArgs e)
        {
            NhapDiemGV DSKH = new NhapDiemGV();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void toolStripLabel1_Click_1(object sender, EventArgs e)
        {
            THONGKE DSKH = new THONGKE();
            DSKH.TopLevel = false;
            dtgv.Controls.Clear();
            dtgv.Controls.Add(DSKH);
            DSKH.Show();
        }

        private void cửaSổThuNhỏToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.FormBorderStyle = FormBorderStyle.Sizable;
        }

        private void toànMànHìnhToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.FormBorderStyle = FormBorderStyle.None;
        }
    }
}
