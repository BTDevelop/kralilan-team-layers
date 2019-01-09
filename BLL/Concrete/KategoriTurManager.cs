using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class KategoriTurManager : IKategoriTurService
    {
        private IKategoriTurlerDal _kategoriTurlerDal;
        public KategoriTurManager(IKategoriTurlerDal kategoriTurlerDal)
        {
            _kategoriTurlerDal = kategoriTurlerDal;
        }

        public void Add(kategoriTur entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(kategoriTur entity)
        {
            throw new NotImplementedException();
        }

        public kategoriTur Get(int Id)
        {
            return _kategoriTurlerDal.Get(Id);
        }

        public List<kategoriTur> GetAll()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<object> GetByCategoriId(int CategoriId)
        {
            return _kategoriTurlerDal.GetByCategoriId(CategoriId);
        }

        public string GetByCategoriIdStr(int CategoriId)
        {
            return _kategoriTurlerDal.GetByCategoriIdStr(CategoriId);
        }

        public IEnumerable<object> GetByCategoriTypeId(int CategoriId, int TypeId)
        {
            return _kategoriTurlerDal.GetByCategoriTypeId(CategoriId, TypeId);
        }

        public void Update(kategoriTur entity)
        {
            throw new NotImplementedException();
        }
    }
}
