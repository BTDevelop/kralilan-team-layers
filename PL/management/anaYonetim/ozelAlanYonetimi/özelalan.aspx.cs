using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.anaYonetim.ozelAlanYonetimi
{
    public partial class özelalan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ozelAlanYonetimi/listele.ascx"));
            }

            if (Request.QueryString["page"] == "ekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ozelAlanYonetimi/ekle.ascx"));
            }

            if (Request.QueryString["page"] == "duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ozelAlanYonetimi/duzenle.ascx"));
            }

            if (Request.QueryString["page"] == "alanekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ozelAlanYonetimi/alanekle.ascx"));
            }

            if (Request.QueryString["page"] == "alanduzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ozelAlanYonetimi/alanduzenle.ascx"));
            }

            if (Request.QueryString["page"] == "alanlistele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ozelAlanYonetimi/alanlistele.ascx"));
            }
        }
    }
}