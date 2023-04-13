using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aytek
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            if (txtAd.Text != "" && txtSifre.Text != "")
            {

                string kad, ksifre;
                kad = txtAd.Text;
                ksifre = txtSifre.Text;

                SqlCommand komut = new SqlCommand();

                DataTable dt = dataClass.get_tbl("SELECT k_ad, k_sifre, k_rol FROM tbl_users WHERE (k_ad = '" + kad.ToString() + "') AND (k_sifre = '" + ksifre.ToString() + "')");



                if (dt.Rows.Count > 0)
                {
                    Session.Add("k_ad", dt.Rows[0]["k_ad"].ToString());
                    Session.Add("k_sifre", dt.Rows[0]["k_sifre"].ToString());
                    Session.Add("k_rol", dt.Rows[0]["k_rol"].ToString());

                    Response.Redirect("Anasayfa.aspx");
                }
                else
                {
                    lblDurum.Text = "Giriş Başarısız";
                }

            }
        }
    }
}