using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSMagazaKullanicilarDal : IMagazaKullanicilarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(magazaKullanici entity)
        {
            magazaKullanici magazaKullanici = new magazaKullanici();
            magazaKullanici.magazaId = entity.magazaId;
            magazaKullanici.kullaniciId = entity.kullaniciId;
            magazaKullanici.rol = entity.rol;
            idc.magazaKullanicis.InsertOnSubmit(magazaKullanici);
            idc.SubmitChanges();
        }

        public int Count(int StoreId)
        {
            var count = idc.magazaKullanicis.Where(mk => mk.magazaId == StoreId).Count();
            return count;
        }

        public void Delete(magazaKullanici entity)
        {
            var value = idc.magazaKullanicis
                .Where(q => q.magazaId == entity.magazaId & q.kullaniciId == entity.kullaniciId).FirstOrDefault();
            if (value != null)
            {
                idc.magazaKullanicis.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public magazaKullanici Get(int Id)
        {
            var value = idc.magazaKullanicis.Where(q => q.kullaniciId == Id).FirstOrDefault();
            return value;
        }

        public magazaKullanici Get(magazaKullanici entity)
        {
            throw new NotImplementedException();
        }

        public List<magazaKullanici> GetAll()
        {
            throw new NotImplementedException();
        }

        public IQueryable GetAllByStoreId(int StoreId)
        {
            var query = from i in idc.magazaKullanicis.Where(i => i.magazaId == StoreId && i.magaza.pasifMi == false && i.magaza.silindiMi == false)
                select new
                {
                    i.kullanici.kullaniciId,
                    i.kullanici.kullaniciAdSoyad,
                    i.kullanici.profilResim,
                    i.rol,
                    kullaniciFormat = i.kullanici.kullaniciAdSoyad
                };

            return query;
        }

        public List<MagazaKullanici> GetByStoreId(int StoreId)
        {
            var query = from mk in idc.magazaKullanicis.Where(mk => mk.magazaId == StoreId && mk.kullanici.silindiMi == false)
                select new MagazaKullanici
                {
                   KullaniciId = mk.kullanici.kullaniciId,
                   KullaniciAdSoyad = mk.kullanici.kullaniciAdSoyad
                };

            return query.ToList();
        }

        public magazaKullanici GetByUserId(int UserId)
        {
            var value = idc.magazaKullanicis.Where(q => q.kullaniciId == UserId && q.kullanici.silindiMi == false && q.magaza.silindiMi == false && q.magaza.onay == true && q.magaza.pasifMi == false).FirstOrDefault();
            return value;
        }

        public void Update(magazaKullanici entity)
        {
            throw new NotImplementedException();
        }
    }
}
