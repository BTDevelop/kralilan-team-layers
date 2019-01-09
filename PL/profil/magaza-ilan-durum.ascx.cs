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
    public partial class magaza_ilan_durum : System.Web.UI.UserControl
    {
        kullanici _kullanici;
        kullaniciBll kullanicib = new kullaniciBll();
        magazaKullaniciBll magazaKllb = new magazaKullaniciBll();
        magazaBll magazaBLL = new magazaBll();

        public int userid, storeid;

        private IMagazaKullaniciService _magazaKullaniciManager;
        public magaza_ilan_durum()
        {
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;
                userid = _authority.kullaniciId;

                magazaKullanici _magazakullanici = _magazaKullaniciManager.GetByUserId(userid);
                storeid = _magazakullanici.magazaId;
            }
        }
    }
}