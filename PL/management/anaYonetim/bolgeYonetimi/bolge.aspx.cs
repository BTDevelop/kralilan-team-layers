using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.anaYonetim.bolgeYonetimi
{
    public partial class bolgeListele : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["page"]=="listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/listele.ascx"));
            }

            if (Request.QueryString["page"] == "ekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/ekle.ascx"));
            }

            if (Request.QueryString["page"] == "duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/duzenle.ascx"));
            }

            if (Request.QueryString["page"] == "ilcelistele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/ilcelistele.ascx"));
            }

            if (Request.QueryString["page"] == "ilceekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/ilceekle.ascx"));
            }

            if (Request.QueryString["page"] == "mahallelistele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/mahallelistele.ascx"));
            }

            if (Request.QueryString["page"] == "ilceduzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/ilceduzenle.ascx"));
            }

            if (Request.QueryString["page"] == "mahalleduzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/mahalleduzenle.ascx"));
            }

            if (Request.QueryString["page"] == "mahalleekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/bolgeYonetimi/mahalleekle.ascx"));
            }

        }
    }
}                                                                                          