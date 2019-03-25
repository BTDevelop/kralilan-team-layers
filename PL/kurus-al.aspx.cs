using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class kurus_al : System.Web.UI.Page
    {
        private kullanici _kullanici = null;

        private IOdemeService _odemeManager;
        private IIlService _ilManager;
        public kurus_al()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        double price;
        int jetonCount = 2;

        protected void Button1_Click(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici!= null)
            {

                if (Request.Form["method"] != "-1")
                {
                    if (Request.Form["method"] == "1")
                    {
                        price = 5;
                    }

                    if (Request.Form["method"] == "2")
                    {
                        price = 25;
                        jetonCount = 10;
                    }

                    if (Request.Form["method"] == "3")
                    {
                        price = 50;
                        jetonCount = 25;
                    }

                    if (Request.Form["method"] == "4")
                    {
                        price = 80;
                        jetonCount = 50;
                    }

                    if (Request.Form["method"] == "5")
                    {
                        price = 140;
                        jetonCount = 100;
                    }

                    if (Request.Form["method"] == "6")
                    {
                        price = 325;
                        jetonCount = 250;
                    }

                    if (Request.Form["method"] == "7")
                    {
                        price = 600;
                        jetonCount = 500;
                    }

                    if (Request.Form["method"] == "8")
                    {
                        price = 1000;
                        jetonCount = 1000;
                    }

                    odemeBll odemeb = new odemeBll();
                    int islemId = 15;
                    int odemeTip = 3;
                    int kullaniciId = ((kullanici)Session["unique-site-user"]).kullaniciId;

                    DAL.odeme odeme = new DAL.odeme
                    {
                        kullaniciId = kullaniciId,
                        odemeTutar = price,
                        islemId = islemId,
                        odemeTipId = odemeTip,
                        kartNo = null,
                        basariliMi = false,
                        siparis = ""
                    };
                     
                    _odemeManager.Add(odeme);

                    DAL.odeme _odeme = _odemeManager.GetLast();
                    int order = _odeme.odemeId;
                    HttpRequest _request = base.Request;

                    string reportNameVal = reportName.Value;
                    string reportSurnameVal = reportSurname.Value;
                    string reportIdentityNumVal = reportIdentityNum.Value;
                    int billingProvince = Convert.ToInt32(Request.Form["location5"]);
                    string billingAdressVal = billingAddress.Value;
                    string reportZipCodeVal = reportZipCode.Value;

                    try
                    {
                        StrategyIyzicoCheckoutForm _checkout = new StrategyIyzicoCheckoutForm();
                        _checkout.buyerId = _kullanici.kullaniciId.ToString();
                        _checkout.buyerIp = _request.UserHostAddress;
                        _checkout.buyerName = reportNameVal;
                        _checkout.buyerAddress = billingAdressVal;
                        _checkout.buyerCity = _ilManager.Get(billingProvince).ilAdi;
                        _checkout.buyerBasketName = "Jeton";
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
                        _checkout.buyerBasketCategory = "Jeton";
                        _checkout.callbackUrl = "";


                        Session["CheckoutContext"] = _checkout;
                        Session["JetonCount"] = jetonCount;

                        Response.Redirect("~/odeme");
                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }
    }
}