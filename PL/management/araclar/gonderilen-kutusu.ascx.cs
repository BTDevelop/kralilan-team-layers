using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace PL.management.araclar
{
    public partial class gönderilen_kutusu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["unique-user"] != null)
            {
                kullanici _authority = (kullanici)Session["unique-user"];
                //mesajRepeater.DataSource = mesajb.list(7, _authority.kullaniciId);
                //mesajRepeater.DataBind();
            }

        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            kullanici _authority = (kullanici)Session["unique-user"];

            foreach (RepeaterItem item in mesajRepeater.Items)
            {
                CheckBox chc = (CheckBox)item.FindControl("chcSil");
                if (chc.Checked)
                {
                    HiddenField gelenData = (HiddenField)item.FindControl("hfDelete");
                    //mesajb.update(2, gelenData.Value);
                }
            }
            //mesajRepeater.DataSource = mesajb.list(7, _authority.kullaniciId);
            //mesajRepeater.DataBind();
        }
    }
}