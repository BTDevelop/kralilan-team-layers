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
    public partial class projeler : System.Web.UI.UserControl
    {
        projelerBll projeb = new projelerBll();
        public int usid;
        kullanici _kullanici;

        private IProjeService _projeManager;
        public projeler()
        {
            _projeManager = new ProjeManager(new LTSProjelerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                usid = _authority.kullaniciId;


                if (!Page.IsPostBack)
                {
                  
                    if (Request.QueryString["salesend"] != null)
                    {
                 
                        int _adsid = Convert.ToInt32(Request.QueryString["salesend"]);
                        DAL.projeler _projeStatus = new DAL.projeler
                        {
                            projeid = _adsid,
                            ponay = true,
                            psilindmi = false,
                            psatistami = false
                        };
                        _projeManager.UpdateStatus(_projeStatus);
                        Response.Redirect("~/secure/projelerim/");
                    }

                    if (Request.QueryString["dlt"] != null)
                    {
                        int _adsid = Convert.ToInt32(Request.QueryString["dlt"]);
                        DAL.projeler _projeStatus = new DAL.projeler
                        {
                            projeid = _adsid,
                            ponay = false,
                            psilindmi = true,
                            psatistami = false
                        };
                        _projeManager.UpdateStatus(_projeStatus);
                        Response.Redirect("~/secure/projelerim/");
                    }


                    if (Request.QueryString["salecont"] != null)
                    {
                        int _adsid = Convert.ToInt32(Request.QueryString["salecont"]);
                        DAL.projeler _projeStatus = new DAL.projeler
                        {
                            projeid = _adsid,
                            ponay = true,
                            psilindmi = false,
                            psatistami = true
                        };
                        _projeManager.UpdateStatus(_projeStatus);
                        Response.Redirect("~/secure/projelerim/");
                    }
                }

            }
        }
    }
}