using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PL
{
    public partial class projeler : System.Web.UI.Page
    {
        firmalarBll firmab = new firmalarBll();

        protected void Page_Load(object sender, EventArgs e)
        {

            ((HtmlGenericControl)Master.FindControl("project")).Visible = true;
            ((HtmlGenericControl)Master.FindControl("project1")).Visible = true;
            Page.MetaDescription = "Türkiye'nin her yerinden en uygun Güncel Yatırımlık Konut Projeleri kralilan.com 'da. Uydudan Gör Beğen Seç Al deneyimi yaşamak için hemen tıkla.";

        }
    }
}