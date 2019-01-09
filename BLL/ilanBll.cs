using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Newtonsoft.Json;
using System.IO;
using BLL.EnumHelper;
using BLL.ExternalClass;
using static DAL.toolkit;
using BLL.Formatter;

namespace BLL
{
    public class ilanBll
    {

        Formatter.Formatter formatter = new Formatter.Formatter();

        ozelliklerBll _prop_object = new ozelliklerBll();

        public enum ClassifiedType
        {
            satilik = 1,
            kiralik = 2,
            günlükkiralik = 3,
            devren = 4,
            devrensatilik = 5
        }

        public enum VerifyStatus
        {
            onaylanmis = 1,
            onay_bekliyor = 2,
            onaylanmamis = 3
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inTypeId"></param>
        /// <param name="_inCatId"></param>
        /// <param name="_inPrice"></param>
        /// <param name="_inCurr"></param>
        /// <param name="_inUserId"></param>
        /// <param name="_inProvId"></param>
        /// <param name="_inDistId"></param>
        /// <param name="_inNeigId"></param>
        /// <param name="_inHeader"></param>
        /// <param name="_inExp"></param>
        /// <param name="_inStoreId"></param>
        /// <param name="_inVerify"></param>
        /// <param name="_inPrivacy"></param>
        /// <param name="_inCoord"></param>
        /// <param name="_inTextValues"></param>
        /// <param name="_inSelectValues"></param>
        /// <param name="_inPicValues"></param>
        /// <param name="_inLat"></param>
        /// <param name="_inLng"></param>
        //public void insert(int _inTypeId, int _inCatId, double _inPrice, int _inCurr, int _inUserId,
        //                   int _inProvId, int _inDistId, int _inNeigId, string _inHeader, string _inExp,
        //                   int _inStoreId, int _inVerify, bool _inPrivacy, string _inCoord, string _inTextValues,
        //                   string _inSelectValues, string _inPicValues, Single _inLat, Single _inLng)
        //{

        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        ilan ilan = new ilan();
        //        if (_inTypeId != -1) ilan.ilanTurId = _inTypeId;
        //        if (_inCatId != -1) ilan.kategoriId = _inCatId;
        //        if (_inPrice != -1) ilan.fiyat = _inPrice;
        //        if (_inCurr != -1) ilan.fiyatTurId = _inCurr;
        //        if (_inUserId != -1) ilan.kullaniciId = _inUserId;
        //        if (_inStoreId != -1) ilan.magazaId = _inStoreId;
        //        if (_inProvId != -1) ilan.ilId = _inProvId;
        //        if (_inDistId != -1) ilan.ilceId = _inDistId;
        //        if (_inNeigId != -1) ilan.mahalleId = _inNeigId;
        //        if (!String.IsNullOrEmpty(_inHeader)) ilan.baslik = _inHeader;
        //        if (!String.IsNullOrEmpty(_inExp)) ilan.aciklama = _inExp;
        //        ilan.baslangicTarihi = DateTime.Now;
        //        ilan.bitisTarihi = (DateTime.Now.AddYears(1));
        //        if (_inVerify != -1) ilan.onay = _inVerify;
        //        ilan.ziyaretci = 0;
        //        ilan.satildiMi = false;
        //        ilan.numaraYayinlansinMi = _inPrivacy;
        //        if (!String.IsNullOrEmpty(_inCoord)) ilan.koordinat = _inCoord;
        //        if (!String.IsNullOrEmpty(_inTextValues)) ilan.girilenOzellik = _inTextValues;
        //        if (!String.IsNullOrEmpty(_inSelectValues)) ilan.secilenOzellik = _inSelectValues;
        //        if (!String.IsNullOrEmpty(_inPicValues)) ilan.resim = _inPicValues;
        //        if (_inLat != -1) ilan.ilat = _inLat;
        //        if (_inLng != -1) ilan.ilng = _inLng;
        //        idc.ilans.InsertOnSubmit(ilan);
        //        idc.SubmitChanges();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inAdsId"></param>
        /// <param name="_inPrice"></param>
        /// <param name="_inCurr"></param>
        /// <param name="_inUserId"></param>
        /// <param name="_inProvId"></param>
        /// <param name="_inDistId"></param>
        /// <param name="_inNeigId"></param>
        /// <param name="_inHeader"></param>
        /// <param name="_inExp"></param>
        /// <param name="_inStoreId"></param>
        /// <param name="_inVerify"></param>
        /// <param name="_inSales"></param>
        /// <param name="_inPrivacy"></param>
        /// <param name="_inCoord"></param>
        /// <param name="_inTextValues"></param>
        /// <param name="_inSelectValues"></param>
        /// <param name="_inPicValues"></param>
        /// <param name="_inLat"></param>
        /// <param name="_inLng"></param>
        /// <param name="_inDate"></param>
        /// <param name="_inDeleted"></param>
        //public void update(int _inAdsId, double _inPrice, int _inCurr, int _inUserId, int _inProvId,
        //                   int _inDistId, int _inNeigId, string _inHeader, string _inExp, int _inStoreId,
        //                   int _inVerify, bool _inSales, bool _inPrivacy, string _inCoord, string _inTextValues,
        //                   string _inSelectValues, string _inPicValues, Single _inLat, Single _inLng, DateTime _inDate, bool _inDeleted)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {

        //        var value = idc.ilans.Where(q => q.ilanId == _inAdsId).SingleOrDefault();

        //        if (value != null)
        //        {
        //            if (_inPrice != -1) value.fiyat = _inPrice;
        //            if (_inCurr != -1) value.fiyatTurId = _inCurr;
        //            if (_inUserId != -1) value.kullaniciId = _inUserId;
        //            if (_inStoreId != -1) value.magazaId = _inStoreId;
        //            if (_inProvId != -1) value.ilId = _inProvId;
        //            if (_inDistId != -1) value.ilceId = _inDistId;
        //            if (_inNeigId != -1) value.mahalleId = _inNeigId;
        //            if (!String.IsNullOrEmpty(_inHeader)) value.baslik = _inHeader;
        //            if (!String.IsNullOrEmpty(_inExp)) value.aciklama = _inExp;
        //            value.baslangicTarihi = _inDate;
        //            value.bitisTarihi = (_inDate.AddYears(1));
        //            if (_inVerify != -1) value.onay = _inVerify;
        //            value.satildiMi = false;
        //            value.numaraYayinlansinMi = _inPrivacy;
        //            if (!String.IsNullOrEmpty(_inCoord)) value.koordinat = _inCoord;
        //            if (!String.IsNullOrEmpty(_inTextValues)) value.girilenOzellik = _inTextValues;
        //            if (!String.IsNullOrEmpty(_inSelectValues)) value.secilenOzellik = _inSelectValues;
        //            if (!String.IsNullOrEmpty(_inPicValues)) value.resim = _inPicValues;
        //            if (_inLat != -1) value.ilat = _inLat;
        //            if (_inLng != -1) value.ilng = _inLng;
        //            value.silindiMi = _inDeleted;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_intype"></param>
        /// <param name="_incatid"></param>
        /// <param name="_inprice"></param>
        /// <param name="_incurr"></param>
        /// <param name="_inuserid"></param>
        /// <param name="_inprovid"></param>
        /// <param name="_indistid"></param>
        /// <param name="_inneigid"></param>
        /// <param name="_inheader"></param>
        /// <param name="_inexp"></param>
        /// <param name="_instrid"></param>
        /// <param name="_inok"></param>
        /// <param name="_inpriva"></param>
        /// <param name="_incoor"></param>
        /// <param name="_intext"></param>
        /// <param name="_inslct"></param>
        /// <param name="_inpic"></param>
        /// <param name="_inlat"></param>
        /// <param name="_inlng"></param>
        //public void insert1(int _inType, int _inCatId, double _inPrice, int _inCurr, int _inUserId,
        //                    int _inProvId, int _inDistId, int _inNeigId, string _inHeader, string _inExp,
        //                    int _inStoreId, int _inVerify, bool _inPriva, string _inCoor, string _inText,
        //                    string _inSelect, string _inPic, Single _inLat, Single _inLng)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        ilan ilan = new ilan();

        //        ilan.ilanTurId = _inType;
        //        ilan.kategoriId = _inCatId;
        //        ilan.fiyat = _inPrice;
        //        ilan.fiyatTurId = _inCurr;
        //        ilan.kullaniciId = _inUserId;
        //        if (_inStoreId != -1) ilan.magazaId = _inStoreId;
        //        ilan.ilId = _inProvId;
        //        ilan.ilceId = _inDistId;
        //        ilan.mahalleId = _inNeigId;
        //        ilan.baslik = _inHeader;
        //        ilan.aciklama = _inExp;
        //        ilan.baslangicTarihi = DateTime.Now;
        //        ilan.bitisTarihi = (DateTime.Now.AddYears(1));
        //        ilan.onay = _inVerify;
        //        ilan.ziyaretci = 0;
        //        ilan.satildiMi = false;
        //        ilan.numaraYayinlansinMi = _inPriva;
        //        ilan.koordinat = _inCoor;
        //        ilan.girilenOzellik = _inText;
        //        ilan.secilenOzellik = _inSelect;
        //        ilan.resim = _inPic;
        //        if (_inLat != -1) ilan.ilat = _inLat;
        //        if (_inLng != -1) ilan.ilng = _inLng;
        //        idc.ilans.InsertOnSubmit(ilan);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_inadsid"></param>
        /// <returns></returns>
        public ilan search(int _inAdsId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.ilans.Where(i => i.ilanId == _inAdsId).SingleOrDefault();
                return value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inadsid"></param>
        /// <param name="_inprice"></param>
        /// <param name="_incurr"></param>
        /// <param name="_inuserid"></param>
        /// <param name="_inprovid"></param>
        /// <param name="_indistid"></param>
        /// <param name="_inneigid"></param>
        /// <param name="_inheader"></param>
        /// <param name="_inexp"></param>
        /// <param name="_instrid"></param>
        /// <param name="_inok"></param>
        /// <param name="_insalest"></param>
        /// <param name="_inpriva"></param>
        /// <param name="_incoor"></param>
        /// <param name="_intext"></param>
        /// <param name="_inslct"></param>
        /// <param name="_inpic"></param>
        /// <param name="_inlat"></param>
        /// <param name="_inlng"></param>
        /// <param name="_indate"></param>
        /// <param name="_indlt"></param>
        //public void update1(int _inAdsId, double _inPrice, int _inCurr, int _inUserId, int _inProvId,
        //    int _inDistId, int _inNeigId, string _inHeader, string _inExp, int _inStoreId, int _inVerify, bool _inSales,
        //    bool _inPriva, string _inCoor, string _intext, string _inSelect, string _inPic, Single _inLat, Single _inLng, DateTime _inDate, bool _inDeleted)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilans.Where(q => q.ilanId == _inAdsId).SingleOrDefault();
        //        if (value != null)
        //        {
        //            value.fiyat = _inPrice;
        //            value.fiyatTurId = _inCurr;
        //            value.kullaniciId = _inUserId;
        //            if (_inStoreId != -1) value.magazaId = _inStoreId;
        //            value.ilId = _inProvId;
        //            value.ilceId = _inDistId;
        //            value.mahalleId = _inNeigId;
        //            value.baslik = _inHeader;
        //            value.aciklama = _inExp;
        //            value.baslangicTarihi = _inDate;
        //            value.bitisTarihi = (_inDate.AddYears(1));
        //            value.onay = _inVerify;
        //            value.satildiMi = false;
        //            value.numaraYayinlansinMi = _inPriva;
        //            if (!String.IsNullOrEmpty(_inCoor)) value.koordinat = _inCoor;
        //            value.girilenOzellik = _intext;
        //            value.secilenOzellik = _inSelect;
        //            if (_inPic != null) value.resim = _inPic;
        //            if (_inLat != -1) value.ilat = _inLat;
        //            if (_inLng != -1) value.ilng = _inLng;
        //            value.silindiMi = _inDeleted;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        //public ilan getLastOneAds()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilans.OrderByDescending(x => x.ilanId).First();
        //        return value;
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inAdsId"></param>
        /// <param name="_inPicValues"></param>
        //public void updatePictureByAdsId(int _inAdsId, string _inPicValues)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilans.Where(q => q.ilanId == _inAdsId).SingleOrDefault();

        //        if (value != null)
        //        {
        //            value.resim = _inPicValues;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_index"></param>
        /// <param name="_inCount"></param>
        /// <param name="_inSort"></param>
        /// <param name="_inDataType"></param>
        /// <param name="_inDateRange"></param>
        /// <returns></returns>
        public string getLastHoursAds(int _index, int _inCount, int _inSort, IFormatter _inReturnType, int _inDateRange)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilans.Where(i => i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false && i.satildiMi == false)
                            select new
                            {
                                i.ilanId,
                                i.baslik,
                                i.fiyat,
                                i.fiyatTurId,
                                i.aciklama,
                                i.magazaId,
                                i.baslangicTarihi,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                                i.resim,
                                i.kategori.kategoriAdi,
                                i.mahalleler.mahalleAdi,
                                baslikFormat = PublicHelper.Tools.URLConverter(i.baslik),
                                fiyatFormat = String.Format(" {0:N0}", i.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                            };


                if (_inDateRange == 1) query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)));

                else if (_inDateRange == 2) query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(3, 0, 0, 0, 0)));

                else if (_inDateRange == 3) query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0, 0)));

                else if (_inDateRange == 4) query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(15, 0, 0, 0, 0)));

                else query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(30, 0, 0, 0, 0)));


                if (_inSort == 1) query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                else if (_inSort == 2) query = query.OrderBy(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                else if (_inSort == 3) query = query.OrderByDescending(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);

                else query = query.OrderBy(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);


                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }
        /// <summary>
        /// satılan ilanlar
        /// </summary>
        /// <param name="_index"></param>
        /// <param name="_count"></param>
        /// <param name="_insort"></param>
        /// <param name="_indatatype"></param>
        /// <returns></returns>
        public string getSalesAds(int _index, int _inCount, int _inSort, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilans.Where(i => i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false && i.satildiMi == true)
                            select new
                            {
                                i.ilanId,
                                i.baslik,
                                i.fiyat,
                                i.fiyatTurId,
                                i.aciklama,
                                i.magazaId,
                                i.baslangicTarihi,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                                i.resim,
                                i.kategori.kategoriAdi,
                                i.mahalleler.mahalleAdi,
                                baslikFormat = PublicHelper.Tools.URLConverter(i.baslik),
                                fiyatFormat = String.Format(" {0:N0}", i.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),

                            };

                if (_inSort == 1) query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                else if (_inSort == 2) query = query.OrderBy(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                else if (_inSort == 3) query = query.OrderByDescending(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);

                else query = query.OrderBy(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);


                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inWhoFrom"></param>
        /// <param name="_index"></param>
        /// <param name="_inCount"></param>
        /// <param name="_inOpt"></param>
        /// <returns></returns>
        public string getAdsBySellerUser(int _inWhoFrom, int _index, int _inCount, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilans.Where(i => i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false && i.satildiMi == false && i.kullaniciId == _inWhoFrom && i.magazaId == null)
                            select new
                            {
                                i.ilanId,
                                i.baslik,
                                i.baslangicTarihi,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                i.mahalleler.mahalleAdi,
                                i.fiyat,
                                i.kategori.kategoriAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                                resim = i.resim,
                                dopingCtrl = i.seciliDopings.FirstOrDefault().dopingKategori.dopingId,
                                baslikFormat = PublicHelper.Tools.URLConverter(i.baslik),
                                fiyatFormat = String.Format(" {0:N0}", i.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                            };

                query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inWhoFrom"></param>
        /// <param name="_index"></param>
        /// <param name="_inCount"></param>
        /// <param name="_inOpt"></param>
        /// <returns></returns>
        public string getAdsUserOrStore(int _inWhoFrom, int _index, int _inCount, int _inOpt, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilans.Where(i => i.silindiMi == false)
                            select new
                            {
                                i.ilanId,
                                i.kullaniciId,
                                i.magazaId,
                                i.baslik,
                                i.baslangicTarihi,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                i.mahalleler.mahalleAdi,
                                i.fiyat,
                                i.kategori.kategoriAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                                resim = i.resim,
                                dopingCtrl = i.seciliDopings.FirstOrDefault().dopingKategori.dopingId,
                                i.satildiMi,
                                i.onay,
                                i.pasifMi,
                                baslikFormat = PublicHelper.Tools.URLConverter(i.baslik),
                                fiyatFormat = String.Format(" {0:N0}", i.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                            };

                if (_inOpt == 1) query = query.Where(i => i.kullaniciId == _inWhoFrom && i.magazaId == null);
                else query = query.Where(i => i.magazaId == _inWhoFrom);

                query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();

            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_incat"></param>
        /// <param name="_intype"></param>
        /// <param name="_inwhoFrom"></param>
        /// <returns></returns>
        public int count(int _inCatId, int _inTypeId, int _inWhoFrom)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.ilans.Where(q => q.onay == (int)VerifyStatus.onaylanmis && q.silindiMi == false && q.satildiMi == false);
                if (_inCatId != -1)
                {
                    var itemTopValue = idc.kategoris.Where(x => x.ustKategoriId == _inCatId).FirstOrDefault();

                    if (itemTopValue == null) value = value.Where(q => q.kategoriId == _inCatId);
                    else value = value.Where(q => q.kategori.ustKategoriId == _inCatId);
                }

                if (_inTypeId != -1) value = value.Where(q => q.ilanTurId == _inTypeId);

                if (_inWhoFrom != -1)
                {
                    if (_inWhoFrom == 0) value = value.Where(q => q.magazaId == null);
                    else value = value.Where(q => q.magaza.magazaTur.turId == _inWhoFrom);
                }

                int count = value.Count();
                return count;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inopt"></param>
        /// <returns></returns>
        public int countOther(int _inOpt)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.ilans.Where(q => q.onay == (int)VerifyStatus.onaylanmis && q.silindiMi == false);

                if (_inOpt == 48) value = value.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)) && q.satildiMi == false);
                else value = value.Where(q => q.satildiMi == true);

                return value.Count();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="whoFrom"></param>
        /// <param name="index"></param>
        /// <param name="pageSize"></param>
        /// <param name="opt"></param>
        /// <param name="sort"></param>
        /// <returns></returns>
        public string getAdsByStoreId(int _inWhoFrom, int _index, int _inCount, IFormatter _inReturnType, int _inSort)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilans.Where(i => i.onay == (int)VerifyStatus.onaylanmis && i.magazaId == _inWhoFrom && i.silindiMi == false && i.satildiMi == false)
                            select new
                            {
                                i.ilanId,
                                i.baslik,
                                i.baslangicTarihi,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                i.mahalleler.mahalleAdi,
                                i.fiyat,
                                i.kategori.kategoriAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                                resim = i.resim,
                                dopingCtrl = i.seciliDopings.FirstOrDefault().dopingKategori.dopingId,
                                baslikFormat = PublicHelper.Tools.URLConverter(i.baslik),
                                fiyatFormat = String.Format(" {0:N0}", i.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                            };

                if (_inSort == 1) query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                else if (_inSort == 2) query = query.OrderBy(x => x.baslangicTarihi).Skip(_inCount * (_inCount)).Take(_inCount);

                else if (_inSort == 3) query = query.OrderByDescending(x => x.fiyat).Skip(_inCount * (_inCount)).Take(_inCount);

                else query = query.OrderBy(x => x.fiyat).Skip(_inCount * (_inCount)).Take(_inCount);


                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inadsid"></param>
        /// <param name="_inok"></param>
        /// <param name="_inpass"></param>
        /// <param name="_indlt"></param>
        /// <param name="_insale"></param>
        //public void updateStatusAdsByAdsId(int _inAdsId, int _inVerify, bool _inPass, bool _inDelete, bool _inSales)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilans.Where(q => q.ilanId == _inAdsId).FirstOrDefault();

        //        if (value != null)
        //        {
        //            value.silindiMi = _inDelete;
        //            value.onay = _inVerify;
        //            value.pasifMi = _inPass;
        //            value.satildiMi = _inSales;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}


        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inadsid"></param>
        /// <param name="_inuserid"></param>
        /// <returns></returns>
        //public ilan getAdsByUserIdOrStoreId(int _inAdsId, int _inUserId, int _inStoreId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilans.Where(i => i.ilanId == _inAdsId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            if (_inStoreId != -1) value = value.magazaId == _inStoreId ? value : null;
        //            else if (_inUserId != -1) value = value.kullaniciId == _inUserId ? value : null;

        //        }

        //        return value;
        //    }
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <returns></returns>
        //public ilan getLastAdsByUserId(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilans.Where(i => i.kullaniciId == _inUserId & i.silindiMi == false && i.onay == (int)VerifyStatus.onaylanmis)
        //                             .OrderByDescending(x => x.baslangicTarihi).FirstOrDefault();
        //        return value;
        //    }
        //}

        public string getAdsByStore(int _index, int _inCount, int _inUserId, int _inStoreId, string _inSearchWord, int _inStatus, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilans.Where(i => i.silindiMi == false)
                            select new
                            {
                                i.ilanId,
                                i.baslik,
                                i.baslangicTarihi,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                i.mahalleler.mahalleAdi,
                                i.fiyat,
                                i.kategori.kategoriAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                                resim = i.resim,
                                dopingCtrl = i.seciliDopings.FirstOrDefault().dopingKategori.dopingId,
                                i.satildiMi,
                                i.onay,
                                i.pasifMi,
                                i.kullaniciId,
                                i.magazaId,
                                i.ziyaretci,
                                baslikFormat = PublicHelper.Tools.URLConverter(i.baslik),
                                fiyatFormat = String.Format(" {0:N0}", i.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                            };

                if (_inStatus != -1)
                {
                    if (_inStatus == 1) { query = query.Where(x => x.onay == 1); }
                    else if (_inStatus == 2) { query = query.Where(x => x.onay == 2 || x.onay == 3); }
                }

                if (!String.IsNullOrEmpty(_inSearchWord)) { query = query.Where(x => x.ilanId.ToString().Contains(_inSearchWord) || x.baslik.Contains(_inSearchWord)); }

                if (_inUserId != -1) { query = query.Where(x => x.kullaniciId == _inUserId && x.magazaId == null); }

                if (_inStoreId != -1) { query = query.Where(x => x.magazaId == _inStoreId); }

                query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);


                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        public class ViewsInClassified
        {
            public int viewsCount { get; set; }

            public string viewsDate { get; set; }
        }

        public string GetViewsReportByStore(int _instoreid, int _indaterange)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var queryVisitor = idc.ziyaretcis;

                var queryClassified = idc.ilans.Where(x => x.silindiMi == false && x.magazaId == _instoreid);

                List<ViewsInClassified> resultList = new List<ViewsInClassified>();

                for (int i = _indaterange - 1; i >= 0; i--)
                {
                    foreach (var itemClassified in queryClassified.ToList())
                    {
                        int _tempCount = queryVisitor.Where(x => x.ilanId == itemClassified.ilanId && x.sonGirisTarihi == DateTime.Now.AddDays(i)).Count();

                        var _data = new ViewsInClassified
                        {
                            viewsCount = _tempCount,
                            viewsDate = String.Format("{0:dd MMMM}", DateTime.Now.AddDays(-i))
                        };

                        resultList.Add(_data);

                    }
                }

                var _resultQuery = resultList.GroupBy(d => d.viewsDate)
                 .Select(
                     g => new
                     {
                         viewsCount = g.Sum(s => s.viewsCount),
                         viewsDate = g.First().viewsDate,
                         viewsRange = String.Format("{0:dd MMMM} - {1:dd MMMM}", DateTime.Now.AddDays(-(_indaterange - 1)), DateTime.Now.AddDays(0))
                     });

                return JsonConvert.SerializeObject(_resultQuery);
            }
        }

        public class ReportInClassified
        {
            public int viewsCount { get; set; }

            public int favoriteAddCount { get; set; }

            public int broadcastAdsCount { get; set; }

            public int nonBroadcastAdsCount { get; set; }
        }

        public string getAdsClaimByStore(int _inStoreId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var queryVisitor = idc.ziyaretcis;
                var queryClassified = idc.ilans.Where(x => x.silindiMi == false && x.magazaId == _inStoreId);

                int tempCount = 0;

                foreach (var itemClassified in queryClassified.ToList())
                {
                    tempCount += queryVisitor.Where(x => x.ilanId == itemClassified.ilanId).Count();
                }

                var data = new ReportInClassified
                {
                    broadcastAdsCount = queryClassified.Where(x => x.onay == 1).Count(),
                    nonBroadcastAdsCount = queryClassified.Where(x => x.onay != 1).Count(),
                    favoriteAddCount = idc.ilanFavoris.Where(x => x.ilan.magazaId == _inStoreId && x.ilan.silindiMi == false).Count(),
                    viewsCount = tempCount
                };

                return JsonConvert.SerializeObject(data);
            }
        }

        public string getMultipleFilterAds(int _index, int _inCount, string[] _income, jsonintextDataType _intext, FormatDataType _inDataType)
        {
            var pageSize = _inCount;
            var pageIndex = _index;
            using (ilanDataContext idc = new ilanDataContext())
            {

                var query = from i in idc.ilans.Where(i =>
                        i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false && i.satildiMi == false)
                            select new
                            {
                                ilanId = i.ilanId,
                                i.kategoriId,
                                i.ilanTurId,
                                i.kategori,
                                i.baslik,
                                i.fiyat,
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                                i.baslangicTarihi,
                                i.iller.ilId,
                                i.ilceler.ilceId,
                                i.mahalleler.mahalleId,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                i.mahalleler.mahalleAdi,
                                magazaTur = i.magaza.magazaTur.turId,
                                i.magazaId,
                                i.resim,
                                i.girilenOzellik,
                                i.secilenOzellik,
                                i.koordinat,
                                i.ilat,
                                i.ilng,
                                i.bitisTarihi,
                                i.satildiMi
                            };

                string
                    ilId = _income[2],
                    ilceId = _income[3],
                    mahalleId = _income[4],
                    magazaTur = _income[5],
                    tarihAralik = _income[6],
                    sirala = _income[7];

                string category = _income[0],
                    type = _income[1];


                if (_intext.isCoordinates == true)
                {
                    query = query.Where(q => q.koordinat != null);

                    if (_intext.isDrag == true)
                    {
                        query = query.Where(q =>
                            q.ilat < _intext.koordinatlar.maxLat & q.ilat > _intext.koordinatlar.minLat &
                            q.ilng < _intext.koordinatlar.maxLng & q.ilng > _intext.koordinatlar.minLng);
                    }
                }
                else
                {
                    query = query.Where(q => q.satildiMi == false);
                }

                if (ilId != "-1")
                {
                    query = query.Where(q => q.ilId == Convert.ToInt32(ilId));

                    if (ilceId != "-1")
                    {
                        query = query.Where(q => q.ilceId == Convert.ToInt32(ilceId));

                        if (mahalleId != "-1")
                        {
                            query = query.Where(q => q.mahalleId == Convert.ToInt32(mahalleId));
                        }
                    }
                }

                if (!category.Equals("-1"))
                {
                    int categoryId = idc.kategoris.Where(x => (x.kategoriAdi).Equals(category)).FirstOrDefault()
                        .kategoriId;

                    if (idc.kategoris.Where(x => x.ustKategoriId == categoryId).FirstOrDefault() == null)
                    {
                        query = query.Where(q => q.kategoriId == categoryId);
                    }
                    else
                    {
                        query = query.Where(q => q.kategori.ustKategoriId == categoryId);
                    }
                }

                if (!type.Equals("-1"))
                {
                    int typeId = Convert.ToInt32(type);
                    query = query.Where(q => q.ilanTurId == typeId);
                }


                if (magazaTur != "-1")
                {
                    if (magazaTur != "0")
                    {
                        query = query.Where(q => q.magazaTur == Convert.ToInt32(magazaTur));
                    }
                    else
                    {
                        query = query.Where(q => q.magazaId == null);
                    }
                }

                int dateRange = Convert.ToInt32(tarihAralik);
                if (dateRange != -1)
                {
                    if (dateRange == 1)
                    {
                        query = query.Where(
                            q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(1, 0, 0, 0, 0)));
                    }
                    else if (dateRange == 3)
                    {
                        query = query.Where(
                            q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(3, 0, 0, 0, 0)));
                    }
                    else if (dateRange == 7)
                    {
                        query = query.Where(
                            q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0, 0)));
                    }
                    else if (dateRange == 15)
                    {
                        query = query.Where(q =>
                            q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(15, 0, 0, 0, 0)));
                    }
                    else
                    {
                        query = query.Where(q =>
                            q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(30, 0, 0, 0, 0)));
                    }
                }

                int sort = Convert.ToInt32(sirala);
                if (sort != -1)
                {
                    if (sort == 2) query = query.OrderBy(x => x.fiyat);

                    if (sort == 3) query = query.OrderByDescending(x => x.fiyat);

                    if (sort == 4) query = query.OrderBy(x => x.baslangicTarihi);

                    if (sort == 5) query = query.OrderByDescending(x => x.baslangicTarihi);

                    if (sort == 6) query = query.OrderBy(x => x.ilId);

                    if (sort == 7) query = query.OrderByDescending(x => x.ilId);
                }


                // gelen veri min#max
                if (_intext.FiyatData != null)
                {
                    if (_intext.FiyatData.Max != "" || _intext.FiyatData.Min != "")
                    {
                        double min = -1,
                            max = -1;

                        if (_intext.FiyatData.Min != "")
                            min = Convert.ToDouble(_intext.FiyatData.Min);
                        if (_intext.FiyatData.Max != "")
                            max = Convert.ToDouble(_intext.FiyatData.Max);

                        if (min != -1 && max != -1)
                        {
                            query = query.Where(q => q.fiyat >= min & q.fiyat <= max);
                        }

                        if (min == -1 && max != -1)
                        {
                            query = query.Where(q => q.fiyat <= max);
                        }

                        if (min != -1 && max == -1)
                        {
                            query = query.Where(q => q.fiyat >= min);
                        }
                    }
                }

                //gelen veri 78_1 $ 45 @ 78_2 $ 45 %
                bool blmaxmin = false;
                List<TextItemSearchCS> lstsorgu = new List<TextItemSearchCS>();

                if (_intext.ListText != null)
                {
                    if (_intext.ListText.Count != 0)
                    {

                        for (int i = 0; i < _intext.ListText.Count; i++)
                        {
                            try
                            {
                                ListText data = _intext.ListText[i];
                                double min = -1,
                                    max = -1;

                                int ozellikId = -1;

                                if (data.Max != "")
                                {
                                    max = Convert.ToDouble(data.Max);
                                }

                                if (data.Min != "")
                                {
                                    min = Convert.ToDouble(data.Min);
                                }

                                ozellikId = Convert.ToInt32(data.id);

                                TextItemSearchCS itemclssorgu = new TextItemSearchCS();
                                itemclssorgu.id = ozellikId;
                                itemclssorgu.Max = max;
                                itemclssorgu.Min = min;
                                lstsorgu.Add(itemclssorgu);
                                if (max != -1 || min != -1)
                                {
                                    query = query.Where(q =>
                                        q.girilenOzellik.Contains("<ozellikId>" + ozellikId + "</ozellikId>"));
                                    blmaxmin = true;
                                }

                            }

                            catch (Exception)
                            {

                                throw;
                            }

                        }
                    }
                }


                if (_intext.ListDrop != null)
                {
                    //gelen veri 22 $ 45 %
                    for (int i = 0; i < _intext.ListDrop.Count; i++)
                    {
                        try
                        {
                            ListDrop data = new ListDrop();

                            data = _intext.ListDrop[i];

                            int deger = -1;
                            int ozellikId = Convert.ToInt32(data.id);
                            if (data.value != "")
                            {
                                if (data.value != null)
                                {
                                    deger = Convert.ToInt32(data.value);
                                }
                            }

                            if (deger != -1)
                            {
                                query = query.Where(q => q.secilenOzellik.Contains("<deger>" + deger + "</deger>"));
                            }

                        }
                        catch (Exception)
                        {

                            throw;
                        }
                    }
                }


                List<ilanDataType> list = new List<ilanDataType>();
                if (blmaxmin == true)
                {

                }
                else
                {
                    query = query.Skip(pageSize * (pageIndex)).Take(pageSize);
                }

                var dt = query.ToArray();
                int bas = pageSize * (pageIndex);
                int bitis = (pageSize * (pageIndex)) + pageSize;
                int art = 0;
                foreach (var item in dt)
                {
                    if (blmaxmin == true)
                    {

                        bool ekle = false;
                        string girilendata = item.girilenOzellik;
                        List<girilenDataType> girlist = new List<girilenDataType>();
                        girlist = (List<girilenDataType>)toolkit.GetObjectInXml(girilendata,
                            typeof(List<girilenDataType>));

                        foreach (girilenDataType itemgiris in girlist)
                        {
                            foreach (TextItemSearchCS sorgu in lstsorgu)
                            {
                                if (sorgu.id == itemgiris.ozellikId)
                                {

                                    if (sorgu.Min != -1 && sorgu.Max != -1)
                                    {
                                        if (sorgu.Max >= Convert.ToDouble(itemgiris.deger) &&
                                            sorgu.Min <= Convert.ToDouble(itemgiris.deger))
                                        {
                                            ekle = true;
                                        }
                                    }

                                    if (sorgu.Min == -1 && sorgu.Max != -1)
                                    {
                                        if (sorgu.Max >= Convert.ToDouble(itemgiris.deger))
                                        {
                                            ekle = true;
                                        }
                                    }

                                    if (sorgu.Min != -1 && sorgu.Max == -1)
                                    {
                                        if (sorgu.Min <= Convert.ToDouble(itemgiris.deger))
                                        {
                                            ekle = true;
                                        }
                                    }
                                }
                            }
                        }

                        if (ekle == true)
                        {
                            if (bas <= art && art < bitis)
                            {
                                string resdata = item.resim;
                                List<resimDataType> resler = new List<resimDataType>();
                                resler = (List<resimDataType>)toolkit.GetObjectInXml(resdata,
                                    typeof(List<resimDataType>));

                                resimDataType seciliresim = new resimDataType();
                                if (resler.Count() == 0)
                                {
                                    seciliresim.resim = "noImage.jpg";
                                }
                                else
                                {
                                    foreach (resimDataType rs in resler)
                                    {

                                        seciliresim.resim = "thmb_" + rs.resim;
                                        seciliresim.seciliMi = true;
                                        break;
                                    }
                                }

                                string satisdata = item.girilenOzellik;
                                List<girilenDataType> girilenler = new List<girilenDataType>();
                                girilenler =
                                    (List<girilenDataType>)toolkit.GetObjectInXml(satisdata,
                                        typeof(List<girilenDataType>));

                                girilenDataType satisTarihi = new girilenDataType();

                                foreach (girilenDataType rs in girilenler)
                                {
                                    if (rs.ozellikId == 64)
                                    {
                                        satisTarihi.deger = rs.deger;
                                    }
                                    else
                                    {
                                        if (rs.ozellikId == 63)
                                        {
                                            satisTarihi.deger = rs.deger;
                                        }
                                    }
                                }

                                if (satisTarihi.deger == null)
                                {
                                    satisTarihi.deger = item.bitisTarihi.ToString();
                                }

                                DateTime dateCtrl = Convert.ToDateTime(satisTarihi.deger);
                                bool guncel = false;

                                if (dateCtrl < DateTime.Now)
                                {
                                    guncel = true;
                                }

                                bool acil = false;
                                if (idc.seciliDopings
                                        .Where(x => x.dopingKategori.doping.dopingId == 5 && x.ilanId == item.ilanId)
                                        .FirstOrDefault() != null)
                                {
                                    acil = true;
                                }

                                list.Add(new ilanDataType()
                                {
                                    ilanId = item.ilanId,
                                    baslik = item.baslik,
                                    fiyat = item.fiyat,
                                    fiyatTurId = item.fiyatTur,
                                    baslangicTarihi = item.baslangicTarihi,
                                    ilAdi = item.ilAdi,
                                    ilceAdi = item.ilceAdi,
                                    mahalleAdi = item.mahalleAdi,
                                    resim = seciliresim.resim,
                                    resimList = resler,
                                    girilenOzellikList =
                                        (List<girilenDataType>)toolkit.GetObjectInXml(item.girilenOzellik,
                                            typeof(List<girilenDataType>)),
                                    secilen = (List<secilenDataType>)toolkit.GetObjectInXml(item.secilenOzellik,
                                        typeof(List<secilenDataType>)),
                                    koordinat = item.koordinat,
                                    lat = Convert.ToSingle(item.ilat),
                                    lng = Convert.ToSingle(item.ilng),
                                    magazaTurId = Convert.ToInt32(item.magazaTur),
                                    satisTarihi1 = satisTarihi.deger,
                                    guncelMi = guncel,
                                    satildi = Convert.ToBoolean(item.satildiMi),
                                    magazaId = Convert.ToInt32(item.magazaId),
                                    acilMi = acil

                                });

                            }

                            art++;
                            if (art > bitis) break;
                        }

                    }
                    else
                    {
                        string resdata = item.resim;
                        List<resimDataType> resler = new List<resimDataType>();
                        resler = (List<resimDataType>)toolkit.GetObjectInXml(resdata, typeof(List<resimDataType>));

                        resimDataType seciliresim = new resimDataType();
                        if (resler.Count() == 0)
                        {
                            seciliresim.resim = "noImage.jpg";
                        }
                        else
                        {
                            foreach (resimDataType rs in resler)
                            {

                                seciliresim.resim = "thmb_" + rs.resim;
                                seciliresim.seciliMi = true;
                                break;
                            }
                        }

                        string satisdata = item.girilenOzellik;
                        List<girilenDataType> girilenler = new List<girilenDataType>();
                        girilenler =
                            (List<girilenDataType>)toolkit.GetObjectInXml(satisdata, typeof(List<girilenDataType>));

                        girilenDataType satisTarihi = new girilenDataType();

                        foreach (girilenDataType rs in girilenler)
                        {
                            if (rs.ozellikId == 64)
                            {
                                satisTarihi.deger = rs.deger;
                            }
                            else
                            {
                                if (rs.ozellikId == 63)
                                {
                                    satisTarihi.deger = rs.deger;
                                }
                            }
                        }

                        if (satisTarihi.deger == null)
                        {
                            satisTarihi.deger = item.bitisTarihi.ToString();
                        }

                        DateTime dateCtrl = Convert.ToDateTime(satisTarihi.deger);
                        bool guncel = false;

                        if (dateCtrl >= DateTime.Now)
                        {
                            guncel = true;
                        }

                        bool acil = false;
                        if (idc.seciliDopings
                                .Where(x => x.dopingKategori.doping.dopingId == 5 && x.ilanId == item.ilanId)
                                .FirstOrDefault() != null)
                        {
                            acil = true;
                        }

                        list.Add(new ilanDataType()
                        {
                            ilanId = item.ilanId,
                            baslik = item.baslik,
                            fiyat = item.fiyat,
                            fiyatTurId = item.fiyatTur,
                            baslangicTarihi = item.baslangicTarihi,
                            ilAdi = item.ilAdi,
                            ilceAdi = item.ilceAdi,
                            mahalleAdi = item.mahalleAdi,
                            resim = seciliresim.resim,
                            resimList = resler,
                            girilenOzellikList =
                                (List<girilenDataType>)toolkit.GetObjectInXml(item.girilenOzellik,
                                    typeof(List<girilenDataType>)),
                            secilen = (List<secilenDataType>)toolkit.GetObjectInXml(item.secilenOzellik,
                                typeof(List<secilenDataType>)),
                            koordinat = item.koordinat,
                            lat = Convert.ToSingle(item.ilat),
                            lng = Convert.ToSingle(item.ilng),
                            magazaTurId = Convert.ToInt32(item.magazaTur),
                            satisTarihi1 = satisTarihi.deger,
                            guncelMi = guncel,
                            satildi = Convert.ToBoolean(item.satildiMi),
                            magazaId = Convert.ToInt32(item.magazaId),
                            acilMi = acil
                        });
                    }
                }

                if (_inDataType == FormatDataType.JSON) return JsonConvert.SerializeObject(list);

                else if (_inDataType == FormatDataType.XML) return toolkit.GetXmlDataInObject(list).ToString();

                else if (_inDataType == FormatDataType.HTML)
                {
                    string result = "";

                    foreach (ilanDataType item in list)
                    {
                        result += @"<a target='_blank' href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + @"-" +
                                  item.ilanId + @"/detay'><div class='list-r-b-div clearfix'>
                                    <div class='list-r-b-d list-r-b-d-1'>
                                	    <img src='/upload/ilan/" + item.resim + @"' alt='" + item.baslik +
                                  @"' width='90' height='60'>
                                    </div>
                                    <div class='list-r-b-d list-r-b-d-2'>
                                	    <h5 class='add-title'><strong>" + item.baslik + @"</strong></h5>
                                    </div>
                                    <div class='list-r-b-d list-r-b-d-3'>
                                	    <h5 class='item-price'>" + item.fiyatTurId + "  " +
                                  String.Format(" {0:N0}", item.fiyat) + @"</h5>
                                    </div>
                                    <div class='list-r-b-d list-r-b-d-4'>
                                	    <span class='date'><i class='icon-clock'></i> " +
                                  item.baslangicTarihi.ToString("dd MMMM yyyy") + @" </span>
                                    </div>
                                    <div class='list-r-b-d list-r-b-d-5'>
                                	    <span class='item-location'><i class='fa fa-map-marker'></i>" + item.ilAdi +
                                  @"<br />/" + item.ilceAdi + @"</span>
                                </div></div></a>";
                    }

                    return result;
                }
                else
                {
                    return null;
                }
            }
        }

        //public string CountFilterClassified(int _index, int _count, string[] _income, jsonintextDataType _intext, FormatDataType _inDataType)
        //{
        //    var pageSize = _count;
        //    var pageIndex = _index;
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {

        //        var query = from i in idc.ilans.Where(i =>
        //                i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false && i.satildiMi == false)
        //                    select new
        //                    {
        //                        ilanId = i.ilanId,
        //                        i.kategoriId,
        //                        i.ilanTurId,
        //                        i.kategori,
        //                        i.baslik,
        //                        i.fiyat,
        //                        fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
        //                        i.baslangicTarihi,
        //                        i.iller.ilId,
        //                        i.ilceler.ilceId,
        //                        i.mahalleler.mahalleId,
        //                        i.iller.ilAdi,
        //                        i.ilceler.ilceAdi,
        //                        i.mahalleler.mahalleAdi,
        //                        magazaTur = i.magaza.magazaTur.turId,
        //                        i.magazaId,
        //                        i.resim,
        //                        i.girilenOzellik,
        //                        i.secilenOzellik,
        //                        i.koordinat,
        //                        i.ilat,
        //                        i.ilng,
        //                        i.bitisTarihi,
        //                        i.satildiMi
        //                    };

        //        string category = _income[0],
        //            type = _income[1],
        //            ilId = _income[2],
        //            ilceId = _income[3],
        //            mahalleId = _income[4],
        //            magazaTur = _income[5],
        //            tarihAralik = _income[6],
        //            sirala = _income[7];

        //        // ilk önce il ilçe ve mahalle ye göre filtreleme yapılır.

        //        if (ilId != "-1")
        //        {
        //            query = query.Where(q => q.ilId == Convert.ToInt32(ilId));

        //            if (ilceId != "-1")
        //            {
        //                query = query.Where(q => q.ilceId == Convert.ToInt32(ilceId));

        //                if (mahalleId != "-1")
        //                {
        //                    query = query.Where(q => q.mahalleId == Convert.ToInt32(mahalleId));
        //                }
        //            }
        //        }


        //        if (!category.Equals("-1"))
        //        {
        //            int categoryId = idc.kategoris.Where(x => (x.kategoriAdi).Equals(category)).FirstOrDefault()
        //                .kategoriId;

        //            if (idc.kategoris.Where(x => x.ustKategoriId == categoryId).FirstOrDefault() == null)
        //            {
        //                query = query.Where(q => q.kategoriId == categoryId);
        //            }
        //            else
        //            {
        //                query = query.Where(q => q.kategori.ustKategoriId == categoryId);
        //            }
        //        }

        //        if (!type.Equals("-1"))
        //        {
        //            int typeId = Convert.ToInt32(type);
        //            query = query.Where(q => q.ilanTurId == typeId);
        //        }


        //        if (tarihAralik != "-1")
        //        {
        //            if (tarihAralik == "1")
        //            {
        //                query = query.Where(
        //                    q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(1, 0, 0, 0, 0)));
        //            }
        //            else if (tarihAralik == "3")
        //            {
        //                query = query.Where(
        //                    q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(3, 0, 0, 0, 0)));
        //            }
        //            else if (tarihAralik == "7")
        //            {
        //                query = query.Where(
        //                    q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0, 0)));
        //            }
        //            else if (tarihAralik == "15")
        //            {
        //                query = query.Where(q =>
        //                    q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(15, 0, 0, 0, 0)));
        //            }
        //            else
        //            {
        //                query = query.Where(q =>
        //                    q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(30, 0, 0, 0, 0)));
        //            }
        //        }

        //        // gelen veri min#max
        //        if (_intext.FiyatData.Max != "" || _intext.FiyatData.Min != "")
        //        {
        //            double min = -1,
        //                max = -1;

        //            if (_intext.FiyatData.Min != "")
        //                min = Convert.ToDouble(_intext.FiyatData.Min);
        //            if (_intext.FiyatData.Max != "")
        //                max = Convert.ToDouble(_intext.FiyatData.Max);

        //            if (min != -1 && max != -1)
        //            {
        //                query = query.Where(q => q.fiyat >= min & q.fiyat <= max);
        //            }

        //            if (min == -1 && max != -1)
        //            {
        //                query = query.Where(q => q.fiyat <= max);
        //            }

        //            if (min != -1 && max == -1)
        //            {
        //                query = query.Where(q => q.fiyat >= min);
        //            }
        //        }

        //        //gelen veri 78_1 $ 45 @ 78_2 $ 45 %
        //        bool blmaxmin = false;
        //        List<TextItemSearchCS> lstsorgu = new List<TextItemSearchCS>();

        //        if (_intext.ListText.Count != 0)
        //        {

        //            for (int i = 0; i < _intext.ListText.Count; i++)
        //            {
        //                try
        //                {
        //                    ListText data = _intext.ListText[i];
        //                    double min = -1,
        //                        max = -1;

        //                    int ozellikId = -1;

        //                    if (data.Max != "")
        //                    {
        //                        max = Convert.ToDouble(data.Max);
        //                    }

        //                    if (data.Min != "")
        //                    {
        //                        min = Convert.ToDouble(data.Min);
        //                    }

        //                    ozellikId = Convert.ToInt32(data.id);

        //                    TextItemSearchCS itemclssorgu = new TextItemSearchCS();
        //                    itemclssorgu.id = ozellikId;
        //                    itemclssorgu.Max = max;
        //                    itemclssorgu.Min = min;
        //                    lstsorgu.Add(itemclssorgu);
        //                    if (max != -1 || min != -1)
        //                    {
        //                        query = query.Where(q =>
        //                            q.girilenOzellik.Contains("<ozellikId>" + ozellikId + "</ozellikId>"));
        //                        blmaxmin = true;
        //                    }

        //                }

        //                catch (Exception)
        //                {

        //                    throw;
        //                }

        //            }
        //        }

        //        //gelen veri 22 $ 45 %

        //        if (_intext.ListDrop.Count != 0)
        //        {
        //            for (int i = 0; i < _intext.ListDrop.Count; i++)
        //            {
        //                try
        //                {
        //                    ListDrop data = new ListDrop();
        //                    data = _intext.ListDrop[i];
        //                    int deger = -1;
        //                    int ozellikId = Convert.ToInt32(data.id);
        //                    if (data.value != "")
        //                    {
        //                        if (data.value != null)
        //                        {
        //                            deger = Convert.ToInt32(data.value);
        //                        }
        //                    }

        //                    if (deger != -1)
        //                    {
        //                        query = query.Where(q => q.secilenOzellik.Contains("<deger>" + deger + "</deger>"));
        //                    }
        //                }
        //                catch (Exception)
        //                {
        //                    throw;
        //                }
        //            }
        //        }


        //        List<ilanDataType> list = new List<ilanDataType>();

        //        if (_intext.ListDrop.Count != 0 || _intext.ListText.Count != 0)
        //        {

        //            var dt = query.ToArray();
        //            int bas = pageSize * (pageIndex);
        //            int bitis = (pageSize * (pageIndex)) + pageSize;
        //            int art = 0;
        //            foreach (var item in dt)
        //            {
        //                if (blmaxmin == true)
        //                {

        //                    bool ekle = false;
        //                    string girilendata = item.girilenOzellik;
        //                    List<girilenDataType> girlist = new List<girilenDataType>();
        //                    girlist = (List<girilenDataType>)toolkit.GetObjectInXml(girilendata,
        //                        typeof(List<girilenDataType>));

        //                    foreach (girilenDataType itemgiris in girlist)
        //                    {
        //                        foreach (TextItemSearchCS sorgu in lstsorgu)
        //                        {
        //                            if (sorgu.id == itemgiris.ozellikId)
        //                            {

        //                                if (sorgu.Min != -1 && sorgu.Max != -1)
        //                                {
        //                                    if (sorgu.Max >= Convert.ToDouble(itemgiris.deger) &&
        //                                        sorgu.Min <= Convert.ToDouble(itemgiris.deger))
        //                                    {
        //                                        ekle = true;

        //                                    }
        //                                }

        //                                if (sorgu.Min == -1 && sorgu.Max != -1)
        //                                {
        //                                    if (sorgu.Max >= Convert.ToDouble(itemgiris.deger))
        //                                    {
        //                                        ekle = true;
        //                                    }
        //                                }

        //                                if (sorgu.Min != -1 && sorgu.Max == -1)
        //                                {
        //                                    if (sorgu.Min <= Convert.ToDouble(itemgiris.deger))
        //                                    {
        //                                        ekle = true;
        //                                    }
        //                                }
        //                            }
        //                        }
        //                    }

        //                    if (ekle == true)
        //                    {
        //                        if (bas <= art && art < bitis)
        //                        {
        //                            string resdata = item.resim;
        //                            List<resimDataType> resler = new List<resimDataType>();
        //                            resler = (List<resimDataType>)toolkit.GetObjectInXml(resdata,
        //                                typeof(List<resimDataType>));

        //                            resimDataType seciliresim = new resimDataType();
        //                            if (resler.Count() == 0)
        //                            {
        //                                seciliresim.resim = "noImage.jpg";
        //                            }
        //                            else
        //                            {
        //                                foreach (resimDataType rs in resler)
        //                                {

        //                                    seciliresim.resim = "thmb_" + rs.resim;
        //                                    seciliresim.seciliMi = true;
        //                                    break;
        //                                }
        //                            }

        //                            string satisdata = item.girilenOzellik;
        //                            List<girilenDataType> girilenler = new List<girilenDataType>();
        //                            girilenler =
        //                                (List<girilenDataType>)toolkit.GetObjectInXml(satisdata,
        //                                    typeof(List<girilenDataType>));

        //                            girilenDataType satisTarihi = new girilenDataType();

        //                            foreach (girilenDataType rs in girilenler)
        //                            {
        //                                if (rs.ozellikId == 64)
        //                                {
        //                                    satisTarihi.deger = rs.deger;
        //                                }
        //                                else
        //                                {
        //                                    if (rs.ozellikId == 63)
        //                                    {
        //                                        satisTarihi.deger = rs.deger;
        //                                    }
        //                                }
        //                            }

        //                            if (satisTarihi.deger == null)
        //                            {
        //                                satisTarihi.deger = item.bitisTarihi.ToString();
        //                            }


        //                            list.Add(new ilanDataType()
        //                            {
        //                                ilanId = item.ilanId,

        //                                magazaTurId = Convert.ToInt32(item.magazaTur),


        //                            });

        //                        }

        //                        art++;
        //                        if (art > bitis) break;
        //                    }

        //                }
        //                else
        //                {
        //                    string resdata = item.resim;
        //                    List<resimDataType> resler = new List<resimDataType>();
        //                    resler = (List<resimDataType>)DAL.toolkit.GetObjectInXml(resdata,
        //                        typeof(List<resimDataType>));

        //                    resimDataType seciliresim = new resimDataType();
        //                    if (resler.Count() == 0)
        //                    {
        //                        seciliresim.resim = "noImage.jpg";
        //                    }
        //                    else
        //                    {
        //                        foreach (resimDataType rs in resler)
        //                        {

        //                            seciliresim.resim = "thmb_" + rs.resim;
        //                            seciliresim.seciliMi = true;
        //                            break;
        //                        }
        //                    }

        //                    /////////////////////////////////
        //                    string satisdata = item.girilenOzellik;
        //                    List<girilenDataType> girilenler = new List<girilenDataType>();
        //                    girilenler =
        //                        (List<girilenDataType>)toolkit.GetObjectInXml(satisdata,
        //                            typeof(List<girilenDataType>));

        //                    girilenDataType satisTarihi = new girilenDataType();

        //                    foreach (girilenDataType rs in girilenler)
        //                    {
        //                        if (rs.ozellikId == 64)
        //                        {
        //                            satisTarihi.deger = rs.deger;
        //                        }
        //                        else
        //                        {
        //                            if (rs.ozellikId == 63)
        //                            {
        //                                satisTarihi.deger = rs.deger;
        //                            }
        //                        }
        //                    }

        //                    if (satisTarihi.deger == null)
        //                    {
        //                        satisTarihi.deger = item.baslangicTarihi.ToString();
        //                    }

        //                    list.Add(new ilanDataType()
        //                    {
        //                        ilanId = item.ilanId,
        //                        magazaTurId = Convert.ToInt32(item.magazaTur),

        //                    });

        //                }
        //            }

        //            int[] toArray = new int[12];

        //            toArray[0] = list.Count();
        //            toArray[1] = list.Where(x => x.magazaTurId == 1).Count();
        //            toArray[2] = list.Where(x => x.magazaTurId == 2).Count();
        //            toArray[3] = list.Where(x => x.magazaTurId == 3).Count();
        //            toArray[4] = list.Where(x => x.magazaTurId == 4).Count();
        //            toArray[5] = list.Where(x => x.magazaTurId == 5).Count();
        //            toArray[6] = list.Where(x => x.magazaTurId == 6).Count();
        //            toArray[7] = list.Where(x => x.magazaTurId == 7).Count();
        //            toArray[8] = list.Where(x => x.magazaTurId == 8).Count();
        //            toArray[9] = list.Where(x => x.magazaTurId == 9).Count();
        //            toArray[10] = list.Where(x => x.magazaTurId == 10).Count();
        //            toArray[11] = list.Where(x => x.magazaTurId == 0).Count();


        //            return JsonConvert.SerializeObject(toArray);
        //        }
        //        else
        //        {
        //            int[] toArray = new int[12];

        //            toArray[0] = query.Count();
        //            toArray[1] = query.Where(x => x.magazaTur == 1).Count();
        //            toArray[2] = query.Where(x => x.magazaTur == 2).Count();
        //            toArray[3] = query.Where(x => x.magazaTur == 3).Count();
        //            toArray[4] = query.Where(x => x.magazaTur == 4).Count();
        //            toArray[5] = query.Where(x => x.magazaTur == 5).Count();
        //            toArray[6] = query.Where(x => x.magazaTur == 6).Count();
        //            toArray[7] = query.Where(x => x.magazaTur == 7).Count();
        //            toArray[8] = query.Where(x => x.magazaTur == 8).Count();
        //            toArray[9] = query.Where(x => x.magazaTur == 9).Count();
        //            toArray[10] = query.Where(x => x.magazaTur == 10).Count();
        //            toArray[11] = query.Where(x => x.magazaId == null).Count();


        //            return JsonConvert.SerializeObject(toArray);
        //        }
        //    }
        //}

        public object getAdminMultipleFilterAds(int _index, int _inCount, int[] _inGeneralPropValues, jsonintextDataType _inJsonPropValues, string _inAds, string _inEcho, string _inDateRange)
        {
            ilanDataContext idc = new ilanDataContext();

            var query = from i in idc.ilans.Where(i => i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false)
                        select new
                        {
                            ilanId = i.ilanId,
                            i.kategoriId,
                            i.ilanTurId,
                            i.baslik,
                            i.fiyat,
                            i.kullaniciId,
                            i.kullanici.kullaniciAdSoyad,
                            fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            i.baslangicTarihi,
                            i.iller.ilId,
                            i.ilceler.ilceId,
                            i.mahalleler.mahalleId,
                            i.iller.ilAdi,
                            i.ilceler.ilceAdi,
                            i.mahalleler.mahalleAdi,
                            magazaTur = i.magaza.magazaTur.turId,
                            i.magazaId,
                            i.resim,
                            i.girilenOzellik,
                            i.secilenOzellik,
                            i.koordinat,
                            i.ilat,
                            i.ilng,
                            i.kategori
                        };

            int kategoriId = _inGeneralPropValues[0],
                turId = _inGeneralPropValues[1],
                ilId = _inGeneralPropValues[2],
                ilceId = _inGeneralPropValues[3],
                mahalleId = _inGeneralPropValues[4],
                magazaTur = _inGeneralPropValues[5],
                tarihAralik = _inGeneralPropValues[6],
                kullaniciId = _inGeneralPropValues[7],
                resimsizMi = _inGeneralPropValues[8],
                koordinatsizMi = _inGeneralPropValues[9];

            if (!String.IsNullOrEmpty(_inAds))
            {
                query = query.Where(q => q.ilanId == Convert.ToInt32(_inAds));
            }

            if (!String.IsNullOrEmpty(_inDateRange))
            {
                DateTime min, max;
                string data = _inDateRange.Split('-')[0];
                min = Convert.ToDateTime(_inDateRange.Split('-')[0]);
                max = Convert.ToDateTime(_inDateRange.Split('-')[1]);

                query = query.Where(q => q.baslangicTarihi >= min && q.baslangicTarihi <= max);
            }

            if (ilId != -1)
            {
                query = query.Where(q => q.ilId == ilId);

                if (ilceId != -1)
                {
                    query = query.Where(q => q.ilceId == ilceId);

                    if (mahalleId != -1)
                    {
                        query = query.Where(q => q.mahalleId == mahalleId);
                    }
                }
            }

            if (kullaniciId != -1) query = query.Where(q => q.kullaniciId == kullaniciId);

            if (resimsizMi != -1) query = query.Where(q => q.resim.IndexOf("_1.") == -1);

            if (koordinatsizMi != -1) query = query.Where(q => q.koordinat == null);

            if (kategoriId != -1)
            {
                var itemTopValues = idc.kategoris.Where(x => x.ustKategoriId == kategoriId).FirstOrDefault();
                if (itemTopValues == null)
                {
                    query = query.Where(q => q.kategoriId == kategoriId);
                }
                else
                {
                    query = query.Where(q => q.kategori.ustKategoriId == kategoriId);
                }
            }

            if (turId != -1)
            {
                query = query.Where(q => q.ilanTurId == turId);
            }

            if (magazaTur != -1)
            {
                if (magazaTur != 0)
                {
                    query = query.Where(q => q.magazaTur == magazaTur);
                }
                else
                {
                    query = query.Where(q => q.magazaId == null);
                }
            }

            if (tarihAralik != -1)
            {
                if (tarihAralik == 1)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(1, 0, 0, 0, 0)));
                }
                else if (tarihAralik == 3)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(3, 0, 0, 0, 0)));
                }
                else if (tarihAralik == 7)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0, 0)));
                }
                else if (tarihAralik == 15)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(15, 0, 0, 0, 0)));
                }
                else
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(30, 0, 0, 0, 0)));
                }
            }

            if (_inJsonPropValues.FiyatData.Max != "" || _inJsonPropValues.FiyatData.Min != "")
            {
                double min = -1,
                       max = -1;

                if (_inJsonPropValues.FiyatData.Min != "")
                    min = Convert.ToDouble(_inJsonPropValues.FiyatData.Min);
                if (_inJsonPropValues.FiyatData.Max != "")
                    max = Convert.ToDouble(_inJsonPropValues.FiyatData.Max);

                if (min != -1 && max != -1)
                {
                    query = query.Where(q => q.fiyat >= min & q.fiyat <= max);
                }
                if (min == -1 && max != -1)
                {
                    query = query.Where(q => q.fiyat <= max);
                }
                if (min != -1 && max == -1)
                {
                    query = query.Where(q => q.fiyat >= min);
                }
            }

            int totalCount = query.Count();
            query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_index).Take(_inCount);
            List<ilanDataType> ads = new List<ilanDataType>();

            foreach (var item in query.ToList())
            {
                ads.Add(new ilanDataType()
                {
                    ilanId = item.ilanId,
                    ilAdi = item.ilAdi,
                    resim = item.kullaniciAdSoyad,
                    fiyat = item.fiyat,
                    baslangicTarihi = item.baslangicTarihi,
                    aciklama = @"<a class='btn btn-primary btn-xs' target='_blank' href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + @"-" + item.ilanId + @"/detay'>Görüntüle</a>
                                <a class='btn btn-warning btn-xs' target='_blank' href='/management/anaYonetim/ilanYonetimi/ilan.aspx?page=duzenle&ilan=" + item.ilanId + @"'>Düzenle</a>"
                });

            }

            var cmd = new
            {
                draw = _inEcho,
                recordsTotal = totalCount,
                recordsFiltered = totalCount,
                data = ads
            };

            return cmd;
        }

        public object getAdminListAds(int _index, int _inCount, int _inVerify, bool _inDeleted, bool _inSale, string _inAds, string _inEcho, int _income)
        {
            ilanDataContext idc = new ilanDataContext();

            var query = from i in idc.ilans.Where(i => i.onay == _inVerify & i.silindiMi == _inDeleted & i.satildiMi == _inSale)
                        select new
                        {
                            ilanId = i.ilanId,
                            i.kategoriId,
                            i.ilanTurId,
                            i.baslik,
                            i.fiyat,
                            i.kullaniciId,
                            i.kullanici.kullaniciAdSoyad,
                            fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            i.baslangicTarihi,
                            i.iller.ilId,
                            i.iller.ilAdi,
                            i.ilceler.ilceAdi,
                            i.mahalleler.mahalleAdi,
                            i.magazaId,
                            i.magaza.magazaTur.turId,
                            i.kategori
                        };


            if (!String.IsNullOrEmpty(_inAds))
            {
                query = query.Where(q => q.ilanId.ToString() == _inAds);
            }

            if (_income == 6)
            {
                query = query.Where(i => i.turId != 7 || i.turId != 8 || i.magazaId != null);
            }

            int totalCount = query.Count();
            query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_index).Take(_inCount);
            List<ilanDataType> ads = new List<ilanDataType>();

            foreach (var item in query.ToList())
            {
                ads.Add(new ilanDataType()
                {

                    ilanId = item.ilanId,
                    resim = item.kullaniciAdSoyad,
                    ilAdi = item.ilAdi,
                    baslik = item.fiyatTur + " " + item.fiyat,
                    baslangicTarihi = item.baslangicTarihi,
                    aciklama = @"<a class='btn btn-primary btn-xs' target='_blank' href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + "-" + item.ilanId + @"/detay'>Görüntüle</a>
                                <a class='btn btn-warning btn-xs' target='_blank' href='/management/anaYonetim/ilanYonetimi/ilan.aspx?page=duzenle&ilan=" + item.ilanId + @"'>Düzenle</a>"
                });
            }

            var cmd = new
            {
                draw = _inEcho,
                recordsTotal = totalCount,
                recordsFiltered = totalCount,
                data = ads
            };

            return cmd;
        }

        
        public string EditorClassified(int whoFrom, int index, int pageSize, int opt)
        {
            ilanDataContext idc = new ilanDataContext();

            var query = from i in idc.ilans.Where(i => i.onay == 1 & i.silindiMi == false & i.kullaniciId == whoFrom & i.magazaId != null)
                        select new
                        {
                            i.ilanId,
                            i.baslik,
                            i.baslangicTarihi,
                            i.iller.ilAdi,
                            i.ilceler.ilceAdi,
                            i.mahalleler.mahalleAdi,
                            i.fiyat,
                            i.kategori.kategoriAdi,
                            ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                            fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            resim = i.resim,
                            dopingCtrl = i.seciliDopings.FirstOrDefault().dopingKategori.dopingId
                        };


            string sonuc = "";
            foreach (var item in query.OrderByDescending(x => x.baslangicTarihi).Skip(pageSize * (index)).Take(pageSize).ToArray())
            {
                string resdata = item.resim;
                List<ExternalClass.resimDataType> resler = new List<ExternalClass.resimDataType>();
                resler = (List<ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(resdata, typeof(List<ExternalClass.resimDataType>));

                ExternalClass.resimDataType seciliresim = new ExternalClass.resimDataType();
                if (resler.Count() == 0)
                {
                    seciliresim.resim = "noImage.jpg";
                }
                else
                {
                    foreach (ExternalClass.resimDataType rs in resler)
                    {

                        seciliresim.resim = "thmb_" + rs.resim;
                        seciliresim.seciliMi = true;
                        break;

                    }
                }

                sonuc += @"<div class='attachment-block clearfix'>
                    <img class='attachment-img' src ='../../../upload/ilan/" + seciliresim.resim + @"' alt='attachment image'>
                    <div class='attachment-pushed'>
                      <h4 class='attachment-heading'><a href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + @"-" + item.ilanId + @"/detay'>" + item.baslik + @"</a></h4>
                      <div class='attachment-text'>
                        " + item.baslangicTarihi.ToString("dd MMMM yyyy") + ' ' + item.ilAdi + " / " + item.ilceAdi + " / " + item.mahalleAdi + @"
                      </div>
                    </div>
                  </div>";





                //sonuc += @"<div class='item-list'>

                //                                    <div class='col-sm-2 no-padding photobox'>
                //                                        <div>              
                //                                            <a href='ilan-detay.aspx?" + PublicHelper.Tools.URLConverter(item.baslik) + @"&ilan=" + item.ilanId + @"' runat='server'
                //                                                title='" + item.baslik + @"'>
                //                                                    <img
                //                                                       class='thumbnail no-margin' src='upload/ilan/" + seciliresim.resim + @"'
                //                                                        alt='" + item.baslik + @"'></a>
                //                                        </div>
                //                                    </div>
                //                                    <!--/.photobox-->
                //                                    <div class='col-sm-7 add-desc-box'>
                //                                        <div class='add-details'>
                //                                            <h5 class='add-title'>
                //                                            <a href='ilan-detay.aspx?" + PublicHelper.Tools.URLConverter(item.baslik) + @"&ilan=" + item.ilanId + @"' runat='server'
                //                                                    title='" + item.baslik + @"'>" + item.baslik + @" </a></h5>
                //                                            <span class='info-row'><span
                //                                                    class='date'><i class=' icon-clock'></i>" + item.baslangicTarihi.ToString("dd MMMM yyyy") + @" </span>- <span
                //                                                        class='category'>" + item.ilanTur + " " + item.kategoriAdi + @" </span>- <span
                //                                                            class='item-location'><i class='icon-location-2'></i>&nbsp;" + item.ilAdi + " / " + item.ilceAdi + " / " + item.mahalleAdi + @" </span>
                //                                            </span>
                //                                        </div>
                //                                    </div>
                //                                    <!--/.add-desc-box-->
                //                                    <div class='col-sm-3 text-right price-box'>
                //                                        <h2 class='item-price'>" + item.fiyatTur + " " + String.Format(" {0:N2}", item.fiyat) + @" </h2>
                //                                    </div>
                //                                    <!--/.add-desc-box-->
                //                                </div>";
            }
            return sonuc;
        }

        public string getAdsUniqueControl(string _inAdsInfo)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                int provId = Convert.ToInt32(_inAdsInfo.Split('#')[0]);
                int distId = Convert.ToInt32(_inAdsInfo.Split('#')[1]);
                int neigId = Convert.ToInt32(_inAdsInfo.Split('#')[2]);
                int adaInfo = Convert.ToInt32(_inAdsInfo.Split('#')[3]);
                int parselInfo = Convert.ToInt32(_inAdsInfo.Split('#')[4]);
                double price = Convert.ToDouble(_inAdsInfo.Split('#')[5]);

                var value = idc.ilans.Where(i => i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false && i.ilId == provId && i.ilceId == distId && i.mahalleId == neigId && i.fiyat == price &&
                i.girilenOzellik.Contains("<ozellikId>3</ozellikId><deger>" + adaInfo + "</deger>")
                & i.girilenOzellik.Contains("ozellikId>4</ozellikId><deger>" + parselInfo + "</deger>")).Select(x => new
                {
                    x.ilanId,
                    x.baslik,
                    x.baslangicTarihi

                }).FirstOrDefault();

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = value;
                return formatter.Format();
            }
        }


        public string getAdsCountByProvince()
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = (from i in idc.ilans
                             where i.onay == 1 && i.silindiMi == false && i.satildiMi == false
                             group i by i.iller into g
                             select new provinCntDT
                             {
                                 provId = g.Key.ilId,
                                 provName = g.Key.ilAdi,
                                 cnt = g.Count()
                             });


                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        public string getAdsCountByDistrict(int _inProvId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {

                var query = from i in idc.ilans
                            where i.onay == 1 && i.silindiMi == false && i.satildiMi == false && i.iller.ilId == _inProvId
                            group i by new { i.ilceler, i.iller } into g
                            select new distCntDT
                            {
                                distId = g.Key.ilceler.ilceId,
                                distName = g.Key.ilceler.ilceAdi,
                                provId = g.Key.iller.ilId,
                                provName = g.Key.iller.ilAdi,
                                cnt = g.Count()
                            };


                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }


        public int getAdsCountByEditorId(int _inUserId, int _inDateRange)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = (from i in idc.ilans.Where(i => i.onay == (int)VerifyStatus.onaylanmis && i.silindiMi == false && i.satildiMi == false && i.kullaniciId == _inUserId && i.magazaId != null)
                             select new
                             {
                                 i.ilanId,
                                 i.baslangicTarihi,
                             });


                if (_inDateRange == 1) query = query.Where(q => q.baslangicTarihi == DateTime.Now);

                else if (_inDateRange == 2) query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(3, 0, 0, 0, 0)));

                else if (_inDateRange == 3) query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0, 0)));

                else if (_inDateRange == 4) query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(15, 0, 0, 0, 0)));

                else query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(30, 0, 0, 0, 0)));

                return query.Count();
            }
        }

 
        public string FilterClassified(int _index, int _count, int[] _income, jsonintextDataType _intext, int _datatur)
        {
            var pageSize = _count;
            var pageIndex = _index;
            ilanDataContext idc = new ilanDataContext();
            var query = from i in idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false)
                        select new
                        {
                            ilanId = i.ilanId,
                            i.kategoriId,
                            i.ilanTurId,
                            i.kategori,
                            i.baslik,
                            i.fiyat,
                            fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            i.baslangicTarihi,
                            i.iller.ilId,
                            i.ilceler.ilceId,
                            i.mahalleler.mahalleId,
                            i.iller.ilAdi,
                            i.ilceler.ilceAdi,
                            i.mahalleler.mahalleAdi,
                            magazaTur = i.magaza.magazaTur.turId,
                            i.magazaId,
                            i.resim,
                            i.girilenOzellik,
                            i.secilenOzellik,
                            i.koordinat,
                            i.ilat,
                            i.ilng,
                            i.bitisTarihi,
                            i.satildiMi
                        };

            int kategoriId = _income[0],
                turId = _income[1],
                ilId = _income[2],
                ilceId = _income[3],
                mahalleId = _income[4],
                magazaTur = _income[5],
                tarihAralik = _income[6],
                sirala = _income[7];

            if (_intext.isCoordinates == true)
            {
                query = query.Where(q => q.koordinat != null);

                if (_intext.isDrag == true)
                {
                    query = query.Where(q => q.ilat < _intext.koordinatlar.maxLat & q.ilat > _intext.koordinatlar.minLat & q.ilng < _intext.koordinatlar.maxLng & q.ilng > _intext.koordinatlar.minLng);
                }
            }
            else
            {
                query = query.Where(q => q.satildiMi == false);
            }

            // ilk önce il ilçe ve mahalle ye göre filtreleme yapılır.

            if (ilId != -1)
            {
                query = query.Where(q => q.ilId == ilId);

                if (ilceId != -1)
                {
                    query = query.Where(q => q.ilceId == ilceId);

                    if (mahalleId != -1)
                    {
                        query = query.Where(q => q.mahalleId == mahalleId);
                    }
                }
            }


            if (kategoriId != -1)
            {
                if (idc.kategoris.Where(x => x.ustKategoriId == kategoriId).FirstOrDefault() == null)
                {/*alt kategori ve tur varsa*/
                    query = query.Where(q => q.kategoriId == kategoriId);
                }
                else
                {
                    query = query.Where(q => q.kategori.ustKategoriId == kategoriId);

                }
            }

            if (turId != -1)
            {
                query = query.Where(q => q.ilanTurId == turId);
            }


            if (magazaTur != -1)
            {
                if (magazaTur != 0)
                {
                    query = query.Where(q => q.magazaTur == magazaTur);
                }
                else
                {
                    query = query.Where(q => q.magazaId == null);
                }
            }

            if (tarihAralik != -1)
            {
                if (tarihAralik == 1)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(1, 0, 0, 0, 0)));
                }
                else if (tarihAralik == 3)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(3, 0, 0, 0, 0)));
                }
                else if (tarihAralik == 7)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0, 0)));
                }
                else if (tarihAralik == 15)
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(15, 0, 0, 0, 0)));
                }
                else
                {
                    query = query.Where(q => q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(30, 0, 0, 0, 0)));
                }
            }

            if (sirala != -1)
            {
                if (sirala == 2) query = query.OrderBy(x => x.fiyat);

                if (sirala == 3) query = query.OrderByDescending(x => x.fiyat);

                if (sirala == 4) query = query.OrderBy(x => x.baslangicTarihi);

                if (sirala == 5) query = query.OrderByDescending(x => x.baslangicTarihi);

                if (sirala == 6) query = query.OrderBy(x => x.ilId);

                if (sirala == 7) query = query.OrderByDescending(x => x.ilId);
            }


            // gelen veri min#max
            if (_intext.FiyatData.Max != "" || _intext.FiyatData.Min != "")
            {
                double min = -1,
                       max = -1;

                if (_intext.FiyatData.Min != "")
                    min = Convert.ToDouble(_intext.FiyatData.Min);
                if (_intext.FiyatData.Max != "")
                    max = Convert.ToDouble(_intext.FiyatData.Max);

                if (min != -1 && max != -1)
                {
                    query = query.Where(q => q.fiyat >= min & q.fiyat <= max);
                }
                if (min == -1 && max != -1)
                {
                    query = query.Where(q => q.fiyat <= max);
                }
                if (min != -1 && max == -1)
                {
                    query = query.Where(q => q.fiyat >= min);
                }
            }

            //gelen veri 78_1 $ 45 @ 78_2 $ 45 %
            bool blmaxmin = false;
            List<ExternalClass.TextItemSearchCS> lstsorgu = new List<ExternalClass.TextItemSearchCS>();

            if (_intext.ListText.Count != 0)
            {

                for (int i = 0; i < _intext.ListText.Count; i++)
                {
                    try
                    {
                        ListText data = _intext.ListText[i];
                        double min = -1,
                               max = -1;

                        int ozellikId = -1;

                        if (data.Max != "")
                        {
                            max = Convert.ToDouble(data.Max);
                        }
                        if (data.Min != "")
                        {
                            min = Convert.ToDouble(data.Min);
                        }

                        ozellikId = Convert.ToInt32(data.id);

                        ExternalClass.TextItemSearchCS itemclssorgu = new ExternalClass.TextItemSearchCS();
                        itemclssorgu.id = ozellikId;
                        itemclssorgu.Max = max;
                        itemclssorgu.Min = min;
                        lstsorgu.Add(itemclssorgu);
                        if (max != -1 || min != -1)
                        {
                            query = query.Where(q => q.girilenOzellik.Contains("<ozellikId>" + ozellikId + "</ozellikId>"));
                            blmaxmin = true;
                        }

                    }

                    catch (Exception)
                    {

                        throw;
                    }

                }
            }

            //gelen veri 22 $ 45 %
            for (int i = 0; i < _intext.ListDrop.Count; i++)
            {
                try
                {
                    ExternalClass.ListDrop data = new ListDrop();

                    data = _intext.ListDrop[i];

                    int deger = -1;
                    int ozellikId = Convert.ToInt32(data.id);
                    if (data.value != "")
                    {
                        if (data.value != null)
                        {
                            deger = Convert.ToInt32(data.value);
                        }
                    }

                    if (deger != -1)
                    {
                        query = query.Where(q => q.secilenOzellik.Contains("<deger>" + deger + "</deger>"));
                    }

                }
                catch (Exception)
                {

                    throw;
                }
            }


            List<ExternalClass.ilanDataType> list = new List<ExternalClass.ilanDataType>();
            if (blmaxmin == true)
            {

            }
            else
            {
                query = query.Skip(pageSize * (pageIndex)).Take(pageSize);
            }

            var dt = query.ToArray();
            int bas = pageSize * (pageIndex);
            int bitis = (pageSize * (pageIndex)) + pageSize;
            int art = 0;
            foreach (var item in dt)
            {
                if (blmaxmin == true)
                {

                    bool ekle = false;
                    string girilendata = item.girilenOzellik;
                    List<ExternalClass.girilenDataType> girlist = new List<ExternalClass.girilenDataType>();
                    girlist = (List<ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(girilendata, typeof(List<ExternalClass.girilenDataType>));

                    foreach (ExternalClass.girilenDataType itemgiris in girlist)
                    {
                        foreach (ExternalClass.TextItemSearchCS sorgu in lstsorgu)
                        {
                            if (sorgu.id == itemgiris.ozellikId)
                            {

                                if (sorgu.Min != -1 && sorgu.Max != -1)
                                {
                                    if (sorgu.Max >= Convert.ToDouble(itemgiris.deger) && sorgu.Min <= Convert.ToDouble(itemgiris.deger))
                                    {
                                        ekle = true;

                                    }
                                    //    query = query.Where(q => Convert.ToDouble(q.girilenIlanOzelliks.Where(x => x.ozellikId == ozellikId).FirstOrDefault().deger) >= min & Convert.ToDouble(q.girilenIlanOzelliks.Where(x => x.ozellikId == ozellikId).FirstOrDefault().deger.Trim()) <= max);
                                }
                                if (sorgu.Min == -1 && sorgu.Max != -1)
                                {
                                    if (sorgu.Max >= Convert.ToDouble(itemgiris.deger))
                                    {
                                        ekle = true;
                                    }
                                    //    query = query.Where(q => Convert.ToDouble(q.girilenIlanOzelliks.Where(x => x.ozellikId == ozellikId).FirstOrDefault().deger) >= min & Convert.ToDouble(q.girilenIlanOzelliks.Where(x => x.ozellikId == ozellikId).FirstOrDefault().deger.Trim()) <= max);
                                }
                                if (sorgu.Min != -1 && sorgu.Max == -1)
                                {
                                    if (sorgu.Min <= Convert.ToDouble(itemgiris.deger))
                                    {
                                        ekle = true;
                                    }
                                    //    query = query.Where(q => Convert.ToDouble(q.girilenIlanOzelliks.Where(x => x.ozellikId == ozellikId).FirstOrDefault().deger) >= min & Convert.ToDouble(q.girilenIlanOzelliks.Where(x => x.ozellikId == ozellikId).FirstOrDefault().deger.Trim()) <= max);
                                }
                            }
                        }
                    }

                    if (ekle == true)
                    {
                        if (bas <= art && art < bitis)
                        {
                            string resdata = item.resim;
                            List<ExternalClass.resimDataType> resler = new List<ExternalClass.resimDataType>();
                            resler = (List<ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(resdata, typeof(List<ExternalClass.resimDataType>));

                            ExternalClass.resimDataType seciliresim = new ExternalClass.resimDataType();
                            if (resler.Count() == 0)
                            {
                                seciliresim.resim = "noImage.jpg";
                            }
                            else
                            {
                                foreach (ExternalClass.resimDataType rs in resler)
                                {
                                    //if (rs.seciliMi)
                                    //{
                                    seciliresim.resim = "thmb_" + rs.resim;
                                    seciliresim.seciliMi = true;
                                    //}
                                    break;
                                }
                            }

                            string satisdata = item.girilenOzellik;
                            List<ExternalClass.girilenDataType> girilenler = new List<ExternalClass.girilenDataType>();
                            girilenler = (List<ExternalClass.girilenDataType>)toolkit.GetObjectInXml(satisdata, typeof(List<ExternalClass.girilenDataType>));

                            ExternalClass.girilenDataType satisTarihi = new ExternalClass.girilenDataType();

                            foreach (ExternalClass.girilenDataType rs in girilenler)
                            {
                                if (rs.ozellikId == 64)
                                {
                                    satisTarihi.deger = rs.deger;
                                }
                                else
                                {
                                    if (rs.ozellikId == 63)
                                    {
                                        satisTarihi.deger = rs.deger;
                                    }
                                }
                            }

                            if (satisTarihi.deger == null)
                            {
                                satisTarihi.deger = item.bitisTarihi.ToString();
                            }
                            //////////////////////////////////////////////////////////

                            DateTime dateCtrl = Convert.ToDateTime(satisTarihi.deger);
                            bool guncel = false;

                            if (dateCtrl < DateTime.Now)
                            {
                                guncel = true;
                            }

                            //////////////////////////////////////////////////
                            bool acil = false;
                            if (idc.seciliDopings.Where(x => x.dopingKategori.doping.dopingId == 5 && x.ilanId == item.ilanId).FirstOrDefault() != null)
                            {
                                acil = true;
                            }
                            ///////////////////////////////////////////////////

                            list.Add(new ExternalClass.ilanDataType()
                            {
                                ilanId = item.ilanId,
                                baslik = item.baslik,
                                fiyat = item.fiyat,
                                fiyatTurId = item.fiyatTur,
                                baslangicTarihi = item.baslangicTarihi,
                                ilAdi = item.ilAdi,
                                ilceAdi = item.ilceAdi,
                                mahalleAdi = item.mahalleAdi,
                                resim = seciliresim.resim,
                                resimList = resler,
                                girilenOzellikList = (List<ExternalClass.girilenDataType>)toolkit.GetObjectInXml(item.girilenOzellik, typeof(List<ExternalClass.girilenDataType>)),
                                secilen = (List<ExternalClass.secilenDataType>)DAL.toolkit.GetObjectInXml(item.secilenOzellik, typeof(List<ExternalClass.secilenDataType>)),
                                koordinat = item.koordinat,
                                lat = Convert.ToSingle(item.ilat),
                                lng = Convert.ToSingle(item.ilng),
                                magazaTurId = Convert.ToInt32(item.magazaTur),
                                satisTarihi1 = satisTarihi.deger,
                                guncelMi = guncel,
                                satildi = Convert.ToBoolean(item.satildiMi),
                                magazaId = Convert.ToInt32(item.magazaId),
                                acilMi = acil

                            });

                        }
                        art++;
                        if (art > bitis) break;
                    }

                }
                else
                {
                    string resdata = item.resim;
                    List<ExternalClass.resimDataType> resler = new List<ExternalClass.resimDataType>();
                    resler = (List<ExternalClass.resimDataType>)toolkit.GetObjectInXml(resdata, typeof(List<ExternalClass.resimDataType>));

                    ExternalClass.resimDataType seciliresim = new ExternalClass.resimDataType();
                    if (resler.Count() == 0)
                    {
                        seciliresim.resim = "noImage.jpg";
                    }
                    else
                    {
                        foreach (ExternalClass.resimDataType rs in resler)
                        {
                            //if (rs.seciliMi)
                            //{
                            seciliresim.resim = "thmb_" + rs.resim;
                            seciliresim.seciliMi = true;
                            //}
                            break;
                        }
                    }

                    /////////////////////////////////
                    string satisdata = item.girilenOzellik;
                    List<ExternalClass.girilenDataType> girilenler = new List<ExternalClass.girilenDataType>();
                    girilenler = (List<ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(satisdata, typeof(List<ExternalClass.girilenDataType>));

                    ExternalClass.girilenDataType satisTarihi = new ExternalClass.girilenDataType();

                    foreach (ExternalClass.girilenDataType rs in girilenler)
                    {
                        if (rs.ozellikId == 64)
                        {
                            satisTarihi.deger = rs.deger;
                        }
                        else
                        {
                            if (rs.ozellikId == 63)
                            {
                                satisTarihi.deger = rs.deger;
                            }
                        }
                    }

                    if (satisTarihi.deger == null)
                    {
                        satisTarihi.deger = item.bitisTarihi.ToString();
                    }
                    //////////////////////////////////////////////////////////

                    DateTime dateCtrl = Convert.ToDateTime(satisTarihi.deger);
                    bool guncel = false;

                    if (dateCtrl >= DateTime.Now)
                    {
                        guncel = true;
                    }

                    //////////////////////////////////////////////////
                    bool acil = false;
                    if (idc.seciliDopings.Where(x => x.dopingKategori.doping.dopingId == 5 && x.ilanId == item.ilanId).FirstOrDefault() != null)
                    {
                        acil = true;
                    }
                    ///////////////////////////////////////////////////

                    list.Add(new ExternalClass.ilanDataType()
                    {
                        ilanId = item.ilanId,
                        baslik = item.baslik,
                        fiyat = item.fiyat,
                        fiyatTurId = item.fiyatTur,
                        baslangicTarihi = item.baslangicTarihi,
                        ilAdi = item.ilAdi,
                        ilceAdi = item.ilceAdi,
                        mahalleAdi = item.mahalleAdi,
                        resim = seciliresim.resim,
                        resimList = resler,
                        girilenOzellikList = (List<ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(item.girilenOzellik, typeof(List<ExternalClass.girilenDataType>)),
                        secilen = (List<ExternalClass.secilenDataType>)DAL.toolkit.GetObjectInXml(item.secilenOzellik, typeof(List<ExternalClass.secilenDataType>)),
                        koordinat = item.koordinat,
                        //magazaId = turId,
                        lat = Convert.ToSingle(item.ilat),
                        lng = Convert.ToSingle(item.ilng),
                        magazaTurId = Convert.ToInt32(item.magazaTur),
                        satisTarihi1 = satisTarihi.deger,
                        guncelMi = guncel,
                        satildi = Convert.ToBoolean(item.satildiMi),
                        magazaId = Convert.ToInt32(item.magazaId),

                        acilMi = acil
                    });

                }
            }


            if (_datatur == 1)
            {

                return JsonConvert.SerializeObject(list);
            }
            else if (_datatur == 2)//xml
            {


                return DAL.toolkit.GetXmlDataInObject(list).ToString();
            }
            else if (_datatur == 3)//html
            {
                string sonuc = "";

                foreach (ExternalClass.ilanDataType item in list)
                {
                    sonuc += @"<div class='list-r-b-div clearfix'>
                                			<div class='list-r-b-d list-r-b-d-1'>
                                				<a target='_blank' href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + @"-" + item.ilanId + @"/detay'><img src='/upload/ilan/" + item.resim + @"' alt='" + item.baslik + @"' width='90' height='60'></a>
                                			</div>
                                			<div class='list-r-b-d list-r-b-d-2'>
                                				<h5 class='add-title'><strong>" + item.baslik + @"</strong></h5>
                                			</div>
                                			<div class='list-r-b-d list-r-b-d-3'>
                                				<h5 class='item-price'>" + item.fiyatTurId + "  " + String.Format(" {0:N0}", item.fiyat) + @"</h5>
                                			</div>
                                			<div class='list-r-b-d list-r-b-d-4'>
                                				<span class='date'><i class='icon-clock'></i> " + item.baslangicTarihi.ToString("dd MMMM yyyy") + @" </span>
                                			</div>
                                			<div class='list-r-b-d list-r-b-d-5'>
                                				<span class='item-location'><i class='fa fa-map-marker'></i>" + item.ilAdi + @"<br />/" + item.ilceAdi + @"</span>
                                            </div>
                                		</div>";
                }
                return sonuc;
            }
            else
            {
                return null;
            }
        }

        public List<SiteMapCS> getSitemapByYearAndMonth(int _inYear, int _inMonth)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilans
                        .Where(x => x.silindiMi == false & x.onay == (int) VerifyStatus.onaylanmis &&
                                    x.baslangicTarihi.Year == _inYear && x.baslangicTarihi.Month == _inMonth)
                        .OrderBy(x => x.baslangicTarihi)
                    select new
                    {
                        i.baslik,
                        i.ilanId,
                        i.baslangicTarihi
                    };


                List<SiteMapCS> ads = new List<SiteMapCS>();
                int monthVal = -1;
                int yearVal = -1;
                foreach (var item in query.ToList())
                {
                    monthVal = item.baslangicTarihi.Month;
                    yearVal = item.baslangicTarihi.Year;

                    var itemVal = new SiteMapCS
                    {
                        baslik = item.baslik,
                        ilanId = item.ilanId,
                        baslangicTarihi = item.baslangicTarihi
                    };

                    ads.Add(itemVal);
                }

                return ads;
            }
        }

    }

}

