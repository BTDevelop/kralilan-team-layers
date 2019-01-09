using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class kullanici_listele : System.Web.UI.UserControl
    {
        private IMagazaKullaniciService _magazaKullaniciManager;
        public kullanici_listele()
        {
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["how"]) == 1)
            {
                kullaniciRepeater.DataSource = _magazaKullaniciManager.GetByStoreId(Convert.ToInt32(Request.QueryString["magazaId"]));
                kullaniciRepeater.DataBind();
            }
          
        }
    }
}