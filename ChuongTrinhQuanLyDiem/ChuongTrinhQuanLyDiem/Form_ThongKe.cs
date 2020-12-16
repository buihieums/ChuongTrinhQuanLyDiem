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
    public partial class Form_ThongKe : Form
    {
        public Form_ThongKe()
        {
            InitializeComponent();
        }
        public string getQuyen;
        QLDDataContext dt = new QLDDataContext();
        public void HienThi()
        {
            dtgv.Columns[0].HeaderText = "Mã SV";
            dtgv.Columns[1].HeaderText = "Tên sinh viên";
            dtgv.Columns[2].HeaderText = "Ngày sinh";
            dtgv.Columns[3].HeaderText = "Thường kỳ";
            dtgv.Columns[4].HeaderText = "Điểm thi";
            dtgv.Columns[5].HeaderText = "Điểm thi lần 2";
            dtgv.Columns[6].HeaderText = "Trung bình môn";
            //dtgv.Columns[7].HeaderText = "Xếp loại";


            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[6].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //dtgv.Columns[7].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;

        }

        //QLDDataContext dt = new QLDDataContext();

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void Form_ThongKe_Load(object sender, EventArgs e)
        {

            
            cbLop.DisplayMember = "TenLop";
            cbLop.ValueMember = "MaLop";
            cbLop.DataSource = dt.Lops_SelectAll();

            cbHocKy.DisplayMember = "TenHocKy";
            cbHocKy.ValueMember = "MaHocKy";
            cbHocKy.DataSource = dt.HocKy_SelectAll();

            txtMaHK.DataBindings.Clear();
            txtMaHK.DataBindings.Add("Text", cbHocKy.DataSource, "MaHocKy");


            cbMonHP_SelectedIndexChanged(sender, e);
            dtgv.Visible = false;
            //cbMonHP_SelectedIndexChanged(sender, e);

            //this.dtgv.Columns["DiemTrenLop"].ReadOnly = true;
            //this.dtgv.Columns["DiemThi"].ReadOnly = true;
        }

        private void cbLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtgv.DataSource = dt.BangDiemHP(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            dtgv.DataSource = dt.ThongKe_ThiLai(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            //dtgv.DataSource = dt.BangDiemHP(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            //dtgv.DataSource = dt.BangDiemHP(cbLop.SelectedValue.ToString(), txtMaMon.Text);

        }

        private void cbHocKy_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbMonHP.ValueMember = "MaMon";
            cbMonHP.DisplayMember = "TenMon";
            cbMonHP.DataSource = dt.MonHoc_SelectMaHocKy(cbHocKy.SelectedValue.ToString());

            txtMaMon.DataBindings.Clear();
            txtMaMon.DataBindings.Add("Text", cbMonHP.DataSource, "MaMon");

            txtTenMon.DataBindings.Clear();
            txtTenMon.DataBindings.Add("Text", cbMonHP.DataSource, "TenMon");

            //txtSoTC.DataBindings.Clear();
            //txtSoTC.DataBindings.Add("Text", cbMonHP.DataSource, "TinChi");

            cbLop_SelectedIndexChanged(sender, e);
        }

        private void cbMonHP_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbLop_SelectedIndexChanged(sender, e);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            lblThiLai.Text = "Danh sách sinh viên thi lại "+ " Học kỳ: " + txtMaHK.Text + " - Môn học: " + txtTenMon.Text + " - Lớp: " + cbLop.Text;
            dtgv.DataSource = dt.ThongKe_ThiLai(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            HienThi();

            // lblThiLai.Text = "Danh sách sinh viên học lại" +" [ "+ " Học kỳ: " + txtMaHK.Text + " - Môn học: " + txtTenMon.Text + " - Lớp: " + cbLop.Text + " ]";
            // //dtgv.DataSource = dt.ThongKe_ThiLai(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            //  HienThi();
            dtgv.Visible = true;
            this.dtgv.Columns["DiemTrenLop"].ReadOnly = true;
            this.dtgv.Columns["DiemThi"].ReadOnly = true;
        }

        private void button4_Click(object sender, EventArgs e)
        {
           
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            lblThiLai.Text = "Danh sách sinh viên học lại" + " Học kỳ: " + txtMaHK.Text + " - Môn học: " + txtTenMon.Text + " - Lớp: " + cbLop.Text;
            dtgv.DataSource = dt.ThongKe_HocLai(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            HienThi();
        }

        private void dtgv_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int i = dtgv.CurrentCell.RowIndex;
                double diem1 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells["DiemTrenLop"].Value));
                double diem2 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells["DiemThi"].Value));
                double diem3 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells["DiemThi2"].Value));
                double diem4 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells[6].Value));

                /*
                if (diem3 >= 0 && diem3 <= 100)
                {
                    if (diem3 > 10)
                    {
                        diem3 = diem3 / 10;
                        dtgv.Rows[i].Cells["DiemThi2"].Value = diem3;
                    }
                    dt.Diem_UpdateDiemThi2(diem3, txtMaMon.Text, dtgv.Rows[i].Cells["MSV"].Value.ToString());
                    dt.Diem_UpdateDiemThi(diem3, txtMaMon.Text, dtgv.Rows[i].Cells["MSV"].Value.ToString());
                }
                else
                {
                    MessageBox.Show("Điểm phải nằm trong khoảng 0 đến 10, Vui lòng kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    dtgv.Rows[i].Cells["DiemThi"].Value = "";
                }

    */

                if (diem4 >= 4)
                {
                    
                   

                    MessageBox.Show("Không thể cập nhật điểm thi cho sinh viên đã đạt!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    dtgv.Rows[i].Cells["DiemThi2"].Value = "";
                }
                else
                {
                    if (diem3 >= 0 && diem3 <= 100)
                    {
                        dtgv.Rows[i].Cells["DiemThi"].Value = "";
                        if (diem3 > 10)
                        {
                            diem3 = diem3 / 10;
                            dtgv.Rows[i].Cells["DiemThi"].Value = "";
                            dtgv.Rows[i].Cells["DiemThi2"].Value = diem3;


                        }
                        dt.Diem_UpdateDiemThi2(diem3, txtMaMon.Text, dtgv.Rows[i].Cells["MSV"].Value.ToString());
                        dt.Diem_UpdateDiemThi(diem3, txtMaMon.Text, dtgv.Rows[i].Cells["MSV"].Value.ToString());
                    }
                    else
                    {
                        MessageBox.Show("Điểm phải nằm trong khoảng 0 đến 10, Vui lòng kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        dtgv.Rows[i].Cells["DiemThi2"].Value = "";
                    }
                }
            }
            catch (Exception)
            {
               ;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dtgv.Visible = true;
            dtgv.DataSource = dt.ThongKe_ThiLai(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            HienThi();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            lblThiLai.Text = "Danh sách sinh viên học lại" +" [ "+ " Học kỳ: " + txtMaHK.Text + " - Môn học: " + txtTenMon.Text + " - Lớp: " + cbLop.Text + " ]";
            dtgv.DataSource = dt.ThongKe_HocLai(cbLop.SelectedValue.ToString(), txtMaMon.Text);
            HienThi();
            this.dtgv.ReadOnly = true;
        }
    }
}
