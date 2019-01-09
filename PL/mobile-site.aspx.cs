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
using KralilanProject.Interfaces;
using static DAL.toolkit;

namespace PL
{
    public partial class mobile_site : System.Web.UI.Page
    {
        kategoriBll kategorib = new kategoriBll();
        kullaniciBll kullaniciBLL = new kullaniciBll();
        kategoriTurBll kategoriTurBLL = new kategoriTurBll();
        XmlFormat xmlFormat = new XmlFormat();
        private kullanici _kullanici;

        private IKategoriTurService _kategoriTurManager;
        private IKullaniciService _kullaniciManager;
        public mobile_site()
        {
            _kategoriTurManager = new KategoriTurManager(new LTSKategoriTurlerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
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

            List<StrategyData.KategoriType> categori = new List<StrategyData.KategoriType>();
            categori = (List<StrategyData.KategoriType>)toolkit.GetObjectInXml(kategorib.getTopCategoriViewHomePageTest(1, xmlFormat), typeof(List<StrategyData.KategoriType>));
       

            string[] arrIcon = new string[6] { "icon-home", "icon-shop", "icon-prison", "icon-building-filled", "icon-calendar-1", "icon-home-1" };

            for (int i = 0; i < categori.Count; i++)
            {
                categori[i].kategoriLogo = arrIcon[i];
                categori[i].kategoriTip = _kategoriTurManager.GetByCategoriIdStr(Convert.ToInt32(categori[i].kategoriId));
            }

            rpcategories.DataSource = categori;
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