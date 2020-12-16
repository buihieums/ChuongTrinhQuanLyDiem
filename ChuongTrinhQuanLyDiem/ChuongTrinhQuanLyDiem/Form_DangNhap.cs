using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.Threading;

namespace ChuongTrinhQuanLyDiem
{
    public partial class Form_DangNhap : Form
    {
        public Form_DangNhap()
        {
            Thread t = new Thread(new ThreadStart(StartForm));
            t.Start();
            Thread.Sleep(3000);

            InitializeComponent();
            t.Abort();
        }

        public void StartForm()
        {
            Application.Run(new KhoiDong());
        }


        // Mã hóa MD5



        public string getMD5(string text)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));
            byte[] result = md5.Hash;
            StringBuilder str = new StringBuilder();
            for (int i = 1; i < result.Length; i++)
            {
                str.Append(result[i].ToString("x2"));
            }
            return str.ToString();
        }

        int sai = 5;
        private static int tk;

        // Lấy thông tin tài khoản
        public int TK
        {
            get { return tk; }
            set { tk = value; }
        }


        //
        private void button_DangNhap_Click(object sender, EventArgs e)
        {
            Form1 a = new Form1();
            a.ShowDialog();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void textBox_User_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void textBox_Pass_TextChanged(object sender, EventArgs e)
        {

        }

        private void checDk_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Form_DangNhap_Load(object sender, EventArgs e)
        {
            
        }

        private void button_DangNhap_Click_1(object sender, EventArgs e)
        {
            try
            {
                string passMD5 = getMD5(textBox_Pass.Text);
                string tentk = textBox_User.Text;
                string matkhau = textBox_Pass.Text;
                if (tentk == "")
                {
                    MessageBox.Show("Bạn chưa nhập tên tài khoản",
                    "Đăng nhập", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    if (matkhau == "")
                    {
                        MessageBox.Show("Bạn chưa nhập mật khẩu",
                        "Đăng Nhập", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        string dangNhap = "SELECT * FROM DangNhap WHERE TaiKhoan = '" +
                                textBox_User.Text + "' and MatKhau='" +
                                passMD5 + " '";
                        DataTable dt = CSDL.bang(dangNhap);
                        int i = dt.Rows.Count;


                        if (sai > 0)
                        {
                            if (i > 0)
                            {
                                DataTable datadn = CSDL.bang(dangNhap);
                                tk = int.Parse(datadn.Rows[0][2].ToString());//Lấy thông tin cấp độ tài khoản
                                if (tk == 1)
                                {
                                    MessageBox.Show("Quản trị viên " + "\"" + textBox_User.Text + "\"" + " đã đăng nhập",
                                    "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    //this.Close();
                                }
                                else if (tk == 2)
                                {
                                    MessageBox.Show("Giáo viên " + "\"" + textBox_User.Text + "\"" + " đã đăng nhập",
                                    "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                }
                                else if (tk == 3)
                                {
                                    MessageBox.Show("Sinh viên " + "\"" + textBox_User.Text + "\"" + " đã đăng nhập",
                                    "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                }
                                else
                                {
                                    tk = 0;
                                }

                                using (Form1 gd = new Form1())
                                {
                                    if (tk == 1 || tk == 2)
                                    {
                                        gd.getUsername = textBox_User.Text;
                                    }
                                    else
                                    {
                                        gd.getUsername2 = textBox_User.Text;
                                    }
                                    gd.ShowDialog();
                                    this.Close();
                                }
                            }
                            else
                            {
                                tk = 0;
                                sai = sai - 1;
                                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu! Bạn còn " + sai + " lần đăng nhập",
                                        "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                this.textBox_User.Clear();
                                this.textBox_Pass.Clear();
                                this.textBox_User.Focus();
                            }
                        }
                        else
                        {
                            MessageBox.Show("Bạn đã hết lượt truy cập đăng nhập. Mời đăng nhập lại!",
                                        "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.Close();
                            Form_DangNhap gd1 = new Form_DangNhap();
                            gd1.Show();
                        }
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Lỗi kết nối với máy chủ, vui lòng thử lại",
                                "Lỗi kết nối", MessageBoxButtons.OK, MessageBoxIcon.Error);
            };
        }

        private void label8_Click(object sender, EventArgs e)
        {
            Form_DangKy frm = new Form_DangKy();
            frm.ShowDialog();
        }

        private void pictureBox1_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void checDk_CheckedChanged_1(object sender, EventArgs e)
        {
            if (checDk.Checked == true)
            {
                textBox_Pass.UseSystemPasswordChar = true;
            }
            else
            {
                textBox_Pass.UseSystemPasswordChar = false;
            }
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {
            Form_DangKy a = new Form_DangKy();
            a.ShowDialog();
        }
    }
}
