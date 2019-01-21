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

                SayilarList = _ilanSayiManager.GetAllCategoriByTopCategoriId(TopCategoriId);
                ProjeSayi = _projeManager.Count();

                rpcategories.DataSource = SayilarList;
                rpcategories.DataBind();

                AnasayfaVitrinList = _seciliDopingManager.GetAllByDopingId(1);
                rphomeshowcase.DataSource = AnasayfaVitrinList;
                rphomeshowcase.DataBind();

                AcilVitrinList = _seciliDopingManager.GetAllByDopingId(5);
                rpemergencyshowcase.DataSource = AcilVitrinList;
                rpemergencyshowcase.DataBind();

              
                Son48List = _ilanManager.GetByLastDate();     
                rplast48showcase.DataSource = Son48List;
                rplast48showcase.DataBind();


                SatilanlarList = _ilanSatilanManager.GetBySale();
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
            }
        }

        public string count(int opt)
        {
            string cnt = "";
            if (opt == 1 || opt == 5 || opt == 8 || opt==2)
                cnt = String.Format("({0:N0})", _seciliDopingManager.CountByDopingId(opt));
            else if (opt == 48)
                cnt = String.Format("({0:N0})", _ilanManager.CountLastDate());
            else 
                cnt = String.Format("({0:N0})", _ilanSatilanManager.Count());

            return cnt;
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