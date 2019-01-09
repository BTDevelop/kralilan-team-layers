using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSDopingKategorilerDal : IDopingKategorilerDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(dopingKategori entity)
        {
            dopingKategori dopingKategori = new dopingKategori();
            dopingKategori.kategoriId = entity.kategoriId;
            dopingKategori.dopingId = entity.dopingId;
            dopingKategori.dopingSureId = entity.dopingSureId;
            dopingKategori.fiyat = entity.fiyat;
            idc.dopingKategoris.InsertOnSubmit(dopingKategori);
            idc.SubmitChanges();
        }

        public void Delete(dopingKategori entity)
        {
            throw new NotImplementedException();
        }

        public dopingKategori Get(int Id)
        {
            var value = idc.dopingKategoris.Where(q => q.dopingKategoriId == Id).FirstOrDefault();
            return value;
        }

        public dopingKategori Get(dopingKategori entity)
        {
            throw new NotImplementedException();
        }

        public List<dopingKategori> GetAll()
        {
            throw new NotImplementedException();
        }

        public IQueryable GetByDopingKategoriId(int DopingId, int KategoriId)
        {

            var query = from dk in idc.dopingKategoris.Where(d => d.kategoriId == KategoriId && d.dopingId == DopingId)
                        select new
                        {
                            dk.dopingKategoriId,
                            dopingFiyat = String.Format("{0} Haftalık ({1} TL)", dk.dopingSureId, dk.fiyat)
                        };

            return query;
        }

        public void Update(dopingKategori entity)
        {
            var value = idc.dopingKategoris.Where(q => q.dopingKategoriId == entity.dopingKategoriId).FirstOrDefault();
            if (value != null)
            {
                value.fiyat = entity.fiyat;
                idc.SubmitChanges();
            }
        }
    }
}
