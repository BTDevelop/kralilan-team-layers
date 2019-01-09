using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using BLL.Concrete;
using BLL.SecurityCodeHelper;
using BLL.PublicHelper;
using BLL.SMSHelper;
using BLL.EncryptHelper;
using BLL.ReCaptchaHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class uye_ol : System.Web.UI.Page
    {

        kullaniciBll kll = new kullaniciBll();
        SecurityCodeHelper securityCode = new SecurityCodeHelper();
        SMSHelper smsHelper = new SMSHelper();
        ReCaptchaHelper reCaptchaHelper = new ReCaptchaHelper();

        private IGuvenlikKodService _guvenlikKodManager;
        private IKullaniciService _kullaniciManager;
        public uye_ol()
        {
            _guvenlikKodManager = new GuvenlikKodManager(new LTSGuvenlikKodlarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MetaDescription = "Kral ilan ailesine, sayfadaki formu doldurarak ücretsiz üye olabilirsiniz.";
        }

        protected void UyeOl_Click(object sender, EventArgs e)
        {
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            var isCaptchaValid = reCaptchaHelper.Validate(encodedResponse);

            if (isCaptchaValid)
            {
                if (_kullaniciManager.IsDuplicate(Request.Form["mail"], Tools.PhoneNumberOrganizer(Request.Form["phone"])))
                {
                    string onay_Kod = securityCode.SecurityCodeGenerate();
                    string[] dizi = { Request.Form["name"] + " " + Request.Form["surname"], Tools.PhoneNumberOrganizer(Request.Form["phone"]), Request.Form["mail"], EncryptHelper.SHA1HashEncryption(Request.Form["password"]), onay_Kod };
                    Session["yeniKullanici"] = dizi;


                    guvenlikKodlari _kod = new guvenlikKodlari
                    {
                        cepTelefonu = Tools.PhoneNumberOrganizer(Request.Form["phone"]),
                        guvenlikKodu = onay_Kod
                    };

                    _guvenlikKodManager.Add(_kod);

                    //guvenlib.insert(Tools.PhoneNumberOrganizer(Request.Form["phone"]), onay_Kod);

                    List<string> numara = new List<string>();
                    numara.Add(Tools.PhoneNumberOrganizer(Request.Form["phone"]));
                    string mesaj = "Referans Kodunuz : " + onay_Kod + " İşlem güvenliğiniz için onay kodunuzu başkalarıyla paylaşmamanızı öneriyoruz.\nkralilan.com";

                    smsHelper.Message = mesaj;
                    smsHelper.PhoneNumbers = numara;
                    bool result = smsHelper.Send();

                    if (result)
                    {
                        Response.Redirect("~/uyelik-onayla/");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup2();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup3();", true);
            }

        }
    }
}