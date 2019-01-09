using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class magaza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/listele.ascx"));
            }
            if (Request.QueryString["page"] == "ekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/ekle.ascx"));
            }
            if (Request.QueryString["page"] == "duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/duzenle.ascx"));
            }
            if (Request.QueryString["page"] == "kategori-secimi")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/kategori-secimi.ascx"));
            }
            if (Request.QueryString["page"] == "kullanici-listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/kullanici-listele.ascx"));
            }

            if (Request.QueryString["page"] == "magaza-detay-duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/magaza-detay-duzenle.ascx"));
            }

            if (Request.QueryString["page"] == "magaza-tipi")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/magaza-tipi.ascx"));
            }

            if (Request.QueryString["page"] == "icerik")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/icerik.ascx"));
            }

            if (Request.QueryString["page"] == "odeme")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/odeme.ascx"));
            }

            if (Request.QueryString["page"] == "duzenle-kategori-secimi")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/duzenle-kategori-secimi.ascx"));
            }

            if (Request.QueryString["page"] == "duzenle-magaza-tipi")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/duzenle-magaza-tipi.ascx"));
            }

            if (Request.QueryString["page"] == "duzenle-icerik")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/magazaYonetimi/duzenle-icerik.ascx"));
            }
        }
    }
}