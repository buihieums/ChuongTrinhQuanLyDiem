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
    public partial class Form_QuanLyTaiKhoan : Form
    {
        public Form_QuanLyTaiKhoan()
        {
            InitializeComponent();
        }
        QLDDataContext dt = new QLDDataContext();
        private void Form_QuanLyTaiKhoan_Load(object sender, EventArgs e)
        {
            dtgv.DataSource = dt.DangNhap_SelectAll();

            dtgv.Columns[0].HeaderText = "Tên tài khoản";
            dtgv.Columns[1].HeaderText = "Mật khẩu";
            dtgv.Columns[2].HeaderText = "Mã quyền";

            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult hoi;
            hoi = MessageBox.Show("Bạn có muốn xóa dữ liệu này không?", "Xóa dữ liệu", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (hoi == DialogResult.Yes)
            {
                try
                {
                    dt.TaiKhoan_Delete(txtmaMon.Text);
                    MessageBox.Show("Đã xóa!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dtgv.DataSource = dt.TaiKhoan_SelectAll();
                }
                catch (Exception)
                {
                    MessageBox.Show("Không thể xác định tên tài khoản cần xóa !", "Không thể xóa");
                }
            }
        }

        private void dtgv_CellEnter(object sender, DataGridViewCellEventArgs e)
        {

            try
            {
                txtmaMon.Text = dtgv.CurrentRow.Cells[0].Value.ToString();
                txtTenMon.Text = dtgv.CurrentRow.Cells[1].Value.ToString();
                txtMaQuyen.Text = dtgv.CurrentRow.Cells[2].Value.ToString();
            }
            catch { }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                dt.TaiKhoan_Insert(txtmaMon.Text, txtTenMon.Text,txtMaQuyen.Text);
                dtgv.DataSource = dt.TaiKhoan_SelectAll();
                MessageBox.Show("Thêm thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Vui lòng kiểm tra lại dữ liệu đã nhập!", "Thêm dữ liệu thất bại",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Hệ thống hiện chưa cho phép thay đổi thông tin đăng nhập của người dùng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
