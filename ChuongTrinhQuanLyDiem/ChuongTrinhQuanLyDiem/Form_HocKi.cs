﻿using System;
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
    public partial class Form_HocKi : Form
    {
        public Form_HocKi()
        {
            InitializeComponent();
        }

        QLDDataContext dt = new QLDDataContext();
        private void HocKi_Load(object sender, EventArgs e)
        {
            dtgv.DataSource = dt.HocKy_SelectAll();

            dtgv.Columns[0].HeaderText = "Mã học kỳ";
            dtgv.Columns[1].HeaderText = "Tên học kỳ";

            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try {
                dt.HocKy_Insert(txtMaHocKy.Text, txtTenHocKy.Text);
                dtgv.DataSource = dt.HocKy_SelectAll();
                MessageBox.Show("Thêm thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            } catch (Exception) {
                MessageBox.Show("Vui lòng kiểm tra lại dữ liệu đã nhập!", "Thêm dữ liệu thất bại",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                dt.HocKy_Update(txtTenHocKy.Text, txtMaHocKy.Text);
                dtgv.DataSource = dt.HocKy_SelectAll();
                MessageBox.Show("Đã cập nhật lại thông tin học kỳ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
                    dt.HocKy_Delete(txtMaHocKy.Text);
                    MessageBox.Show("Đã xóa!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dtgv.DataSource = dt.HocKy_SelectAll();
                }
                catch (Exception)
                {
                    MessageBox.Show("Không thể xác định Mã học kỳ cần xóa !", "Không thể xóa");
                }
            }

            
        }

        private void dtgv_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            try {
                txtMaHocKy.Text = dtgv.CurrentRow.Cells[0].Value.ToString();
                txtTenHocKy.Text = dtgv.CurrentRow.Cells[1].Value.ToString();
            } catch { }
            
        }
    }
}
