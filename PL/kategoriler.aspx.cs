using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using BLL.ExternalClass;
using BLL.Formatter;
using static BLL.seciliDopingBll;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using KralilanProject.Entities;

namespace PL
{
    public partial class kategoriler : System.Web.UI.Page
    {
        kategoriTurBll kategoriTurBLL = new kategoriTurBll();
        kategoriBll kategorib = new kategoriBll();
        seciliDopingBll seciliDpngb = new seciliDopingBll();

        List<CategoriCS> lstCategory = new List<CategoriCS>();

        public Proje ProjeView = null;
        public string ProjectPlace = null;
        public string ProjectEstateCount = null;
        public string ProjectDate = null;

        private List<IlanSayi> SayilarList = new List<IlanSayi>();
        private List<Ilan> IlanlarList = new List<Ilan>();
        public string CategoriName;
        public int CategoriId;

        public IIlanSayiService _ilanSayiManager;
        public IProjeService _projeManager;
        public ISeciliDopingService _seciliDopingManager;
        private IKategoriTurService _kategoriTurManager;
        private IKategoriService _kategoriManager;
        public kategoriler()
        {
            _ilanSayiManager = new IlanSayiManager(new LTSIlanSayilarDal()); //injection (ninject wiil create)
            _projeManager = new ProjeManager(new LTSProjelerDal());
            _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());
            _kategoriTurManager = new KategoriTurManager(new LTSKategoriTurlerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (RouteData.Values["KategoriNo"] != null)
                {
                    Response.Status = "301 Moved Permanently";
                    Response.RedirectPermanent("~/kategori/emlak-" + RouteData.Values["Kategori"]);
                }
                else if (RouteData.Values["Kategori"] != null)
                {
                    string urlParamCategory = RouteData.Values["Kategori"].ToString();
                    lstCategory = kategorib.getCategoriesFormat();
                    CategoriId = lstCategory.Where(x => x.kateogoriTip == urlParamCategory).FirstOrDefault().kategoriId;

                    ProjeView = _projeManager.GetProjectRandom(-1);
                    if (ProjeView != null)
                    {
                        List<girilenDataType> txtlist = new List<girilenDataType>();
                        txtlist = (List<girilenDataType>)toolkit.GetObjectInXml(ProjeView.ProjeBilgiler, typeof(List<girilenDataType>));
                        ProjectPlace = txtlist.Where(x => x.ozellikId == 8756).FirstOrDefault().deger;
                        ProjectEstateCount = txtlist.Where(x => x.ozellikId == 8757).FirstOrDefault().deger;
                        ProjectDate = txtlist.Where(x => x.ozellikId == 8758).FirstOrDefault().deger;
                    }
             
                    SayilarList = _ilanSayiManager.GetAllByTopCategoriId(CategoriId);

                    if (_kategoriTurManager.Get(CategoriId) != null)
                    {
                        rpTypes.DataSource = SayilarList;
                        rpTypes.DataBind();

                        //categorishwcase = (List<DopingKategoriType>)DAL.toolkit.GetObjectInXml(seciliDpngb.getAdsByDopingCatHomePage(0, 13, 1, CategoriId, xmlFormat), typeof(List<DopingKategoriType>));

                        IlanlarList = _seciliDopingManager.GetAllByCategoriShowcase(CategoriId);
                        rpcategorishowcase.DataSource = IlanlarList;
                        rpcategorishowcase.DataBind();
                    }
                    else
                    {
                        Response.Redirect("~/liste/satilik-arsa");
                    }

                }
            }

            CategoriName = _kategoriManager.Get(CategoriId).kategoriAdi;
            Page.Title = CategoriName + " Fiyatları ve Emlak İlanları kralilan.com'da";
            Page.MetaDescription = "Satılık ve Kiralık " + CategoriName.ToLower() + " ilanları ile bankadan, belediyeden, icradan, hazineden kısacası tüm kamu kurumlarından emlak ilanları kral ilan 'da";
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
