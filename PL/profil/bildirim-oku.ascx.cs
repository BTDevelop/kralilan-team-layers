using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace PL.profil
{
    public partial class bildirim_oku : System.Web.UI.UserControl
    {
        public string name = "";
        public string pic = "";
        public int userid;
        kullanici _kullanici;

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (Session["unique-site-user"] != null)
            {
                kullanici _authority = _kullanici;

                userid = _authority.kullaniciId;
                pic = _authority.profilResim;
                name = _authority.kullaniciAdSoyad;

                if (String.IsNullOrEmpty(pic))
                {
                    pic = "noUser.jpg";
                }

            }

        }
    }
}