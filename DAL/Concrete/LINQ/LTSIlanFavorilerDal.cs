using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSIlanFavorilerDal : IIlanFavorilerDal
    {
        private ilanDataContext idc = new ilanDataContext();

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

        public IQueryable GetByUserId(int UserId)
        {
            var query = from i in idc.ilanFavoris.Where(i => i.ilan.silindiMi == false & i.kullaniciId == UserId)
                select new
                {
                    i.ilanId,
                    i.ilan.baslik,
                    i.ilan.baslangicTarihi,
                    i.ilan.iller.ilAdi,
                    i.ilan.ilceler.ilceAdi,
                    i.ilan.mahalleler.mahalleAdi,
                    i.ilan.fiyat,
                    i.ilan.kategori.kategoriAdi,
                    ilanTur = i.ilan.ilanTurId.ToString(),
                    fiyatTur =  i.ilan.fiyatTurId.ToString(),
                    i.ilan.resim,
                    i.ilan.satildiMi,
                    baslikFormat = i.ilan.baslik,
                    fiyatFormat = String.Format(" {0:N0}", i.ilan.fiyat),
                    tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.ilan.baslangicTarihi),
                };

            return query;
        }

        public void Update(ilanFavori entity)
        {
            throw new NotImplementedException();
        }
    }
}
