using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.anaYonetim.projeYonetimi
{
    public partial class proje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/projeYonetimi/listele.ascx"));
            }
            if (Request.QueryString["page"] == "duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/projeYonetimi/duzenle.ascx"));
            }

            if (Request.QueryString["page"] == "firma-listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/projeYonetimi/firma-listele.ascx"));
            }

            if (Request.QueryString["page"] == "firma-duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/projeYonetimi/firma-duzenle.ascx"));
            }
        }
    }
}