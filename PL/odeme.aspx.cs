using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Collections;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Net;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using DAL;
using System.Globalization;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using Iyzipay.Request;
using Iyzipay;
using Iyzipay.Model;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class odeme : System.Web.UI.Page
    {
        public string mesaj = "";
        kullanici _kullanici;

        private IOdemeService _odemeManager;
        private IIlService _ilManager;
        private IDopingKategoriService _dopingKategoriManager;
        private ITelefonService _telefonManager;
        public odeme()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _dopingKategoriManager = new DopingKategoriManager(new LTSDopingKategorilerDal());
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
        }

        public JArray objDizi = new JArray();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                if (!IsPostBack)
                {
                    objDizi = (JArray)Session["showcasebasket"];
                    if (objDizi.Count <= 0)
                    {
                        Response.Redirect("~/ilanin-basarili/");
                    }
                    else
                    {
                        odemeRepeater.DataSource = objDizi.ToList();
                        odemeRepeater.DataBind();
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "temp", "<script language='javascript'>hesapla();</script>", false);
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<BLL.ExternalClass.siparisDT> siparisler = new List<BLL.ExternalClass.siparisDT>();
            List<BasketItem> basketItems = new List<BasketItem>();

            int adsid = Convert.ToInt32(Session["ilanNo"]);
            JArray objDizi2 = ((JArray)Session["showcasebasket"]);

            for (int i = 0; i < objDizi2.Count; i++)
            {
                if (Convert.ToInt32(objDizi2[i]["vitrinKategori"]) != -1)
                {
                    var siparisdata = new BLL.ExternalClass.siparisDT
                    {
                        adsid = adsid,
                        optid = Convert.ToInt32(objDizi2[i]["islemId"]),
                        price = Convert.ToDouble(objDizi2[i]["tutar"]),
                        showcasecatid = Convert.ToInt32(objDizi2[i]["vitrinKategori"])

                    };

                    dopingKategori _dopKat = _dopingKategoriManager.Get(Convert.ToInt32(objDizi2[i]["vitrinKategori"]));

                    var basketItem = new BasketItem
                    {
                        Id = adsid.ToString(),
                        Name = _dopKat.doping.dopingAdi + "(" + _dopKat.dopingSureId + " Haftalık)",
                        Category1 = "Vitrin",
                        ItemType = BasketItemType.VIRTUAL.ToString(),
                        Price = Convert.ToDouble(objDizi2[i]["tutar"]).ToString()
                    };

                    basketItems.Add(basketItem);
                    siparisler.Add(siparisdata);
                }
                else
                {
                    var siparisdata = new BLL.ExternalClass.siparisDT
                    {
                        adsid = adsid,
                        optid = Convert.ToInt32(objDizi2[i]["islemId"]),
                        price = Convert.ToDouble(objDizi2[i]["tutar"]),
                        showcasecatid = Convert.ToInt32(objDizi2[i]["vitrinKategori"])
                    };

                    //dopingKategori _dopKat = dopingKatBll.search(Convert.ToInt32(objDizi2[i]["vitrinKategori"]));

                    var basketItem = new BasketItem
                    {
                        Id = adsid.ToString(),
                        Name = "İlan Ücreti",
                        Category1 = "İlan",
                        ItemType = BasketItemType.VIRTUAL.ToString(),
                        Price = Convert.ToDouble(objDizi2[i]["tutar"]).ToString()
                    };

                    basketItems.Add(basketItem);
                    siparisler.Add(siparisdata);
                }
            }

            string reportNameVal = reportName.Value;
            string reportSurnameVal = reportSurname.Value;
            string reportIdentityNumVal = reportIdentityNum.Value;
            int billingProvince = Convert.ToInt32(Request.Form["location5"]);
            string billingAdressVal = billingAddress.Value;
            string reportZipCodeVal = reportZipCode.Value;

            if (Request.Form["optionsRadios"] == "1")
            {
                string txtstr = toolkit.GetXmlDataInObject(siparisler);
                txtstr = txtstr.Replace("\r\n", "").Trim();
                txtstr = txtstr.Replace("  ", "");
                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));

                double price = 0;
                for (int i = 0; i < objDizi2.Count; i++)
                {
                    price += Convert.ToDouble(objDizi2[i]["tutar"]);
                }

                int kullaniciId = _kullanici.kullaniciId;


                DAL.odeme odeme = new DAL.odeme
                {
                    kullaniciId = kullaniciId,
                    odemeTutar = price,
                    islemId = 10,
                    odemeTipId = 1,
                    kartNo = "",
                    basariliMi = false,
                    siparis = txtstr
                };

                _odemeManager.Add(odeme);

                //odemeb.insert(
                //      kullaniciId,
                //      price,
                //      10,
                //      1,
                //      "",
                //      false,
                //      txtstr
                //      );

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
                    _checkout.buyerCity = _ilManager.Get(billingProvince).ilAdi;
                    _checkout.buyerBasketName = "Vitrin";
                    _checkout.buyerBasketPrice = price.ToString();
                    _checkout.price = price.ToString();
                    _checkout.paidPrice = price.ToString();
                    _checkout.conversationId = "75436915264";
                    _checkout.buyerSurname = reportSurnameVal;
                    _checkout.buyerZipCode = reportZipCodeVal;
                    _checkout.buyerIdentityNumber = reportIdentityNumVal;
                    _checkout.buyerGSMNumber = "+90" + _telefonManager.GetAllByUserId(_kullanici.kullaniciId).FirstOrDefault().telefon;
                    _checkout.buyerEmail = _kullanici.email;
                    _checkout.buyerBasketId = order.ToString();
                    _checkout.buyerBasketCategory = "Vitrin";
                    _checkout.basketItems = basketItems;

                    Session["ShowcaseCheckoutContext"] = _checkout;

                }
                catch (Exception ex)
                {

                    throw ex;
                }

                Response.Redirect("~/odeme-formu/");


                //DAL.toolkit.VirtualPosPayment(this.Context, order, price, "dfdsfsd", "sdsadasd");

            }

            //else if (Request.Form["optionsRadios"] == "2")
            //{

            //    string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
            //    txtstr = txtstr.Replace("\r\n", "").Trim();
            //    txtstr = txtstr.Replace("  ", "");
            //    List<BLL.deff.siparisDT> siparislist = new List<BLL.deff.siparisDT>();
            //    siparislist = (List<BLL.deff.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.deff.siparisDT>));

            //    odemeBll odemeb = new odemeBll();

            //    int kullaniciId = ((kullanici)Session["unique-site-user"]).kullaniciId;
            //    odemeb.insert(
            //          kullaniciId,
            //          -1,
            //          10,
            //          2,
            //          "",
            //          false,
            //          txtstr
            //          );

            //    DAL.odeme _odeme = odemeb.LastPayment();
            //    int order = _odeme.odemeId;
            //    double price = 0;

            //    for (int i = 0; i < objDizi2.Count; i++)
            //    {
            //        price += Convert.ToDouble(objDizi2[i]["tutar"]);
            //    }

            //    DAL.toolkit.MobilePayment(this.Context, order.ToString(), "vitrin" , price.ToString("F2", CultureInfo.InvariantCulture), "dfdsfsd", "sdsadasd");



            //}
            else if (Request.Form["optionsRadios"] == "3")
            {

                string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
                txtstr = txtstr.Replace("\r\n", "").Trim();
                txtstr = txtstr.Replace("  ", "");
                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));

                double price = 0;

                for (int i = 0; i < objDizi2.Count; i++)
                {
                    price += Convert.ToDouble(objDizi2[i]["tutar"]);
                }


                //int kullaniciId = ((kullanici)Session["unique-site-user"]).kullaniciId;
                int kullaniciId = _kullanici.kullaniciId;

                //odemeb.insert(
                //      kullaniciId,
                //      price,
                //      10,
                //      3,
                //      "",
                //      false,
                //      txtstr
                //      );

                DAL.odeme odeme = new DAL.odeme
                {
                    kullaniciId = kullaniciId,
                    odemeTutar = price,
                    islemId = 10,
                    odemeTipId = 3,
                    kartNo = "",
                    basariliMi = false,
                    siparis = txtstr
                };

                _odemeManager.Add(odeme);



                Response.Redirect("~/ilanin-basarili/");


            }
        }

        protected void Devam_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
        }

        protected void odemeRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Sil" && e.CommandArgument.ToString() != "")
            {
                JArray objDizi2 = ((JArray)Session["showcasebasket"]);
                for (int i = 0; i < objDizi2.Count; i++)
                {
                    if (objDizi2[i]["vitrinKategori"].ToString() != "-1")
                    {
                        if (objDizi2[i]["primarykey"].ToString() == e.CommandArgument.ToString())
                        {
                            objDizi2[i].Remove();
                            break;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "None", "basketNonDelete();", true);
                    }
                }
                Session["showcasebasket"] = objDizi2;
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}