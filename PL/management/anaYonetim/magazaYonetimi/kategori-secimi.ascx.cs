using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class ekle_detay : System.Web.UI.UserControl
    {
        kategoriBll kategorib = new kategoriBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["sto"]!=null)
            {
                if (!Page.IsPostBack)
                {
                    //rdKategori.DataSource = kategorib.list(0);
                    //rdKategori.DataTextField = "kategoriAdi";
                    //rdKategori.DataValueField = "kategoriId";
                    //rdKategori.DataBind();
                }
            }
        }

        protected void devam_Click(object sender, EventArgs e)
        {
            if(Request.Form["daterange"] != null)
            {
                Response.Redirect("~/management/anaYonetim/magazaYonetimi/magaza.aspx?page=magaza-tipi&sto="+Request.QueryString["sto"]+"&cat="+ Request.Form["daterange"]);
            }
        }
    }
}