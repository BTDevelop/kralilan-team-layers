using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class magaza_profil : System.Web.UI.Page
    {
        public int storeClassifiedCount = 0;
        public int storeFollowerCount = 0;
        int magazaId;
        public string storeLogo = "";
        public string storecat = "";
        public string storexp = "";
        public int userid = 0;
        public int sellerProfilId;
        public int ctrlFollow;
        kullanici _kullanici;

        private IMagazaTakipciService _magazaTakipciManager;
        private IMagazaService _magazaManager;
        private IIlanService _ilanManager;
        public magaza_profil()
        {
            _magazaTakipciManager = new MagazaTakipciManager(new LTSMagazaTakipcilerDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            magazaId = Convert.ToInt32(RouteData.Values["MagazaNo"]);

            storeClassifiedCount = _ilanManager.CountByStoreId(magazaId);
            storeFollowerCount = _magazaTakipciManager.CountByStoreId(magazaId);

            DAL.magaza _magaza = _magazaManager.Get(magazaId);
            lblMagazaAdi.Text = _magaza.magazaAdi;
            Page.Title = _magaza.magazaAdi+ " satılık kiralık emlak ilanları kral ilan ‘da";
            Page.MetaDescription = _magaza.magazaAdi + " satılık daire kiralık ev işyeri arsa ve tüm emlak ilanları ile iletişim bilgileri kral ilan ‘da";
            Page.MetaKeywords = (_magaza.magazaAdi + " satılık daire kiralık ev işyeri arsa ve tüm emlak ilanları ile iletişim bilgileri kral ilan ‘da").Replace(' ', ',');

            storeLogo = _magaza.magazaLogo;
            storecat = "Emlak";
            storexp = _magaza.aciklama;
            sellerProfilId = _magaza.magazaId;

            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                userid = _kullanici.kullaniciId;

                if (_magazaTakipciManager.GetStoreUserId(sellerProfilId, _kullanici.kullaniciId) != null)
                {
                    ctrlFollow = 1;
                }
                else
                {
                    ctrlFollow = 0;
                }
            }

        }
    }
}