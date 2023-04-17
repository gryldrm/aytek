using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
//using System.Windows.Controls;
//using TextBox = System.Windows.Controls.TextBox;

namespace aytek
{

    public class dataClass
    {
         
        internal static SqlConnection db_baglanti()
        {

            SqlConnection baglanti = new SqlConnection("Data Source=.;Initial Catalog=db_depremzede;Integrated Security=True");

            return baglanti;
        }
   
        internal static DataTable get_tbl(string srg)
        {
           
            SqlDataAdapter adaptor;
            DataTable dt = new DataTable();
            adaptor = new SqlDataAdapter(srg.ToString(), db_baglanti()) ;
            adaptor.Fill(dt);

            return dt;
                        
        }

        internal static int ins_tbl(string v)
        {
            SqlConnection con = db_baglanti();
            SqlCommand cmd = new SqlCommand(v.ToString(), con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            return 1;
        }
        internal static string trh_con(string text)
        {
            DateTime dt = DateTime.Parse(text.ToString());
            string gun = dt.Day.ToString();
            string ay = dt.Month.ToString();
            string yil = dt.Year.ToString();

            text = yil.ToString() + "-" + ay.ToString() + "-" + gun.ToString();
            return text.ToString();
        }


    }
}
