using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.araclar
{
    public partial class araclar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "mesajgonder")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/araclar/mesajgonder.ascx"));
            }
            if (Request.QueryString["page"] == "gelenkutusu")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/araclar/gelenkutusu.ascx"));
            }
            if (Request.QueryString["page"] == "mesajoku")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/araclar/mesajoku.ascx"));
            }
            if (Request.QueryString["page"] == "gonderilen-kutusu")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/araclar/gonderilen-kutusu.ascx"));
            }
            if (Request.QueryString["page"] == "linkkontrol")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/araclar/linkkontrol.ascx"));
            }
        }
    }
}