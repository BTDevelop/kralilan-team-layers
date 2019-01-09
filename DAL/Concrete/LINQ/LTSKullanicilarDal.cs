using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSKullanicilarDal : IKullanicilarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10;
        public void Add(kullanici entity)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                kullanici kullanici = new kullanici();
                kullanici.kullaniciAdSoyad = entity.kullaniciAdSoyad;
                kullanici.sifre = entity.sifre;
                kullanici.email = entity.email;
                kullanici.rol = entity.rol;
                kullanici.silindiMi = false;
                idc.kullanicis.InsertOnSubmit(kullanici);
                idc.SubmitChanges();
            }
        }

        public void Delete(kullanici entity)
        {
            throw new NotImplementedException();
        }

        public kullanici Get(int Id)
        {
            var value = idc.kullanicis.Where(q => q.kullaniciId == Id && q.silindiMi == false).FirstOrDefault();
            return value;
        }

        public kullanici Get(kullanici entity)
        {
            throw new NotImplementedException();
        }

        public List<kullanici> GetAll()
        {
            throw new NotImplementedException();
        }

        public IQueryable GetAllLast()
        {
            var query = from i in idc.kullanicis.Where(k => k.silindiMi == false && k.rol == 4)
                        select new
                        {
                            i.kullaniciId,
                            i.kullaniciAdSoyad,
                            i.telefonlars.Where(t => t.telefonTur == 1).FirstOrDefault().telefon,
                            i.email,
                            i.sonGirisTarihi,
                            tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.sonGirisTarihi)
                        };
            query = query.OrderByDescending(x => x.kullaniciId).Skip(pageCount * (pageIndex)).Take(pageCount);

            return query;
        }

        public kullanici GetByEmail(string Email)
        {
            return idc.kullanicis.Where(q => q.email == Email && q.silindiMi == false).FirstOrDefault();

        }

        public kullanici GetLast()
        {
            var value = idc.kullanicis.OrderByDescending(x => x.kullaniciId).First();
            return value;
        }

        public IQueryable GetOnline()
        {
            var query = from k in idc.kullanicis.Where(k => k.silindiMi == false && DateTime.Compare(Convert.ToDateTime(k.online), DateTime.Now) > 0)
                        select new
                        {
                            k.kullaniciId,
                            k.kullaniciAdSoyad,
                            k.sonGirisTarihi,
                            k.ipAdres,
                            k.online,
                            cevrimIci = k.online.Value.AddMinutes(-10)
                        };

            query = query.OrderByDescending(x => x.sonGirisTarihi).OrderBy(x => x.kullaniciId).Skip(pageCount * (pageIndex)).Take(pageCount);


            return query;
        }

        public bool IsDuplicate(string Email, string Phone)
        {
            telefonlar telefon = idc.telefonlars.Where(q => q.telefon == Phone).FirstOrDefault();
            kullanici kullanici = idc.kullanicis.Where(q => q.email == Email).FirstOrDefault();

            if (telefon != null || kullanici != null) return false;
            else return true;
        }

        public void Update(kullanici entity)
        {
            var value = idc.kullanicis.Where(q => q.kullaniciId == entity.kullaniciId).FirstOrDefault();
            if (value != null)
            {
                if (!String.IsNullOrEmpty(entity.kullaniciAdSoyad)) value.kullaniciAdSoyad = entity.kullaniciAdSoyad;
                if (entity.ilId != -1) value.ilId = entity.ilId;
                if (entity.ilceId != -1) value.ilceId = entity.ilceId;
                if (entity.mahalleId != -1) value.mahalleId = entity.mahalleId;
                if (!String.IsNullOrEmpty(entity.tckimlikNo)) value.tckimlikNo = entity.tckimlikNo;
                if (entity.egitimDurumuId != -1) value.egitimDurumuId = entity.egitimDurumuId;
                value.cinsiyetId = Convert.ToBoolean(entity.cinsiyetId);
                value.dogumTarihi = Convert.ToDateTime(entity.dogumTarihi);
                if (!String.IsNullOrEmpty(entity.profilResim)) value.profilResim = entity.profilResim;
                idc.SubmitChanges();
            }
        }

        public void UpdateByEmail(int UserId, string Email)
        {
            var value = idc.kullanicis.Where(q => q.kullaniciId == UserId).FirstOrDefault();
            if (value != null)
            {
                value.email = Email;
                idc.SubmitChanges();
            }
        }

        public void UpdateByManager(kullanici entity)
        {
            var value = idc.kullanicis.Where(q => q.kullaniciId == entity.kullaniciId).FirstOrDefault();
            if (value != null)
            {
                if (!String.IsNullOrEmpty(entity.kullaniciAdSoyad)) value.kullaniciAdSoyad = entity.kullaniciAdSoyad;
                if (!String.IsNullOrEmpty(entity.sifre)) value.sifre = entity.sifre;
                if (!String.IsNullOrEmpty(entity.email)) value.email = entity.email;
                value.rol = entity.rol;
                value.silindiMi = entity.silindiMi;
                idc.SubmitChanges();
            }
        }

        public void UpdateByOnlineStatus(int UserId, int SessionTime)
        {

            var value = idc.kullanicis.Where(q => q.kullaniciId == UserId).FirstOrDefault();
            if (value != null)
            {
                value.online = DateTime.Now.AddMinutes(SessionTime);
                idc.SubmitChanges();
            }
        }

        public void UpdateByPassword(int UserId, string Password)
        {
            var value = idc.kullanicis.Where(q => q.kullaniciId == UserId).FirstOrDefault();
            if (value != null)
            {
                value.sifre = Password;
                idc.SubmitChanges();
            }
        }

        public void UpdateBySessionInfo(int UserId, string Browser, string IPAddress)
        {
            var value = idc.kullanicis.Where(q => q.kullaniciId == UserId).FirstOrDefault();
            if (value != null)
            {
                value.tarayici = Browser;
                value.sonGirisTarihi = DateTime.Now;
                value.ipAdres = IPAddress;
                idc.SubmitChanges();
            }
        }
    }
}
