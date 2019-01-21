using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Web.Security;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.BLL.Concrete;
using KralilanProject.Interfaces;

namespace PL.Management
{
    public partial class admin : System.Web.UI.MasterPage
    {
        public string name = "";
        public string onlinestat = "";
        public int id;
        kullanici _kullanici;

        private IBildirimService _bildirimManager;
        private IKullaniciService _kullaniciManager;
        public admin()
        {
            _bildirimManager = new BildirimManager(new LTSBildirimlerDal());
            _kullaniciManager =new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if(_kullanici != null && _kullanici.rol < 4)
            {              
                kullanici _authority = _kullanici;
                HttpRequest _request = base.Request;
                name = _authority.kullaniciAdSoyad;
                onlinestat = _authority.online.Value.AddMinutes(-10).ToString();
                id = _authority.kullaniciId;

                if (_authority.rol == 1)
                {

                    classifiedMenu.Visible = true;
                    adsMenu.Visible = true;
                    catMenu.Visible = true;
                    userMenu.Visible = true;
                    storeMenu.Visible = true;
                    areaMenu.Visible = true;
                    messageMenu.Visible = true;
                    settingsMenu.Visible = true;
                }

                else if (_authority.rol == 2)
                {

                    classifiedMenu.Visible = true;
                    adsMenu.Visible = true;
                    catMenu.Visible = true;
                    userMenu.Visible = true;
                    storeMenu.Visible = true;
                    areaMenu.Visible = true;
                    messageMenu.Visible = true;
                    settingsMenu.Visible = true;
                }

                else if (_authority.rol == 3)
                {

                    classifiedMenu.Visible = true;
                    adsMenu.Visible = true;
                    catMenu.Visible = false;
                    userMenu.Visible = false;
                    storeMenu.Visible = true;
                    areaMenu.Visible = true;
                    messageMenu.Visible = true;
                    settingsMenu.Visible = false;
                }

                if (_bildirimManager.Count(_authority.kullaniciId) != 0)
                {
                    headerNotCount.InnerText = _bildirimManager.Count(_authority.kullaniciId).ToString() + " adet okunmamış bildirimin var.";
                    spanNotCount.InnerText = _bildirimManager.Count(_authority.kullaniciId).ToString();
                }

                _kullaniciManager.UpdateBySessionInfo(_authority.kullaniciId, _request.Browser.Browser, _request.UserHostAddress);
                _kullaniciManager.UpdateByOnlineStatus(_authority.kullaniciId,10);
            }
            else
            {
                Response.Redirect("~/sysLogin/syslogin.aspx");
            }

        }

        protected void Cikis_Click(object sender, EventArgs e)
        {

            kullanici _authority = _kullanici;

            _kullaniciManager.UpdateByOnlineStatus(_authority.kullaniciId,-10);
            Session.Abandon();
            FormsAuthentication.SignOut();
       
            Response.Redirect("~/sysLogin/syslogin.aspx");

        }
    }
}