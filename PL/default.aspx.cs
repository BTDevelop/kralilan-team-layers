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

        seciliDopingBll seciliDpngObject = new seciliDopingBll();
 
        ilanBll ilanb = new ilanBll();
        projelerBll projeb = new projelerBll();

        public int projectId;
        public string projectName, projectPic, projectProv, projectDist, projectComp, projectPlace, projectDate, projectEstateCount;
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
        public _default()
        {
            _ilanSayiManager = new IlanSayiManager(new LTSIlanSayilarDal());
            _projeManager = new ProjeManager(new LTSProjelerDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
            _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                //List<IlanType> homeShowcaseDataRepeater = new List<IlanType>();
                //List<IlanType> emerShowcaseDataRepeater = new List<IlanType>();

                SayilarList = _ilanSayiManager.GetAllCategoriByTopCategoriId(TopCategoriId);
                ProjeSayi = _projeManager.Count();
                //homeShowcaseDataRepeater = (List<IlanType>)toolkit.GetObjectInXml(seciliDpngObject.getAdsByDopingId(index, 11, 1, 1, xmlFormat), typeof(List<IlanType>)); 
                //emerShowcaseDataRepeater = (List<IlanType>)toolkit.GetObjectInXml(seciliDpngObject.getAdsByDopingId(index, 11, 1, 5, xmlFormat), typeof(List<IlanType>));
                ////lastShowcaseDataRepeater = (List<IlanType>)toolkit.GetObjectInXml(seciliDpngObject.GetClassifiedByLastDate(index, 20, 1, 1, xmlFormat), typeof(List<IlanType>));
                //saleShowcaseDataRepeater = _ilanManager.GetBySale();

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


                SatilanlarList = _ilanManager.GetBySale();
                rpsales.DataSource = SatilanlarList;
                rpsales.DataBind();


                projelerBll.ProjectView _proje = projeb.getProjectRandomizer(-1, Request.UserHostAddress.ToString(), false);
                projectId = _proje.ProjeId;
                projectName = _proje.ProjeAdi;
                List<resimDataType> pics = new List<resimDataType>();
                pics = (List<resimDataType>)toolkit.GetObjectInXml(_proje.Galeri, typeof(List<resimDataType>));
                projectPic = pics.Count() > 0 ? pics[0].resim : "noImage.png";
                projectProv = _proje.IlAdi;
                projectDist = _proje.IlceAdi;

                List<girilenDataType> txtlist = new List<girilenDataType>();
                txtlist = (List<girilenDataType>)toolkit.GetObjectInXml(_proje.ProjeBilgiler, typeof(List<girilenDataType>));
                projectPlace = txtlist.Where(x => x.ozellikId == 8756).FirstOrDefault().deger;
                projectEstateCount = txtlist.Where(x => x.ozellikId == 8757).FirstOrDefault().deger;
                projectDate = txtlist.Where(x => x.ozellikId == 8758).FirstOrDefault().deger;
                if (projectDate == "check") projectDate = "Hemen Teslim";
                projectComp = _proje.FirmaLogo;
            }
        }

        public string count(int opt)
        {
            string cnt = "";
            if (opt == 1 || opt == 5 || opt == 8 || opt==2)
                cnt = String.Format("{0:N0}", _seciliDopingManager.CountByDopingId(opt));
            else
                cnt = String.Format("{0:N0}", ilanb.countOther(opt));

            return "(" + cnt + ")";
        }

        public string getShowCasePic(string picturesStr)
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