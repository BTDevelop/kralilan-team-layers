using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Web.Security;
using BLL.PublicHelper;
using BLL.EncryptHelper;

namespace PL
{
    public partial class giris_yap : System.Web.UI.Page
    {
        kullaniciBll kullanicib = new kullaniciBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MetaDescription = "Sahibinden ücretsiz ilan vermek yada kurumsal mağaza açmak için giriş yapabilirsiniz.";
        }

        protected void Giris_Click(object sender, EventArgs e)
        {
            string encryptData = EncryptHelper.SHA1HashEncryption(txtSifre.Value);
            if (kullanicib.getUserAppLoginOn(txtMail.Value, encryptData))
            {           
                Response.Redirect("~/");
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }

        protected void chcBeniHatirla_CheckedChanged(object sender, EventArgs e)
        {
          
        }
    }
}