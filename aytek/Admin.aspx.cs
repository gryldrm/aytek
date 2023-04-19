using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace aytek
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["k_ad"] != null)
                {
                    //cadyukle();

                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private void cadyukle()
        {
            //DataTable dt = dataClass.get_tbl("SELECT * FROM [tbl_koncad]");
            //GridView4.DataSource = dt;
            //GridView4.DataBind();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int drm = dataClass.ins_tbl("INSERT INTO [tbl_users] ([k_ad], [k_sifre], [k_rol]) VALUES ('" + txt_ad.Text.ToString() + "', '" + txt_sif.Text.ToString() + "', '" + dd_user.SelectedItem.Text.ToString() + "')");

            if (drm == 1)
            {
                MessageBox.Show("Kayıt başarılı...", "Kayıt İşlemi");
                GridView1.DataBind();
            }
            else
            {
                MessageBox.Show("Kayıt hatalı...", "Kayıt İşlemi");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int drm = dataClass.ins_tbl("INSERT  INTO tbl_ihtiyackat(i_kategori) VALUES (N'" + txt_kat.Text.ToString() + "')");

            if (drm == 1)
            {
                MessageBox.Show("Kayıt başarılı...", "Kayıt İşlemi");
                GridView2.DataBind();
                dd_katt.DataBind();
            }
            else
            {
                MessageBox.Show("Kayıt hatalı...", "Kayıt İşlemi");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int drm = dataClass.ins_tbl("INSERT INTO tbl_ihtiyacaltk(kat, altkat) VALUES(" + dd_katt.SelectedValue.ToString() + ", N'" + txt_altk.Text.ToString() + "')");

            if (drm == 1)
            {
                MessageBox.Show("Kayıt başarılı...", "Kayıt İşlemi");
                GridView3.DataBind();
            }
            else
            {
                MessageBox.Show("Kayıt hatalı...", "Kayıt İşlemi");
            }
        }

       

        protected void Button4_Click(object sender, EventArgs e)
        {
            int drm = dataClass.ins_tbl("INSERT INTO tbl_koncad(k_tip, k_ad, k_kon) VALUES (N'" + txtknttip.Text.ToString() + "', N'" + txtkntno.Text.ToString() + "', " + txtkntkon.Text.ToString() + ")");

            if (drm == 1)
            {
                MessageBox.Show("Kayıt başarılı...", "Kayıt İşlemi");
                GridView4.DataBind();
            }
            else
            {
                MessageBox.Show("Kayıt hatalı...", "Kayıt İşlemi");
            }
        }
    }
}