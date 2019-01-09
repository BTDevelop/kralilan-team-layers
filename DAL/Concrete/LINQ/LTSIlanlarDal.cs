using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using System.Data.Linq;
using KralilanProject.Entities;
using DAL.Enums;

namespace DAL.Concrete.LINQ
{
    public class LTSIlanlarDal : IIlanlarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10;

        public static Func<ilanDataContext, IQueryable<Ilan>> GetByLastDateCompiled =
            CompiledQuery.Compile((ilanDataContext iDc) =>
                (from i in iDc.ilans.Where(x => x.onay == 1 && x.silindiMi == false && x.satildiMi == false && x.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)))
                 select new Ilan
                 {
                     IlanId = i.ilanId,
                     Baslik = i.baslik,
                     Tarih = i.baslangicTarihi,
                     Resimler = i.resim,
                 }).OrderByDescending(x => x.Tarih).Take(20));


        public static Func<ilanDataContext, IQueryable<Ilan>> GetBySaleCompiled =
            CompiledQuery.Compile((ilanDataContext iDc) =>
                (from i in iDc.ilans.Where(x => x.onay == 1 && x.silindiMi == false && x.satildiMi == true)
                 select new Ilan
                 {
                     IlanId = i.ilanId,
                     Baslik = i.baslik,
                     Tarih = i.baslangicTarihi,
                     Resimler = i.resim,
                     Fiyat = string.Format("{0:N0}", i.fiyat),
                 }).OrderByDescending(x => x.IlanId).Take(20));

        public void Add(ilan entity)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                ilan ilan = new ilan();
                if (entity.ilanTurId != -1) ilan.ilanTurId = entity.ilanTurId;
                if (entity.kategoriId != -1) ilan.kategoriId = entity.kategoriId;
                if (entity.fiyat != -1) ilan.fiyat = entity.fiyat;
                if (entity.fiyatTurId != -1) ilan.fiyatTurId = entity.fiyatTurId;
                if (entity.kullaniciId != -1) ilan.kullaniciId = entity.kullaniciId;
                if (entity.magazaId != -1) ilan.magazaId = entity.magazaId;
                if (entity.ilId != -1) ilan.ilId = entity.ilId;
                if (entity.ilceId != -1) ilan.ilceId = entity.ilceId;
                if (entity.mahalleId != -1) ilan.mahalleId = entity.mahalleId;
                if (!String.IsNullOrEmpty(entity.baslik)) ilan.baslik = entity.baslik;
                if (!String.IsNullOrEmpty(entity.aciklama)) ilan.aciklama = entity.aciklama;
                ilan.baslangicTarihi = DateTime.Now;
                ilan.bitisTarihi = (DateTime.Now.AddYears(1));
                if (entity.onay != -1) ilan.onay = entity.onay;
                ilan.ziyaretci = 0;
                ilan.satildiMi = false;
                ilan.numaraYayinlansinMi = entity.numaraYayinlansinMi;
                if (!String.IsNullOrEmpty(entity.koordinat)) ilan.koordinat = entity.koordinat;
                if (!String.IsNullOrEmpty(entity.girilenOzellik)) ilan.girilenOzellik = entity.girilenOzellik;
                if (!String.IsNullOrEmpty(entity.secilenOzellik)) ilan.secilenOzellik = entity.secilenOzellik;
                if (!String.IsNullOrEmpty(entity.resim)) ilan.resim = entity.resim;
                if (entity.ilat != -1) ilan.ilat = entity.ilat;
                if (entity.ilng != -1) ilan.ilng = entity.ilng;
                idc.ilans.InsertOnSubmit(ilan);
                idc.SubmitChanges();
            }
        }

        public void Delete(ilan entity)
        {
            throw new NotImplementedException();
        }

        public ilan Get(int Id)
        {
            var value = idc.ilans.Where(i => i.ilanId == Id).SingleOrDefault();
            return value;
        }

        public ilan Get(ilan entity)
        {
            throw new NotImplementedException();
        }

        public List<ilan> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(ilan entity)
        {
            var value = idc.ilans.Where(q => q.ilanId == entity.ilanId).SingleOrDefault();

            if (value != null)
            {
                if (entity.fiyat != -1) value.fiyat = entity.fiyat;
                if (entity.fiyatTurId != -1) value.fiyatTurId = entity.fiyatTurId;
                if (entity.kullaniciId != -1) value.kullaniciId = entity.kullaniciId;
                if (entity.magazaId != -1) value.magazaId = entity.magazaId;
                if (entity.ilId != -1) value.ilId = entity.ilId;
                if (entity.ilceId != -1) value.ilceId = entity.ilceId;
                if (entity.mahalleId != -1) value.mahalleId = entity.mahalleId;
                if (!String.IsNullOrEmpty(entity.baslik)) value.baslik = entity.baslik;
                if (!String.IsNullOrEmpty(entity.aciklama)) value.aciklama = entity.aciklama;
                value.baslangicTarihi = entity.baslangicTarihi;
                value.bitisTarihi = entity.bitisTarihi;
                if (entity.onay != -1) value.onay = entity.onay;
                value.satildiMi = false;
                value.numaraYayinlansinMi = entity.numaraYayinlansinMi;
                if (!String.IsNullOrEmpty(entity.koordinat)) value.koordinat = entity.koordinat;
                if (!String.IsNullOrEmpty(entity.girilenOzellik)) value.girilenOzellik = entity.girilenOzellik;
                if (!String.IsNullOrEmpty(entity.secilenOzellik)) value.secilenOzellik = entity.secilenOzellik;
                if (!String.IsNullOrEmpty(entity.resim)) value.resim = entity.resim;
                if (entity.ilat != -1) value.ilat = entity.ilat;
                if (entity.ilng != -1) value.ilng = entity.ilng;
                value.silindiMi = entity.silindiMi;
                idc.SubmitChanges();
            }
        }

        public List<Ilan> GetByLastDate()
        {
            return GetByLastDateCompiled(idc).ToList();
        }

        public List<Ilan> GetBySale()
        {
            return GetBySaleCompiled(idc).ToList();
        }

        public int CountByStoreId(int StoreId)
        {
            return idc.ilans.Count(i => i.magazaId == StoreId && i.onay == 1 && i.silindiMi == false && i.satildiMi == false);
        }

        public ilan GetLast()
        {
            var value = idc.ilans.OrderByDescending(x => x.ilanId).First();
            return value;
        }

        public void UpdatePicturesByAdsId(int AdsId, string Pictures)
        {
            var value = idc.ilans.Where(q => q.ilanId == AdsId).SingleOrDefault();
            if (value != null)
            {
                value.resim = Pictures;
                idc.SubmitChanges();
            }
        }

        public List<Ilan> GetByLastDateFaceted(SortTypeString SortType)
        {
            var query = from i in idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false && i.satildiMi == false)
                        select new Ilan
                        {
                            IlanId = i.ilanId,
                            Baslik = i.baslik,
                            Fiyat = String.Format(" {0:N0}", i.fiyat),
                            FiyatNumeric = i.fiyat,
                            Aciklama = i.aciklama,
                            MagazaId = i.magazaId,
                            Tarih = i.baslangicTarihi,
                            IlAdi = i.iller.ilAdi,
                            MahalleAdi = i.mahalleler.mahalleAdi,
                            IlceAdi = i.ilceler.ilceAdi,
                            EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                            FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            Resimler = i.resim,
                            KategoriAdi = i.kategori.kategoriAdi,
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.baslik),
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                        };


            query = query.Where(q => q.Tarih >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)));

            if (SortTypeString.DateDesc == SortType) query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.DateAsc == SortType) query = query.OrderBy(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceDesc == SortType) query = query.OrderByDescending(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceAsc == SortType) query = query.OrderBy(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            return query.ToList();
        }

        public List<Ilan> GetBySaleFaceted(SortTypeString SortType)
        {
            var query = from i in idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false && i.satildiMi == true)
                        select new Ilan
                        {
                            IlanId = i.ilanId,
                            Baslik = i.baslik,
                            Fiyat = String.Format(" {0:N0}", i.fiyat),
                            FiyatNumeric = i.fiyat,
                            Aciklama = i.aciklama,
                            MagazaId = i.magazaId,
                            Tarih = i.baslangicTarihi,
                            IlAdi = i.iller.ilAdi,
                            MahalleAdi = i.mahalleler.mahalleAdi,
                            IlceAdi = i.ilceler.ilceAdi,
                            EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                            FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            Resimler = i.resim,
                            KategoriAdi = i.kategori.kategoriAdi,
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.baslik),
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                        };


            if (SortTypeString.DateDesc == SortType) query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.DateAsc == SortType) query = query.OrderBy(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceDesc == SortType) query = query.OrderByDescending(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceAsc == SortType) query = query.OrderBy(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            return query.ToList();
        }

        public List<Ilan> GetByUserIdFaceted(int UserId)
        {

            var query = from i in idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false && i.satildiMi == false && i.kullaniciId == UserId && i.magazaId == null)
                        select new Ilan
                        {
                            IlanId = i.ilanId,
                            Baslik = i.baslik,
                            Fiyat = String.Format(" {0:N0}", i.fiyat),
                            FiyatNumeric = i.fiyat,
                            Aciklama = i.aciklama,
                            MagazaId = i.magazaId,
                            Tarih = i.baslangicTarihi,
                            IlAdi = i.iller.ilAdi,
                            MahalleAdi = i.mahalleler.mahalleAdi,
                            IlceAdi = i.ilceler.ilceAdi,
                            EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                            FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            Resimler = i.resim,
                            KategoriAdi = i.kategori.kategoriAdi,
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.baslik),
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                        };

            query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);
            return query.ToList();
        }

        public ilan GetLastByUserId(int UserId)
        {
            var value = idc.ilans.Where(i => i.kullaniciId == UserId && i.onay == 1 && i.silindiMi == false && i.satildiMi == false)
                .OrderByDescending(x => x.baslangicTarihi).FirstOrDefault();
            return value;
        }

        public bool IsOwnerAds(int AdsId, int UserId, int StoreId)
        {
            var value = idc.ilans.Where(i => i.ilanId == AdsId).FirstOrDefault();
            if (value != null)
            {
                if (StoreId != -1) value = value.magazaId == StoreId ? value : null;
                else if (UserId != -1) value = value.kullaniciId == UserId ? value : null;

            }

            return value == null ? false : true;
        }

        public void UpdateStatus(int AdsId, int IsVerify, bool IsPass, bool IsDelete, bool IsSale)
        {
            var value = idc.ilans.Where(q => q.ilanId == AdsId).FirstOrDefault();

            if (value != null)
            {
                value.silindiMi = IsDelete;
                value.onay = IsVerify;
                value.pasifMi = IsPass;
                value.satildiMi = IsSale;
                idc.SubmitChanges();
            }
        }
    }
}
