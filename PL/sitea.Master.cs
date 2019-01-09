using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Web.Security;

namespace PL
{
    public partial class site : System.Web.UI.MasterPage
    {
        mesajBll mesajb = new mesajBll();
        bildirimBll bildirimb = new bildirimBll();
        kullaniciBll kullanicib = new kullaniciBll();
        kullanici _kullanici;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                _kullanici = kullaniciBll.GetUserUseId();

                if (_kullanici != null)
                {
                    //if (!Page.IsPostBack)
                    //{
                    //if (Session["unique-site-user"] != null)

                    //if (HttpContext.Current.User.Identity.Name != "")
                    //{
                    //    kullanici _authority = kullanicib.search(Convert.ToInt32(HttpContext.Current.User.Identity.Name));
                    //    HttpRequest _request = base.Request;
                    //if(!String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
                    //    if (Session["unique-site-user"] != null)
                    //{
                    //kullanici _authority = (kullanici)Session["unique-site-user"];

                    HttpRequest _request = base.Request;
                    //_kullanici _autority olrak değiştirildi.
                    //if (_kullanici.rol == 4 || _kullanici.rol == 3 || _kullanici.rol == 2 || _kullanici.rol == 1)
                    //{
                    visitorPanel.Visible = false;
                    userPanel.Visible = true;
                    lblUserName.Text = _kullanici.kullaniciAdSoyad.ToString();
                    //span3.InnerText = kullanicib.search(_authority.kullaniciId).kredi.ToString();
                    //}

                    if (mesajb.count(1, _kullanici.kullaniciId) != 0)
                    {
                        //span2.InnerText = mesajb.count(1, _authority.kullaniciId).ToString();
                    }

                    if (bildirimb.count(_kullanici.kullaniciId) != 0)
                    {
                        span1.InnerText = bildirimb.count(_kullanici.kullaniciId).ToString();
                    }

                    kullanicib.SessionInfo(_kullanici.kullaniciId, _request.Browser.Browser, _request.UserHostAddress);
                    kullanicib.OnlineStatus(_kullanici.kullaniciId, 1);

                    //}
                }
            }          
        }

        protected void Cikis_Click(object sender, EventArgs e)
        {
            //kullanici _authority = (kullanici)Session["unique-site-user"];

            kullanicib.OnlineStatus(_kullanici.kullaniciId, 2);
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/");
        }
    }
}
