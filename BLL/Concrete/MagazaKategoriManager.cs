using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class MagazaKategoriManager : IMagazaKategoriService
    {
        private IMagazaKategorilerDal _magazaKategorilerDal;
        public MagazaKategoriManager(IMagazaKategorilerDal magazaKategorilerDal)
        {
            _magazaKategorilerDal = magazaKategorilerDal;
        }

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
            throw new NotImplementedException();
        }

        public List<magazaKategori> GetAll()
        {
            throw new NotImplementedException();
        }

        public magazaKategori GetByCategoriId(int CategoriId)
        {
            return _magazaKategorilerDal.GetByCategoriId(CategoriId);
        }

        public magazaKategori GetByPackageCategoriId(int CategoriId, int PackageTimeId, int StorePackageId)
        {
            return _magazaKategorilerDal.GetByPackageCategoriId(CategoriId, PackageTimeId, StorePackageId);
        }

        public void Update(magazaKategori entity)
        {
            throw new NotImplementedException();
        }
    }
}
