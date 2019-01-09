using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.management.genelAyarlar
{
    public partial class genelayarlar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "odemeler")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/genelAyarlar/odemeler.ascx"));
            }

            if (Request.QueryString["page"] == "vitrinucretayar")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/genelAyarlar/vitrin-ucret-ayar.ascx"));
            }

            if (Request.QueryString["page"] == "vitrinucretleri")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/genelAyarlar/vitrin-ucretleri.ascx"));
            }

            if (Request.QueryString["page"] == "magazaucretleri")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/genelAyarlar/magaza-ucretleri.ascx"));
            }

            if (Request.QueryString["page"] == "odemefatura")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/genelAyarlar/odeme-fatura.ascx"));
            }

            if (Request.QueryString["page"] == "magazaucretayar")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/genelAyarlar/magaza-ucret-ayar.ascx"));
            }
            
        }
    }
}