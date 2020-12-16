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
    public partial class Form_BangDiem : Form
    {
        public Form_BangDiem()
        {
            InitializeComponent();
        }

        QLDDataContext dt = new QLDDataContext();
        XuLyDiem xl = new XuLyDiem();

        private void BangDiem_Load(object sender, EventArgs e)
        {
            MessageBox.Show("Hãy click vào tên sinh viên để xem bảng điểm chi tiết!", "Hướng dẫn tra cứu", MessageBoxButtons.OK, MessageBoxIcon.Information);
            cbLop.ValueMember = "MaLop";
            cbLop.DisplayMember = "TenLop";
            cbLop.DataSource = dt.Lops_SelectAll();
           // dtgv.Columns[6].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //dtgv.Columns[7].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void cbLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            treeViewSV.Nodes.Clear();
            TreeNode nutGoc = new TreeNode();
            nutGoc.Text = "Chọn sinh viên";
            treeViewSV.Nodes.Add(nutGoc);

            foreach (var r in dt.SinhVien_SelectMaLop(cbLop.SelectedValue.ToString()))
            {
                TreeNode node = new TreeNode();
                node.Name = r.MSV;
                node.Text = r.HoTen;
                treeViewSV.Nodes.Add(node);
            }
            treeViewSV.ExpandAll();
        }

        private void treeViewSV_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {

            foreach (var r in dt.SinhVien_SelectID(e.Node.Name))
            {
                lblMSV.Text = e.Node.Name;
                lblHoTen.Text = r.HoTen;
                lblNgaySinh.Text = r.NgaySinh.ToString();
                lblGioiTinh.Text = r.GioiTinh;
                lblDanToc.Text = r.DanToc;
                lblQueQuan.Text = r.QueQuan;
            }

            var table = new DataTable();
            DataColumnCollection col = table.Columns;
            if (!col.Contains("MaMon"))
                table.Columns.Add("MaMon", typeof(string));
            if (!col.Contains("TenMon"))
                table.Columns.Add("TenMon", typeof(string));
            if (!col.Contains("TinChi"))
                table.Columns.Add("TinChi", typeof(string));
            if (!col.Contains("DiemTBMon"))
                table.Columns.Add("DiemTBMon", typeof(string));
            if (!col.Contains("DiemSo"))
                table.Columns.Add("DiemSo", typeof(string));
            if (!col.Contains("DiemChu"))
                table.Columns.Add("DiemChu", typeof(string));
            


            Double tong = 0;
            int SoTC = 0;

            foreach(var m in dt.MonHoc_SelectAll())
            {
                DataRow r = table.NewRow();
                r["MaMon"] = m.MaMon;
                r["TenMon"] = m.TenMon;
                r["TinChi"] = m.TinChi;

                SoTC += Convert.ToInt32(m.TinChi);
                foreach(var d in dt.Diem_Search(m.MaMon, e.Node.Name))
                {
                    if(d.DiemThi2 == null)
                    {
                        //r["DiemTBM"] =  ((d.DiemTrenLop)*0.4) + ((d.DiemThi) * 0.6);
                        //r["DiemChu"] = xl.DiemChu(Convert.ToDouble(((d.DiemTrenLop) * 0.4) + ((d.DiemThi) * 0.6)));
                        //r["DiemSo"] = xl.DiemChu(Convert.ToDouble(((d.DiemTrenLop) * 0.4) + ((d.DiemThi) * 0.6)));

                        r["DiemTBMon"] = ((d.DiemTrenLop) * 0.4) + ((d.DiemThi) * 0.6);
                        r["DiemSo"] = xl.DiemSo(Convert.ToDouble(((d.DiemTrenLop) * 0.4) + ((d.DiemThi) * 0.6)));
                        r["DiemChu"] = xl.DiemChu(Convert.ToDouble(((d.DiemTrenLop) * 0.4) + ((d.DiemThi) * 0.6)));
                        
                        tong += xl.DiemSo(Convert.ToDouble(((d.DiemTrenLop) * 0.4) + ((d.DiemThi) * 0.6))) * Convert.ToDouble(m.TinChi);
                    }
                    else
                    {

                    }
                }

                table.Rows.Add(r);
            }
            Double DiemTichLuy = Math.Round(tong / SoTC, 2);
            lblDiemTichLuy.Text = DiemTichLuy.ToString();
            lblXepLoaiTN.Text = xl.XepLoaiTN(DiemTichLuy);
            dtgv.DataSource = table;

            dtgv.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dtgv.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;

            dtgv.Columns[0].HeaderText = "Mã học phần";
            dtgv.Columns[1].HeaderText = "Tên học phần";
            dtgv.Columns[2].HeaderText = "Số tín chỉ";
            dtgv.Columns[3].HeaderText = "Trung bình môn (Hệ 10)";
            dtgv.Columns[4].HeaderText = "Trung bình môn (Hệ 4)";
            dtgv.Columns[5].HeaderText = "Xếp loại";
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
            worksheet.Cells[4, 1] = "BẢNG ĐIỂM SINH VIÊN";

            worksheet.Cells[1, 2] = "BỘ CÔNG THƯƠNG";
            worksheet.Cells[2, 2] = "TRƯỜNG ĐẠI HỌC";
            worksheet.Cells[3, 1] = "KINH TÊ - KỸ THUẬT CÔNG NGHIỆP";

            worksheet.Cells[1, 5] = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
            worksheet.Cells[2, 5] = "Độc lập - Tự do - Hạnh phúc";

            worksheet.Cells[6, 2] = "Mã sinh viên: " + lblMSV.Text;
            worksheet.Cells[7, 2] = "Họ tên: " + lblHoTen.Text;
            worksheet.Cells[8, 2] = "Ngày sinh: " + lblNgaySinh.Text;
            worksheet.Cells[9, 2] = "Giới tính: " + lblGioiTinh.Text;
            worksheet.Cells[10, 2] = "Dân tộc: " + lblDanToc.Text;
            worksheet.Cells[11, 2] = "Quê quán: " + lblQueQuan.Text;

            worksheet.Cells[13, 1] = "STT";
            worksheet.Cells[13, 2] = "Mã môn";
            worksheet.Cells[13, 3] = "Tên môn";
            worksheet.Cells[13, 4] = "Số tín chỉ";
            worksheet.Cells[13, 5] = "Điểm hệ 10";
            worksheet.Cells[13, 6] = "Điểm hệ 4";
            worksheet.Cells[13, 7] = "Xếp loại";

            for(int i = 0; i< dtgv.RowCount -1; i++)
            {
                for(int j = 0; j<6; j++)
                {
                    worksheet.Cells[i + 14, 1] = i + 1;
                    worksheet.Cells[i + 14, j + 2] = dtgv.Rows[i].Cells[j].Value;
                }
            }
            int mon = dtgv.RowCount;
            worksheet.Cells[mon + 14, 6] ="Điểm tích lũy: " +lblDiemTichLuy.Text;
            worksheet.Cells[mon + 15, 6] = "Xếp loại tốt nghiệp: "+lblXepLoaiTN.Text;
                
            // Định dang trang
            worksheet.PageSetup.Orientation = Microsoft.Office.Interop.Excel.XlPageOrientation.xlPortrait;
            worksheet.PageSetup.PaperSize = Microsoft.Office.Interop.Excel.XlPaperSize.xlPaperA4;
            worksheet.PageSetup.LeftMargin = 2;
            worksheet.PageSetup.RightMargin = 2;
            worksheet.PageSetup.TopMargin = 2;
            worksheet.PageSetup.BottomMargin = 2;
            // Định dạng cột
            worksheet.Range["A1"].ColumnWidth = 10;
            worksheet.Range["B1"].ColumnWidth = 10;
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
            worksheet.Range["A1", "G13"].Font.Bold = true;
            // Kẻ bảng điểm
            worksheet.Range["A13", "G" + (mon + 12)].Borders.LineStyle = 1;
            // Định dạng các dòng chữ
            worksheet.Range["A4", "A12"].HorizontalAlignment = 3;
            worksheet.Range["A13", "G13"].HorizontalAlignment = 3;

            worksheet.Range["A13", "A"+(mon+13)].HorizontalAlignment = 3;
            worksheet.Range["D13", "D" + (mon + 12)].HorizontalAlignment = 3;
            worksheet.Range["E13", "E" + (mon + 12)].HorizontalAlignment = 3;
            worksheet.Range["F13", "F" + (mon + 12)].HorizontalAlignment = 3;
            //worksheet.Range["G13", "G" + (mon + 12)].HorizontalAlignment = 3;

        }
    }
}
