using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.diger
{
    public partial class diger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "404")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/diger/404.ascx"));
            }
            if (Request.QueryString["page"] == "500")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/diger/500.ascx"));
            }
        }
    }
}