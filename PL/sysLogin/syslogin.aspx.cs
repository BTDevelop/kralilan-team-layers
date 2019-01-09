using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.EncryptHelper;

namespace PL.sysLogin
{
    public partial class syslogin : System.Web.UI.Page
    {
        kullaniciBll kullanicib = new kullaniciBll();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void chcBeniHatirla_CheckedChanged(object sender, EventArgs e)
        {
            if (txtMail.Value != null && txtSifre.Value != null)
            {
              
            }
        }

        protected void Giris_Click(object sender, EventArgs e)
        {
            string encryptData = EncryptHelper.SHA1HashEncryption(txtSifre.Value);
            if (kullanicib.getUserLoginOn(txtMail.Value, encryptData))
            {
                Response.Redirect("~/management/default.aspx");
            }
            else
            {
                Response.Redirect("~/sysLogin/syslogin.aspx");
            }
        }
    }
}