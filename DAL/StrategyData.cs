using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace DAL
{

    public class StrategyData
    {

        #region Anasayfa gösterilecek ilanların derlenmiş formatları

        public class IlanType
        {
            public int? ilanId { get; set; }
            public string baslik { get; set; }
            public DateTime baslangicTarihi { get; set; }
            public string resim { get; set; }
            public double fiyat { get; set; }

        }


        public class KategoriType
        {
            public int? kategoriId { get; set; }
            public string kategoriAdi { get; set; }
            public int? kategoriSayi { get; set; }
            public string kategoriTip { get; set; }
            public string kategoriLogo { get; set; }

        }

        //public static Func<ilanDataContext, int, IQueryable<KategoriType>> GetTopCategoriWithCount =
        //    CompiledQuery.Compile((ilanDataContext iDc, int inTopCategori) =>
        //        (from k in iDc.kategoris.Where(q => q.ustKategoriId == inTopCategori)
        //            select new KategoriType
        //            {
        //                kategoriId = k.kategoriId,
        //                kategoriAdi = k.kategoriAdi,
        //                kategoriSayi = iDc.ilans.Where(x =>
        //                    x.onay == 1 && x.silindiMi == false && x.satildiMi == false &&
        //                    (x.kategori.ustKategoriId == k.kategoriId || x.kategoriId == k.kategoriId)).Count()
        //            }).OrderBy(x => x.kategoriId));


        public static Func<ilanDataContext, int, IQueryable<KategoriType>> GetTopesCategoriWithCount =
            CompiledQuery.Compile((ilanDataContext iDc, int inTopCategori) =>
                (iDc.ilanSayis.Where(x => x.ustKategoriId == inTopCategori)
                    .GroupBy(l => l.kategoriId)
                    .Select(cl => new KategoriType
                    {
                        kategoriId = cl.First().kategoriId,
                        kategoriAdi = cl.First().kategori.kategoriAdi,
                        kategoriSayi = cl.Sum(c => c.sayi),
                    }).OrderBy(x => x.kategoriId)));


        //public static Func<ilanDataContext, int, int, int, IQueryable<IlanType>> GetClassifiedByDopingIdViewHomePageCompiled =
        // CompiledQuery.Compile((ilanDataContext iDc, int index, int inCount, int inDopingId) =>
        // (from s in iDc.seciliDopings.Where(s => s.onay == true && s.ilan.onay == 1 && s.ilan.silindiMi == false && s.dopingKategori.dopingId == inDopingId)
        //  select new IlanType
        //  {
        //      ilanId = s.ilan.ilanId,
        //      baslik = s.ilan.baslik,
        //      baslangicTarihi = s.ilan.baslangicTarihi,
        //      resim = s.ilan.resim,
        //  }).OrderByDescending(x => x.baslangicTarihi).Take(inCount));


        //public static Func<ilanDataContext, int, int, IQueryable<IlanType>> GetClassifiedByLastDateViewHomePageCompiled =
        // CompiledQuery.Compile((ilanDataContext iDc, int index, int inCount) =>
        // (from i in iDc.ilans.Where(x => x.onay  == 1 && x.silindiMi == false && x.satildiMi == false && x.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)))
        //  select new IlanType
        //  {
        //      ilanId = i.ilanId,
        //      baslik = i.baslik,
        //      baslangicTarihi = i.baslangicTarihi,
        //      resim = i.resim,
        //  }).OrderByDescending(x => x.baslangicTarihi).Take(inCount));



        //public static Func<ilanDataContext, int, int, IQueryable<IlanType>> GetClassifiedByLastSaleViewHomePageCompiled =
        //    CompiledQuery.Compile((ilanDataContext iDc, int index, int inCount) =>
        //    (from i in iDc.ilans.Where(x => x.onay == 1 && x.silindiMi == false && x.satildiMi == true)
        //     select new IlanType
        //     {
        //         ilanId = i.ilanId,
        //         baslik = i.baslik,
        //         baslangicTarihi = i.baslangicTarihi,
        //         resim = i.resim,
        //         fiyat = i.fiyat
        //     }).OrderByDescending(x => x.ilanId).Take(inCount));


        #endregion

    }
}
