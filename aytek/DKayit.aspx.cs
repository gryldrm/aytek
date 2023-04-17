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
    public partial class DKayit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["k_ad"] != null)
                {

                    ilyukle();
                    cinsiyetyukle();
                    konyukle();


                    datayukle();

                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private void konyukle()
        {
            //SELECT k_tip FROM tbl_koncad GROUP BY k_tip

            DataTable dt = dataClass.get_tbl("SELECT k_tip FROM tbl_koncad GROUP BY k_tip");

            dd_konteyner.DataSource = dt;
            // dd_kontno0.DataBind();
            dd_konteyner.DataTextField = "k_tip";
            dd_konteyner.DataValueField = "k_tip";
            dd_konteyner.DataBind();

            dd_konteyner.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            dd_konteyner.SelectedIndex = 0;

            //dd_konteyner0.DataSource = dt;
            //// dd_kontno0.DataBind();
            //dd_konteyner0.DataTextField = "k_tip";
            //dd_konteyner0.DataValueField = "k_tip";
            //dd_konteyner0.DataBind();

            //dd_konteyner0.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            //dd_konteyner0.SelectedIndex = 0;
        }

        private void cinsiyetyukle()
        {
            DataTable dt = dataClass.get_tbl("SELECT * FROM [tbl_cinsiyet]");

            dd_cinsiyet.DataSource = dt;
            // dd_kontno0.DataBind();
            dd_cinsiyet.DataTextField = "d_cins";
            dd_cinsiyet.DataValueField = "id";
            dd_cinsiyet.DataBind();

            dd_cinsiyet.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            dd_cinsiyet.SelectedIndex = 0;

            //dd_cinsiyet0.DataSource = dt;
            //// dd_kontno0.DataBind();
            //dd_cinsiyet0.DataTextField = "d_cins";
            //dd_cinsiyet0.DataValueField = "id";
            //dd_cinsiyet0.DataBind();

            //dd_cinsiyet0.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            //dd_cinsiyet0.SelectedIndex = 0;
        }

        private void ilyukle()
        {

            //SELECT * FROM [tbl_iller]

            DataTable dt = dataClass.get_tbl("SELECT * FROM [tbl_iller]");

            dd_gil.DataSource = dt;
            // dd_kontno0.DataBind();
            dd_gil.DataTextField = "sehir_adi";
            dd_gil.DataValueField = "id";
            dd_gil.DataBind();

            dd_gil.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            dd_gil.SelectedIndex = 0;


            //dd_gil0.DataSource = dt;
            //// dd_kontno0.DataBind();
            //dd_gil0.DataTextField = "sehir_adi";
            //dd_gil0.DataValueField = "id";
            //dd_gil0.DataBind();

            //dd_gil0.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            //dd_gil0.SelectedIndex = 0;
        }

        private void datayukle()
        {
            GridView1.DataSource = dataClass.get_tbl("SELECT TOP (1000) [İd] ,[TC] ,[Adı] ,[Soyadı] ,[Cinsiyet] ,[İl] ,[Doğum Tarihi] ,[Telefon] ,[Kaldığı Yer] ,[No] ,[Kayıt Tarihi] ,[Personel]   FROM [db_depremzede].[dbo].[View_Dzede]");
            GridView1.DataBind();

        }

        protected void btnkaydet_Click(object sender, EventArgs e)
        {
            int drm = dataClass.ins_tbl("INSERT INTO tbl_dzede (d_tc, d_ad, d_sad, d_dtar, d_gyer, d_tel, d_cins, d_kont,d_kontno, d_kuser) VALUES(" +
                txt_tc.Text + ", N'" +
                txt_ad.Text + "', N'" +
                txt_sad.Text + "', CONVERT(DATETIME, '" +
                dt_dtar.Text + "', 102), " +
                dd_gil.SelectedValue + ", " +
                txt_tel.Text + ", " +
                dd_cinsiyet.SelectedValue + ", N'" +
                dd_konteyner.SelectedValue + "', " +
                dd_kontno.SelectedValue + ", N'" +
                Session["k_ad"].ToString() + "')");

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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Panel1.Visible = true;
            btnkaydet.Visible = false;
            btn_gun.Visible = true;

            int secili;
            secili = GridView1.SelectedIndex;

            GridViewRow row = GridView1.Rows[secili];

            lblid.Text = row.Cells[1].Text;
            DataTable dt = dataClass.get_tbl("SELECT *  FROM [db_depremzede].[dbo].[tbl_dzede]  where id=" + row.Cells[1].Text + "");

            txt_tc.Text = dt.Rows[0][1].ToString();
            txt_ad.Text = dt.Rows[0][2].ToString();
            txt_sad.Text = dt.Rows[0][3].ToString();

            string ss = dt.Rows[0][4].ToString().Substring(0, 10);
            dt_dtar.Text = ss;


            dd_gil.SelectedValue = dt.Rows[0][5].ToString();
            txt_tel.Text = dt.Rows[0][6].ToString();
            dd_cinsiyet.SelectedValue = dt.Rows[0][7].ToString();
            dd_konteyner.SelectedValue = dt.Rows[0][8].ToString();



        }

        protected void btn_yk_Click(object sender, EventArgs e)
        {
            //Panel1.Visible = true;
            btnkaydet.Visible = true;
            btn_gun.Visible = false;

            lblid.Text = "";

            txt_tc.Text = "";
            txt_ad.Text = "";
            txt_sad.Text = "";

            dt_dtar.Text = "";
            dd_gil.SelectedIndex = 0;
            txt_tel.Text = "";
            dd_cinsiyet.SelectedIndex = 0;
            dd_konteyner.SelectedIndex = 0;
        }

        protected void btn_gun_Click(object sender, EventArgs e)
        {


            int drm = dataClass.ins_tbl("UPDATE TOP (200) tbl_dzede SET d_tc = " +
                txt_tc.Text + ", d_ad = N'" +
                txt_ad.Text + "', d_sad = N'" +
                txt_sad.Text + "', d_dtar = CONVERT(DATETIME, '" +
                dt_dtar.Text + "', 102), d_gyer = " +
                dd_gil.SelectedValue + ", d_tel = " +
                txt_tel.Text + ", d_cins = " +
                dd_cinsiyet.SelectedValue + ", d_kont = N'" +
                dd_konteyner.SelectedValue + "', d_kontno = " +
                dd_kontno.SelectedValue + ", d_ktar = GETDATE(), d_kuser = N'" + Session["k_ad"].ToString() + "' where id=" + lblid.Text + "");

            if (drm == 1)
            {
                MessageBox.Show("Kayıt başarılı...", "Kayıt İşlemi");
                datayukle();
            }
            else
            {
                MessageBox.Show("Kayıt hatalı...", "Kayıt İşlemi");
            }
        }

        protected void btnsor_Click(object sender, EventArgs e)
        {
            //SELECT        dbo.tbl_dzede.id AS İd, dbo.tbl_dzede.d_tc AS TC, dbo.tbl_dzede.d_ad AS Adı, dbo.tbl_dzede.d_sad AS Soyadı, dbo.tbl_cinsiyet.d_cins AS Cinsiyet, dbo.tbl_iller.sehir_adi AS İl, dbo.tbl_dzede.d_dtar AS [Doğum Tarihi],              dbo.tbl_dzede.d_tel AS Telefon, dbo.tbl_dzede.d_kont AS[Kaldığı Yer], dbo.tbl_dzede.d_kontno AS No, dbo.tbl_dzede.d_ktar AS[Kayıt Tarihi], dbo.tbl_dzede.d_kuser AS Personel FROM            dbo.tbl_dzede LEFT OUTER JOIN                          dbo.tbl_cinsiyet ON dbo.tbl_dzede.d_cins = dbo.tbl_cinsiyet.id LEFT OUTER JOIN                          dbo.tbl_iller ON dbo.tbl_dzede.d_gyer = dbo.tbl_iller.id

            //string sorgu = "";
            //string srg_select = "SELECT TOP (1000) [İd] ,[TC] ,[Adı] ,[Soyadı] ,[Cinsiyet] ,[İl] ,[Doğum Tarihi] ,[Telefon] ,[Kaldığı Yer] ,[No] ,[Kayıt Tarihi] ,[Personel]   FROM [db_depremzede].[dbo].[View_Dzede]";




            //if (txt_ad0.Text != "")
            //{
            //    sorgu += " WHERE ([Adı] = '" + txt_ad0.Text.ToString() + "')";

            //}

            //if (txt_sad0.Text != "")

            //{
            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE ([Soyadı]  = '" + txt_sad0.Text.ToString() + "') ";
            //    }
            //    else
            //    {
            //        sorgu += " AND  ([Soyadı]  = '" + txt_sad0.Text.ToString() + "') ";
            //    }

            //}

            //if (txt_tc0.Text != "")

            //{
            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE ([TC] = '" + txt_tc0.Text.ToString() + "') ";
            //    }
            //    else
            //    {
            //        sorgu += " AND  ([TC] = '" + txt_tc0.Text.ToString() + "') ";
            //    }

            //}

            //if (txt_tel0.Text != "")

            //{
            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE ([Telefon] = '" + txt_tel0.Text.ToString() + "') ";
            //    }
            //    else
            //    {
            //        sorgu += " AND  ([Telefon] = '" + txt_tel0.Text.ToString() + "') ";
            //    }

            //}

            //if (dt_dtar0.Text != "")
            //{
            //    // (d_dtar > CONVERT(DATETIME, '01.01.2010', 104))
            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE     ( d_dtar  >=CONVERT(DATETIME, '" + dt_dtar0.Text + "', 104) )  ";
            //    }
            //    else
            //    {
            //        sorgu += " AND     ( d_dtar  >=CONVERT(DATETIME, '" + dt_dtar0.Text + "', 104) )  ";
            //    }
            //}

            //if (dt_dtar1.Text != "")
            //{
            //    // (d_dtar < CONVERT(DATETIME, '01.01.2020', 104))

            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE      ( d_dtar  <=CONVERT(DATETIME, '" + dt_dtar1.Text + "', 104) )  ";
            //    }
            //    else
            //    {
            //        sorgu += " AND     ( d_dtar  <=CONVERT(DATETIME, '" + dt_dtar1.Text + "', 104) )  ";
            //    }
            //}


            //if (dd_gil0.SelectedItem.Text != "Seçiniz")
            //{
            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE ([İl] = '" + dd_gil0.SelectedItem.Text.ToString() + "') ";
            //    }
            //    else
            //    {
            //        sorgu += " AND  ([İl] = '" + dd_gil0.SelectedItem.Text.ToString() + "') ";
            //    }
            //}

            //if (dd_cinsiyet0.SelectedItem.Text != "Seçiniz")
            //{
            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE ([Cinsiyet] = '" + dd_cinsiyet0.SelectedItem.Text.ToString() + "') ";
            //    }
            //    else
            //    {
            //        sorgu += " AND  ([Cinsiyet] = '" + dd_cinsiyet0.SelectedItem.Text.ToString() + "') ";
            //    }
            //}



            //if (dd_konteyner0.SelectedItem.Text != "Seçiniz")
            //{
            //    if (sorgu.ToString() == "")
            //    {
            //        sorgu += " WHERE ([Kaldığı Yer] = '" + dd_konteyner0.SelectedItem.Text.ToString() + "') ";
            //    }
            //    else
            //    {
            //        sorgu += " AND  ([Kaldığı Yer] = '" + dd_konteyner0.SelectedItem.Text.ToString() + "') ";
            //    }

            //    if (dd_kontno0.SelectedItem.Text != "Seçiniz")
            //    {
            //        if (sorgu.ToString() == "")
            //        {
            //            sorgu += " WHERE ([No] = '" + dd_kontno0.SelectedItem.Text.ToString() + "') ";
            //        }
            //        else
            //        {
            //            sorgu += " AND  ([No] = '" + dd_kontno0.SelectedItem.Text.ToString() + "') ";
            //        }
            //    }
            //}




            //srg_select += sorgu.ToString() + " ORDER BY İd DESC";
            //DataTable dt = dataClass.get_tbl(srg_select.ToString());
            //GridView1.DataSource = null;
            //GridView1.DataSource = dt;
            //GridView1.DataBind();

            //Panel1.Visible = false;
        }



        protected void dd_konteyner0_SelectedIndexChanged(object sender, EventArgs e)
        {

            //DataTable dt = dataClass.get_tbl("SELECT k_tip, k_ad FROM tbl_koncad WHERE (k_tip = '" + dd_konteyner0.SelectedItem.Text.ToString() + "') ORDER BY k_tip, k_ad");

            //dd_kontno0.DataSource = dt;
            //// dd_kontno0.DataBind();
            //dd_kontno0.DataTextField = "k_ad";
            //dd_kontno0.DataValueField = "k_ad";
            //dd_kontno0.DataBind();

            //dd_kontno0.Items.Insert(0, new ListItem("Seçiniz", String.Empty));
            //dd_kontno0.SelectedIndex = 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Add("d_tc", txt_tc.Text.ToString());
            Response.Redirect("\\Ihtiyaclar.aspx");
        }
    }
}