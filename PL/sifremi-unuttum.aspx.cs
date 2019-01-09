using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class sifremi_unuttum : System.Web.UI.Page
    {
        kullaniciBll kullanicib = new kullaniciBll();
        guvenlikKodlariBll guvenlib = new guvenlikKodlariBll();
        string info, detail;

        private IGuvenlikKodService _guvenlikKodManager;
        private IKullaniciService _kullaniciManager;

        protected void Page_Load(object sender, EventArgs e)
        {
            _guvenlikKodManager = new GuvenlikKodManager(new LTSGuvenlikKodlarDal());
            _kullaniciManager =new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Gonder_Click(object sender, EventArgs e)
        {
            info = "Şifremi unuttum değişikliği için gönderilen aktivasyon linki:";
            string GuidKey = Guid.NewGuid().ToString();

            detail = "https://www.kralilan.com/yeni-sifre.aspx?act=" + GuidKey;

            if (_kullaniciManager.GetByEmail(txtMail.Value) != null)
            {
                if (_guvenlikKodManager.GetByPhone(txtMail.Value) == null)
                {
                    kullanici _kullanici = _kullaniciManager.GetByEmail(txtMail.Value);

                    guvenlikKodlari _kod = new guvenlikKodlari
                    {
                        cepTelefonu = _kullanici.email,
                        guvenlikKodu = GuidKey
                    };

                    _guvenlikKodManager.Add(_kod);
                    //guvenlib.insert(_kullanici.email, GuidKey);
                    try
                    {
                        toolkit.HtmlMailSender(_kullanici.email, "~/email-temp/single-column/build.html", "Şifremi unuttum", "Şifremi unuttum", _kullanici.kullaniciAdSoyad, info, detail);
                        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
                    }
                    catch (Exception)
                    {

                        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup2();", true);
                    }

                }
                else if (_guvenlikKodManager.GetByPhone(txtMail.Value) != null)
                {
                    kullanici _kullanici = _kullaniciManager.GetByEmail(txtMail.Value);

                    guvenlikKodlari _kod = new guvenlikKodlari
                    {
                        cepTelefonu = txtMail.Value,
                        guvenlikKodu = GuidKey
                    };

                    _guvenlikKodManager.Update(_kod);
                    try
                    {
                        toolkit.HtmlMailSender(_kullanici.email, "~/email-temp/single-column/build.html", "Şifremi unuttum", "Şifremi unuttum", _kullanici.kullaniciAdSoyad, info, detail);
                        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
                    }
                    catch (Exception)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup2();", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
            }
        }
    }
}