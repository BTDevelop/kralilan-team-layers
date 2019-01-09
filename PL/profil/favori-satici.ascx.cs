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
    public partial class favori_satici : System.Web.UI.UserControl
    {
        kullaniciTakipciBll kllTkpb = new kullaniciTakipciBll();
        public int kullaniciId;
        kullanici _kullanici;

        private IKullaniciTakipService _kullaniciTakipManager;
        public favori_satici()
        {
            _kullaniciTakipManager = new KullaniciTakipManager(new LTSKullaniciTakipcilerDal());
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
            
                    if (Request.QueryString["nofollow"] != null)
                    {
                        kullaniciTakip _kullaniciTakip = new kullaniciTakip
                        {
                            kullaniciId = kullaniciId,
                            takipciId = _authority.kullaniciId
                        };
                        _kullaniciTakipManager.Delete(_kullaniciTakip);
                    }

                }
            }
        }
    }
}