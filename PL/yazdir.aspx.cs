using BLL;
using BLL.EnumHelper;
using BLL.PublicHelper;
using DAL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using KralilanProject.Entities;

namespace PL
{
    public partial class yazdir : System.Web.UI.Page
    { 

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
                      sellername = "",
                      adsimage;

        private ITelefonService _telefonManager;
        private IOzellikService _ozellikManager;
        private IMagazaTelefonService _magazaTelefonManager;
        private IIlanService _ilanManager;
        public yazdir()
        {
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _magazaTelefonManager = new MagazaTelefonManager(new LTSMagazaTelefonlarDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        public void CreateDynamicControls()
        {
            List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> slctlist = new List<BLL.ExternalClass.secilenDataType>();
            List<Ozellik> formlist = new List<Ozellik>();

            ilan _ilan = _ilanManager.Get(Convert.ToInt32(RouteData.Values["IlanNo"]));

            formlist = _ozellikManager.GetAllByCategoriId(_ilan.kategoriId);
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
                        DAL.ilan iln = _ilanManager.Get(ilanId);

                        txtlist = (List<BLL.ExternalClass.girilenDataType>)toolkit.GetObjectInXml(iln.girilenOzellik, typeof(List<BLL.ExternalClass.girilenDataType>));
                        slctlist = (List<BLL.ExternalClass.secilenDataType>)toolkit.GetObjectInXml(iln.secilenOzellik, typeof(List<BLL.ExternalClass.secilenDataType>));
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
                                        ul1.InnerHtml = @"<tr><td><strong>" + FieldName + "</strong></td><td><span>" + value.deger + "</span></td></tr>";
                                    }
                                }
                            }
                        }
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
                                            ul1.InnerHtml = @"<tr><td><strong>" + FieldName + "</strong></td><td><span>" + item1.Split('#')[1] + "</span></td></tr>";

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

        protected override void OnInit(EventArgs e)
        {
            CreateDynamicControls();

            adsNumber = Convert.ToInt32(RouteData.Values["IlanNo"]);
            ilan _ilan = _ilanManager.Get(adsNumber);
            qrlink = Tools.URLConverter(_ilan.baslik);
            heading = _ilan.baslik.ToString();
            date = String.Format("{0:dd MMMM yyyy}", _ilan.baslangicTarihi);
            location = _ilan.iller.ilAdi + " / " + _ilan.ilceler.ilceAdi + " / " + _ilan.mahalleler.mahalleAdi;
            price = EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), _ilan.fiyatTurId.ToString())) + " " + String.Format(" {0:N0}", _ilan.fiyat);
            number = _ilan.ilanId.ToString();
            adsType = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), _ilan.ilanTurId.ToString())) + " " + _ilan.kategori.kategoriAdi;
            explanation = _ilan.aciklama;

            List<BLL.ExternalClass.resimDataType> resimler = new List<BLL.ExternalClass.resimDataType>();
            resimler = (List<BLL.ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(_ilanManager.Get(_ilan.ilanId).resim, typeof(List<BLL.ExternalClass.resimDataType>));

            if (resimler.Count() == 0)
            {
                resimler.Add(new BLL.ExternalClass.resimDataType()
                {
                    resim = "not-found-image.jpg",
                    seciliMi = true

                });

            }

            adsimage = resimler[0].resim;

            if (_ilan.magazaId == null)
            {
                fromWho = "Sahibinden";
                sellername = _ilan.kullanici.kullaniciAdSoyad;

                if (_ilan.numaraYayinlansinMi == true)
                {
                    rpuserphone.DataSource = _telefonManager.GetAllByUserId(_ilan.kullaniciId);
                    rpuserphone.DataBind();
                }

                kullaniciId = _ilan.kullaniciId.ToString();
            }
            else
            {
                magazaId = _ilan.magazaId.ToString();
                sellername = _ilan.magaza.magazaAdi;

                int strId = Convert.ToInt32(_ilan.magazaId);

                if (_ilan.numaraYayinlansinMi == true)
                {

                    rpuserphone.DataSource = _magazaTelefonManager.GetAllByStoreId(Convert.ToInt32(_ilan.magazaId));
                    rpuserphone.DataBind();
                }

                fromWho = EnumHelper.GetDescription((StoreTypeString)Enum.Parse(typeof(StoreTypeString), _ilan.magaza.magazaTur.turId.ToString()));

            }
        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}