using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using DAL.Enums;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSIlanSatilanDal : IIlanSatilanDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageCount = 10;
        public static Func<ilanDataContext, IQueryable<Ilan>> GetBySaleCompiled =
            CompiledQuery.Compile((ilanDataContext iDc) =>
                (from i in iDc.ilanSatilans.Where(x => x.onay == 1 && x.silindiMi == false)
                 select new Ilan
                 {
                     IlanId = i.ilanId,
                     Baslik = i.baslik,
                     Tarih = i.baslangicTarihi,
                     Resimler = i.resim,
                     Fiyat = string.Format("{0:N0}", i.fiyat),
                 }).OrderByDescending(x => x.IlanId).Take(20));

        public void Add(ilanSatilan entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(ilanSatilan entity)
        {
            throw new NotImplementedException();
        }

        public ilanSatilan Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<ilanSatilan> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetBySale()
        {
            return GetBySaleCompiled(idc).ToList();
        }

        public void Update(ilanSatilan entity)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetBySaleFaceted(int Index, SortTypeString SortType)
        {
            var query = from i in idc.ilanSatilans.Where(i => i.onay == 1 && i.silindiMi == false)
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


            if (SortTypeString.DateDesc == SortType) query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (Index)).Take(pageCount);

            else if (SortTypeString.DateAsc == SortType) query = query.OrderBy(x => x.Tarih).Skip(pageCount * (Index)).Take(pageCount);

            else if (SortTypeString.PriceDesc == SortType) query = query.OrderByDescending(x => x.FiyatNumeric).Skip(pageCount * (Index)).Take(pageCount);

            else if (SortTypeString.PriceAsc == SortType) query = query.OrderBy(x => x.FiyatNumeric).Skip(pageCount * (Index)).Take(pageCount);

            return query.ToList();
        }

        public int Count()
        {
            var value = idc.ilanSatilans.Where(q => q.onay == 1 && q.silindiMi == false);
            return value.Count();
        }
    }
}
