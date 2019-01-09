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
    public partial class favori_magaza : System.Web.UI.UserControl
    {
         
        magazaTakipciBll magazaTkpb = new magazaTakipciBll();
        public int kullaniciId;
        kullanici _kullanici;

        private IMagazaTakipciService _magazaTakipciManager;
        public favori_magaza()
        {
            _magazaTakipciManager = new MagazaTakipciManager(new LTSMagazaTakipcilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici != null)
            {
                if (!Page.IsPostBack)
                {
                    kullanici _authority = _kullanici;

                    kullaniciId = _authority.kullaniciId;
                    int magazaId = Convert.ToInt32(Request.QueryString["like"]);
                    if (Request.QueryString["like"] != null)
                    {
                        magazaTakip _magazaTakip = new magazaTakip
                        {
                            magazaId = magazaId,
                            kullaniciId = _authority.kullaniciId
                        };
                        _magazaTakipciManager.Delete(_magazaTakip);

                        //magazaTkpb.delete(magazaId, _authority.kullaniciId);
                    }

                }
            }
        }
    }
}


