using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using BLL.EnumHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management
{
    public partial class odeme_fatura_yazdir : System.Web.UI.Page
    {
        public int odemeId;
        public string durum;
        public string islemtip;
        public string odemetip;
        public string ad;
        public string tutar;
        public string tarih;
        public int kullaniciId;
        public string mail;
        public string telefon = "";

        odemeBll odemeb = new odemeBll();
        kullaniciBll kullanicib = new kullaniciBll();
        dopingKategoriBll dopingKatb = new dopingKategoriBll();
        seciliDopingBll secDopingB = new seciliDopingBll();

        private IOdemeService _odemeManager;
        private IDopingKategoriService _dopingKategoriManager;
        private IKullaniciService _kullaniciManager;

        public odeme_fatura_yazdir()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
            _dopingKategoriManager = new DopingKategoriManager(new LTSDopingKategorilerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                odemeId = Convert.ToInt32(Request.QueryString["payment"]);
                DAL.odeme _odeme = _odemeManager.Get(odemeId);
                // islemtip = DAL.toolkit.OperationType(Convert.ToInt32(_odeme.islemId));
                odemetip = EnumHelper.GetDescription((PaymentTypeString)Enum.Parse(typeof(PaymentTypeString), _odeme.odemeTipId.ToString()));
                ad = _odeme.kullanici.kullaniciAdSoyad;
                tutar = String.Format(" {0:N0}", _odeme.odemeTutar);
                tarih = _odeme.tarih.ToString("dd MMMM yyyy");
                kullaniciId = Convert.ToInt32(_odeme.kullaniciId);


                List<BLL.ExternalClass.PaymentCS> siparisler = new List<BLL.ExternalClass.PaymentCS>();

                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(_odeme.siparis, typeof(List<BLL.ExternalClass.siparisDT>));


                for (int i = 0; i < siparislist.Count; i++)
                {
                    dopingKategori _dopKat = _dopingKategoriManager.Get(siparislist[i].showcasecatid);


                    var odemedata = new BLL.ExternalClass.PaymentCS
                    {
                        id = odemeId,
                        operation = _dopKat.doping.dopingAdi + "(" + _dopKat.dopingSureId + " Haftalık)",
                        cardno = "***********************",
                        paytype = odemetip,
                        paytotal = String.Format(" {0:N0}", siparislist[i].price) 

                    };

                    siparisler.Add(odemedata);
                }

                rppay.DataSource = siparisler;
                rppay.DataBind();


                if (_odeme.basariliMi == true)
                    durum = " <button class='btn btn-success pull-right' style='margin-right: 5px;'><i class='fa fa-check'></i> Ödeme Başarılı</button>";
                else
                    durum = " <button class='btn btn-danger pull-right' style='margin-right: 5px;'><i class='fa fa-times'></i> Ödeme Başarısız</button>";




                kullanici _kullanici = _kullaniciManager.Get(kullaniciId);

                //mail = _kullanici.email;
                var _value = _kullanici.telefonlars.Where(x => x.telefonTur == 1).FirstOrDefault();

                if (_value != null)
                {
                    telefon = "Telefon: +90-" + _value.telefon.ToString().Substring(0, 3) + "-" + _value.telefon.ToString().Substring(3, 7);
                }

                if (!String.IsNullOrEmpty(_kullanici.email))
                {
                    mail = "Email: " + _kullanici.email;
                }

            }
        }
    }
}