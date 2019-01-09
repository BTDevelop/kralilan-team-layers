using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.profil
{
    public partial class odemeler : System.Web.UI.UserControl
    {
        public int kullaniciId;
        kullanici _kullanici;

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;
                kullaniciId = _authority.kullaniciId;
            }
        }
    }
}