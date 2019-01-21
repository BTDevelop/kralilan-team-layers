using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;
using DAL.Enums;

namespace DAL.Concrete.LINQ
{
    public class LTSIlanFavorilerDal : IIlanFavorilerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageCount = 10;

        public void Add(ilanFavori entity)
        {
            throw new NotImplementedException();
        }

        public int Count(int UserId)
        {
            return idc.ilanFavoris.Count(i => i.kullaniciId == UserId && i.ilan.onay == 1 && i.ilan.silindiMi == false);
        }

        public void Delete(ilanFavori entity)
        {
            var value = idc.ilanFavoris.Where(q => q.ilanId == entity.ilanId && q.kullaniciId == entity.kullaniciId).FirstOrDefault();
            if (value != null)
            {
                idc.ilanFavoris.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public ilanFavori Get(int Id)
        {
            throw new NotImplementedException();
        }

        public ilanFavori Get(ilanFavori entity)
        {
            throw new NotImplementedException();
        }

        public List<ilanFavori> GetAll()
        {
            throw new NotImplementedException();
        }

        public ilanFavori GetByAdsUserId(int AdsId, int UserId)
        {
            var value = idc.ilanFavoris.Where(f => f.ilanId == AdsId && f.kullaniciId == UserId).FirstOrDefault();
            return value;
        }

        public List<Ilan> GetByUserId(int UserId, int Index)
        {
            var query = from i in idc.ilanFavoris.Where(i => i.ilan.silindiMi == false & i.kullaniciId == UserId)
                select new Ilan
                {
                    IlanId = i.ilanId,
                    Baslik = i.ilan.baslik,
                    Tarih = i.ilan.baslangicTarihi,
                    IlAdi = i.ilan.iller.ilAdi,
                    IlceAdi = i.ilan.ilceler.ilceAdi,
                    MahalleAdi = i.ilan.mahalleler.mahalleAdi,
                    FiyatNumeric = i.ilan.fiyat,
                    KategoriAdi = i.ilan.kategori.kategoriAdi,
                    EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilan.ilanTurId.ToString())),
                    FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.ilan.fiyatTurId.ToString())),
                    Resimler = i.ilan.resim,
                    Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.ilan.baslik),
                    Fiyat = String.Format(" {0:N0}", i.ilan.fiyat),
                    BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", i.ilan.baslangicTarihi)
                };

            query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (Index)).Take(pageCount);

            return query.ToList();
        }

        public void Update(ilanFavori entity)
        {
            throw new NotImplementedException();
        }
    }
}
