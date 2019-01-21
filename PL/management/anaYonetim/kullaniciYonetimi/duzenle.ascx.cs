using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using BLL.EncryptHelper;
using BLL.PublicHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.kullaniciYonetimi
{
    public partial class duzenle : System.Web.UI.UserControl
    {
        public int kullaniciId=0;
        public string status = "";
        bool silindi = false;

        private ITelefonService _telefonManager;
        private IKullaniciService _kullaniciManager;
        public duzenle()
        {
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            kullaniciId = Convert.ToInt32(Request.QueryString["user"]);
            kullanici _kullanici = _kullaniciManager.Get(Convert.ToInt32(Request.QueryString["user"]));

            if (_kullanici.silindiMi == false) status = "Düzenleme işlemindeki kullanıcı aktif";
            else status = "Bu kullanıcının kaydı silinmiş durumda";

            if (!Page.IsPostBack)
            {
                string[] adSoyad = Tools.StringOrganizer(_kullanici.kullaniciAdSoyad);
                txtAd.Text = adSoyad[0];
                txtSoyad.Text = adSoyad[1];
                //txtSifre.Text = _kullanici.sifre;
                txtEmail.Text = _kullanici.email;
                drpYetki.SelectedValue = _kullanici.rol.ToString();

                telefonlar _telefon = _telefonManager.GetByUserId(Convert.ToInt32(Request.QueryString["user"]), 1);

                if (_telefon != null) txtGsm1.Text = _telefon.telefon;

            }
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            kullanici _kullanici = _kullaniciManager.Get(Convert.ToInt32(Request.QueryString["user"]));

            int yetki = Convert.ToInt32(drpYetki.SelectedValue);
            string isim = txtAd.Text + " " + txtSoyad.Text;
            string sifre = txtSifre.Text;

            if(!String.IsNullOrEmpty(sifre)) sifre = EncryptHelper.SHA1HashEncryption(sifre);
            
            string mail = txtEmail.Text;
            string ctrl = Request.Form["ctrlselect"];

            if (!String.IsNullOrEmpty(ctrl))
            {        
                if (ctrl == "1") silindi = true;            
            }
            else silindi = Convert.ToBoolean(Convert.ToInt32(_kullanici.silindiMi));


            try
            {
                DAL.kullanici kullanici = new kullanici
                {
                    kullaniciId = kullaniciId,
                    kullaniciAdSoyad = isim,
                    sifre = sifre,
                    email = mail,
                    rol = yetki,
                    silindiMi = silindi
                };

                _kullaniciManager.UpdateByManager(kullanici);
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}
