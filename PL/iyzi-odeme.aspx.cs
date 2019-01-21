using BLL;
using DAL;
using Iyzipay;
using Iyzipay.Model;
using Iyzipay.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class iyzi_odeme : System.Web.UI.Page
    {
        private IOdemeService _odemeManager;
        private IDopingKategoriService _dopingKategoriManager;
        private ISeciliDopingService _seciliDopingManager;
        public iyzi_odeme()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
            _dopingKategoriManager = new DopingKategoriManager(new LTSDopingKategorilerDal());
            _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Token"] != null)
            {
                try
                {
                    GetResult(Session["Token"].ToString());
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            if (Session["ShowcaseCheckoutContext"] != null)
            {
                try
                {
                    StrategyIyzicoCheckoutForm _checkout = (StrategyIyzicoCheckoutForm)Session["ShowcaseCheckoutContext"];
                    CheckoutFormInitialize checkoutFormInitialize = _checkout.initializeCheckoutBuilderForm();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", checkoutFormInitialize.CheckoutFormContent);
                    Session["Token"] = checkoutFormInitialize.Token;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        public void GetResult(string token)
        {
            Options options = new Options();
            options.ApiKey = "wyBxkxcGMxMdemTzA26k7reEBxyfuS6A";
            options.SecretKey = "jUqowI6O3zEQVNm2ZIo6H5nU5QKUWzxn";
            options.BaseUrl = "https://api.iyzipay.com";

            RetrieveCheckoutFormRequest request = new RetrieveCheckoutFormRequest();
            request.ConversationId = "75436915264";
            request.Token = token;

            CheckoutForm checkoutForm = CheckoutForm.Retrieve(request, options);

            if (checkoutForm.PaymentStatus.Contains("SUCCESS"))
            {
                Session["Token"] = null;
                Session["ShowcaseCheckoutContext"] = null;
                int basketID = Convert.ToInt32(checkoutForm.BasketId);

                DAL.odeme odeme = new DAL.odeme
                {
                    odemeId = basketID
                };

                _odemeManager.Update(odeme);
               
                DAL.odeme _odeme = _odemeManager.Get(basketID);
                List<BLL.ExternalClass.PaymentCS> siparisler = new List<BLL.ExternalClass.PaymentCS>();
                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(_odeme.siparis, typeof(List<BLL.ExternalClass.siparisDT>));

                for (int i = 0; i < siparislist.Count; i++)
                {
                    dopingKategori _dopKat = _dopingKategoriManager.Get(siparislist[i].showcasecatid);
                    int pubDays = Convert.ToInt32(_dopKat.dopingSureId) * 7;
                    seciliDoping _seciliDoping = new seciliDoping
                    {
                        ilanId = siparislist[i].adsid,
                        dopingKategoriId = siparislist[i].showcasecatid,
                        baslangicTarihi = DateTime.Now,
                        bitisTarihi = DateTime.Now.AddDays(pubDays),
                        onay = true
                    };

                    _seciliDopingManager.Add(_seciliDoping);

                    //secDopingB.insert(siparislist[i].adsid, siparislist[i].showcasecatid, DateTime.Now, DateTime.Now.AddDays(pubDays), true);
                }

                Response.Redirect("~/ilanin-basarili/");
            }
        }
    }
}
