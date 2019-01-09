using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

namespace PL.profil
{
    public partial class hesap_dondur : System.Web.UI.UserControl
    {
        kullaniciBll kullaniciBLL = new kullaniciBll();
        kullanici _kullanici;

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici == null)
            {
                Response.Redirect("~/giris-yap/");

            }
        }
        protected void Iptal_Click(object sender, EventArgs e)
        {
            kullanici _authority = _kullanici;
            //kullaniciBLL.deletedUser(_authority.kullaniciId);
            Session.Abandon();
            Response.Redirect("~/giris-yap/");
        }
    }
}