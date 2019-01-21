using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class DopingKategoriManager : IDopingKategoriService
    {
        private IDopingKategorilerDal _dopingKategorilerDal;
        public DopingKategoriManager(IDopingKategorilerDal dopingKategorilerDal)
        {
            _dopingKategorilerDal = dopingKategorilerDal;
        }

        public void Add(dopingKategori entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(dopingKategori entity)
        {
            throw new NotImplementedException();
        }

        public dopingKategori Get(int Id)
        {
            return _dopingKategorilerDal.Get(Id);
        }

        public List<dopingKategori> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<DopingKategori> GetByDopingKategoriId(int DopingId, int KategoriId)
        {
            return _dopingKategorilerDal.GetByDopingKategoriId(DopingId, KategoriId);
        }

        public void Update(dopingKategori entity)
        {
            _dopingKategorilerDal.Update(entity);
        }
    }
}
