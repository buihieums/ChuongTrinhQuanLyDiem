using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace ChuongTrinhQuanLyDiem
{
    public partial class DoiMatKhau : Form
    {
        public DoiMatKhau()
        {
            InitializeComponent();
        }
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
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnDong_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnDoiMK_Click(object sender, EventArgs e)
        {
            string passMD5_a = txt_MatKhau.Text;
            passMD5_a = getMD5(txt_MatKhau.Text);// Chuỗi đã mã hóa sang MD5

            string passMD5_b = txt_newPass.Text;
            passMD5_b = getMD5(txt_newPass.Text);

            //string passMD5_b2 = txt_MatKhau.Text;
            //passMD5_b2 = getMD5(txt_MatKhau.Text);


            string pass = txt_newPass.Text;
            string newPass = txt_rePass.Text;
            if (txt_TaiKhoan.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập tài khoản!",
                    "Nhập liệu", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txt_TaiKhoan.Focus();

            }
            else
            if (txt_MatKhau.Text == "")
            {
                MessageBox.Show("Bạn chưa nhập mật khẩu!",
                "Nhập liệu", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txt_MatKhau.Focus();
            }
            else
            {
                string sqlAdmin = "select * from dbo.DangNhap where TaiKhoan = '" +
                        txt_TaiKhoan.Text + "' and MatKhau='" +
                        passMD5_a + " '";
                DataTable ba = CSDL.bang(sqlAdmin);
                int i = ba.Rows.Count;

                //Bảng Người Dùng

                if (i == 0)
                {
                    MessageBox.Show("Bạn nhập sai tài khoản hoặc mật khẩu !", "Đổi Mật Khẩu",
                                MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txt_TaiKhoan.Focus();
                }
                else
                {
                    if (i > 0)
                    {
                        try
                        {
                            if (pass == "" || newPass == "")
                            {
                                MessageBox.Show("Mật khẩu mới không được để trống !", "Nhập Liệu",
                                    MessageBoxButtons.OK, MessageBoxIcon.Information);

                                txt_newPass.Focus();
                            }
                            else
                            {
                                if (pass == newPass)
                                {
                                    string sqlUpdate = "update dbo.DangNhap set MatKhau ='" +
                                         passMD5_b + "' where TaiKhoan = '" +
                                         txt_TaiKhoan.Text + "' ";
                                    CSDL.ThemSuaXoa(sqlUpdate);
                                    MessageBox.Show("Bạn đã đổi mật khẩu thành công!", "Đổi Mật Khẩu"
                                            , MessageBoxButtons.OK, MessageBoxIcon.Information);

                                    this.Close();

                                }
                                else
                                {
                                    MessageBox.Show("Mật khẩu mới không khớp, vui lòng kiểm tra lại!", "Nhập Liệu"
                                                      , MessageBoxButtons.OK, MessageBoxIcon.Information);
                                }
                            }
                        }
                        catch (Exception)
                        {
                            MessageBox.Show("Thao tác không thể thực hiện được, vui lòng kiểm tra lại!", "Đổi Mật Khẩu"
                                            , MessageBoxButtons.OKCancel, MessageBoxIcon.Information);
                        }
                    }

                }
            }
        }
    }
}
