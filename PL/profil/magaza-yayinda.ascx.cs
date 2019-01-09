using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class magaza_yayinda : System.Web.UI.UserControl
    {
        public int userIdentifier;
        public int storeIdentifier;
        kullanici userObject;
        ilanBll ilanb = new ilanBll();

        private IIlanService _ilanManager;
        public magaza_yayinda()
        {
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            userObject = kullaniciBll.getUsersBlock();

            if (userObject != null)
            {
                kullanici _authority = userObject;
                userIdentifier = _authority.kullaniciId;

                if (Session["StoreIdentifier"] != null) storeIdentifier = Convert.ToInt32(Session["StoreIdentifier"]);
            }

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["pass"] != null)
                {
                    int _adsid = Convert.ToInt32(Request.QueryString["pass"]);
                    _ilanManager.UpdateStatus(_adsid, 3, false, false, false);
                    Response.Redirect("~/secure/yayindaki-ilanlarim/");
                }

                if (Request.QueryString["bcon"] != null)
                {
                    int _adsid = Convert.ToInt32(Request.QueryString["bcon"]);
                    _ilanManager.UpdateStatus(_adsid, 2, false, false, false);
                    Response.Redirect("~/secure/yayindaki-ilanlarim/");
                }

                if (Request.QueryString["dlt"] != null)
                {
                    int _adsid = Convert.ToInt32(Request.QueryString["dlt"]);
                    _ilanManager.UpdateStatus(_adsid, 3, false, true, false);
                    Response.Redirect("~/secure/yayindaki-ilanlarim/");
                }


                if (Request.QueryString["sale"] != null)
                {
                    int _adsid = Convert.ToInt32(Request.QueryString["sale"]);
                    _ilanManager.UpdateStatus(_adsid, 1, false, false, true);
                    Response.Redirect("~/secure/yayindaki-ilanlarim/");
                }
            }

        }
    }
}