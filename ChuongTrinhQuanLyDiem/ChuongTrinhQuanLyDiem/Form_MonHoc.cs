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
    public partial class Form_MonHoc : Form
    {
        public Form_MonHoc()
        {
            InitializeComponent();
        }

        QLDDataContext dt = new QLDDataContext();
        private void Form_MonHoc_Load(object sender, EventArgs e)
        {
            cbMaHocKy.DisplayMember = "MaHocKy";
            cbMaHocKy.ValueMember = "MaHocKy";
            cbMaHocKy.DataSource = dt.HocKy_SelectAll();

            dtgv.DataSource = dt.MonHoc_SelectAll();
            dtgv.Columns[0].HeaderText = "Mã môn học";
            dtgv.Columns[1].HeaderText = "Tên môn hoc";
            dtgv.Columns[2].HeaderText = "Số tín chỉ";
            dtgv.Columns[3].HeaderText = "Mã hoc kỳ";

            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                dt.MonHoc_Insert(txtmaMon.Text, txtTenMon.Text, Convert.ToInt16(txtSoTC.Text), cbMaHocKy.Text);
                dtgv.DataSource = dt.MonHoc_SelectAll();
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
            
            try
            {
                dt.MonHoc_Update(txtmaMon.Text, txtTenMon.Text, Convert.ToInt16(txtSoTC.Text));
                dtgv.DataSource = dt.MonHoc_SelectAll();
                MessageBox.Show("Đã cập nhật lại dữ liệu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Vui lòng kiểm tra lại dữ liệu đã nhập!", "Cập nhật dữ liệu thất bại",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            
            DialogResult hoi;
            hoi = MessageBox.Show("Bạn có muốn xóa dữ liệu này không?", "Xóa dữ liệu", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (hoi == DialogResult.Yes)
            {
                try
                {
                    dt.MonHoc_Delete(txtmaMon.Text);
                    MessageBox.Show("Đã xóa!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dtgv.DataSource = dt.MonHoc_SelectAll();
                }
                catch (Exception)
                {
                    MessageBox.Show("Không thể xác định Mã lớp học cần xóa !", "Không thể xóa");
                }
            }
        }

        private void dtgv_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                
                txtmaMon.Text = dtgv.CurrentRow.Cells[0].Value.ToString();
                txtTenMon.Text = dtgv.CurrentRow.Cells[1].Value.ToString();
                txtSoTC.Text = dtgv.CurrentRow.Cells[2].Value.ToString();
                cbMaHocKy.Text = dtgv.CurrentRow.Cells[3].Value.ToString();
            }
            catch { }
        }

        private void cbMaHocKy_SelectedIndexChanged(object sender, EventArgs e)
        {
            //dtgv.DataSource = dt.BangDiemHP(cbLop.SelectedValue.ToString(), txtmaMon.Text);

        }
    }
}
