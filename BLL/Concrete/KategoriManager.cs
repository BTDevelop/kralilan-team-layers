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
    public class KategoriManager : IKategoriService
    {
        private IKategorilerDal _kategorilerDal;
        public KategoriManager(IKategorilerDal kategorilerDal)
        {
            _kategorilerDal = kategorilerDal;
        }

        public void Add(kategori entity)
        {
            _kategorilerDal.Add(entity);
        }

        public void Delete(kategori entity)
        {
            throw new NotImplementedException();
        }

        public kategori Get(int Id)
        {
            return _kategorilerDal.Get(Id);
        }

        public List<kategori> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<kategori> GetAllByCategoriId(int CategoriId)
        {
            return _kategorilerDal.GetAllByCategoriId(CategoriId);
        }

        public void Update(kategori entity)
        {
            _kategorilerDal.Update(entity);
        }
    }
}
