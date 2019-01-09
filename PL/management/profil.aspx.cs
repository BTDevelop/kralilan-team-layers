using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

namespace PL.management
{
    public partial class profil : System.Web.UI.Page
    {
        kullaniciBll kullanicib = new kullaniciBll();
        telefonBll telefonb = new telefonBll();
        ilBll il = new ilBll();
        ilceBll ilce = new ilceBll();
        mahalleBll mahalle = new mahalleBll();
        public string name = "";
        public string rank = "";
        public string id = "";
        kullanici _kullanici;

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null)
            {
                if (!Page.IsPostBack)
                {
                    kullanici _authority = _kullanici;
                    HttpRequest _request = base.Request;
                    name = _authority.kullaniciAdSoyad;
                    rank = _authority.rol.ToString();
                    id = _authority.kullaniciId.ToString();
                    if (rank == "1")
                        rank = "Patron";
                    else if (rank == "2")
                        rank = "Yazılım Geliştirici";
                    else if (rank == "3")
                        rank = "Editör";
                }
            }
            else
            {
                Response.Redirect("~/sysLogin/syslogin.aspx");
            }
        }


    }
}