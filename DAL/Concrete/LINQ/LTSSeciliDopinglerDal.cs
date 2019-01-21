using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;
using System.Data.Linq;
using DAL.Enums;

namespace DAL.Concrete.LINQ
{
    public class LTSSeciliDopinglerDal : ISeciliDopinglerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10;


        public static Func<ilanDataContext, int, IQueryable<Ilan>> GetByDopingIdCompiled =
            CompiledQuery.Compile((ilanDataContext iDc, int DopingId) =>
                (from s in iDc.seciliDopings.Where(s => s.onay == true && s.ilan.onay == 1 && s.ilan.silindiMi == false && s.dopingKategori.dopingId == DopingId)
                 select new Ilan
                 {
                     IlanId = s.ilan.ilanId,
                     Baslik = s.ilan.baslik,
                     Tarih = s.ilan.baslangicTarihi,
                     Resimler = s.ilan.resim,
                 }).OrderByDescending(x => x.Tarih).Take(11));

        public void Add(seciliDoping entity)
        {
            seciliDoping seciliDoping = new seciliDoping();
            seciliDoping.ilanId = entity.ilanId;
            seciliDoping.dopingKategoriId = entity.dopingKategoriId;
            seciliDoping.baslangicTarihi = entity.baslangicTarihi;
            seciliDoping.bitisTarihi = entity.bitisTarihi;
            seciliDoping.onay = entity.onay;
            seciliDoping.pasifMi = entity.pasifMi;
            idc.seciliDopings.InsertOnSubmit(seciliDoping);
            idc.SubmitChanges();
        }

        public void Delete(seciliDoping entity)
        {
            throw new NotImplementedException();
        }

        public seciliDoping Get(int Id)
        {
            var value = idc.seciliDopings.Where(q => q.ilanId == Id).FirstOrDefault();
            return value;
        }

        public seciliDoping Get(seciliDoping entity)
        {
            throw new NotImplementedException();
        }

        public List<seciliDoping> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetAllByCategoriShowcase(int CategoriId)
        {
            var query = from s in idc.seciliDopings.Where(s => s.onay == true & s.ilan.onay == 1 && s.ilan.silindiMi == false && s.dopingKategori.dopingId == 3)
                        select new Ilan
                        {
                            IlanId = s.ilan.ilanId,
                            Baslik = s.ilan.baslik,
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", s.ilan.baslangicTarihi),
                            Tarih = s.ilan.baslangicTarihi,
                            Resimler = s.ilan.resim,
                            Fiyat = string.Format(" {0:N0}", s.ilan.fiyat),
                            UstKategoriId = Convert.ToInt32(s.ilan.kategori.ustKategoriId),
                            KategoriId = s.ilan.kategoriId
                        };

            var TopCategori = idc.kategoris.Where(x => x.ustKategoriId == CategoriId).FirstOrDefault(); //KategoriService call
            if (TopCategori == null) query = query.Where(q => q.KategoriId == CategoriId);
            else query = query.Where(q => q.UstKategoriId == CategoriId);

            query = query.OrderByDescending(x => x.Tarih).Take(pageCount);

            return query.ToList();
        }



        public void Update(seciliDoping entity) // parameter external
        {
            idc.seciliDopings.Where(q => q.ilanId == entity.ilanId && q.pasifMi == true && q.onay == true).ToList().ForEach(x =>
            {
                x.pasifMi = false;
                x.baslangicTarihi = DateTime.Now;
                x.bitisTarihi = DateTime.Now.AddDays(Convert.ToInt32(x.dopingKategori.dopingSureId) * 7);
            });
            idc.SubmitChanges();
        }

        public List<Ilan> GetAllByDopingId(int DopingId)
        {
            return GetByDopingIdCompiled(idc, DopingId).ToList();
        }

        public int CountByDopingId(int DopingId)
        {
            var count = idc.seciliDopings.Where(s => s.onay == true && s.ilan.onay == 1 &&
                                                     s.dopingKategori.dopingId == DopingId).Count();
            return count;
        }

        public seciliDoping GetByAdsId(int AdsId)
        {
            var value = idc.seciliDopings.Where(q => q.ilanId == AdsId && q.pasifMi == true && q.onay == true)
                .FirstOrDefault();
            return value;
        }

        public List<SeciliDoping> GetAllByAdsId(int AdsId)
        {
            var query = from s in idc.seciliDopings.Where(x => x.ilanId == AdsId)
                        select new SeciliDoping
                        {
                            DopingDurum = s.onay == true ? "onaylanmış" : "onaylanmamış",
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", s.baslangicTarihi),
                            BitisTarihi = String.Format(" {0:dd MMMM yyyy}", s.bitisTarihi),
                            DopingAdi = s.dopingKategori.doping.dopingAdi,
                            DopingSure = s.dopingKategori.dopingSureId + " Haftalık"
                        };

            return query.ToList();
        }

        public List<Ilan> GetAllByDopingIdFaceted(int DopingId, int Index, SortTypeString SortType)
        {
            var query = from s in idc.seciliDopings.Where(s => s.onay == true & s.ilan.onay == 1 & s.dopingKategori.dopingId == DopingId & s.ilan.silindiMi == false)
                        select new Ilan
                        {
                            IlanId = s.ilan.ilanId,
                            Baslik = s.ilan.baslik,
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", s.ilan.baslangicTarihi),
                            Tarih = s.ilan.baslangicTarihi,
                            Resimler = s.ilan.resim,
                            Fiyat = String.Format(" {0:N0}", s.ilan.fiyat),
                            UstKategoriId = Convert.ToInt32(s.ilan.kategori.ustKategoriId),
                            KategoriId = s.ilan.kategoriId,
                            IlAdi = s.ilan.iller.ilAdi,
                            IlceAdi = s.ilan.ilceler.ilceAdi,
                            MahalleAdi = s.ilan.mahalleler.mahalleAdi,
                            KategoriAdi = s.ilan.kategori.kategoriAdi,
                            EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), s.ilan.ilanTurId.ToString())),
                            FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), s.ilan.fiyatTurId.ToString())),
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(s.ilan.baslik),
                        };

            if (SortTypeString.DateDesc == SortType) query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (Index)).Take(pageCount);

            else if (SortTypeString.DateAsc == SortType) query = query.OrderBy(x => x.Tarih).Skip(pageCount * (Index)).Take(pageCount);

            else if (SortTypeString.PriceDesc == SortType) query = query.OrderByDescending(x => x.FiyatNumeric).Skip(pageCount * (Index)).Take(pageCount);

            else if (SortTypeString.PriceAsc == SortType) query = query.OrderBy(x => x.FiyatNumeric).Skip(pageCount * (Index)).Take(pageCount);

            return query.ToList();
        }

        public void UpdateByAdsId(int AdsId)
        {
            idc.seciliDopings.Where(q => q.ilanId == AdsId && q.pasifMi == true && q.onay == true).ToList().ForEach(x =>
            {
                x.pasifMi = false;
                x.baslangicTarihi = DateTime.Now;
                x.bitisTarihi = DateTime.Now.AddDays(Convert.ToInt32(x.dopingKategori.dopingSureId) * 7);
            });
            idc.SubmitChanges();
        }
    }
}
