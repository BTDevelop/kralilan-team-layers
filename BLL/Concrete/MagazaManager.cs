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
    public class MagazaManager : IMagazaService
    {
        private IMagazalarDal _magazalarDal;
        public MagazaManager(IMagazalarDal magazalarDal)
        {
            _magazalarDal = magazalarDal;
        }

        public void Add(magaza entity)
        {
            _magazalarDal.Add(entity);
        }

        public void Delete(magaza entity)
        {
            throw new NotImplementedException();
        }

        public magaza Get(int Id)
        {
            return _magazalarDal.Get(Id);
        }

        public List<magaza> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Magaza> GetAllByStoreCategori(int StoreCategori)
        {
            throw new NotImplementedException();
        }

        public magaza GetLast()
        {
            return _magazalarDal.GetLast();
        }

        public void Update(magaza entity)
        {
            throw new NotImplementedException();
        }

        public void UpdateManager(magaza entity)
        {
            _magazalarDal.UpdateManager(entity);
        }

        public void UpdateStatus(int StoreId, bool Status, bool Deleted)
        {
            throw new NotImplementedException();
        }
    }
}
