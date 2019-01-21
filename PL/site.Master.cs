using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.BLL.Concrete;
using KralilanProject.Interfaces;


namespace PL
{
    public partial class site : System.Web.UI.MasterPage
    {
        kullanici _kullanici;

        private IBildirimService _bildirimManager;
        private IKullaniciService _kullaniciManager;
        public site()
        {
            _bildirimManager = new BildirimManager(new LTSBildirimlerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _kullanici = kullaniciBll.getUsersBlock();

                if (_kullanici != null)
                {
                    HttpRequest _request = base.Request;
                    visitorPanel.Visible = false;
                    userPanel.Visible = true;
                    lblUserName.Text = _kullanici.kullaniciAdSoyad.ToString();

                    if (_bildirimManager.Count(_kullanici.kullaniciId) != 0)
                    {
                        span1.InnerText = _bildirimManager.Count(_kullanici.kullaniciId).ToString();
                    }

                    _kullaniciManager.UpdateBySessionInfo(_kullanici.kullaniciId, _request.Browser.Browser, _request.UserHostAddress);
                    _kullaniciManager.UpdateByOnlineStatus(_kullanici.kullaniciId, 10);

                }
            }
        }

        protected void Cikis_Click(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null)
            {
                _kullaniciManager.UpdateByOnlineStatus(_kullanici.kullaniciId, -10);
            }

            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/");
        }
    }
}