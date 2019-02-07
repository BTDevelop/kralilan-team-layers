using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Newtonsoft.Json;
using System.Web.UI.HtmlControls;
using BLL.ExternalClass;
using DAL;
using static DAL.toolkit;
using System.Diagnostics;
using BLL.Concrete;
using static DAL.StrategyData;
using BLL.Formatter;
using DAL.Concrete.LINQ;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class _default : System.Web.UI.Page
    {

        static int index = 0;
        public Proje ProjeView = null;
        public string ProjectPlace = null;
        public string ProjectEstateCount = null;
        public string ProjectDate = null;

        List<IlanSayi> SayilarList = new List<IlanSayi>();
        List<Ilan> SatilanlarList = new List<Ilan>();
        List<Ilan> Son48List = new List<Ilan>();
        List<Ilan> AcilVitrinList = new List<Ilan>();
        List<Ilan> AnasayfaVitrinList = new List<Ilan>();
        public Dictionary<string, string> SayilarDic = new Dictionary<string, string>();

        private readonly int TopCategoriId = 1;
        public int ProjeSayi = 0;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Request.Browser.IsMobileDevice)
                Response.Redirect("~/mobile");
        }

        private IIlanSayiService _ilanSayiManager;
        private IProjeService _projeManager;
        private IIlanService _ilanManager;
        private ISeciliDopingService _seciliDopingManager;
        private IIlanSatilanService _ilanSatilanManager;
        public _default()
        {
            _ilanSayiManager = new IlanSayiManager(new LTSIlanSayilarDal());
            _projeManager = new ProjeManager(new LTSProjelerDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
            _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());
            _ilanSatilanManager = new IlanSatilanManager(new LTSIlanSatilanDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Cache["SayilarCache"] != null)
                {
                    SayilarList = Cache["SayilarCache"] as List<IlanSayi>;
                }
                else
                {
                    SayilarList = _ilanSayiManager.GetAllCategoriByTopCategoriId(TopCategoriId);
                    Cache.Add("SayilarCache", SayilarList, null, System.Web.Caching.Cache.NoAbsoluteExpiration, new TimeSpan(0, 30, 0), System.Web.Caching.CacheItemPriority.Default, null);
                }

                if (Cache["ProjeSayiCache"] != null)
                {
                    ProjeSayi = Convert.ToInt32(Cache["ProjeSayiCache"]);
                }
                else
                {
                    ProjeSayi = _projeManager.Count();
                    Cache.Add("ProjeSayiCache", ProjeSayi, null, System.Web.Caching.Cache.NoAbsoluteExpiration, new TimeSpan(0, 30, 0), System.Web.Caching.CacheItemPriority.Default, null);
                }


                rpcategories.DataSource = SayilarList;
                rpcategories.DataBind();

                if (Cache["AnasayfaVitrinCache"] != null)
                {
                    AnasayfaVitrinList = Cache["AnasayfaVitrinCache"] as List<Ilan>;
                }
                else
                {
                    AnasayfaVitrinList = _seciliDopingManager.GetAllByDopingId(1);
                    Cache.Add("AnasayfaVitrinCache", AnasayfaVitrinList, null, System.Web.Caching.Cache.NoAbsoluteExpiration, new TimeSpan(0, 5, 0), System.Web.Caching.CacheItemPriority.Default, null);
                }

                rphomeshowcase.DataSource = AnasayfaVitrinList;
                rphomeshowcase.DataBind();


                if (Cache["AcilVitrinCache"] != null)
                {
                    AcilVitrinList = Cache["AcilVitrinCache"] as List<Ilan>;
                }
                else
                {
                    AcilVitrinList = _seciliDopingManager.GetAllByDopingId(5);
                    Cache.Add("AcilVitrinCache", AcilVitrinList, null, System.Web.Caching.Cache.NoAbsoluteExpiration, new TimeSpan(0, 15, 0), System.Web.Caching.CacheItemPriority.Default, null);
                }

                rpemergencyshowcase.DataSource = AcilVitrinList;
                rpemergencyshowcase.DataBind();

                if (Cache["Son48Cache"] != null)
                {
                    Son48List = Cache["Son48Cache"] as List<Ilan>;
                }
                else
                {
                    Son48List = _ilanManager.GetByLastDate();
                    Cache.Add("Son48Cache", Son48List, null, System.Web.Caching.Cache.NoAbsoluteExpiration, new TimeSpan(0, 15, 0), System.Web.Caching.CacheItemPriority.Default, null);
                }
                
                rplast48showcase.DataSource = Son48List;
                rplast48showcase.DataBind();

                if (Cache["SatilanlarCache"] != null)
                {
                    SatilanlarList = Cache["SatilanlarCache"] as List<Ilan>;
                }
                else
                {
                    SatilanlarList = _ilanSatilanManager.GetBySale();
                    Cache.Add("SatilanlarCache", SatilanlarList, null, System.Web.Caching.Cache.NoAbsoluteExpiration, new TimeSpan(1, 0, 0), System.Web.Caching.CacheItemPriority.Default, null);
                }

                rpsales.DataSource = SatilanlarList;
                rpsales.DataBind();


                ProjeView = _projeManager.GetProjectRandom(-1);
                if (ProjeView != null)
                {
                    List<girilenDataType> txtlist = new List<girilenDataType>();
                    txtlist = (List<girilenDataType>)toolkit.GetObjectInXml(ProjeView.ProjeBilgiler, typeof(List<girilenDataType>));
                    ProjectPlace = txtlist.Where(x => x.ozellikId == 8756).FirstOrDefault().deger;
                    ProjectEstateCount = txtlist.Where(x => x.ozellikId == 8757).FirstOrDefault().deger;
                    ProjectDate = txtlist.Where(x => x.ozellikId == 8758).FirstOrDefault().deger;
                }


                if (Cache["SayilarDicCache"] != null)
                {
                    SayilarDic = Cache["SayilarDicCache"] as Dictionary<string, string>;
                }
                else
                {
                    SayilarDic.Add("Anasayfa Vitrini", String.Format("({0:N0})", _seciliDopingManager.CountByDopingId(1)));
                    SayilarDic.Add("Arama Sonuç Vitrini", String.Format("({0:N0})", _seciliDopingManager.CountByDopingId(2)));
                    SayilarDic.Add("Acil Acil", String.Format("({0:N0})", _seciliDopingManager.CountByDopingId(5)));
                    SayilarDic.Add("Fiyatı Düşen", String.Format("({0:N0})", _seciliDopingManager.CountByDopingId(8)));
                    SayilarDic.Add("Son 48 Saat", String.Format("({0:N0})", _ilanManager.CountLastDate()));
                    SayilarDic.Add("Satılanlar", String.Format("({0:N0})", _ilanSatilanManager.Count()));
                    Cache.Add("SayilarDicCache", SayilarDic, null, System.Web.Caching.Cache.NoAbsoluteExpiration, new TimeSpan(0, 30, 0), System.Web.Caching.CacheItemPriority.Default, null);
                }
            }
        }

        public string ParsePictures(string picturesStr)
        {
            List<resimDataType> picList = new List<resimDataType>();
            picList = (List<resimDataType>)toolkit.GetObjectInXml(picturesStr, typeof(List<resimDataType>));
            if (picList.Count() > 0)
            {
                string resim = picList[0].resim;
                return resim;
            }

            return "";
        }
    }
}