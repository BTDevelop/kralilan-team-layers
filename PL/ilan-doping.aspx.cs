using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Collections;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using Newtonsoft.Json.Linq;

namespace PL
{
    public partial class ilan_doping : System.Web.UI.Page
    {
        kullanici _kullanici;
        private IDopingKategoriService _dopingKategoriManager;
        public ilan_doping()
        {
            _dopingKategoriManager = new DopingKategoriManager(new LTSDopingKategorilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (_kullanici == null)
            {
                Response.Redirect("~/giris-yap/");
            }
        }

        protected void devam_Click(object sender, EventArgs e)
        {
            ArrayList secilenDopingler = new ArrayList();
            JArray objDizi = new JArray();
            List<BLL.ExternalClass.siparisDT> siparisler = new List<BLL.ExternalClass.siparisDT>();
            int adsid = Convert.ToInt32(Session["ilanNo"]);

            if (Session["priceAds"] != null)
            {
                JObject obj = new JObject();
                obj.Add("islemId", 1);
                obj.Add("siparis", "İlan Ücreti");
                obj.Add("tutar", "10");
                obj.Add("vitrinKategori", "-1");
                obj.Add("primarykey", DateTime.Now.Ticks.ToString());

                objDizi.Add(obj);
            }

            if (Request.Form["slcthomeshowcase"] != "-1")
            {
                int _value = Convert.ToInt32(Request.Form["slcthomeshowcase"]);
                dopingKategori dopingKategori = _dopingKategoriManager.Get(_value);
                JObject obj = new JObject();

                obj.Add("islemId", 1);
                obj.Add("siparis", "Anasayfa Vitrini (" + dopingKategori.dopingSureId + " Haftalık)");
                obj.Add("tutar", dopingKategori.fiyat);
                obj.Add("vitrinKategori", _value);
                obj.Add("primarykey", DateTime.Now.ToString());

                objDizi.Add(obj);

                var siparisdata = new BLL.ExternalClass.siparisDT
                {
                    adsid = adsid,
                    optid = 1,
                    price = Convert.ToDouble(dopingKategori.fiyat)
                };

                siparisler.Add(siparisdata);
            }

            if (Request.Form["slctcatshowcase"] != "-1")
            {

                int _value = Convert.ToInt32(Request.Form["slctcatshowcase"]);
                dopingKategori dopingKategori = _dopingKategoriManager.Get(_value);

                JObject obj = new JObject();
                obj.Add("islemId", 3);
                obj.Add("siparis", "Kategori Vitrini (" + dopingKategori.dopingSureId + " Haftalık)");
                obj.Add("tutar", dopingKategori.fiyat);
                obj.Add("vitrinKategori", _value);
                obj.Add("primarykey", DateTime.Now.ToString());

                objDizi.Add(obj);

                var siparisdata = new BLL.ExternalClass.siparisDT
                {
                    adsid = adsid,
                    optid = 3,
                    price = Convert.ToDouble(dopingKategori.fiyat)

                };

                siparisler.Add(siparisdata);
            }
            if (Request.Form["slctemergencyshowcase"] != "-1")
            {

                int _value = Convert.ToInt32(Request.Form["slctemergencyshowcase"]);
                dopingKategori dopingKategori = _dopingKategoriManager.Get(_value);

                JObject obj = new JObject();
                obj.Add("islemId", 5);
                obj.Add("siparis", "Acil Acil Vitrini (" + dopingKategori.dopingSureId + " Haftalık)");
                obj.Add("tutar", dopingKategori.fiyat);
                obj.Add("vitrinKategori", _value);
                obj.Add("primarykey", DateTime.Now.ToString());

                objDizi.Add(obj);

                var siparisdata = new BLL.ExternalClass.siparisDT
                {
                    adsid = adsid,
                    optid = 5,
                    price = Convert.ToDouble(dopingKategori.fiyat)

                };

                siparisler.Add(siparisdata);
            }

            if (Request.Form["slctsearchshowcase"] != "-1")
            {
                int _value = Convert.ToInt32(Request.Form["slctsearchshowcase"]);
                dopingKategori dopingKategori = _dopingKategoriManager.Get(_value);

                JObject obj = new JObject();
                obj.Add("islemId", 2);
                obj.Add("siparis", "Arama Sonuç Vitrini (" + dopingKategori.dopingSureId + " Haftalık)");
                obj.Add("tutar", dopingKategori.fiyat);
                obj.Add("vitrinKategori", _value);
                obj.Add("primarykey", DateTime.Now.ToString());

                objDizi.Add(obj);

                var siparisdata = new BLL.ExternalClass.siparisDT
                {
                    adsid = adsid,
                    optid = 2,
                    price = Convert.ToDouble(dopingKategori.fiyat)

                };

                siparisler.Add(siparisdata);
        
            }


            if (Request.Form["slctdiscountshowcase"] != "-1")
            {
                int _value = Convert.ToInt32(Request.Form["slctdiscountshowcase"]);
                dopingKategori dopingKategori = _dopingKategoriManager.Get(_value);

                JObject obj = new JObject();
                obj.Add("islemId", 8);
                obj.Add("siparis", "Fiyatı Düştü Vitrini (" + dopingKategori.dopingSureId + " Haftalık)");
                obj.Add("tutar", dopingKategori.fiyat);
                obj.Add("vitrinKategori", _value);
                obj.Add("primarykey", DateTime.Now.ToString());

                objDizi.Add(obj);


                var siparisdata = new BLL.ExternalClass.siparisDT
                {
                    adsid = adsid,
                    optid = 8,
                    price = Convert.ToDouble(dopingKategori.fiyat)

                };

                siparisler.Add(siparisdata);
            }

            Session["showcasebasket"] = objDizi;

            Response.Redirect("~/hizli-satis-odeme/");
        }
    }
}