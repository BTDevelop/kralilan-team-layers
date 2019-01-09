using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSMagazaKategorilerDal : IMagazaKategorilerDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(magazaKategori entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(magazaKategori entity)
        {
            throw new NotImplementedException();
        }

        public magazaKategori Get(int Id)
        {
            var value = idc.magazaKategoris.Where(q => q.magazaKategoriId == Id).FirstOrDefault();
            return value;
        }

        public magazaKategori Get(magazaKategori entity)
        {
            throw new NotImplementedException();
        }

        public List<magazaKategori> GetAll()
        {
            throw new NotImplementedException();
        }

        public magazaKategori GetByCategoriId(int CategoriId)
        {
            var value = idc.magazaKategoris.Where(q => q.magazaKategoriId == CategoriId).FirstOrDefault();
            return value;
        }

        public magazaKategori GetByPackageCategoriId(int CategoriId, int PackageTimeId, int StorePackageId)
        {
            var value = idc.magazaKategoris.Where(q =>
                    q.kategoriId == CategoriId & q.paketSureId == PackageTimeId & q.magazaPaketId == StorePackageId)
                .FirstOrDefault();
            return value;
        }

        public void Update(magazaKategori entity)
        {
            var value = idc.magazaKategoris.Where(q => q.magazaKategoriId == entity.magazaKategoriId).FirstOrDefault();
            if (value != null)
            {
                value.fiyat = entity.fiyat;
                idc.SubmitChanges();
            }
        }
    }
}
