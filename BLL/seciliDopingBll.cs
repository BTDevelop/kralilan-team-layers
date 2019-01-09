using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Newtonsoft.Json;
using System.IO;
using BLL.ExternalClass;
using static DAL.toolkit;
using static BLL.ilanBll;
using BLL.Formatter;
using static DAL.StrategyData;
using BLL.EnumHelper;

namespace BLL
{
    public class seciliDopingBll
    {

        Formatter.Formatter formatter = new Formatter.Formatter();

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
        /// <param name="_inAdsId"></param>
        /// <param name="_inDopingCatId"></param>
        /// <param name="_inStartDate"></param>
        /// <param name="_inEndDate"></param>
        /// <param name="_inVerify"></param>
        //public void insert(int _inAdsId, int _inDopingCatId, DateTime _inStartDate, DateTime _inEndDate, bool _inVerify)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        seciliDoping seciliDoping = new seciliDoping();
        //        seciliDoping.ilanId = _inAdsId;
        //        seciliDoping.dopingKategoriId = _inDopingCatId;
        //        seciliDoping.baslangicTarihi = _inStartDate;
        //        seciliDoping.bitisTarihi = _inEndDate;
        //        seciliDoping.onay = _inVerify;
        //        seciliDoping.pasifMi = true;
        //        idc.seciliDopings.InsertOnSubmit(seciliDoping);
        //        idc.SubmitChanges();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inAdsId"></param>
        //public void update(int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        idc.seciliDopings.Where(q => q.ilanId == _inAdsId && q.pasifMi == true && q.onay == true).ToList().ForEach(x =>
        //        {
        //            x.pasifMi = false;
        //            x.baslangicTarihi = DateTime.Now;
        //            x.bitisTarihi = DateTime.Now.AddDays(Convert.ToInt32(x.dopingKategori.dopingSureId) * 7);
        //        });
        //        idc.SubmitChanges();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inAdsId"></param>
        /// <returns></returns>
        //public seciliDoping search(int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.seciliDopings.Where(q => q.ilanId == _inAdsId).FirstOrDefault();
        //        return value;
        //    }
        //}

        public string select(int _index, int _inCount, int _inSort, int _inDopingId, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from s in idc.seciliDopings.Where(s => s.onay == true & s.ilan.onay == (int)VerifyStatus.onaylanmis & s.dopingKategori.dopingId == _inDopingId & s.ilan.silindiMi == false)
                            select new
                            {
                                s.ilan.ilanId,
                                s.ilan.baslik,
                                s.ilan.baslangicTarihi,
                                s.ilan.iller.ilAdi,
                                s.ilan.ilceler.ilceAdi,
                                s.ilan.mahalleler.mahalleAdi,
                                s.ilan.fiyat,
                                s.ilan.kategori.kategoriAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), s.ilan.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), s.ilan.fiyatTurId.ToString())),
                                s.ilan.resim,
                                s.ilan.aciklama,
                                baslikFormat = PublicHelper.Tools.URLConverter(s.ilan.baslik),
                                fiyatFormat = String.Format(" {0:N0}", s.ilan.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", s.ilan.baslangicTarihi),
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

        //public int count(int _inOpt)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var count = idc.seciliDopings.Where(s => s.onay == true && s.ilan.onay == (int)VerifyStatus.onaylanmis &&
        //                                                  s.dopingKategori.dopingId == _inOpt).Count();
        //        return count;
        //    }
        //}

        //public seciliDoping getDopingByAdsId(int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.seciliDopings.Where(q => q.ilanId == _inAdsId && q.pasifMi == true && q.onay == true)
        //                       .FirstOrDefault();
        //        return value;
        //    }
        //}

        //public class DopingKategoriType
        //{
        //    public int ilanId
        //    { get; set; }
        //    public string baslik
        //    { get; set; }
        //    public DateTime baslangicTarihi
        //    { get; set; }
        //    public string resim
        //    { get; set; }
        //    public string fiyat
        //    { get; set; }
        //    public int ustKategoriId
        //    { get; set; }
        //    public int kategoriId
        //    { get; set; }
        //}

        //public string getAdsByDopingCatHomePage(int _index, int _inCount, int _inSort, int _inCatId, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from s in idc.seciliDopings.Where(s => s.onay == true & s.ilan.onay == (int)VerifyStatus.onaylanmis && s.dopingKategori.dopingId == 3 && s.ilan.silindiMi == false)
        //                    select new DopingKategoriType
        //                    {
        //                        ilanId = s.ilan.ilanId,
        //                        baslik = s.ilan.baslik,
        //                        baslangicTarihi = s.ilan.baslangicTarihi,
        //                        resim = s.ilan.resim,
        //                        fiyat = string.Format(" {0:N0}", s.ilan.fiyat),
        //                        ustKategoriId = Convert.ToInt32(s.ilan.kategori.ustKategoriId),
        //                        kategoriId = s.ilan.kategoriId
        //                    };

        //        if (_inCatId != -1)
        //        {
        //            var itemTopValues = idc.kategoris.Where(x => x.ustKategoriId == _inCatId).FirstOrDefault();
        //            if (itemTopValues == null) query = query.Where(q => q.kategoriId == _inCatId);
        //            else query = query.Where(q => q.ustKategoriId == _inCatId);
        //        }

        //        if (_inSort == 1) query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

        //        else if (_inSort == 2) query = query.OrderBy(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

        //        else if (_inSort == 3) query = query.OrderByDescending(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);

        //        else query = query.OrderBy(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }
        //}


        //public string getAdsByDopingCat(int _index, int _inCount, int _inSort, int _inCatId, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from s in idc.seciliDopings.Where(s => s.onay == true & s.ilan.onay == (int)VerifyStatus.onaylanmis && s.dopingKategori.dopingId == 3 && s.ilan.silindiMi == false)
        //                    select new
        //                    {
        //                        s.ilan.ilanId,
        //                        s.ilan.baslik,
        //                        s.ilan.baslangicTarihi,
        //                        s.ilan.iller.ilAdi,
        //                        s.ilan.ilceler.ilceAdi,
        //                        s.ilan.mahalleler.mahalleAdi,
        //                        s.ilan.fiyat,
        //                        s.ilan.kategori.kategoriAdi,
        //                        ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), s.ilan.ilanTurId.ToString())),
        //                        fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), s.ilan.fiyatTurId.ToString())),
        //                        s.ilan.resim,
        //                        s.ilan.aciklama,
        //                        s.ilan.kategoriId,
        //                        s.ilan.kategori,
        //                        baslikFormat = PublicHelper.Tools.URLConverter(s.ilan.baslik),
        //                        fiyatFormat = String.Format(" {0:N0}", s.ilan.fiyat),
        //                        tarihFormat = String.Format(" {0:dd MMMM yyyy}", s.ilan.baslangicTarihi),
        //                    };

        //        if (_inCatId != -1)
        //        {
        //            var itemTopValues = idc.kategoris.Where(x => x.ustKategoriId == _inCatId).FirstOrDefault();
        //            if (itemTopValues == null) query = query.Where(q => q.kategoriId == _inCatId);
        //            else query = query.Where(q => q.kategori.ustKategoriId == _inCatId);
        //        }

        //        if (_inSort == 1) query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

        //        else if (_inSort == 2) query = query.OrderBy(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

        //        else if (_inSort == 3) query = query.OrderByDescending(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);

        //        else query = query.OrderBy(x => x.fiyat).Skip(_inCount * (_index)).Take(_inCount);

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }

        //}

        //public string getDopingsByAdsId(IFormatter _inReturnType, int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from s in idc.seciliDopings.Where(x => x.ilanId == _inAdsId)
        //                    select new ilanDataType
        //                    {
        //                        girilenOzellik = s.onay == true ? "onaylanmış" : "onaylanmamış",
        //                        baslangicTarihi = s.baslangicTarihi,
        //                        bitisTarihi = Convert.ToDateTime(s.bitisTarihi),
        //                        baslik = s.dopingKategori.doping.dopingAdi,
        //                        aciklama = s.dopingKategori.dopingSureId + " Haftalık"
        //                    };

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }
        //}

        //public string getAdsByDopingId(int index, int inCount, int inSort, int inDopingId, IFormatter inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = StrategyData.GetClassifiedByDopingIdViewHomePageCompiled(idc, index, inCount, inDopingId);

        //        formatter.FormatTo(inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();

        //    }
        //}

        //public string GetClassifiedByLastDate(int _index, int _inCount, int _inSort, int _inRange, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = StrategyData.GetClassifiedByLastDateViewHomePageCompiled(idc, _index, _inCount);

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }
        //}

        //public string GetClassifiedByLastSale(int _index, int _inCount, int _inSort, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = StrategyData.GetClassifiedByLastSaleViewHomePageCompiled(idc, _index, _inCount);

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }

        //}
    }

}

