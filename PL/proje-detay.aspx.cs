using BLL;
using BLL.ReCaptchaHelper;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using PL.management.anaYonetim.projeYonetimi;
using KralilanProject.Entities;

namespace PL
{
    public partial class proje_detay : System.Web.UI.Page
    {

        public string _inproname;
        public string _incompost;
        public string _inphone;
        public string _infaks;
        public string _inaddress;
        public string _inwebsite;
        public string _inabout;
        public string _inbilgiler;
        public string _ingalery;
        public string _inprovi;
        public string _indist;
        public int _inprojeid;
        public string _inplan;
        public string _incoor;
        public string _inprop;
        public string _instplan;
        public string _inprojealan;
        public string _inkonutsayisi;
        public string _inteslim;
        public string _inshowcaseimg;

        public string _infirmaadi;
        public string _infirlogo;
        public string _infirtelefon;
        public string _infirfaks;
        public string _infirposta;
        public int _infirmid;

        List<BLL.ExternalClass.resimDataType> galery = new List<BLL.ExternalClass.resimDataType>();
        List<BLL.ExternalClass.pplanDT> plnlist = new List<BLL.ExternalClass.pplanDT>();
        List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();

        ReCaptchaHelper reCapthcaHelper = new ReCaptchaHelper();

        private IZiyaretciProjeService _ziyaretciProjeManager;
        private IProjeService _projelerManager;
        private IOzellikService _ozellikManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IFirmaService _firmaManager;
        public proje_detay()
        {
            _ziyaretciProjeManager = new ZiyaretciProjeManager(new LTSZiyaretcilerProjeDal());
            _projelerManager = new ProjeManager(new LTSProjelerDal());
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _firmaManager = new FirmaManager(new LTSFirmalarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(RouteData.Values["ProNo"].ToString()))
            {
                _inprojeid = Convert.ToInt32(RouteData.Values["ProNo"]);
                ziyaretproje ziyaretciProje = new ziyaretproje
                {
                    gpid = _inprojeid,
                    gip = Request.UserHostAddress,
                    gtarih = DateTime.Now,
                    gtip = true
                };
                _ziyaretciProjeManager.Add(ziyaretciProje);
                DAL.projeler projed = _projelerManager.Get(_inprojeid);
               
                _inproname = projed.padi;
                _incompost = projed.peposta;
                _inphone = projed.ptelefon;
                _infaks = projed.pfaks;
                _inaddress = projed.padres;
                _inwebsite = projed.pwebsite;
                _inabout = projed.phakkinda;
                _inbilgiler = projed.pbilgiler;
                _ingalery = projed.pgaleri;
                _inprovi = _ilManager.Get(Convert.ToInt32(projed.pil)).ilAdi;
                _indist = _ilceManager.Get(Convert.ToInt32(projed.pilce)).ilceAdi;
                _inplan = projed.pkatplan;
                _incoor = projed.pkoordinat;
                _inprop = projed.pozellik;
                 if(!String.IsNullOrEmpty(projed.pvaziyetplan))
                     _instplan = _inprojeid +"/"+ projed.pvaziyetplan;
                 else
                    _instplan = "afdc488e57b215a2.jpg";

                Page.Title = _inproname + " Projesi kralilan.com'da";
				Page.MetaDescription = _inproname + " Projesi ve tüm detaylarına kralilan.com'da bu sayfadan ulaşabilirisiniz.";


				galery = (List<BLL.ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(_ingalery, typeof(List<BLL.ExternalClass.resimDataType>));

                rpgalery.DataSource = galery.ToList();
                rpgalery.DataBind();

                CreateDynamicControls(_inprojeid, _inprop);

                plnlist = (List<BLL.ExternalClass.pplanDT>)toolkit.GetObjectInXml(_inplan, typeof(List<BLL.ExternalClass.pplanDT>));

                foreach (var item in plnlist)
                {
                    if (!String.IsNullOrEmpty(item.nofroom))
                        item.nofroom = DAL.toolkit.NofRoomTemp(item.nofroom);
                    else
                        item.nofroom = "-";

                    if (!String.IsNullOrEmpty(item.housing))
                        item.housing = DAL.toolkit.EstateTypeTemp(item.housing);
                    else
                        item.housing = "-";

                    if (String.IsNullOrEmpty(item.sqmeter))
                        item.sqmeter = "-";

                    if (String.IsNullOrEmpty(item.image))
                        item.image = "afdc488e57b215a2.jpg";
                    else
                        item.image = _inprojeid+"/"+item.image;

                }

                rpplan.DataSource = plnlist.ToList();
                rpplan.DataBind();

  
                txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(_inbilgiler, typeof(List<BLL.ExternalClass.girilenDataType>));

                foreach (var item in txtlist)
                {
                    if (item.ozellikId == 8756)
                        _inprojealan = item.deger;

                    if (item.ozellikId == 8757)
                        _inkonutsayisi = item.deger;

                    if (item.ozellikId == 8758)
                        if(item.deger=="check")
                            _inteslim = "Hemen Teslim";
                        else
                            _inteslim = item.deger;

                }

                firmalar company = _firmaManager.Get(Convert.ToInt32(projed.pfirmaid));
                _inshowcaseimg = galery[0].resim;
                _infirmid = company.firmaid;
                _infirmaadi = company.fadi;
                _infirlogo = company.flogo;
                _infirtelefon = company.ftelefon;
            }
        }

        public void CreateDynamicControls(int _inid, string _inproperty)
        {
            List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> slctlist = new List<BLL.ExternalClass.secilenDataType>();
            List<Ozellik> formlist = new List<Ozellik>();

            formlist = _ozellikManager.GetAllByCategoriId(1001);
            if (formlist.Count() > 0)
            {
                foreach (var item in formlist)
                {

                    String FieldName = Convert.ToString(item.OzellikAdi);
                    String FieldType = Convert.ToString(item.Tipi);
                    String FieldNum = Convert.ToString(item.OzellikId);


                    slctlist = (List<BLL.ExternalClass.secilenDataType>)DAL.toolkit.GetObjectInXml(_inproperty, typeof(List<BLL.ExternalClass.secilenDataType>));


                    HtmlGenericControl divg = new HtmlGenericControl("div");
                    bool ctrl = false;
                    if (FieldType.ToLower().Trim() == "check")
                    {
                        ctrl = false;

                        HtmlGenericControl div2 = new HtmlGenericControl("ul");
                        div2.Attributes.Add("class", "property-features checkboxes margin-top-0");

                        string[] checkarray = item.Degeri.Split('|');

                        foreach (var item1 in checkarray)
                        {

                            String chckid = item1.Split('#')[0];


                            foreach (var value in slctlist)
                            {
                                if (Convert.ToInt32(chckid) == value.deger)
                                {
                                    HtmlGenericControl divm = new HtmlGenericControl("li");
                                    divm.InnerText = item1.Split('#')[1];
                                    div2.Controls.Add(divm);
                                    ctrl = true;
                                }
                            }

                        }
                        if(ctrl==true)
                        {
                            divg.InnerHtml = @"<h3 class='desc-headline'>" + FieldName + "</h3>";
                            divg.Controls.Add(div2);

                        }
                    }

                    plfeatures.Controls.Add(divg);
                }

            }

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            var isCaptchaValid = reCapthcaHelper.Validate(encodedResponse);

            if (isCaptchaValid)
            {
                string name = Request.Form["name"];
                string surname = Request.Form["surname"];
                string email = Request.Form["mail"];
                string phone = Request.Form["phone"];
                string message = Request.Form["message"];
                string detail = "Ad: " + name + "<br/>" +
                              "Soyad: " + surname + "<br/>" +
                              "İletişim Epostası: " + email + "<br/>" +
                              "İletişim Numarası: " + phone + "<br/>" +
                              "Bildirimim: " + message + "<br/>"+
                              "Proje Numarası: " + _inprojeid + "<br/>"+
                              "Proje Adı: " + _inproname + "<br/>";
                try
                {
                    DAL.toolkit.HtmlMailSender("info@kralilan.com", "~/email-temp/single-column/build.html", "Projeyle ilgileniyorum", "Projeyle ilgileniyorum", "Editör", "Ben proje sayfasından size mail gönderdim, bana mutlaka ulaşın.", detail);
                    //ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
                    infomessage.InnerText = "Sizinle iletişim kısa sürede sağlanacaktır.";

                }
                catch (Exception)
                {
                    //ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
                    infomessage.InnerText = "İletişim bilgileri alınmadı, daha sonra tekrar deneyiniz.";

                    throw;
                }

            }
             
        }
    }
}