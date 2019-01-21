using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using BLL.SecurityCodeHelper;
using BLL.PublicHelper;
using BLL.SMSHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class cep_telefonu : System.Web.UI.UserControl
    {
        SecurityCodeHelper securityCode = new SecurityCodeHelper();
        SMSHelper smsHelper = new SMSHelper();

        kullanici _kullanici;

        private ITelefonService _telefonManager;
        private IGuvenlikKodService _guvenlikKodManager;
        public cep_telefonu()
        {
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
            _guvenlikKodManager = new GuvenlikKodManager(new LTSGuvenlikKodlarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                var value = _telefonManager.GetByUserId(_authority.kullaniciId, 1);
                if (value != null)
                {
                    txtGsmNo.Text = value.telefon;
                }

            }
            else
            {
                Response.Redirect("~/giris-yap");
            }
        }
        protected void Degistir_Click(object sender, EventArgs e)
        {
            string confirCode = securityCode.SecurityCodeGenerate();
            string[] dizi = { Tools.PhoneNumberOrganizer(txtGsmNo.Text), confirCode };
            Session["mobile-act"] = dizi;

            guvenlikKodlari _kod = new guvenlikKodlari
            {
                cepTelefonu = Tools.PhoneNumberOrganizer(txtGsmNo.Text),
                guvenlikKodu = confirCode
            };

            _guvenlikKodManager.Add(_kod);
            List<string> numara = new List<string>();
            numara.Add(Tools.PhoneNumberOrganizer(txtGsmNo.Text));
            string mesaj = "Onay Kodunuz : " + confirCode + " İşlem güvenliğiniz için onay kodunuzu başkalarıyla paylaşmamanızı öneriyoruz.\nkralilan.com";

            smsHelper.Message = mesaj;
            smsHelper.PhoneNumbers = numara;
            bool result = smsHelper.Send();

            if (result)
            {
                Response.Redirect("~/uyelik-onayla/");
            }
            else
            {
                Panel pnl = new Panel();
                pnl.Attributes["class"] = "alert alert-danger";
                Label lbl = new Label();
                lbl.Text = "Gönderme Başarısız";
                pnl.Controls.Add(lbl);

                uyelikField.Controls.AddAt(0, pnl);
            }
        }
    }
}