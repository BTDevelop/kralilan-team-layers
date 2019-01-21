using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
using BLL.PublicHelper;
using BLL.EncryptHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using BLL.Concrete;

namespace PL.management.anaYonetim.kullaniciYonetimi
{
    public partial class ekle : System.Web.UI.UserControl
    {

        private ITelefonService _telefonManager;
        private IKullaniciService _kullaniciManager;
        public ekle()
        {
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string name = Request.Form["username"] + " " + Request.Form["usersurname"];
            string password = EncryptHelper.SHA1HashEncryption(Request.Form["password"]);
            string mail = Request.Form["mail"];
            string phone = Tools.PhoneNumberOrganizer(Request.Form["phone"]);
            int authority = Convert.ToInt32(Request.Form["slctauthority"]);

            DAL.kullanici _kullanici = new DAL.kullanici
            {
                kullaniciAdSoyad = name,
                sifre = password,
                email = mail,
                rol = authority
            };

            _kullaniciManager.Add(_kullanici);

            //kullanicib.insert(name, password, mail, authority);

            kullanici user = _kullaniciManager.GetLast();
            int kullaniciId = user.kullaniciId;
            telefonlar _telefonlar = new telefonlar
            {
                kullaniciId = kullaniciId,
                telefon = phone,
                telefonTur = 1
            };
            //telefonb.insert(kullaniciId, phone, 1);

            Response.Redirect("~/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=listele&tip=editor");
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=listele&tip=editor");
        }
    }
}