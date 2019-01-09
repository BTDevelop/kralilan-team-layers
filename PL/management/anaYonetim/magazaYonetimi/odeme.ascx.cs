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

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class ödeme : System.Web.UI.UserControl
    {
        magazaKategoriBll magazaKatb = new magazaKategoriBll();
        public double magazaFiyat;
        public string magazaPaket;

        private IMagazaKategoriService _magazaKategoriManager;
        public ödeme()
        {
            _magazaKategoriManager = new MagazaKategoriManager(new LTSMagazaKategorilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int magazaKategoriId = Convert.ToInt32(Request.QueryString["pac"]);
            magazaKategori _magazaKat = _magazaKategoriManager.GetByCategoriId(magazaKategoriId);
            if (_magazaKat.paketSureId == 1)
            {

                magazaFiyat = Convert.ToDouble(_magazaKat.fiyat * 6);
                if (_magazaKat.paketSureId == 1)
                {
                    magazaPaket = "6 Aylık Standart";
                }
                else
                {
                    magazaPaket = "6 Aylık Premium";

                }
            }
            else
            {
                magazaFiyat = Convert.ToDouble(_magazaKat.fiyat * 12);
                if (_magazaKat.paketSureId == 1)
                {
                    magazaPaket = "12 Aylık Standart";
                }
                else
                {
                    magazaPaket = "12 Aylık Premium";

                }
            }


            //List<BLL.deff.siparisDT> siparisler = new List<BLL.deff.siparisDT>();


            //var siparisdata = new BLL.deff.siparisDT
            //{
            //    adsid = adsid,
            //    optid = 16,
            //    price = magazaFiyat,
            //    showcasecatid = magazaKategoriId
            //};

            //siparisler.Add(siparisdata);

            //odemeBll odemeb = new odemeBll();

            //string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
            //txtstr = txtstr.Replace("\r\n", "").Trim();
            //txtstr = txtstr.Replace("  ", "");
            //List<BLL.deff.siparisDT> siparislist = new List<BLL.deff.siparisDT>();
            //siparislist = (List<BLL.deff.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.deff.siparisDT>));


            //int kullaniciId = Convert.ToInt32(Session["storeadmin"]);
            //odemeb.insert(
            //      kullaniciId,
            //      magazaFiyat,
            //      10,
            //      -1,
            //      "",
            //      false,
            //      txtstr
            //      );
        }

        protected void devam_Click(object sender, EventArgs e)
        {

        }
    }
}