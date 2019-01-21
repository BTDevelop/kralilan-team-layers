using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Security.Cryptography;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using PL.profil;

namespace PL
{
    public partial class cep_aktivasyon : System.Web.UI.Page
    {
        kullaniciBll kll = new kullaniciBll();
        kullanici _kullanici;

        private ITelefonService _telefonManager;
        private IKullaniciService _kullaniciManager;

        public cep_aktivasyon()
        {
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
        }

        protected void dogrula_Click(object sender, EventArgs e)
        {
            if (Session["yeniKullanici"] != null)
            {
                string[] array = Session["yeniKullanici"] as string[];
                if (array[4] == Request.Form["validator"])
                {
                    //ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);

                    DAL.kullanici _kullanici = new DAL.kullanici
                    {
                        kullaniciAdSoyad = array[0],
                        sifre = array[3],
                        email = array[2],
                        rol = 4
                    };

                    _kullaniciManager.Add(_kullanici);

                    //kll.insert(array[0], array[3], array[2], 4);
                    kullanici kllnc = _kullaniciManager.GetLast();
                    telefonlar _telefonlar = new telefonlar
                    {
                        kullaniciId = kllnc.kullaniciId,
                        telefon = array[1],
                        telefonTur = 1
                    };

                    _telefonManager.Add(_telefonlar);
                    //tlf.insert(kllnc.kullaniciId, array[1], 1);

                    if (kll.getUserAppLoginOn(array[2], array[3]))
                    {
                        //Response.Redirect("~/");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "none", "ShowUserAds();", true);

                    }
                    else
                    {

                        Response.Redirect("~/giris-yap/");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);

                }
            }

            //if (Session["unique-site-user"] != null)
            //{
            if (_kullanici != null)
            {
                if (Session["mobile-act"] != null)
                {

                    //kullanici _authority = (kullanici)Session["unique-site-user"];
                    kullanici _authority = _kullanici;


                    string[] array = Session["mobile-act"] as string[];
                    if (array[1] == Request.Form["validator"])
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
                        telefonlar _telefonlar = new telefonlar
                        {
                            kullaniciId = _authority.kullaniciId,
                            telefon = array[0],
                            telefonTur = 1
                        };
                        _telefonManager.Update(_telefonlar);
                        //tlf.update(_authority.kullaniciId, array[0], 1);
                        Response.Redirect("~/profil/profil.aspx?control=cep-telefonu");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);

                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);

                }
            }
        }
    }
}