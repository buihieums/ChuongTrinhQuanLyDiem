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
    public partial class NhapDiemGV : Form
    {
        public NhapDiemGV()
        {
            InitializeComponent();
        }
        QLDDataContext dt = new QLDDataContext();
        private void NhapDiemGV_Load(object sender, EventArgs e)
        {
            cbLop.DisplayMember = "TenLop";
            cbLop.ValueMember = "MaLop";
            cbLop.DataSource = dt.Lops_SelectAll();

            cbHocKy.DisplayMember = "TenHocKy";
            cbHocKy.ValueMember = "MaHocKy";
            cbHocKy.DataSource = dt.HocKy_SelectAll();

            txtMaHK.DataBindings.Clear();
            txtMaHK.DataBindings.Add("Text", cbHocKy.DataSource, "MaHocKy");
            txtTenHK.DataBindings.Clear();
            txtTenHK.DataBindings.Add("Text", cbHocKy.DataSource, "TenHocKy");
            cbMonHP_SelectedIndexChanged(sender, e);

            //
            /*
            cbMonHP.ValueMember = "MaMon";
            cbMonHP.DisplayMember = "TenMon";
            cbMonHP.DataSource = dt.MonHoc_SelectMaHocKy(cbHocKy.SelectedValue.ToString());

            txtmaMon.DataBindings.Clear();
            txtmaMon.DataBindings.Add("Text", cbMonHP.DataSource, "MaMon");

            txtTenMon.DataBindings.Clear();
            txtTenMon.DataBindings.Add("Text", cbMonHP.DataSource, "TenMon");

            txtSoTC.DataBindings.Clear();
            txtSoTC.DataBindings.Add("Text", cbMonHP.DataSource, "TinChi");
            */
            // trang trí DTGV
            dtgv.Columns[0].HeaderText = "Mã SV";
            dtgv.Columns[1].HeaderText = "Tên sinh viên";
            dtgv.Columns[2].HeaderText = "Ngày sinh";
            dtgv.Columns[3].HeaderText = "Thường kỳ";
            //dtgv.Columns[4].HeaderText = "Kết thúc";
            //dtgv.Columns[5].HeaderText = "Điểm thi lần 2";
            //dtgv.Columns[6].HeaderText = "Trung bình môn";
            //            dtgv.Columns[7].HeaderText = "Xếp loại";


            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //dtgv.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //dtgv.Columns[6].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //dtgv.Columns[7].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void dtgv_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int i = dtgv.CurrentCell.RowIndex;
                double diem1 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells["DiemTrenLop"].Value));
                //double diem2 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells["DiemThi"].Value));
                //double diem3 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells["DiemThi2"].Value));
                //double diem4 = Convert.ToDouble(Convert.ToDouble(dtgv.Rows[i].Cells[5].Value));


                if (diem1 >= 0 && diem1 <= 100)
                {
                    if (diem1 > 10)
                    {
                        diem1 = diem1 / 10;
                        dtgv.Rows[i].Cells["DiemTrenLop"].Value = diem1;

                    }
                    dt.Diem_UpdateDiemTrenLop(diem1, txtmaMon.Text, dtgv.Rows[i].Cells["MSV"].Value.ToString());
                }
                else
                {
                    MessageBox.Show("Điểm phải nằm trong khoảng 0 đến 10, Vui lòng kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    dtgv.Rows[i].Cells["DiemTrenLop"].Value = "";
                }
                /*

                if (diem2 >= 0 && diem2 <= 100)
                {
                    if (diem2 > 10)
                    {
                        diem2 = diem2 / 10;
                        dtgv.Rows[i].Cells["DiemThi"].Value = diem2;
                    }
                    dt.Diem_UpdateDiemThi(diem2, txtmaMon.Text, dtgv.Rows[i].Cells["MSV"].Value.ToString());
                }
                else
                {
                    MessageBox.Show("Điểm phải nằm trong khoảng 0 đến 10, Vui lòng kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    dtgv.Rows[i].Cells["DiemThi"].Value = "";
                }
                */





            }
            catch (Exception)
            {
                MessageBox.Show("404");
            }
        }

        private void cbLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtgv.DataSource = dt.BangDiemQT(cbLop.SelectedValue.ToString(), txtmaMon.Text);

        }

        private void cbHocKy_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbMonHP.ValueMember = "MaMon";
            cbMonHP.DisplayMember = "TenMon";
            cbMonHP.DataSource = dt.MonHoc_SelectMaHocKy(cbHocKy.SelectedValue.ToString());

            txtmaMon.DataBindings.Clear();
            txtmaMon.DataBindings.Add("Text", cbMonHP.DataSource, "MaMon");

            txtTenMon.DataBindings.Clear();
            txtTenMon.DataBindings.Add("Text", cbMonHP.DataSource, "TenMon");

            txtSoTC.DataBindings.Clear();
            txtSoTC.DataBindings.Add("Text", cbMonHP.DataSource, "TinChi");

            cbLop_SelectedIndexChanged(sender, e);
        }

        private void cbMonHP_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbLop_SelectedIndexChanged(sender, e);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            // Duyệt qua toàn bộ môn học, sinh viên 
            // Nếu Mã môn và mã SV ko tồn tại thì Thêm Mới 


            foreach (var m in dt.MonHoc_SelectAll())
            {
                foreach (var s in dt.SinhVien_SelectAll())
                {
                    if (dt.Diem_Search(m.MaMon, s.MSV).Count() == 0)
                    {
                        dt.Diem_Insert(m.MaMon, s.MSV);
                    }
                }
            }
            MessageBox.Show("Lớp học phần đã được tạo!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            cbLop_SelectedIndexChanged(sender, e);
        }

        private void button1_Click(object sender, EventArgs e)
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
            worksheet.Cells[4, 1] = "Bảng điểm môn: " + txtTenMon.Text + " - Lớp: " + cbLop.Text;

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

            worksheet.Cells[7, 1] = "STT";
            worksheet.Cells[7, 2] = "Mã sinh viên";
            worksheet.Cells[7, 3] = "Họ tên";
            worksheet.Cells[7, 4] = "Ngày sinh ";
            worksheet.Cells[7, 5] = "Thường kỳ";
            worksheet.Cells[7, 6] = "Điểm thi";
            worksheet.Cells[7, 7] = "Điểm thi lần 2";
            worksheet.Cells[7, 8] = "Trung bình môn";

            for (int i = 0; i < dtgv.RowCount - 1; i++)
            {
                for (int j = 0; j < 7; j++)
                {
                    worksheet.Cells[i + 8, 1] = i + 1;
                    worksheet.Cells[i + 8, j + 2] = dtgv.Rows[i].Cells[j].Value;
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
            worksheet.Range["G1"].ColumnWidth = 11;
            worksheet.Range["H1"].ColumnWidth = 15;
            // Định dang font chữ
            worksheet.Range["A1", "G100"].Font.Name = "Times New Roman";
            worksheet.Range["A4", "G100"].Font.Size = 12;
            worksheet.Range["A4", "G4"].MergeCells = true;
            worksheet.Range["A4", "G4"].Font.Bold = true;
            worksheet.Range["A1", "G5"].Font.Bold = true;
            // Kẻ bảng điểm
            worksheet.Range["A7", "H" + (mon + 6)].Borders.LineStyle = 1;
            // Định dạng các dòng chữ
            worksheet.Range["A4", "A5"].HorizontalAlignment = 3;
            worksheet.Range["A6", "G6"].HorizontalAlignment = 3;

            worksheet.Range["A6", "A" + (mon + 6)].HorizontalAlignment = 3;
            worksheet.Range["D6", "D" + (mon + 6)].HorizontalAlignment = 3;
            worksheet.Range["E6", "E" + (mon + 6)].HorizontalAlignment = 3;
            worksheet.Range["F6", "F" + (mon + 6)].HorizontalAlignment = 3;
            worksheet.Range["F6", "H" + (mon + 6)].HorizontalAlignment = 3;
        }
    }
}
