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
    public partial class mesajlar : System.Web.UI.UserControl
    {
        kullanici _kullanici;
        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (!Page.IsPostBack)
            {

                if (_kullanici != null)
                {
                    kullanici _authority = _kullanici;
                }

            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            //kullanici _authority = (kullanici)Session["unique-user"];
            kullanici _authority = _kullanici;

            foreach (RepeaterItem item in mesajRepeater.Items)
            {
                CheckBox chc = (CheckBox)item.FindControl("chcSil");
                if (chc.Checked)
                {
                    HiddenField gelenData = (HiddenField)item.FindControl("hfDelete");
                    //mesajb.update(1, gelenData.Value);
                }
            }
        }

        protected void btnTumunu_Click(object sender, EventArgs e)
        {
            //kullanici _authority = (kullanici)Session["unique-user"];
            kullanici _authority = _kullanici;

            foreach (RepeaterItem item in mesajRepeater.Items)
            {
                CheckBox chc = (CheckBox)item.FindControl("chcSil");
                if (chc != null)
                {
                    if (chc.Checked == false)
                    {
                        chc.Checked = true;
                    }
                    else
                    {
                        chc.Checked = false;
                    }
                }
            }

            //mesajRepeater.DataSource = mesajb.list(6, _authority.kullaniciId);
            //mesajRepeater.DataBind();
        }
    }
}