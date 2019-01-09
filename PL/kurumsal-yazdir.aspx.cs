using BLL;
using BLL.EnumHelper;
using BLL.PublicHelper;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class kurumsal_yazdir : System.Web.UI.Page
    {
        ilanBll ilanBLL = new ilanBll();
        telefonBll telefonb = new telefonBll();
        magazaTelefonBll magazaTlfb = new magazaTelefonBll();
        kullaniciBll kullanicib = new kullaniciBll();
        ozelliklerBll ozelliklerBLL = new ozelliklerBll();

        public string magazaId, kullaniciId, postResim, sellerProfil = "", link = "";
        public int whoFromId, phindex = 0, adsNumber;
        public string heading = "",
                      fromWho = "",
                      date = "",
                      location = "",
                      price = "",
                      visitor = "",
                      number = "",
                      adsType = "",
                      explanation = "",
                      profileImage = "",
                      qrlink = "",
                      sellername = "";

        public List<BLL.ExternalClass.resimDataType> resimler = new List<BLL.ExternalClass.resimDataType>();

        private IOzellikService _ozellikManager;
        private IIlanService _ilanManager;
        public kurumsal_yazdir()
        {
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected override void OnInit(EventArgs e)
        {
            adsNumber = Convert.ToInt32(RouteData.Values["IlanNo"]);
            ilan _ilan = _ilanManager.Get(adsNumber);
            qrlink = Tools.URLConverter(_ilan.baslik);
            heading = _ilan.baslik.ToString();
            location = _ilan.ilceler.ilceAdi + "<br/>" + _ilan.mahalleler.mahalleAdi;
            price = EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), _ilan.fiyatTurId.ToString())) + " " + String.Format(" {0:N0}", _ilan.fiyat);
            number = _ilan.ilanId.ToString();
            adsType = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), _ilan.ilanTurId.ToString())) + " " + _ilan.kategori.kategoriAdi;

            List<BLL.ExternalClass.girilenDataType> girilenler = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> secilenler = new List<BLL.ExternalClass.secilenDataType>();
            List<BLL.ExternalClass.detayDataType> ozellikler = new List<BLL.ExternalClass.detayDataType>();

            secilenler = (List<BLL.ExternalClass.secilenDataType>)toolkit.GetObjectInXml(_ilan.secilenOzellik, typeof(List<BLL.ExternalClass.secilenDataType>));

            foreach (var item in secilenler)
            {
                ozellikler prop = _ozellikManager.Get(item.ozellikId);
                if (prop.ozellikTipi ==  ozelliklerBll.selectVal)
                {
                    var income = new BLL.ExternalClass.detayDataType
                    {
                        ozellikAd = prop.ozellikAdi,
                        deger = ozelliklerBLL.searchPropValue(item.ozellikId, item.deger)
                    };

                    ozellikler.Add(income);
                }
            }

            girilenler = (List<BLL.ExternalClass.girilenDataType>)toolkit.GetObjectInXml(_ilan.girilenOzellik, typeof(List<BLL.ExternalClass.girilenDataType>));

            foreach (var item in girilenler)
            {
                ozellikler prop = _ozellikManager.Get(item.ozellikId);

                if (prop.ozellikTipi == ozelliklerBll.selectVal)
                {
                    var income = new BLL.ExternalClass.detayDataType
                    {
                        ozellikAd = prop.ozellikAdi,
                        deger = item.deger
                    };

                    ozellikler.Add(income);
                }
            }

            resimler = (List<BLL.ExternalClass.resimDataType>)toolkit.GetObjectInXml(_ilanManager.Get(_ilan.ilanId).resim, typeof(List<BLL.ExternalClass.resimDataType>));

            if (resimler.Count() == 0)
            {
                resimler.Add(new BLL.ExternalClass.resimDataType()
                {
                    resim = "not-found-image.jpg",
                    seciliMi = true

                });
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
