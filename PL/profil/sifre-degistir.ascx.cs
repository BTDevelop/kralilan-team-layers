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

namespace PL.profil
{
    public partial class sifre_degistir : System.Web.UI.UserControl
    {
        kullaniciBll kll = new kullaniciBll();
        kullanici _kullanicid;

        private IKullaniciService _kullaniciManager;
        public sifre_degistir()
        {
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanicid = kullaniciBll.getUsersBlock();

        }

        protected void Guncelle_Sifre_Click(object sender, EventArgs e)
        {
            if (_kullanicid != null)
            {

                kullanici _authority = _kullanicid;
                if (txtEskiSifre.Value == _authority.sifre)
                {
                    _kullaniciManager.UpdateByPassword(_authority.kullaniciId, txtYeniSifre.Value);
                    //kll.updatePasswordByUserId(_authority.kullaniciId,txtYeniSifre.Value);
                    try
                    {
                        toolkit.HtmlMailSender(_authority.email, "~/email-temp/single-column/build.html", "şifre değişikliği", "şifre değişikliği", _authority.kullaniciAdSoyad, "şifre değişikliği", "Hesabınızda şifre değişikliği yapıldı.");
                    }
                    catch (Exception)
                    {

                        throw;
                    }
                }
            }
        }
    }
}