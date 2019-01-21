using BLL;
using BLL.Formatter;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Entities;
using KralilanProject.Interfaces;
using static DAL.toolkit;

namespace PL
{
    public partial class mobile_site : System.Web.UI.Page
    {
        public int Index = 0;
        public string[] Icons = { "icon-home", "icon-shop", "icon-prison", "icon-building-filled", "icon-calendar-1", "icon-home-1" };

        private kullanici _kullanici;
        List<IlanSayi> SayilarList = new List<IlanSayi>();

        public IKategoriTurService _kategoriTurManager;
        private IKullaniciService _kullaniciManager;
        private IIlanSayiService _ilanSayiManager;
        public mobile_site()
        {
            _kategoriTurManager = new KategoriTurManager(new LTSKategoriTurlerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
            _ilanSayiManager = new IlanSayiManager(new LTSIlanSayilarDal());

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            signup.Visible = false;
            login.Visible = false;
            logout.Visible = false;
            profile.Visible = false;

            if (_kullanici != null)
            {
                signup.Visible = false;
                login.Visible = false;
                logout.Visible = true;
                profile.Visible = true;
            }
            else
            {
                signup.Visible = true;
                login.Visible = true;
                logout.Visible = false;
                profile.Visible = false;
            }


            SayilarList = _ilanSayiManager.GetAllCategoriByTopCategoriId(1);

            rpcategories.DataSource = SayilarList;
            rpcategories.DataBind();

        }

        protected void Cikis_Click(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null) _kullaniciManager.UpdateByOnlineStatus(_kullanici.kullaniciId, -10);
            
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/mobile");
        }
    }
}