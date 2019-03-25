using BLL;
using DAL;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using BLL.PaymentHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class proje_sepet : System.Web.UI.Page
    {
        public string mesaj = "";

        public JArray objDizi = new JArray();
        kullanici _kullanici;

        private IOdemeService _odemeManager;
        private IIlService _ilManager;

        public proje_sepet()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if(_kullanici!=null)
            { 
                if (!IsPostBack)
                {
                    objDizi = (JArray)Session["showcasebasket"];
                    if (objDizi.Count <= 0)
                    {
                        Response.Redirect("~/projeler/ekle/");
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
            int adsid = Convert.ToInt32(Session["ki-projectregnumeramble"]);
            JArray objDizi2 = ((JArray)Session["showcasebasket"]);

            for (int i = 0; i < objDizi2.Count; i++)
            {
                var siparisdata = new BLL.ExternalClass.siparisDT
                {
                    adsid = adsid,
                    optid = Convert.ToInt32(objDizi2[i]["islemId"]),
                    price = Convert.ToDouble(objDizi2[i]["tutar"]),
                };

                siparisler.Add(siparisdata);
            }

            if (Request.Form["optionsRadios"] == "1")
            {
                string reportNameVal = reportName.Value;
                string reportSurnameVal = reportSurname.Value;
                string reportIdentityNumVal = reportIdentityNum.Value;
                int billingProvince = Convert.ToInt32(Request.Form["location5"]);
                string billingAdressVal = billingAddress.Value;
                string reportZipCodeVal = reportZipCode.Value;

                string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
                txtstr = txtstr.Replace("\r\n", "").Trim();
                txtstr = txtstr.Replace("  ", "");
                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));

                odemeBll odemeb = new odemeBll();

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
                    islemId = 20,
                    odemeTipId = 1,
                    kartNo = "",
                    basariliMi = false,
                    siparis = txtstr
                };

                _odemeManager.Add(odeme);

                DAL.odeme _odeme = _odemeManager.GetLast();
                int order = _odeme.odemeId;

                HttpRequest _request = base.Request;

                PaymentHelper paymentHelper = new PaymentHelper();;

                try
                {
                    StrategyIyzicoCheckoutForm iyzicoPayment = new StrategyIyzicoCheckoutForm();

                    iyzicoPayment.buyerId = _kullanici.kullaniciId.ToString();
                    iyzicoPayment.buyerIp = _request.UserHostAddress;
                    iyzicoPayment.buyerName = reportNameVal;
                    iyzicoPayment.buyerAddress = billingAdressVal;
                    iyzicoPayment.buyerCity = _ilManager.Get(billingProvince).ilAdi;
                    iyzicoPayment.buyerBasketName = "Proje";
                    iyzicoPayment.buyerBasketPrice = price.ToString();
                    iyzicoPayment.price = price.ToString();
                    iyzicoPayment.paidPrice = price.ToString();
                    iyzicoPayment.conversationId = "75436915264";
                    iyzicoPayment.buyerSurname = reportSurnameVal;
                    iyzicoPayment.buyerZipCode = reportZipCodeVal;
                    iyzicoPayment.buyerIdentityNumber = reportIdentityNumVal;
                    iyzicoPayment.buyerGSMNumber = "+90" + _kullanici.telefonlars.Where(x => x.kullaniciId == _kullanici.kullaniciId).FirstOrDefault().telefon;
                    iyzicoPayment.buyerEmail = _kullanici.email;
                    iyzicoPayment.buyerBasketId = order.ToString();
                    iyzicoPayment.buyerBasketCategory = "Proje";
                    iyzicoPayment.callbackUrl = "https://www.kralilan.com/projeler/odeme";

                    Session["CheckoutContext"] = iyzicoPayment;
                    Response.Redirect("~/projeler/odeme/");

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            else if (Request.Form["optionsRadios"] == "3")
            {

                string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
                txtstr = txtstr.Replace("\r\n", "").Trim();
                txtstr = txtstr.Replace("  ", "");
                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));

                odemeBll odemeb = new odemeBll();

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
                    islemId = 20,
                    odemeTipId = 3,
                    kartNo = "",
                    basariliMi = false,
                    siparis = txtstr
                };

                _odemeManager.Add(odeme);

                Response.Redirect("~/projeler/basarili/");
            }
        }


        protected void Devam_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
        }


        //protected void odemeRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "Sil" && e.CommandArgument.ToString() != "")
        //    {
        //        //odemeBll odmB = new odemeBll();
        //        //odmB.delete(Convert.ToInt32(e.CommandArgument));
        //        JArray objDizi2 = ((JArray)Session["showcasebasket"]);

        //        for (int i = 0; i < objDizi2.Count; i++)
        //        {
        //            if (objDizi2[i]["primarykey"].ToString() == e.CommandArgument.ToString())
        //            {
        //                objDizi2[i].Remove();
        //                break;
        //            }
        //        }
        //        Session["showcasebasket"] = objDizi2;
        //        Response.Redirect(Request.RawUrl);
        //    }
        //}
    }
}