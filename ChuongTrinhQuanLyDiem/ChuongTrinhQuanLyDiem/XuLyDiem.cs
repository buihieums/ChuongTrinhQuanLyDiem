using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChuongTrinhQuanLyDiem
{
    class XuLyDiem
    {
        public double DiemSo(Double diem)
        {
            double d;
            if (diem >= 8.5)
                d = 4;
            else if (diem >= 7.8)
                d = 3.5;
            else if (diem >= 7.0)
                d = 3;
            else if (diem >= 6.3)
                d = 2.5;
            else if (diem >= 5.5)
                d = 2;
            else if (diem >= 4.8)
                d = 1.5;
            else if (diem >= 4.0)
                d = 1;
            else d = 0;
            return d;
        }


        public String DiemChu(Double diem)
        {
            string d;
            if (diem >= 8.5)
                d = "A - Giỏi";
            else if (diem >= 7.8)
                d = "B+ - Khá Giỏi";
            else if (diem >= 7.0)
                d = "B - Khá";
            else if (diem >= 6.3)
                d = "C+ - Trung bình Khá";
            else if (diem >= 5.5)
                d = "C - Trung bình";
            else if (diem >= 4.8)
                d = "D+ - Trung bình yếu";
            else if (diem >= 4.0)
                d = "D - Yếu";
            else d = "F - Học lại";
            return d;
        }

        public String XepLoaiTN(Double diem)
        {
            string xl;
            if (diem >= 3.6)
                xl = "Xuất sắc";
            else if (diem >= 3.2)
                xl = "Giỏi";
            else if (diem >= 2.5)
                xl = "Khá";
            else if (diem >= 2.3)
                xl = "Trung bình khá";
            else if (diem >= 2.0)
                xl = "Trung bình";
            else 
                xl = "Chưa đạt điều kiện xét";
            return xl;
        }

    }
}
