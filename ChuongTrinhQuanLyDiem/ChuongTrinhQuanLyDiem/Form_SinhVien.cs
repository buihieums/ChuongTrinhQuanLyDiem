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
    public partial class Form_SinhVien : Form
    {
        public Form_SinhVien()
        {
            InitializeComponent();
        }

        QLDDataContext dt = new QLDDataContext();
        private void FormSV_Load(object sender, EventArgs e)
        {
            dtgv.AllowUserToAddRows = false;
            dtgv.ColumnHeadersDefaultCellStyle.BackColor = Color.DodgerBlue;
            dtgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dtgv.EnableHeadersVisualStyles = false;


            cbLop.DisplayMember = "TenLop";
            cbLop.ValueMember = "MaLop";
            cbLop.DataSource = dt.Lops_SelectAll();
            txtMaLop.DataBindings.Clear();
            txtMaLop.DataBindings.Add("Text", cbLop.DataSource, "MaLop");
            txtTenLop.DataBindings.Clear();
            txtTenLop.DataBindings.Add("Text", cbLop.DataSource, "TenLop");


        }

        Boolean adLop = false;
        private void btnThems_Click(object sender, EventArgs e)
        {
            dt.Lop_Insert(txtMaLop.Text, txtTenLop.Text);
            FormSV_Load(sender, e);
        }

        private void btnSuas_Click(object sender, EventArgs e)
        {
            dt.Lop_Update(txtMaLop.Text, txtTenLop.Text);
            FormSV_Load(sender, e);
        }

        private void btnXoas_Click(object sender, EventArgs e)
        {
            dt.Lop_Delete(cbLop.SelectedValue.ToString());
            FormSV_Load(sender, e);

        }

        private void cbLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtgv.DataSource = dt.SinhVien_SelectMaLop(cbLop.SelectedValue.ToString());
            txtMSV.DataBindings.Clear();
            txtMSV.DataBindings.Add("Text", dtgv.DataSource, "MSV");

            txtHoTen.DataBindings.Clear();
            txtHoTen.DataBindings.Add("Text", dtgv.DataSource, "HoTen");

            txtNgaySinh.DataBindings.Clear();
            txtNgaySinh.DataBindings.Add("Text", dtgv.DataSource, "NgaySinh");

            txtGioiTinh.DataBindings.Clear();
            txtGioiTinh.DataBindings.Add("Text", dtgv.DataSource, "GioiTinh");

            txtQueQuan.DataBindings.Clear();
            txtQueQuan.DataBindings.Add("Text", dtgv.DataSource, "QueQuan");

            txtDanToc.DataBindings.Clear();
            txtDanToc.DataBindings.Add("Text", dtgv.DataSource, "DanToc");


            dtgv.Columns[0].HeaderText = "Mã sinh viên";
            dtgv.Columns[1].HeaderText = "Họ tên";
            dtgv.Columns[2].HeaderText = "Ngày sinh";
            dtgv.Columns[3].HeaderText = "Giới tính";
            dtgv.Columns[4].HeaderText = "Dân tộc";
            dtgv.Columns[5].HeaderText = "Quê quán";
            dtgv.Columns[6].HeaderText = "Mã lớp";
            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[6].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;



        }

        private void dtgv_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dtgv_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                txtMSV.Text = dtgv.CurrentRow.Cells[0].Value.ToString();
                txtHoTen.Text = dtgv.CurrentRow.Cells[1].Value.ToString();
                txtNgaySinh.Text = dtgv.CurrentRow.Cells[2].Value.ToString();
                txtGioiTinh.Text = dtgv.CurrentRow.Cells[3].Value.ToString();
                txtDanToc.Text = dtgv.CurrentRow.Cells[4].Value.ToString();
                txtQueQuan.Text = dtgv.CurrentRow.Cells[5].Value.ToString();
                //txtMSV.Text = dtgv.CurrentRow.Cells[6].Value.ToString();} catch (Exception) { }

            }
            catch (Exception) { }
        }

        
        private void btnThem_Click(object sender, EventArgs e)
        {
            dt.SinhVien_Insert(txtMSV.Text, txtHoTen.Text, txtNgaySinh.Value, txtGioiTinh.Text, txtDanToc.Text, txtQueQuan.Text, txtMaLop.Text);
            //cbLop_SelectedIndexChanged(sender, e);
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            
                dt.SinhVien_Update(txtMSV.Text,txtHoTen.Text, txtNgaySinh.Value, txtGioiTinh.Text, txtDanToc.Text, txtQueQuan.Text);
                //cbLop_SelectedIndexChanged(sender, e);
           
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
            
        }

        private void txtTimSV_TextChanged(object sender, EventArgs e)
        {
            dtgv.DataSource = dt.SinhViens.Where(x => x.MSV.Contains(txtTimSV.Text)).ToList();
            txtMSV.DataBindings.Clear();
            txtMSV.DataBindings.Add("Text", dtgv.DataSource, "MSV");

            txtHoTen.DataBindings.Clear();
            txtHoTen.DataBindings.Add("Text", dtgv.DataSource, "HoTen");

            txtNgaySinh.DataBindings.Clear();
            txtNgaySinh.DataBindings.Add("Text", dtgv.DataSource, "NgaySinh");

            txtGioiTinh.DataBindings.Clear();
            txtGioiTinh.DataBindings.Add("Text", dtgv.DataSource, "GioiTinh");

            txtQueQuan.DataBindings.Clear();
            txtQueQuan.DataBindings.Add("Text", dtgv.DataSource, "QueQuan");

            txtDanToc.DataBindings.Clear();
            txtDanToc.DataBindings.Add("Text", dtgv.DataSource, "DanToc");


            dtgv.Columns[0].HeaderText = "Mã sinh viên";
            dtgv.Columns[1].HeaderText = "Họ tên";
            dtgv.Columns[2].HeaderText = "Ngày sinh";
            dtgv.Columns[3].HeaderText = "Giới tính";
            dtgv.Columns[4].HeaderText = "Dân tộc";
            dtgv.Columns[5].HeaderText = "Quê quán";
            dtgv.Columns[6].HeaderText = "Mã lớp";
            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[6].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {

            dt.SinhVien_Delete(txtMSV.Text);
            cbLop_SelectedIndexChanged(sender, e);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Khởi tạo Excel
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            // Khởi tạo WorkBook
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
            // Khởi tạo WorkSheet
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            worksheet = workbook.Sheets["Sheet1"];
            worksheet = workbook.ActiveSheet;
            app.Visible = true;
            // Đổ dữ liệu vào Sheet:
            worksheet.Cells[4, 1] = "DANH SÁCH SINH VIÊN LỚP "+txtTenLop.Text;

            worksheet.Cells[1, 2] = "BỘ CÔNG THƯƠNG";
            worksheet.Cells[2, 2] = "TRƯỜNG ĐẠI HỌC";
            worksheet.Cells[3, 1] = "KINH TÊ - KỸ THUẬT CÔNG NGHIỆP";

            worksheet.Cells[1, 5] = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
            worksheet.Cells[2, 5] = "Độc lập - Tự do - Hạnh phúc";
            /*
            worksheet.Cells[6, 2] = "Mã sinh viên: " + lblMSV.Text;
            worksheet.Cells[7, 2] = "Họ tên: " + lblHoTen.Text;
            worksheet.Cells[8, 2] = "Ngày sinh: " + lblNgaySinh.Text;
            worksheet.Cells[9, 2] = "Giới tính: " + lblGioiTinh.Text;
            worksheet.Cells[10, 2] = "Dân tộc: " + lblDanToc.Text;
            worksheet.Cells[11, 2] = "Quê quán: " + lblQueQuan.Text;
            */

            worksheet.Cells[6, 1] = "STT";
            worksheet.Cells[6, 2] = "Mã sinh viên";
            worksheet.Cells[6, 3] = "Họ tên";
            worksheet.Cells[6, 4] = "Ngày sinh";
            worksheet.Cells[6, 5] = "Giới tính";
            worksheet.Cells[6, 6] = "Dân tộc";
            worksheet.Cells[6, 7] = "Quê quán";

            for (int i = 0; i < dtgv.RowCount - 1; i++)
            {
                for (int j = 0; j < 6; j++)
                {
                    worksheet.Cells[i + 7, 1] = i + 1;
                    worksheet.Cells[i + 7, j + 2] = dtgv.Rows[i].Cells[j].Value;
                }
            }
            int mon = dtgv.RowCount;
            //worksheet.Cells[mon + 14, 6] = "Điểm tích lũy: " + lblDiemTichLuy.Text;
            //worksheet.Cells[mon + 15, 6] = "Xếp loại tốt nghiệp: " + lblXepLoaiTN.Text;

            // Định dang trang
            worksheet.PageSetup.Orientation = Microsoft.Office.Interop.Excel.XlPageOrientation.xlPortrait;
            worksheet.PageSetup.PaperSize = Microsoft.Office.Interop.Excel.XlPaperSize.xlPaperA4;
            worksheet.PageSetup.LeftMargin = 2;
            worksheet.PageSetup.RightMargin = 2;
            worksheet.PageSetup.TopMargin = 2;
            worksheet.PageSetup.BottomMargin = 2;
            // Định dạng cột
            worksheet.Range["A1"].ColumnWidth = 10;
            worksheet.Range["B1"].ColumnWidth = 15;
            worksheet.Range["C1"].ColumnWidth = 25;
            worksheet.Range["D1"].ColumnWidth = 10;
            worksheet.Range["E1"].ColumnWidth = 11;
            worksheet.Range["F1"].ColumnWidth = 11;
            worksheet.Range["G1"].ColumnWidth = 20;
            // Định dang font chữ
            worksheet.Range["A1", "G100"].Font.Name = "Times New Roman";
            worksheet.Range["A4", "G100"].Font.Size = 12;
            worksheet.Range["A4", "G4"].MergeCells = true;
            worksheet.Range["A4", "G4"].Font.Bold = true;
            worksheet.Range["A1", "G5"].Font.Bold = true;
            // Kẻ bảng điểm
            worksheet.Range["A6", "G" + (mon + 5)].Borders.LineStyle = 1;
            // Định dạng các dòng chữ
            worksheet.Range["A4", "A5"].HorizontalAlignment = 3;
            worksheet.Range["A6", "G6"].HorizontalAlignment = 3;

            worksheet.Range["A6", "A" + (mon + 6)].HorizontalAlignment = 3;
            worksheet.Range["D6", "D" + (mon + 5)].HorizontalAlignment = 3;
            worksheet.Range["E6", "E" + (mon + 5)].HorizontalAlignment = 3;
            worksheet.Range["F6", "F" + (mon + 5)].HorizontalAlignment = 3;
            //worksheet.Range["G13", "G" + (mon + 12)].HorizontalAlignment = 3;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            
            try
            {
                dt.SinhVien_Insert(txtMSV.Text, txtHoTen.Text, txtNgaySinh.Value, txtGioiTinh.Text, txtDanToc.Text, txtQueQuan.Text, txtMaLop.Text);
                dtgv.DataSource = dt.SinhVien_SelectMaLop(cbLop.SelectedValue.ToString());
                MessageBox.Show("Thêm thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Vui lòng kiểm tra lại dữ liệu đã nhập!", "Thêm dữ liệu thất bại",
                        MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
           
            try
            {
                dt.SinhVien_Update(txtMSV.Text, txtHoTen.Text, txtNgaySinh.Value, txtGioiTinh.Text, txtDanToc.Text, txtQueQuan.Text);
                dtgv.DataSource = dt.SinhVien_SelectMaLop(cbLop.SelectedValue.ToString());
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
            
            cbLop_SelectedIndexChanged(sender, e);
            DialogResult hoi;
            hoi = MessageBox.Show("Bạn có muốn xóa dữ liệu này không?", "Xóa dữ liệu", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (hoi == DialogResult.Yes)
            {
                try
                {
                    dt.SinhVien_Delete(txtMSV.Text);
                    MessageBox.Show("Đã xóa!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dtgv.DataSource = dt.SinhVien_SelectMaLop(cbLop.SelectedValue.ToString());
                }
                catch (Exception)
                {
                    MessageBox.Show("Không thể xác định Mã lớp học cần xóa !", "Không thể xóa");
                }
            }
        }
    }
}
