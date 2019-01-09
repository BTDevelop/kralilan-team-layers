using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using KralilanProject.Interfaces;
using DAL.Concrete.LINQ;

namespace PL.profil
{
    public partial class profil : System.Web.UI.Page
    {
        magazaKullaniciBll magazaKullaniciBLL = new magazaKullaniciBll();
        projelerBll projelerBLL = new projelerBll();
        kullanici _kullanici;
        magazaBll magazaBLL = new magazaBll();


        public int storeId = -1;
        public string storeName = null;

        private IProjeService _projeManager;
        private IMagazaKullaniciService _magazaKullaniciManager;
        private IMagazaService _magazaManager;
        public profil()
        {
            _projeManager = new ProjeManager(new LTSProjelerDal());
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            projectBox.Visible = false;
            storeWrapper.Visible = false;
            SectionMyStore.Visible = false;
            SectionStoreInfo.Visible = false;

            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                int kullaniciId = _authority.kullaniciId;

                if (_projeManager.IsByUserId(kullaniciId)) projectBox.Visible = true;

                var result = _magazaKullaniciManager.GetByUserId(_authority.kullaniciId);

                if (result != null)
                {
                    int magazaId = _magazaKullaniciManager.GetByUserId(_authority.kullaniciId).magazaId;
                    string magazaAdi = _magazaManager.Get(magazaId).magazaAdi;
                    storeWrapper.Visible = true;
                    storeId = magazaId;
                    storeName = magazaAdi;
                    SectionMyClassified.Visible = false;
                    SectionStoreInfo.Visible = true;
                    SectionMyStore.Visible = true;

                    Session["StoreIdentifier"] = magazaId;
                }

                if (RouteData.Values["Sayfa"].ToString() == "yayindaki-ilanlarim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/magaza-yayinda.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "yayinda-olmayan-ilanlarim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/magaza-yayinda-olmayan.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "durum-bilgisi") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/magaza-ilan-durum.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "benim-sayfam") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/anasayfa.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "hesap-hareketlerim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/odemeler.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "favori-ilanlarim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/favori-ilan.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "takip-ettigim-saticilar") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/favori-satici.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "ilanlarim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/ilan.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "takip-ettigim-magazalar") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/favori-magaza.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "eposta-hesabim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/eposta.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "cep-telefonum") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/cep-telefonu.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "bildirimlerim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/bildirim-oku.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "kisisel-bilgilerim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/kisisel-bilgiler.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "projelerim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/projeler.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "magaza-bilgilerim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/magaza-profil.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "magaza-danismanlarim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/magaza-kullanicilar.ascx"));

                if (RouteData.Values["Sayfa"].ToString() == "magaza-odemelerim") PlaceHolder1.Controls.Add(Page.LoadControl("~/profil/magaza-odemeler.ascx"));
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }
    }
}
