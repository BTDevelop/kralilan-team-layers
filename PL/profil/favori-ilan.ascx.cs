using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class favori : System.Web.UI.UserControl
    {
        public int kullaniciId;
        kullanici _kullanici;

        private IIlanFavoriService _ilanFavoriManager;
        public favori()
        {
            _ilanFavoriManager = new IlanFavoriManager(new LTSIlanFavorilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                kullaniciId = _authority.kullaniciId;
                if (!Page.IsPostBack)
                {
                    if (Request.QueryString["dislike"] != null)
                    {
                        DAL.ilanFavori _favori = new ilanFavori
                        {
                            ilanId = Convert.ToInt32(Request.QueryString["dislike"]),
                            kullaniciId = _authority.kullaniciId
                        };

                        _ilanFavoriManager.Delete(_favori);
                    }
                }
            }
        }

    }
}