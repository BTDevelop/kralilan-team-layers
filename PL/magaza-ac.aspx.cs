using BLL;
using BLL.PublicHelper;
using DAL;
using Iyzipay.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class magaza_ac : System.Web.UI.Page
    {

      
        public string stdThreePriceText = "";
        public string stdSixPriceText = "";
        public string stdTwelvePriceText = "";

        double price;
        kullanici _kullanici;

        private IOdemeService _odemeManager;
        private IMagazaTelefonService _magazaTelefonManager;
        private IMagazaKullaniciService _magazaKullaniciManager;
        private IMagazaKategoriService _magazaKategoriManager;
        private IIlService _ilManager;
        private IMagazaService _magazaManager;
        public magaza_ac()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
            _magazaTelefonManager = new MagazaTelefonManager(new LTSMagazaTelefonlarDal());
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
            _magazaKategoriManager = new MagazaKategoriManager(new LTSMagazaKategorilerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null)
            {
                int kategoriId = Convert.ToInt32(Request.QueryString["cat"]);
                kategoriId = 1;
                double stdThreePrice = Convert.ToDouble(_magazaKategoriManager.GetByPackageCategoriId(kategoriId, 1, 1).fiyat);
                double stdSixPrice = Convert.ToDouble(_magazaKategoriManager.GetByPackageCategoriId(kategoriId, 2, 1).fiyat);
                double stdTwelvePrice = Convert.ToDouble(_magazaKategoriManager.GetByPackageCategoriId(kategoriId, 3, 1).fiyat);

                stdThreePriceText = (stdThreePrice).ToString();
                stdSixPriceText = (stdSixPrice).ToString();
                stdTwelvePriceText = (stdTwelvePrice).ToString();
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }


        protected void button1id_ServerClick(object sender, EventArgs e)
        {
            int kullaniciId = _kullanici.kullaniciId;
            int province1 = Convert.ToInt32(Request.Form["location1"]);
            int province2 = Convert.ToInt32(Request.Form["location2"]);
            int province3 = Convert.ToInt32(Request.Form["location3"]);
            int province4 = Convert.ToInt32(Request.Form["location4"]);
            int province5 = Convert.ToInt32(Request.Form["location5"]);


            if (_magazaKullaniciManager.Get(kullaniciId) == null)
            {
                bool valid = !String.IsNullOrEmpty(storename.Value) && !String.IsNullOrEmpty(storetextarea.Value) &&
                             (Request.Form["location1"] != "-1") && (Request.Form["location2"] != "-1") &&
                             (Request.Form["location3"] != "-1") && !String.IsNullOrEmpty(identityno.Value) &&
                             (Request.Form["location4"] != "-1") && !String.IsNullOrEmpty(location8.Value) &&
                             !String.IsNullOrEmpty(no1.Value) &&
                             !String.IsNullOrEmpty(reportName.Value) && !String.IsNullOrEmpty(reportSurname.Value) &&
                             !String.IsNullOrEmpty(reportIdentityNum.Value) && (Request.Form["location5"] != "-1") &&
                             !String.IsNullOrEmpty(billingAddress.Value);

                if (valid)
                {
                    try
                    {

                        bool corpote = Convert.ToBoolean(Convert.ToInt32(Request.Form["corpote"]));
                        string storenameVal = storename.Value;
                        string aboutVal = storetextarea.Value;
                        int province = Convert.ToInt32(Request.Form["location1"]);
                        int district = Convert.ToInt32(Request.Form["location2"]);
                        int neig = Convert.ToInt32(Request.Form["location3"]);
                        string idno = identityno.Value;
                        int tax = Convert.ToInt32(Request.Form["location4"]);

                        string reportNameVal = reportName.Value;
                        string reportSurnameVal = reportSurname.Value;
                        string reportIdentityNumVal = reportIdentityNum.Value;
                        int billingProvince = Convert.ToInt32(Request.Form["location5"]);
                        string billingAdressVal = billingAddress.Value;
                        string reportZipCodeVal = reportZipCode.Value;

                        int storekind = Convert.ToInt32(location8.Value);

                        int month = 3;

                        //string category = Request.Form["category"]=="1"?"Emlak":" ";
                        //bool corpote = Convert.ToBoolean(Convert.ToInt32(Request.Form["corpote"]));
                        //string storename = Request.Form["storename"];
                        //string about = Request.Form["storetextarea"];
                        //int province = Convert.ToInt32(Request.Form["location1"]);
                        //int district = Convert.ToInt32(Request.Form["location2"]);
                        //int neig = Convert.ToInt32(Request.Form["location3"]);
                        //string idno = Request.Form["identityno"];
                        //int tax = Convert.ToInt32(Request.Form["localtax"]);
                        //string no1 = Request.Form["no1"];
                        //string no2 = Request.Form["no2"];
                        //string sellermail = Request.Form["seller-email"];
                        //int storekind = Convert.ToInt32(Request.Form["storekind"]);
                        int storepac = Convert.ToInt32(Request.Form["optionsRadios"]);

                        //string reportName = Request.Form["reportName"];
                        //string reportSurname = Request.Form["reportSurame"];
                        //string reportIdentityNum = Request.Form["reportIdentityNum"];
                        //int billingProvince = Convert.ToInt32(Request.Form["location5"]);
                        //string billingAdress = Request.Form["billingAddress"];

                        if (storepac == 1)
                        {

                            magazaKategori _value = _magazaKategoriManager.GetByPackageCategoriId(1, 1, 1);
                            price = Convert.ToDouble(_value.fiyat);
                            storepac = Convert.ToInt32(_value.magazaKategoriId);
                            month = 3;
                        }
                        else if (storepac == 2)
                        {
                            magazaKategori _value = _magazaKategoriManager.GetByPackageCategoriId(1, 2, 1);
                            price = Convert.ToDouble(_value.fiyat);
                            storepac = Convert.ToInt32(_value.magazaKategoriId);
                            month = 6;
                        }
                        else if (storepac == 3)
                        {
                            magazaKategori _value = _magazaKategoriManager.GetByPackageCategoriId(1, 3, 1);
                            price = Convert.ToDouble(_value.fiyat);
                            storepac = Convert.ToInt32(_value.magazaKategoriId);
                            month = 12;
                        }


                        string storelogo = null;
                        HttpFileCollection updateFiles = Request.Files;
                        if (FileUpload1.HasFile)
                        {
                            HttpPostedFile file = FileUpload1.PostedFile;
                            string fileName = file.FileName;
                            string fileExtension = Path.GetExtension(fileName);
                            storelogo = Tools.URLConverter(storenameVal + "-" + DateTime.Now) + fileExtension;
                            System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                            toolkit.FixedSize(imgOrijinalResim, 300, 200, null, "magaza", storelogo);
                        }

                        DAL.magaza _magazaAdd = new DAL.magaza
                        {
                            magazaAdi = storenameVal,
                            kurumsalMi = corpote,
                            ilId = province,
                            ilceId = district,
                            mahalleId = neig,
                            vergiNo = idno,
                            vergiDaireId = tax,
                            magazaLogo = storelogo,
                            aciklama = aboutVal,
                            magazaTurId = storekind,
                            magazaKategoriId = storepac,
                            bitisTarihi = DateTime.Now.AddMonths(month)
                        };

                        _magazaManager.Add(_magazaAdd);

                        //magazab.insert(storenameVal, corpote, province, district, neig, idno, tax, storelogo, aboutVal, storekind, storepac, month);

                        magaza _magaza = _magazaManager.GetLast();
                        int storeId = _magaza.magazaId;

                        if (!String.IsNullOrEmpty(no1.Value))
                        {
                            magazaTelefon _magazaTelefon = new magazaTelefon
                            {
                                magazaId = storeId,
                                telefon = Tools.PhoneNumberOrganizer(no1.Value),
                                telefonTur = 3
                            };

                            _magazaTelefonManager.Add(_magazaTelefon);
                        }
                        //magazaTlfb.insert(storeId, Tools.PhoneNumberOrganizer(no1.Value), 3);
                        if (!String.IsNullOrEmpty(no2.Value))
                        {
                            magazaTelefon _magazaTelefon = new magazaTelefon
                            {
                                magazaId = storeId,
                                telefon = Tools.PhoneNumberOrganizer(no2.Value),
                                telefonTur = 4
                            };

                            _magazaTelefonManager.Add(_magazaTelefon);
                        }
                        //magazaTlfb.insert(storeId, Tools.PhoneNumberOrganizer(no2.Value), 4);


                        List<HttpPostedFile> files = new List<HttpPostedFile>();
                        files.Add(FileUpload2.PostedFile);
                        files.Add(FileUpload3.PostedFile);

                        toolkit.AttachmentMailSender("agent@kralilan.com", "~/email-temp/single-column/build.html", "Mağaza onay bilgilerim", "Mağaza onay bilgilerim", "Editör", storeId + " numaralı mağazamın onay işlemlerini yapınız.", storenameVal, files);

                        magazaKullanici _magazaKullanici = new magazaKullanici
                        {
                            magazaId = storeId,
                            kullaniciId = kullaniciId,
                            rol = 1
                        };

                        _magazaKullaniciManager.Add(_magazaKullanici);

                        //magazaKllb.insert(storeId, kullaniciId, 1);

                        var siparisdata = new BLL.ExternalClass.siparisDT
                        {
                            adsid = _magaza.magazaId,
                            optid = 15,
                            price = price,
                            showcasecatid = storepac
                        };

                        List<BLL.ExternalClass.siparisDT> siparisler = new List<BLL.ExternalClass.siparisDT>();

                        siparisler.Add(siparisdata);
                        //string paymentMethod = Request.Form["PaymentMethod"];
                        string paymentMethod = "1";

                        if (paymentMethod == "1")
                        {
                            string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
                            txtstr = txtstr.Replace("\r\n", "").Trim();
                            txtstr = txtstr.Replace("  ", "");
                            List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                            siparislist = (List<BLL.ExternalClass.siparisDT>)toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));


                            odemeBll odemeb = new odemeBll();
                            DAL.odeme odeme = new DAL.odeme
                            {
                                kullaniciId = kullaniciId,
                                odemeTutar = price,
                                islemId = 15,
                                odemeTipId = 1,
                                kartNo = "",
                                basariliMi = false,
                                siparis = txtstr
                            };

                            _odemeManager.Add(odeme);


                            //odemeb.insert(
                            //  kullaniciId,
                            //  price,
                            //  15,
                            //  1,
                            //  "",
                            //  false,
                            //  txtstr
                            //  );

                            DAL.odeme _odeme = _odemeManager.GetLast();
                            int order = _odeme.odemeId;
                            HttpRequest _request = base.Request;

                            try
                            {
                                StrategyIyzicoCheckoutForm _checkout = new StrategyIyzicoCheckoutForm();
                                _checkout.buyerId = _kullanici.kullaniciId.ToString();
                                _checkout.buyerIp = _request.UserHostAddress;
                                _checkout.buyerName = reportNameVal;
                                _checkout.buyerAddress = billingAdressVal;
                                _checkout.buyerCity = _ilManager.Get(province).ilAdi;
                                _checkout.buyerBasketName = "Mağaza";
                                _checkout.buyerBasketPrice = price.ToString();
                                _checkout.price = price.ToString();
                                _checkout.paidPrice = price.ToString();
                                _checkout.conversationId = "75436915264";
                                _checkout.buyerSurname = reportSurnameVal;
                                _checkout.buyerZipCode = reportZipCodeVal;
                                _checkout.buyerIdentityNumber = reportIdentityNumVal;
                                _checkout.buyerGSMNumber = "+90" + _kullanici.telefonlars.Where(x => x.kullaniciId == _kullanici.kullaniciId).FirstOrDefault().telefon;
                                _checkout.buyerEmail = _kullanici.email;
                                _checkout.buyerBasketId = order.ToString();
                                _checkout.buyerBasketCategory = "Mağaza";

                                Session["CheckoutContext"] = _checkout;

                            }
                            catch (Exception ex)
                            {

                                throw ex;
                            }

                            Response.Redirect("~/yeni-magaza-odeme");
                        }
                        if (paymentMethod == "2")
                        {

                            string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
                            txtstr = txtstr.Replace("\r\n", "").Trim();
                            txtstr = txtstr.Replace("  ", "");
                            List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                            siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));

                            odemeBll odemeb = new odemeBll();

                            double price = 0;

                            DAL.odeme odeme = new DAL.odeme
                            {
                                kullaniciId = kullaniciId,
                                odemeTutar = price,
                                islemId = 15,
                                odemeTipId = 3,
                                kartNo = "",
                                basariliMi = false,
                                siparis = txtstr
                            };

                            _odemeManager.Add(odeme);

                            //odemeb.insert(
                            //      kullaniciId,
                            //      price,
                            //      15,
                            //      3,
                            //      "",
                            //      false,
                            //      txtstr
                            //      );

                        }
                    }
                    catch (Exception ex)
                    {

                        throw (ex);
                    }
                }


            }
            else
            {

            }

        }
    }
}