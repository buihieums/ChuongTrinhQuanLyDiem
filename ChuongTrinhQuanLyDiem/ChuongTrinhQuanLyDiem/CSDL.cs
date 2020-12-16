using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ChuongTrinhQuanLyDiem
{
    static class CSDL
    {
        private static string DuongDan = @"Data Source=BUITRUNGHIEU;Initial Catalog=QuanLyDiemSV;Integrated Security=True";
        private static SqlConnection ketnoi()
        {
            return new SqlConnection(DuongDan);
        }
        public static DataTable bang(string sql)
        {
            SqlConnection connect = ketnoi();
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
            SqlConnection connect = ketnoi();
            connect.Open();
            SqlCommand Lk = new SqlCommand(sql, connect);
            Lk.ExecuteNonQuery();
            connect.Close();
            Lk.Dispose();
        }

    }
}
