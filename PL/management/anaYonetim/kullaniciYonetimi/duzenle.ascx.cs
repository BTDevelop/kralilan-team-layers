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
        kullaniciBll kll = new kullaniciBll();
        telefonBll tlf = new telefonBll();
        ilBll il = new ilBll();
        ilceBll ilce = new ilceBll();
        mahalleBll mahalle = new mahalleBll();
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
            if (_kullanici.silindiMi == false)
                status = "Düzenleme işlemindeki kullanıcı aktif";
            else
                status = "Bu kullanıcının kaydı silinmiş durumda";

            if (!Page.IsPostBack)
            {
                string[] adSoyad = Tools.StringOrganizer(_kullanici.kullaniciAdSoyad);
                txtAd.Text = adSoyad[0].ToString();
                txtSoyad.Text = adSoyad[1].ToString();
               // txtSifre.Text = _kullanici.sifre;
                txtEmail.Text = _kullanici.email;
                drpYetki.SelectedValue = _kullanici.rol.ToString();
                telefonlar _tlfd = _telefonManager.GetByUserId(Convert.ToInt32(Request.QueryString["user"]), 1);
                if (_tlfd != null)
                    txtGsm1.Text = _tlfd.telefon;

            }
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            kullanici _kullanici = _kullaniciManager.Get(Convert.ToInt32(Request.QueryString["user"]));


            int yetki = Convert.ToInt32(drpYetki.SelectedValue.ToString());

            string isim = txtAd.Text + " " + txtSoyad.Text;
            string sifre = txtSifre.Text;

            if(!String.IsNullOrEmpty(sifre))
            {
                sifre = EncryptHelper.SHA1HashEncryption(sifre);
            }

            string mail = txtEmail.Text;
            string ctrl = Request.Form["ctrlselect"];

            if (!String.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.Form["ctrlselect"];
            }
            else
            {
                ctrl = "-1";
            }


            if (ctrl != "-1")
            {
                if (ctrl == "1")
                {                
                    silindi = true;
                }
            }
            else
            {
             
                silindi = Convert.ToBoolean(Convert.ToInt32(_kullanici.silindiMi));
            }


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

                _kullaniciManager.Update(kullanici);

                //kll.updateByManager(kullaniciId, isim, sifre, mail, yetki, silindi);

            }
            catch (Exception)
            {

                throw;
            }


            //if (txtGsm1.Text != "")
            //{
            //    tlf.update(Convert.ToInt32(Request.QueryString["user"]), txtGsm1.Text, 1);
            //}
            //else
            //{
            //    // burda uyarı verilecek
            //}


            //Response.Redirect("~/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=listele");
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}
