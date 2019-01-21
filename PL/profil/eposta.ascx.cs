using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using BLL.PublicHelper;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class eposta : System.Web.UI.UserControl
    {
        string info, detail;
        kullanici _kullanici;

        private IGuvenlikKodService _guvenlikKodManager;
        private IKullaniciService _kullaniciManager;
        public eposta()
        {
            _guvenlikKodManager = new GuvenlikKodManager(new LTSGuvenlikKodlarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null)
            {

                kullanici _authority = _kullanici;

                if (Request.QueryString["activation"] != null)
                {
                    if (_guvenlikKodManager.GetBySecureCode(Request.QueryString["activation"]) != null)
                    {
                        _kullaniciManager.UpdateByEmail(_authority.kullaniciId, _guvenlikKodManager.GetBySecureCode(Request.QueryString["activation"]).cepTelefonu);
                        Session.Abandon();
                        Response.Redirect("~/giris-yap/");

                    }
                    else
                    {
                        Session.Abandon();
                        Response.Redirect("~/giris-yap/");
                    }
                }
                else
                {
                    txtMail.Value = _authority.email;
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }

        protected void Degistir_Click(object sender, EventArgs e)
        {
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                info = "E-posta aktivasyonu için gönderilen aktivasyon linki:";
                string GuidKey = Guid.NewGuid().ToString();

                detail = "https://kralilan.com/secure/eposta-hesabim/?activation=" + GuidKey;
                if (_guvenlikKodManager.GetByPhone(txtMail.Value) == null)
                {
                    guvenlikKodlari _kod = new guvenlikKodlari
                    {
                        cepTelefonu = txtMail.Value,
                        guvenlikKodu = GuidKey
                    };

                    _guvenlikKodManager.Add(_kod);

                    //guvenlikKodb.insert(txtMail.Value, GuidKey);
                    toolkit.HtmlMailSender(txtMail.Value, "~/email-temp/single-column/build.html", "E-posta aktivasyonu", "E-posta aktivasyonu", _authority.kullaniciAdSoyad, info, detail);
                }
                else if (_guvenlikKodManager.GetByPhone(txtMail.Value) != null)
                {
                    guvenlikKodlari _kod = new guvenlikKodlari
                    {
                        cepTelefonu = txtMail.Value,
                        guvenlikKodu = GuidKey
                    };

                    _guvenlikKodManager.Update(_kod);

                    //guvenlikKodb.update(txtMail.Value, GuidKey);
                    toolkit.HtmlMailSender(_authority.email, "~/email-temp/single-column/build.html", "E-posta aktivasyonu", "E-posta aktivasyonu", _authority.kullaniciAdSoyad, info, detail);
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }
    }
}