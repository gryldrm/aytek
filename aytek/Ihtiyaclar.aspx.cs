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
    public partial class Ihtiyaclar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["k_ad"] != null)
                {
                    if (Session["d_tc"] != null)
                    {

                        txt_tc.Text = Session["d_tc"].ToString();
                        DataTable dt = dataClass.get_tbl("SELECT TOP (200) d_tc, d_ad, d_sad FROM tbl_dzede WHERE (d_tc = " + txt_tc.Text.ToString() + ")");

                        txt_adsad.Text = dt.Rows[0][1].ToString() + " " + dt.Rows[0][2].ToString();

                    }
                    else if (txt_tc.Text != "")
                    {
                        DataTable dt = dataClass.get_tbl("SELECT TOP (200) d_tc, d_ad, d_sad FROM tbl_dzede WHERE (d_tc = " + txt_tc.Text.ToString() + ")");

                        txt_adsad.Text = dt.Rows[0][1].ToString() + " " + dt.Rows[0][2].ToString();


                    }
                    katyukle();


                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private void katyukle()
        {
            DataTable dt = dataClass.get_tbl("SELECT id, i_kategori FROM tbl_ihtiyackat");

            dd_ihkat.DataSource = dt;
            // dd_kontno0.DataBind();
            dd_ihkat.DataTextField = "i_kategori";
            dd_ihkat.DataValueField = "id";
            dd_ihkat.DataBind();

            dd_ihkat.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            dd_ihkat.SelectedIndex = 0;
        }

        protected void txt_tc_TextChanged(object sender, EventArgs e)
        {


            DataTable dt = dataClass.get_tbl("SELECT TOP (200) d_tc, d_ad, d_sad FROM tbl_dzede WHERE (d_tc = " + txt_tc.Text.ToString() + ")");

            txt_adsad.Text = dt.Rows[0][1].ToString() + " " + dt.Rows[0][2].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //  

            int drm = dataClass.ins_tbl("INSERT INTO tbl_ihtiyac (d_tc, i_kat, i_ad, i_beden) VALUES(" + txt_tc.Text + ", N'" + dd_ihkat.SelectedItem.Text + "', N'" + dd_ihaltk.SelectedItem.Text + "', N'" + txt_beden.Text + "')");

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

        protected void dd_ihkat_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = dataClass.get_tbl("SELECT altkat FROM tbl_ihtiyacaltk WHERE (kat = " + dd_ihkat.SelectedValue + ")");

            dd_ihaltk.DataSource = dt;
            // dd_kontno0.DataBind();
            dd_ihaltk.DataTextField = "altkat";
            dd_ihaltk.DataValueField = "altkat";
            dd_ihaltk.DataBind();

            dd_ihaltk.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            dd_ihaltk.SelectedIndex = 0;
        }

     
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int secili;
            secili = GridView1.SelectedIndex;

            GridViewRow row = GridView1.Rows[secili];

            lbl_id.Text = row.Cells[1].Text;
            DataTable dt = dataClass.get_tbl("SELECT *  FROM [db_depremzede].[dbo].[tbl_dzede]  where id=" + row.Cells[1].Text + "");

            txt_tc.Text = dt.Rows[0][1].ToString();
            txt_adsad.Text = dt.Rows[0][2].ToString() + " " + dt.Rows[0][3].ToString();
            btn_gncl.Visible = true;
        }

        protected void btn_gncl_Click(object sender, EventArgs e)
        {
            int drm = dataClass.ins_tbl("UPDATE tbl_ihtiyac SET i_kat = N'" + dd_ihkat.SelectedItem.Text.ToString() + "', i_ad = N'" + dd_ihaltk.SelectedItem.Text.ToString() + "', i_beden = N'" + txt_beden.Text.ToString() + "' WHERE (id = " + lbl_id.Text.ToString() + ")");

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
    }
}