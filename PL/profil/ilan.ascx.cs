using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class ilan : System.Web.UI.UserControl
    {
        ilanBll ilanb = new ilanBll();
        public int userid;
        kullanici _kullanici;

        private IIlanService _ilanManager;
        public ilan()
        {
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                userid = _authority.kullaniciId;


                if (!Page.IsPostBack)
                {
                    if (Request.QueryString["pass"] != null)
                    {
                        int _adsid = Convert.ToInt32(Request.QueryString["pass"]);
                        _ilanManager.UpdateStatus(_adsid, 3, false, false, false);
                        Response.Redirect("~/secure/ilanlarim/");
                    }

                    if (Request.QueryString["bcon"] != null)
                    {
                        int _adsid = Convert.ToInt32(Request.QueryString["bcon"]);
                        _ilanManager.UpdateStatus(_adsid, 2, false, false, false);
                        Response.Redirect("~/secure/ilanlarim/");
                    }

                    if (Request.QueryString["dlt"] != null)
                    {
                        int _adsid = Convert.ToInt32(Request.QueryString["dlt"]);
                        _ilanManager.UpdateStatus(_adsid, 3, false, true, false);
                        Response.Redirect("~/secure/ilanlarim/");
                    }


                    if (Request.QueryString["sale"] != null)
                    {
                        int _adsid = Convert.ToInt32(Request.QueryString["sale"]);
                        _ilanManager.UpdateStatus(_adsid, 1, false, false, true);
                        Response.Redirect("~/secure/ilanlarim/");
                    }
                }

            }
        }
    }
}