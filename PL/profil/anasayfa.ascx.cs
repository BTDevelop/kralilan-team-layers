using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using BLL.EnumHelper;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class anasayfa : System.Web.UI.UserControl
    {
        ilanBll ilanb = new ilanBll();
        kullaniciBll kullanicib = new kullaniciBll();
        ilanFavoriBll ilanFavb = new ilanFavoriBll();
        magazaTakipciBll magazaTkpb = new magazaTakipciBll();
        kullanici _kullanici;
        ilBll ilBLL = new ilBll();
        ilceBll ilceBLL = new ilceBll();
        mahalleBll mahalleBLL = new mahalleBll();
        kategoriBll kategoriBLL = new kategoriBll();

        public string userProfilePic = "",
                      classifiedPic = "",
                      userName = "",
                      classifiedDate = "",
                      classifiedCity = "",
                      classifiedDist = "",
                      classifiedNeig = "",
                      classifiedTitle = "",
                      classifiedPrice = "",
                      classifiedPriceKind = "",
                      classifiedId = "",
                      classifiedType = "",
                      classifiedCategori="";
                       
                                               
        public int    userClassified,
                      userFollowerStore,
                      userClassifiedFavorite;

        private IMahalleService _mahalleManager;
        private IMagazaTakipciService _magazaTakipciManager;
        private IKategoriService _kategoriManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IIlanFavoriService _ilanFavoriManager;
        private IIlanService _ilanManager;

        public anasayfa()
        {
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _magazaTakipciManager = new MagazaTakipciManager(new LTSMagazaTakipcilerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _ilanFavoriManager = new IlanFavoriManager(new LTSIlanFavorilerDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                DAL.ilan _ilan = _ilanManager.GetLastByUserId(_authority.kullaniciId);

                if (_ilan != null)
                {
                    classifiedId = _ilan.ilanId.ToString();
                    classifiedTitle = _ilan.baslik;
                    classifiedDate = String.Format("{0:dd MMMM yyyy}", _ilan.bitisTarihi);
                    classifiedCategori = _kategoriManager.Get(_ilan.kategoriId).kategoriAdi;
                    classifiedCity = _ilManager.Get(_ilan.ilId).ilAdi;
                    classifiedDist = _ilceManager.Get(_ilan.ilceId).ilceAdi;
                    classifiedNeig = _mahalleManager.Get(_ilan.mahalleId).mahalleAdi;
                    classifiedPrice = String.Format(" {0:N0}", _ilan.fiyat);
                    classifiedPriceKind = EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), _ilan.fiyatTurId.ToString()));
                    classifiedType = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), _ilan.ilanTurId.ToString()));
                    string resdata = _ilan.resim;
                    BLL.ExternalClass.resimDataType seciliresim = new BLL.ExternalClass.resimDataType();
                    if (resdata != null)
                    {
                        List<BLL.ExternalClass.resimDataType> resler = new List<BLL.ExternalClass.resimDataType>();
                        resler = (List<BLL.ExternalClass.resimDataType>)toolkit.GetObjectInXml(resdata, typeof(List<BLL.ExternalClass.resimDataType>));

                        if (resler.Count() == 0)
                        {
                            seciliresim.resim = "noImage.jpg";
                        }
                        else
                        {
                            foreach (BLL.ExternalClass.resimDataType rs in resler)
                            {
                                if (rs.seciliMi)
                                {
                                    seciliresim.resim = "thmb_" + rs.resim;
                                    seciliresim.seciliMi = true;
                                }
                            }
                        }
                    }
                    else
                    {
                        seciliresim.resim = "noImage.jpg";
                    }
                    classifiedPic = seciliresim.resim;

                    userName = _authority.kullaniciAdSoyad;
                    userProfilePic = _authority.profilResim == null ? "noUser.jpg" : _authority.profilResim;
                    userClassified = kullanicib.countAdsByUserId(_authority.kullaniciId);
                    userClassifiedFavorite = _ilanFavoriManager.Count(_authority.kullaniciId);
                    userFollowerStore = _magazaTakipciManager.CountByUserId(_authority.kullaniciId);
                    enSonİlan.Visible = true;
                }
                else
                {
                    enSonİlan.Visible = false;
                }
            }
        }
    }
}