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
using DAL.Enums;
using KralilanProject.Interfaces;

namespace PL.management.genelAyarlar
{
    public partial class odeme_fatura : System.Web.UI.UserControl
    {
        public int odemeId;
        public string durum;
        public string islemtip;
        public string odemetip;
        public string ad;
        public double tutar;
        public string tarih;
        public int kullaniciId;
        public string mail;
        public string telefon = "";

        private IOdemeService _odemeManager;
        private IMagazaKategoriService _magazaKategoriManager;
        private IDopingKategoriService _dopingKategoriManager;
        private IKullaniciService _kullaniciManager;
        private ISeciliDopingService _seciliDopingManager;
        public odeme_fatura()
        {
            _odemeManager= new OdemeManager(new LTSOdemelerDal());
            _magazaKategoriManager = new MagazaKategoriManager(new LTSMagazaKategorilerDal());
            _dopingKategoriManager = new DopingKategoriManager(new LTSDopingKategorilerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
            _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            odemeId = Convert.ToInt32(Request.QueryString["payment"]);
            DAL.odeme _odeme = _odemeManager.Get(odemeId);
            islemtip = EnumHelper.GetDescription((BLL.EnumHelper.PaymentOrderTypeString)Enum.Parse(typeof(BLL.EnumHelper.PaymentOrderTypeString), _odeme.islemId.ToString()));
            odemetip = EnumHelper.GetDescription((BLL.EnumHelper.PaymentTypeString)Enum.Parse(typeof(BLL.EnumHelper.PaymentTypeString), _odeme.odemeTipId.ToString()));
            ad = _odeme.kullanici.kullaniciAdSoyad;
            tutar = Convert.ToDouble(_odeme.odemeTutar);
            tarih = _odeme.tarih.ToString("dd MMMM yyyy");
            kullaniciId = Convert.ToInt32(_odeme.kullaniciId);

            List<BLL.ExternalClass.PaymentCS> siparisler = new List<BLL.ExternalClass.PaymentCS>();

            List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
            siparislist = (List<BLL.ExternalClass.siparisDT>)toolkit.GetObjectInXml(_odeme.siparis, typeof(List<BLL.ExternalClass.siparisDT>));


            for (int i = 0; i < siparislist.Count; i++)
            {
                if (islemtip == "Vitrin")
                {
                    if (siparislist[i].showcasecatid != -1)
                    {

                        dopingKategori _dopKat = _dopingKategoriManager.Get(siparislist[i].showcasecatid);

                        var odemedata = new BLL.ExternalClass.PaymentCS
                        {
                            id = odemeId,
                            operation = _dopKat.doping.dopingAdi + "(" + _dopKat.dopingSureId + " Haftalık)",
                            cardno = "***********************",
                            paytype = odemetip,
                            paytotal = String.Format(" {0:N0}", siparislist[i].price),
                            

                        };

                        siparisler.Add(odemedata);
                    }

                    else
                    {
                        dopingKategori _dopKat = _dopingKategoriManager.Get(siparislist[i].showcasecatid);

                        var odemedata = new BLL.ExternalClass.PaymentCS
                        {
                            id = odemeId,
                            operation = "İlan Ücreti",
                            cardno = "***********************",
                            paytype = odemetip,
                            paytotal = String.Format(" {0:N0}", siparislist[i].price),

                        };

                        siparisler.Add(odemedata);
                    }
                }
                else if (islemtip == "Mağaza")
                {
                    magazaKategoriBll magazaKatb = new magazaKategoriBll();
                    double magazaFiyat;
                    string magazaPaket = "";
                    int magazaKategoriId = Convert.ToInt32(siparislist[i].showcasecatid);
                    magazaKategori _magazaKat = _magazaKategoriManager.GetByCategoriId(magazaKategoriId);
                    if (_magazaKat.paketSureId == 1)
                    {

                        magazaFiyat = Convert.ToDouble(_magazaKat.fiyat);

                        magazaPaket = "3 Aylık Standart Mağaza";
                    }

                    else if (_magazaKat.paketSureId == 2)
                    {

                        magazaFiyat = Convert.ToDouble(_magazaKat.fiyat);

                        magazaPaket = "6 Aylık Standart Mağaza";

                    }
                    else if (_magazaKat.paketSureId == 3)
                    {
                        magazaFiyat = Convert.ToDouble(_magazaKat.fiyat);

                        magazaPaket = "12 Aylık Standart Mağaza";

                    }

                    var odemedata = new BLL.ExternalClass.PaymentCS
                    {
                        id = odemeId,
                        operation = magazaPaket,
                        cardno = "***********************",
                        paytype = odemetip,
                        paytotal = String.Format(" {0:N0}", siparislist[i].price),

                    };

                    siparisler.Add(odemedata);
                }

            }

            rppay.DataSource = siparisler;
            rppay.DataBind();

            if (!Page.IsPostBack)
            {
                rppay.DataSource = siparisler;
                rppay.DataBind();
            }

            if (_odeme.basariliMi == true)
            {
                durum = " <button class='btn btn-success pull-right' style='margin-right: 5px;'><i class='fa fa-check'></i> Ödeme Başarılı</button>";
                paymentok.Visible = false;
            }
            else
            {
                durum = " <button class='btn btn-danger pull-right' style='margin-right: 5px;'><i class='fa fa-times'></i> Ödeme Başarısız</button>";
                paymentok.Visible = true;
            }


            kullanici _kullanici = _kullaniciManager.Get(kullaniciId);

            var _value = _kullanici.telefonlars.Where(x => x.telefonTur == 1).FirstOrDefault();

            if (_value != null) telefon = "Telefon: +90-" + _value.telefon.ToString().Substring(0, 3) + "-" + _value.telefon.ToString().Substring(3, 7);

            if (!String.IsNullOrEmpty(_kullanici.email)) mail = "Email: " + _kullanici.email;

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            odemeId = Convert.ToInt32(Request.QueryString["payment"]);
            DAL.odeme _odeme = _odemeManager.Get(odemeId);

            if (_odeme.islemId != 20)
            {
                //Vitrin onaylama modülü
                List<BLL.ExternalClass.PaymentCS> siparisler = new List<BLL.ExternalClass.PaymentCS>();

                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(_odeme.siparis, typeof(List<BLL.ExternalClass.siparisDT>));

                for (int i = 0; i < siparislist.Count; i++)
                {
                    if (siparislist[i].showcasecatid != -1)
                    {
                        dopingKategori _dopKat = _dopingKategoriManager.Get(siparislist[i].showcasecatid);
                        int pubDays = Convert.ToInt32(_dopKat.dopingSureId) * 7;

                        seciliDoping _seciliDoping = new seciliDoping
                        {
                            ilanId = siparislist[i].adsid,
                            dopingKategoriId = siparislist[i].showcasecatid,
                            baslangicTarihi = DateTime.Now,
                            bitisTarihi = DateTime.Now.AddDays(pubDays),
                            onay = true
                        };

                        _seciliDopingManager.Add(_seciliDoping);

                        //secDopingB.insert(siparislist[i].adsid, siparislist[i].showcasecatid, DateTime.Now, DateTime.Now.AddDays(pubDays), true);
                    }

                }
            }

            DAL.odeme odeme = new DAL.odeme
            {
                odemeId = odemeId
            };

            _odemeManager.Update(odeme);

            //odemeb.update(odemeId);
        }

    }
}