using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.anaYonetim.kullaniciYonetimi
{
    public partial class listele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/kullaniciYonetimi/listele.ascx"));
            }
            if (Request.QueryString["page"] == "ekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/kullaniciYonetimi/ekle.ascx"));
            }
            if (Request.QueryString["page"] == "duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/kullaniciYonetimi/duzenle.ascx"));
            }
        }
    }
}