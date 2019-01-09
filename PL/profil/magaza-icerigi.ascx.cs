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
    public partial class magaza_icerigi : System.Web.UI.UserControl
    {
        magazaKullaniciBll magazaKllb = new magazaKullaniciBll();
        kullaniciBll kullanicib = new kullaniciBll();
        ilanBll ilanb = new ilanBll();
        kullanici _kullanici;

        public int userid, storeid;

        private IMagazaKullaniciService _magazaKullaniciManager;
        private IIlanService _ilanManager;
        public magaza_icerigi()
        {
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                userid = _authority.kullaniciId;

                magazaKullanici _magazakullanici = _magazaKullaniciManager.GetByUserId(userid);
                storeid = _magazakullanici.magaza.magazaId;

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