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
    public class MagazaTelefonManager : IMagazaTelefonService
    {
        private IMagazaTelefonlarDal _magazaTelefonlarDal;

        public MagazaTelefonManager(IMagazaTelefonlarDal magazaTelefonlarDal)
        {
            _magazaTelefonlarDal = magazaTelefonlarDal;
        }
        public void Add(magazaTelefon entity)
        {
            _magazaTelefonlarDal.Add(entity);
        }

        public void Delete(magazaTelefon entity)
        {
            _magazaTelefonlarDal.Delete(entity);
        }

        public magazaTelefon Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<magazaTelefon> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<magazaTelefon> GetAllByStoreId(int StoreId)
        {
            return _magazaTelefonlarDal.GetAllByStoreId(StoreId);
        }

        public magazaTelefon GetStoreTypeId(int StoreId, int Type)
        {
            return _magazaTelefonlarDal.GetStoreTypeId(StoreId, Type);
        }

        public void Update(magazaTelefon entity)
        {
            _magazaTelefonlarDal.Update(entity);
        }
    }
}
