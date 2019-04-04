using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BLL.Concrete;
using BLL.ExternalClass;
using BLL.PublicHelper;
using BLL.EnumHelper;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using KralilanProject.Entities;

namespace PL
{
    public partial class ilan_bilgi_detay : System.Web.UI.Page
    {
        kullanici _kullanici;
        public List<resimDataType> resimler = new List<resimDataType>();
        private List<Ilan> BakilanlarList = new List<Ilan>();
        ilan _ilan;

        public string magazaId, postResim, sellerProfil = "", link = "", classifiedURI, provName = "", districtName = "", neighName = "";
        public int whoFromId, phindex = 0, kullaniciId;
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
                      sellername = "",
                      adsId = "";


        public string userName = "", email = "";

        public Proje ProjeView = null;
        public string ProjectPlace = null;
        public string ProjectEstateCount = null;
        public string ProjectDate = null;

        private IProjeService _projeManager;
        private IZiyaretciService _ziyaretciManager;
        private ITelefonService _telefonManager;
        private IOzellikService _ozellikManager;
        private IMahalleService _mahalleManager;
        private IMagazaTurService _magazaTurManager;
        private IKategoriService _kategoriManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IKullaniciService _kullaniciManager;
        private IMagazaService _magazaManager;
        private IIlanService _ilanManager;
        private IIlanSatilanService _ilanSatilanManager;
        private IZiyaretciProjeService _ziyaretciProjeManager;
        private IIlanBakilanService _ilanBakilanManager;
        public ilan_bilgi_detay()
        {
            _projeManager = new ProjeManager(new LTSProjelerDal());
            _ziyaretciManager = new ZiyaretciManager(new LTSZiyaretcilerDal());
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _magazaTurManager = new MagazaTurManager(new LTSMagazaTurlerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
            _ilanSatilanManager = new IlanSatilanManager(new LTSIlanSatilanDal());
            _ziyaretciProjeManager = new ZiyaretciProjeManager(new LTSZiyaretcilerProjeDal());
            _ilanBakilanManager = new IlanBakilanManager(new LTSIlanBakilanlarDal());
        }

        protected override void OnInit(EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            int urlIlanId = Convert.ToInt32(RouteData.Values["IlanNo"]);
            _ilan = _ilanManager.Get(urlIlanId);
            if (_ilan == null || _ilan.silindiMi == true)
            {
                var satilan = _ilanSatilanManager.Get(urlIlanId);
                if (satilan != null)
                {
                    if (_kullanici != null)
                    {
                        if (_kullanici.rol < 4 || _kullanici.kredi > 0)
                        {
                            if (_kullanici.kredi > 0)
                            {
                                var value = _ilanBakilanManager.GetByAdsUserId(satilan.ilanId, _kullanici.kullaniciId);
                                if (value == null)
                                {
                                    _ilanBakilanManager.Add(new ilanBakilanlar { kullaniciId = _kullanici.kullaniciId, ilanId = satilan.ilanId });
                                    _kullaniciManager.UpdateJetonByUserId(_kullanici.kullaniciId, Convert.ToInt32(_kullanici.kredi--));
                                }
                            }

                            _ilan = new ilan
                            {
                                ilanId = satilan.ilanId,
                                satildiMi = satilan.satildiMi,
                                aciklama = satilan.aciklama,
                                baslangicTarihi = satilan.baslangicTarihi,
                                baslik = satilan.baslik,
                                bitisTarihi = satilan.bitisTarihi,
                                fiyat = satilan.fiyat,
                                fiyatTurId = satilan.fiyatTurId,
                                fiyatiDustu = satilan.fiyatiDustu,
                                girilenOzellik = satilan.girilenOzellik,
                                ilId = satilan.ilId,
                                ilceId = satilan.ilceId,
                                ilanTurId = satilan.ilanTurId,
                                ilat = satilan.ilat,
                                ilng = satilan.ilng,
                                kategoriId = satilan.kategoriId,
                                koordinat = satilan.koordinat,
                                kullaniciId = satilan.kullaniciId,
                                magazaId = satilan.magazaId,
                                mahalleId = satilan.mahalleId,
                                onay = satilan.onay,
                                numaraYayinlansinMi = satilan.numaraYayinlansinMi,
                                pasifMi = satilan.pasifMi,
                                resim = satilan.resim,
                                silindiMi = satilan.silindiMi,
                                ziyaretci = satilan.ziyaretci,
                                secilenOzellik = satilan.secilenOzellik,

                            };
                        }
                        else
                        {
                            _ilan = new ilan
                            {
                                ilanId = satilan.ilanId,
                                satildiMi = satilan.satildiMi,
                                aciklama = "Açıklama Gizlendi.",
                                baslangicTarihi = satilan.baslangicTarihi,
                                baslik = "Başlık Gizlendi.",
                                bitisTarihi = satilan.bitisTarihi,
                                fiyat = 0,
                                fiyatTurId = satilan.fiyatTurId,
                                fiyatiDustu = satilan.fiyatiDustu,
                                girilenOzellik = satilan.girilenOzellik,
                                ilId = satilan.ilId,
                                ilceId = satilan.ilceId,
                                ilanTurId = satilan.ilanTurId,
                                ilat = satilan.ilat,
                                ilng = satilan.ilng,
                                kategoriId = satilan.kategoriId,
                                koordinat = satilan.koordinat,
                                kullaniciId = satilan.kullaniciId,
                                magazaId = satilan.magazaId,
                                mahalleId = satilan.mahalleId,
                                onay = satilan.onay,
                                numaraYayinlansinMi = false,
                                pasifMi = satilan.pasifMi,
                                resim = satilan.resim,
                                silindiMi = satilan.silindiMi,
                                ziyaretci = satilan.ziyaretci,
                                secilenOzellik = satilan.secilenOzellik,

                            };

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "none", "ShowCreditUserAds();", true);

                        }
                    }
                    else
                    {
                        _ilan = new ilan
                        {
                            ilanId = satilan.ilanId,
                            satildiMi = satilan.satildiMi,
                            aciklama = "Açıklama Gizlendi.",
                            baslangicTarihi = satilan.baslangicTarihi,
                            baslik = "Başlık Gizlendi.",
                            bitisTarihi = satilan.bitisTarihi,
                            fiyat = 0,
                            fiyatTurId = satilan.fiyatTurId,
                            fiyatiDustu = satilan.fiyatiDustu,
                            girilenOzellik = satilan.girilenOzellik,
                            ilId = satilan.ilId,
                            ilceId = satilan.ilceId,
                            ilanTurId = satilan.ilanTurId,
                            ilat = satilan.ilat,
                            ilng = satilan.ilng,
                            kategoriId = satilan.kategoriId,
                            koordinat = satilan.koordinat,
                            kullaniciId = satilan.kullaniciId,
                            magazaId = satilan.magazaId,
                            mahalleId = satilan.mahalleId,
                            onay = satilan.onay,
                            numaraYayinlansinMi = false,
                            pasifMi = satilan.pasifMi,
                            resim = satilan.resim,
                            silindiMi = satilan.silindiMi,
                            ziyaretci = satilan.ziyaretci,
                            secilenOzellik = satilan.secilenOzellik,

                        };

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "none", "ShowCreditUserAds();", true);

                    }
                }
                else
                {
                    Response.Redirect("~/");
                }
            }

            CreateDynamicControls();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAds();
        }

        public void GetAds()
        {
            ziyaretci _ziyaretci = new ziyaretci
            {
                ipAdres = Request.UserHostAddress,
                ilanId = _ilan.ilanId,
                sonGirisTarihi = DateTime.Now.Date
            };
            _ziyaretciManager.Add(_ziyaretci);
            visitor = _ziyaretciManager.Count(_ilan.ilanId) + " kişi görüntüledi";

            heading = _ilan.baslik;
            date = String.Format("{0:dd MMMM yyyy}", _ilan.baslangicTarihi);
            provName = _ilManager.Get(_ilan.ilId).ilAdi;
            districtName = _ilceManager.Get(_ilan.ilceId).ilceAdi;
            neighName = _mahalleManager.Get(_ilan.mahalleId).mahalleAdi;
            location = provName + " / " + districtName + " / " + neighName;
            price = _ilan.fiyat == 0 ? "Fiyat Belirtilmemiş" : EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), _ilan.fiyatTurId.ToString())) + " " + String.Format(" {0:N0}", _ilan.fiyat);
            number = _ilan.ilanId.ToString();
            adsType = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), _ilan.ilanTurId.ToString())) + " " + _kategoriManager.Get(_ilan.kategoriId).kategoriAdi;
            explanation = _ilan.aciklama;
            adsId = _ilan.ilanId.ToString();
            resimler = (List<resimDataType>)toolkit.GetObjectInXml(_ilan.resim, typeof(List<resimDataType>));

            intro.Visible = false; if (Convert.ToBoolean(_ilan.satildiMi)) intro.Visible = true;

            if (resimler.Count() == 0)
            {
                resimler.Add(new resimDataType()
                {
                    resim = "not-found-image.jpg",
                    seciliMi = true
                });

                rpbxslider.DataSource = resimler;
                rpbxslider.DataBind();
                rpbxpager.Visible = false;
            }
            else
            {
                postResim = resimler[0].resim;

                rpbxslider.DataSource = resimler.ToList();
                rpbxslider.DataBind();
                rpbxpager.DataSource = resimler.ToList();
                rpbxpager.DataBind();
            }


            messageAuth.Visible = false;
            messageNonAuth.Visible = true;

            if (_kullanici != null)
            {
                userName = _kullanici.kullaniciAdSoyad;
                email = _kullanici.email;
                senderEmail.Value = _kullanici.email;
                recipientName.Value = _kullanici.kullaniciAdSoyad;

                messageAuth.Visible = true;
                messageNonAuth.Visible = false;
            }

            kullanici _user = _kullaniciManager.Get(_ilan.kullaniciId);

            if (_ilan.magazaId == null)
            {
                fromWho = "Sahibinden";
                link = "/satici/" + _user.kullaniciId + "/" + Tools.URLConverter(_user.kullaniciAdSoyad) + "/";
                whoFromId = 0;
                sellername = _user.kullaniciAdSoyad;
                profileImage = (_user.profilResim == null ? "default-images/no-user.jpg" : "profil/" + _user.profilResim);


                kullaniciId = _user.kullaniciId;
            }
            else
            {
                magaza _store = _magazaManager.Get(Convert.ToInt32(_ilan.magazaId));
                link = "/magaza/" + _store.magazaId + "/" + Tools.URLConverter(_store.magazaAdi) + "/";

                magazaId = _store.magazaId.ToString();
                sellername = _store.magazaAdi;

                profileImage = "default-images/no-store.jpg";

                if (!String.IsNullOrEmpty(_store.magazaLogo))
                {
                    profileImage = "ads-providers/" + _store.magazaLogo;
                }

                //if (_ilan.numaraYayinlansinMi == true)
                //{
                //    rpuserphone.DataSource = magazaTlfb.list(_store.magazaId);
                //    rpuserphone.DataBind();
                //}
                fromWho = EnumHelper.GetDescription((StoreTypeString)Enum.Parse(typeof(StoreTypeString),
                                    _magazaTurManager.Get(Convert.ToInt32(_store.magazaTurId)).turId.ToString()));
                whoFromId = Convert.ToInt32(_magazaTurManager.Get(Convert.ToInt32(_store.magazaTurId)).turId);

                if (whoFromId != 7 && whoFromId != 8)
                {
                    messageAuth.Visible = false;
                    messageNonAuth.Visible = false;
                }

                if (whoFromId == 5)
                {
                    infoModal.Visible = true;
                }
            }

            if (_ilan.numaraYayinlansinMi == true)
            {
                rpuserphone.DataSource = _telefonManager.GetAllByUserId(_user.kullaniciId);
                rpuserphone.DataBind();
            }

            ProjeView = _projeManager.GetProjectRandom(_ilan.ilId);
            if (ProjeView != null)
            {
                List<girilenDataType> txtlist = new List<girilenDataType>();
                txtlist = (List<girilenDataType>)toolkit.GetObjectInXml(ProjeView.ProjeBilgiler,
                    typeof(List<girilenDataType>));
                ProjectPlace = txtlist.Where(x => x.ozellikId == 8756).FirstOrDefault().deger;
                ProjectEstateCount = txtlist.Where(x => x.ozellikId == 8757).FirstOrDefault().deger;
                ProjectDate = txtlist.Where(x => x.ozellikId == 8758).FirstOrDefault().deger;
                ziyaretproje ziyaretciProje = new ziyaretproje
                {
                    gpid = ProjeView.ProjeId,
                    gip = Request.UserHostAddress,
                    gtarih = DateTime.Now,
                    gtip = false
                };
                _ziyaretciProjeManager.Add(ziyaretciProje);
            }
            else ProjeBox.Visible = false;


            BakilanlarList = _ilanManager.GetByLocationRound(_ilan.ilId, _ilan.ilceId);
            rpNearPosition.DataSource = BakilanlarList;
            rpNearPosition.DataBind();


            Page.Title = provName + " " + districtName + " " + fromWho + " " + adsType + " #" + adsId;
            Page.MetaDescription = provName + " " + districtName + " " + neighName + " " + fromWho + " " + adsType + String.Format(" {0:N0}", _ilan.fiyat) + " TL " + "ilan detay ve iletişim bilgileri için tıklayın kralilan.com #" + number;
            Page.MetaKeywords = fromWho + "," + adsType + "," + "Emlak" + "," + provName + "," + districtName + "," + neighName;

        }

        public void CreateDynamicControls()
        {
            List<girilenDataType> txtlist = new List<girilenDataType>();
            List<secilenDataType> slctlist = new List<secilenDataType>();
            List<Ozellik> formlist = new List<Ozellik>();
            try
            {
                formlist = _ozellikManager.GetAllByCategoriId(_ilan.kategoriId);

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            if (formlist.Count() > 0)
            {
                foreach (var item in formlist)
                {
                    String FieldName = Convert.ToString(item.OzellikAdi);
                    String FieldType = Convert.ToString(item.Tipi);
                    String FieldNum = Convert.ToString(item.OzellikId);

                    if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
                    {
                        int ilanId = Convert.ToInt32(RouteData.Values["IlanNo"].ToString());
                        ilan iln = _ilan;

                        txtlist = (List<girilenDataType>)toolkit.GetObjectInXml(iln.girilenOzellik, typeof(List<girilenDataType>));
                        slctlist = (List<secilenDataType>)toolkit.GetObjectInXml(iln.secilenOzellik, typeof(List<secilenDataType>));
                    }

                    HtmlGenericControl ul1 = new HtmlGenericControl("ul");

                    if (FieldType.ToLower().Trim() == "text")
                    {
                        if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
                        {
                            if (item.DetayMi)
                            {
                                foreach (var value in txtlist)
                                {
                                    if (Convert.ToInt32(FieldNum) == value.ozellikId)
                                    {
                                        ul1.InnerHtml = "<div class='media'><div class='media-body'><span class='data-type'>" + FieldName + "</span><span class='media-heading'>" + value.deger + "</span></div></div>";
                                    }
                                }
                            }
                        }
                    }
                    else if (FieldType.ToLower().Trim() == "check")
                    {
                        HtmlGenericControl td1 = new HtmlGenericControl("div");
                        td1.Attributes.Add("class", "form-group");

                        HtmlGenericControl div1 = new HtmlGenericControl("div");
                        div1.Attributes.Add("class", "box box-default collapsed-box box-solid");
                        td1.Controls.Add(div1);
                        div1.InnerHtml = @"<div class='box-header with-border'>
                                        <h3 class='box-title'>" + FieldName + @"</h3>
                                        <div class='box-tools pull-right'>
                                            <button class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-plus'></i></button>
                                        </div>
                                        <!-- /.box-tools -->
                                        </div>";

                        HtmlGenericControl div2 = new HtmlGenericControl("div");
                        div2.Attributes.Add("class", "box-body");
                        div1.Controls.Add(div2);

                        HtmlGenericControl div3 = new HtmlGenericControl("div");
                        div3.Attributes.Add("class", "form-group");
                        div2.Controls.Add(div3);

                        string[] checkarray = item.Degeri.Split('|');

                        foreach (var item1 in checkarray)
                        {

                            HtmlGenericControl div4 = new HtmlGenericControl("div");
                            div4.Attributes.Add("class", "col-md-3 col-xs-6");
                            div3.Controls.Add(div4);

                            HtmlGenericControl div5 = new HtmlGenericControl("div");
                            div5.Attributes.Add("class", "checkbox icheck");
                            div4.Controls.Add(div5);

                            String chckid = item1.Split('#')[0];

                            CheckBox chkbox = new CheckBox();
                            chkbox.ID = "chk" + item1.Split('#')[1] + item1.Split('#')[0];
                            chkbox.Attributes.Add("name", FieldNum);
                            chkbox.Attributes.Add("value", chckid);
                            chkbox.Attributes.Add("type", "checkbox");
                            chkbox.Text = item1.Split('#')[1];

                            if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
                            {
                                foreach (var value in slctlist)
                                {

                                    if (Convert.ToInt32(chckid) == value.deger)
                                    {
                                        chkbox.Checked = true;
                                    }
                                }
                            }

                            div5.Controls.Add(chkbox);
                        }

                        placeholder.Controls.Add(td1);
                    }
                    else if (FieldType.ToLower().Trim() == "select")
                    {
                        string[] array = item.Degeri.Split('|');

                        if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
                        {
                            foreach (var value in slctlist)
                            {
                                if (Convert.ToInt32(FieldNum) == value.ozellikId)
                                {
                                    foreach (var item1 in array)
                                    {
                                        if (value.deger == Convert.ToInt32(item1.Split('#')[0]))
                                        {
                                            ul1.InnerHtml = "<div class='media'><div class='media-body'><span class='data-type'>" + FieldName + "</span><span class='media-heading'>" + item1.Split('#')[1] + "</span></div></div>";

                                        }
                                    }

                                }

                            }
                        }

                    }

                    PlaceHolder1.Controls.Add(ul1);
                }

            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            try
            {
                if (_kullanici == null)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup2();", true);
                }
                else
                {
                    classifiedURI = "https://www.kralilan.com/ilan/" + Tools.URLConverter(heading) + "/" + adsId + "/" + "detay";
                    string userMail = _kullaniciManager.Get(kullaniciId).email;
                    toolkit.HtmlMailMessageSender(userMail, senderEmail.Value, "~/email-temp/three-cols-images/build.html", location + "İlanı için 1 e-posta alındı.", location + "İlanınız için 1 mesaj alındı.", heading, price, _kullanici.kullaniciAdSoyad, "Mesaj", location, "https://www.kralilan.com/upload/ilan/" + postResim, classifiedURI);
                    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
                throw;
            }
        }

        protected void InformationMail_ServerClick(object sender, EventArgs e)
        {
            try
            {
                classifiedURI = "https://www.kralilan.com/ilan/" + Tools.URLConverter(heading) + "/" + adsId + "/" + "detay";
                string userOffer = "<b>Teklif Veren Adı</b> " + infoName.Value + "<br/>" + "<b>Teklif Veren Eposta</b> " + infoEposta.Value + "<br/>" + "<b>Teklif Veren TCKN</b> " + infoIdentity.Value + "<br/>" + "<b>Teklif Veren Telefonu</b> " + infoPhone.Value +
                                   "<br/>" + "<b>Teklif Veren Teklifi</b>" + infoOffer.Value;
                toolkit.HtmlMailMessageSender("info@kralilan.com", infoEposta.Value , "~/email-temp/three-cols-images/build.html", location + "İlan için teklif e-postası alındı.", location + "İlan için teklif mesajı alındı.", heading, price, "Kralilan", userOffer, location, "https://www.kralilan.com/upload/ilan/" + postResim, classifiedURI);
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showSuccess();", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showFailure();", true);
                Console.WriteLine(ex);
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
