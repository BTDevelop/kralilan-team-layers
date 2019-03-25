using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using Iyzipay;
using Iyzipay.Model;
using Iyzipay.Request;
using KralilanProject.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.PaymentHelper;

namespace PL
{
    public partial class proje_odeme : System.Web.UI.Page
    {

        private IOdemeService _odemeManager;

        public proje_odeme()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
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

            if (Session["CheckoutContext"] != null)
            {
                try
                {
                    DAL.StrategyIyzicoCheckoutForm _checkout = (DAL.StrategyIyzicoCheckoutForm)Session["CheckoutContext"];
                    CheckoutFormInitialize checkoutFormInitialize = _checkout.initializeCheckoutBuilder();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", checkoutFormInitialize.CheckoutFormContent);
                    Session["Token"] = checkoutFormInitialize.Token;

                    //PaymentHelper paymentHelper = new PaymentHelper();
                    //IyzicoPayment iyzicoPayment = new IyzicoPayment();
                    //IyzicoPayment _checkout = (IyzicoPayment)Session["CheckoutContext"];
                    //paymentHelper.PaymentTo(iyzicoPayment);
                    //CheckoutFormInitialize checkoutFormInitialize = _checkout.CheckoutForm();
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    //    checkoutFormInitialize.CheckoutFormContent);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        public void GetResult(string token)
        {
            IyzicoPayment iyzicoPayment = new IyzicoPayment();

            Options options = new Options();
            options.ApiKey = iyzicoPayment._apikey;
            options.SecretKey = iyzicoPayment._secretkey;
            options.BaseUrl = iyzicoPayment._baseurl;

            RetrieveCheckoutFormRequest request = new RetrieveCheckoutFormRequest();
            request.ConversationId = "75436915264";
            request.Token = token;

            CheckoutForm checkoutForm = CheckoutForm.Retrieve(request, options);

            if (checkoutForm.PaymentStatus.Contains("SUCCESS"))
            {
                Session["Token"] = null;
                Session["CheckoutContext"] = null;
                int basketID = Convert.ToInt32(checkoutForm.BasketId);
                DAL.odeme odeme = new DAL.odeme
                {
                    odemeId = basketID
                };

                _odemeManager.Update(odeme);
                Response.Redirect("~/projeler/basarili/");
            }
        }
    }
}