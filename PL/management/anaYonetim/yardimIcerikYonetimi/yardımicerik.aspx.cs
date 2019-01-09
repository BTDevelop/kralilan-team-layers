using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.anaYonetim.yardimIcerikYonetimi
{
    public partial class yardımIcerik : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/yardimIcerikYonetimi/listele.ascx"));
            }
            if (Request.QueryString["page"] == "yardimicerikkategori")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/yardimIcerikYonetimi/yardimicerikkategori.ascx"));
            }
            if (Request.QueryString["page"] == "ekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/yardimIcerikYonetimi/ekle.ascx"));
            }
            if (Request.QueryString["page"] == "icerikkategoriekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/yardimIcerikYonetimi/icerikkategoriekle.ascx"));
            }
        }
    }
}