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
using System.Data;
using System.Data.SqlClient;

namespace ChuongTrinhQuanLyDiem
{
    public partial class Form_DangKy : Form
    {
        public Form_DangKy()
        {
            InitializeComponent();
        }
        QLDDataContext dt = new QLDDataContext();

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

        public static SqlConnection knoi()
        {
           
            string strkn;

            strkn = @"Data Source=BUITRUNGHIEU;Initial Catalog=QuanLyDiemSV;Integrated Security=True";
            return new SqlConnection(strkn);
        }
        public static DataTable bang(string sql)
        {
            string query = @"Data Source=BUITRUNGHIEU;Initial Catalog=QuanLyDiemSV;Integrated Security=True";
            SqlConnection connect = new SqlConnection(query);
            connect.Open();
            SqlDataAdapter a = new SqlDataAdapter(sql, connect);
            DataTable data = new DataTable();
            a.Fill(data);
            connect.Close();
            a.Dispose();
            return data;
        }
        public static void ThemSuaXoa(string sql)
        {
            string query = @"Data Source=BUITRUNGHIEU;Initial Catalog=QuanLyDiemSV;Integrated Security=True";
            SqlConnection connect = new SqlConnection(query); ;
            connect.Open();
            SqlCommand Lk = new SqlCommand(sql, connect);
            Lk.ExecuteNonQuery();
            connect.Close();
            Lk.Dispose();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button_DangNhap_Click(object sender, EventArgs e)
        {
            string passMD5 = txtMatKhau.Text;
            passMD5 = getMD5(txtMatKhau.Text);

            try
            {

                SqlConnection kn = knoi();
                string a = txtMatKhau.Text;
                string b = txtNhapLaiMatKhau.Text;
                if (a == b)
                {

                    string str = "SELECT * FROM DangNhap WHERE TaiKhoan = N'" +
                        txtTenDangKy.Text + "' ";
                    if (txtTenDangKy.Text.Trim() == "")
                    {
                        MessageBox.Show("Bạn chưa nhập tên người dùng !",
                            "Đăng Ký", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else if (txtMatKhau.Text.Trim() == "")
                    {
                        MessageBox.Show("Bạn chưa nhập mật khẩu!",
                            "Đăng Ký", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                    else
                    {
                        DataTable ba = bang(str);
                        int i = ba.Rows.Count;
                        if (i > 0)
                        {
                            MessageBox.Show("Tên tài khoản đã được sử dụng, vui lòng sử dụng tên khác !",
                            "Đăng Ký", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            txtTenDangKy.FindForm();
                            txtMatKhau.Text = "";
                            txtTenDangKy.Text = "";
                            txtNhapLaiMatKhau.Text = "";
                        }
                        else
                        {
                            /*
                            string sql = "INSERT INTO DangNhap  VALUES('" + txtTenDangKy.Text
                        + "' ,'" + passMD5 + "',1) ";

                            kn.Open();
                            SqlCommand them = new SqlCommand(sql, kn);
                            them.ExecuteNonQuery();
                            them.Dispose();

                            */

                            dt.TaiKhoan_Insert(txtTenDangKy.Text, passMD5, "1");

                            if (MessageBox.Show("Đăng ký thành công, bạn có muốn đi tới đăng nhập?",
                            "Đăng Ký", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                            {
                                Form_DangNhap dn = new Form_DangNhap();
                                dn.Show();
                            }
                            else
                            {
                                txtTenDangKy.Text = "";
                                txtMatKhau.Text = "";
                                txtNhapLaiMatKhau.Text = "";
                            }
                            kn.Close();
                        }
                    }
                }
                else
                {

                    MessageBox.Show("Mật khẩu bạn nhập không khớp! Vui lòng kiểm tra lại!",
                            "Đăng Ký", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtTenDangKy.Text = "";
                    txtNhapLaiMatKhau.Text = "";
                }

                kn.Close();
            }
            catch (Exception)
            {

                MessageBox.Show("Thao Tác Không Thực Hiện Được. Vui Lòng Kiểm Tra Lại!",
                            "Đăng Nhập", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Form_DangKy_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void checDk_CheckedChanged(object sender, EventArgs e)
        {
            if (checDk.Checked == true)
            {
                txtMatKhau.UseSystemPasswordChar = true;
                txtNhapLaiMatKhau.UseSystemPasswordChar = true;
            }
            else
            {
                txtMatKhau.UseSystemPasswordChar = false;
                txtNhapLaiMatKhau.UseSystemPasswordChar = false;
            }
        }
    }
}
