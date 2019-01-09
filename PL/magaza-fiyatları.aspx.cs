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

namespace PL
{
    public partial class magaza_fiyatları : System.Web.UI.Page
    {
        magazaKategoriBll magazaKtgb = new magazaKategoriBll();
        public string stdHalfPrice = "";
        public string stdFullPrice = "";
        public string prmHalfPrice = "";
        public string prmFullPrice = "";

        private IMagazaKategoriService _magazaKategoriManager;

        public magaza_fiyatları()
        {
            _magazaKategoriManager = new MagazaKategoriManager(new LTSMagazaKategorilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            int kategoriId = Convert.ToInt32(Request.QueryString["cat"]);
            kategoriId = 1;
            double halfStdPrice = Convert.ToDouble(_magazaKategoriManager.GetByPackageCategoriId(kategoriId, 1, 1).fiyat);
            double fullStdPrice = Convert.ToDouble(_magazaKategoriManager.GetByPackageCategoriId(kategoriId, 2, 1).fiyat);
            double halfPrmPrice = Convert.ToDouble(_magazaKategoriManager.GetByPackageCategoriId(kategoriId, 1, 2).fiyat);
            double fullPrmPrice = Convert.ToDouble(_magazaKategoriManager.GetByPackageCategoriId(kategoriId, 2, 2).fiyat);

            altiStn.Text = halfStdPrice.ToString();
            onIkiStn.Text = fullStdPrice.ToString();
            altiPre.Text = halfPrmPrice.ToString();
            onIkiPre.Text = fullPrmPrice.ToString();

            stdHalfPrice = (halfStdPrice * 6).ToString();
            stdFullPrice = (fullStdPrice * 12).ToString();
            prmHalfPrice = (halfPrmPrice * 6).ToString();
            prmFullPrice = (fullPrmPrice * 12).ToString();
        }
    }
}