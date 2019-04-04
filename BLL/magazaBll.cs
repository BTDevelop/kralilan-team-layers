using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BLL.EnumHelper;

namespace BLL
{
    public class magazaBll
    {
        magazaKategoriBll magazaKategoriBLL = new magazaKategoriBll();

        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_instrname"></param>
        /// <param name="_incorpo"></param>
        /// <param name="_inproid"></param>
        /// <param name="_indistid"></param>
        /// <param name="_inneigid"></param>
        /// <param name="_intaxno"></param>
        /// <param name="_intaxid"></param>
        //public void insert(string _inStoreName, bool _inCorpote, int _inProvId, int _inDistId, int _inNeigId,
        //                   string _inTaxNumber, int _inTaxId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        magaza magaza = new magaza();
        //        magaza.magazaAdi = _inStoreName;
        //        magaza.kurumsalMi = _inCorpote;
        //        magaza.ilId = _inProvId;
        //        magaza.ilceId = _inDistId;
        //        magaza.mahalleId = _inNeigId;
        //        magaza.vergiNo = _inTaxNumber;
        //        magaza.vergiDaireId = _inTaxId;
        //        magaza.onay = true;
        //        idc.magazas.InsertOnSubmit(magaza);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public magaza search(int _inStoreId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.magazas.Where(q => q.magazaId == _inStoreId).FirstOrDefault();
        //    }
        //}

        //public magaza getLastStore()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazas.OrderByDescending(x => x.magazaId).First();
        //        return value;
        //    }
        //}
        //public void update1(int _inStoreId, int _inStoreCatId, int _inStoreTypeId, string _inStoreName, string _inStoreLogo,
        //                    DateTime _inStartDate, DateTime _inEndDate, int _inProvId, int _inDistId, int _inNeigId, string _inUniqueKey,
        //                    int _inCoin, int _inVerify, int _inPass, int _inCorp, int _inDeleted, string _inExp)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazas.Where(q => q.magazaId == _inStoreId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            if (_inStoreCatId != -1) value.magazaKategoriId = _inStoreCatId;
        //            if (_inStoreTypeId != -1) value.magazaTurId = _inStoreTypeId;
        //            if (!String.IsNullOrEmpty(_inStoreName)) value.magazaAdi = _inStoreName;
        //            if (!String.IsNullOrEmpty(_inStoreLogo)) value.magazaLogo = _inStoreLogo;
        //            if (_inProvId != -1) value.ilId = _inProvId;
        //            if (_inDistId != -1) value.ilceId = _inDistId;
        //            if (_inNeigId != -1) value.mahalleId = _inNeigId;
        //            if (!String.IsNullOrEmpty(_inUniqueKey)) value.vergiNo = _inUniqueKey;
        //            if (_inCoin != -1) value.krediSayisi = _inCoin;
        //            if (_inVerify != -1) value.onay = Convert.ToBoolean(_inVerify);
        //            if (_inPass != -1) value.onay = Convert.ToBoolean(_inPass);
        //            if (_inCorp != -1) value.kurumsalMi = Convert.ToBoolean(_inCorp);
        //            if (_inDeleted != -1) value.silindiMi = Convert.ToBoolean(_inDeleted);
        //            if (!String.IsNullOrEmpty(_inExp)) value.aciklama = _inExp;

        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        //public void update(int _inStoreId, string _inStoreName, bool _inCorpote, int _inProvId, 
        //                   int _inDistId, int _inNeigId, string _inTaxNumber, int _inTaxId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazas.Where(q => q.magazaId == _inStoreId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.magazaAdi = _inStoreName;
        //            value.kurumsalMi = _inCorpote;
        //            value.ilId = _inProvId;
        //            value.ilceId = _inDistId;
        //            value.mahalleId = _inNeigId;
        //            value.vergiNo = _inTaxNumber;
        //            value.vergiDaireId = _inTaxId;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        //public int storeClassifiedCount(int _inStoreId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.ilans.Count(i => i.magazaId == _inStoreId && i.onay == 1 && i.silindiMi == false  && i.satildiMi == false);
        //    }
        //}

        //public int storeFollowerCount(int _income)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.magazaTakips.Count(i => i.magazaId == _income & i.kullanici.silindiMi == false);
        //    }
        //}

        //public void insert(string _inStoreName, bool _inCorpote, int _inProvId, int _inDistId, int _inNeigId, 
        //                   string _inTaxNumber, int _inTaxId, string _inStoreLogo, string _inExp, int _inStoreType, int _inPacId, int _inMonth)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        magaza magaza = new magaza();

        //        if (!String.IsNullOrEmpty(_inStoreName)) magaza.magazaAdi = _inStoreName;
        //        if (_inPacId != -1) magaza.magazaKategoriId = _inPacId;
        //        magaza.kurumsalMi = _inCorpote;
        //        if (_inProvId != -1) magaza.ilId = _inProvId;
        //        if (_inDistId != -1) magaza.ilceId = _inDistId;
        //        if (_inNeigId != -1) magaza.mahalleId = _inNeigId;
        //        if (!String.IsNullOrEmpty(_inTaxNumber)) magaza.vergiNo = _inTaxNumber;
        //        if (_inTaxId != -1) magaza.vergiDaireId = _inTaxId;
        //        if (!String.IsNullOrEmpty(_inStoreLogo)) magaza.magazaLogo = _inStoreLogo;
        //        if (!String.IsNullOrEmpty(_inExp)) magaza.aciklama = _inExp;
        //        magaza.pasifMi = true;
        //        magaza.silindiMi = false;
        //        magaza.onay = false;
        //        if (_inStoreType != -1) magaza.magazaTurId = _inStoreType;
        //        magaza.baslangicTarihi = DateTime.Now;
        //        magaza.bitisTarihi = DateTime.Now.AddMonths(_inMonth);
        //        idc.magazas.InsertOnSubmit(magaza);
        //        idc.SubmitChanges();
        //    }
        //}

        public void updateStoreStatus(int _inStoreId, bool _inStatus, bool _inDeleted)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.magazas.Where(q => q.magazaId == _inStoreId).FirstOrDefault();
                if (value != null)
                {
                    value.onay = _inStatus;
                    if (_inStatus)
                    {
                        magazaKategori _val = magazaKategoriBLL.getStoreCategoriByCatId(Convert.ToInt32(value.magazaKategoriId));
                        if (_val.paketSureId == Convert.ToInt32(magazaKategoriBll.StoreTimeType.UcAylik)) value.bitisTarihi = DateTime.Now.AddMonths(3);
                        else if (_val.paketSureId == Convert.ToInt32(magazaKategoriBll.StoreTimeType.AltiAylik)) value.bitisTarihi = DateTime.Now.AddMonths(6);
                        else if (_val.paketSureId == Convert.ToInt32(magazaKategoriBll.StoreTimeType.OnIkiAylik)) value.bitisTarihi = DateTime.Now.AddMonths(12);

                        value.pasifMi = false;
                        value.baslangicTarihi = DateTime.Now;

                    }
                    value.silindiMi = Convert.ToBoolean(_inDeleted);
                    idc.SubmitChanges();
                }
            }
        }

        public string getStoreTypeByStoreId(int _inStoreId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.magazas.Where(x => x.magazaId == _inStoreId).FirstOrDefault().magazaTur.turId.ToString();
                return value;
            }
        }

        //public IEnumerable<object> getGeneralStores()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from m in idc.magazas.Where(m => m.silindiMi == false && m.pasifMi == false && m.onay == true && m.magazaKategoriId == null)
        //                    select new
        //                    {
        //                        m.magazaId,
        //                        m.magazaAdi,
        //                    };

        //        return query.ToList();
        //    }


        //}

        //public IEnumerable<object> getStores()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from m in idc.magazas.Where(m => m.silindiMi == false && m.pasifMi == false && m.onay == true)
        //                    select new
        //                    {
        //                        m.magazaTur.kategori.kategoriAdi,
        //                        m.magazaId,
        //                        m.magazaAdi,
        //                        m.magazaKategori.magazaPaketId
        //                    };

        //        return query.ToList();
        //    }
        //}

        public object select(int _index, int _inCount, bool _inVerify, string _inSearch, string _inEcho)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.magazas.Where(k => k.silindiMi == false && k.onay == _inVerify)
                    select new
                    {
                        i.magazaId,
                        i.magazaAdi,
                        i.magazaKategori.kategori.kategoriAdi,
                        magazaPaket = EnumHelper.EnumHelper.GetDescription((StorePackageTypeString)Enum.Parse(typeof(StorePackageTypeString), i.magazaKategori.magazaPaketId.ToString())),
                    };

                if (String.IsNullOrEmpty(_inSearch) == false)
                    query = query.Where(x => x.magazaAdi.IndexOf(_inSearch) != -1);


                int totalCount = idc.magazas.Count(k => k.silindiMi == false & k.onay == _inVerify);

                int filterCount = query.Count();
                string payStatusStr = "";
                query = query.OrderByDescending(x => x.magazaId).Skip(_index).Take(_inCount);
                
                List<magaza> list = new List<magaza>();
                var data = query.ToList();
                odeme paymentObject = new odeme();
                bool paymentStatus = false;

                if (_inVerify == false)
                {
                    for (int i = 0; i < data.Count(); i++)
                    {
                        paymentObject = idc.odemes.Where(x =>
                                x.islemId == 15 && x.siparis.Contains("<adsid>" + data[i].magazaId + "</adsid>"))
                            .FirstOrDefault();
                        if (paymentObject != null) paymentStatus = (bool) paymentObject.basariliMi;
                        else paymentStatus = false;

                        if (paymentStatus)
                            payStatusStr =
                                "<a target='_blank' href='#' class='btn btn-primary btn-xs'>Ödeme Yapıldı</a>";
                        if (!paymentStatus)
                            payStatusStr =
                                "<a target='_blank' href='#' class='btn btn-danger btn-xs'>Ödeme Yapılmadı</a>";

                        list.Add(
                            new magaza
                            {
                                magazaId = data[i].magazaId,
                                magazaAdi = data[i].magazaAdi,
                                vergiNo = data[i].kategoriAdi,
                                magazaLogo = data[i].magazaPaket,
                                aciklama = @"<a target='_blank' class='btn btn-primary btn-xs' href='/magaza/" +
                                           data[i].magazaId + "/" + PublicHelper.Tools.URLConverter(data[i].magazaAdi) +
                                           @"'>Görüntüle</a>
                                         <a target='_blank' class='btn btn-warning btn-xs' href='/management/anaYonetim/magazaYonetimi/magaza.aspx?page=duzenle-icerik&store=" +
                                           data[i].magazaId + @"'>Düzenle</a>" + payStatusStr
                            }
                        );
                    }
                }
                else
                {
                    for (int i = 0; i < data.Count(); i++)
                    {
                        list.Add(
                            new magaza
                            {
                                magazaId = data[i].magazaId,
                                magazaAdi = data[i].magazaAdi,
                                vergiNo = data[i].kategoriAdi,
                                magazaLogo = data[i].magazaPaket,
                                aciklama = @"<a target='_blank' class='btn btn-primary btn-xs' href='/magaza/" +
                                           data[i].magazaId + "/" + PublicHelper.Tools.URLConverter(data[i].magazaAdi) +
                                           @"'>Görüntüle</a>
                                        <a target='_blank' class='btn btn-warning btn-xs' href='/management/anaYonetim/magazaYonetimi/magaza.aspx?page=duzenle-icerik&store=" +
                                           data[i].magazaId + @"'>Düzenle</a>" + payStatusStr
                            }
                        );
                    }
                }

                var cmd = new
                {
                    draw = _inEcho,
                    recordsTotal = totalCount,
                    recordsFiltered = filterCount,
                    data = list
                };

                return cmd;
            }
        }

    }
}
