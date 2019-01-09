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
    public class MagazaTakipciManager : IMagazaTakipciService
    {
        private IMagazaTakipcilerDal _magazaTakipcilerDal;

        public MagazaTakipciManager(IMagazaTakipcilerDal magazaTakipcilerDal)
        {
            _magazaTakipcilerDal = magazaTakipcilerDal;
        }

        public void Add(magazaTakip entity)
        {
            _magazaTakipcilerDal.Add(entity);
        }

        public int CountByStoreId(int StoreId)
        {
            return _magazaTakipcilerDal.CountByStoreId(StoreId);
        }

        public int CountByUserId(int UserId)
        {
            return _magazaTakipcilerDal.CountByUserId(UserId);
        }

        public void Delete(magazaTakip entity)
        {
            _magazaTakipcilerDal.Delete(entity);
        }

        public magazaTakip Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<magazaTakip> GetAll()
        {
            throw new NotImplementedException();
        }

        public magazaTakip GetStoreUserId(int StoreId, int UserId)
        {;
            return _magazaTakipcilerDal.GetStoreUserId(StoreId, UserId);
        }

        public void Update(magazaTakip entity)
        {
            throw new NotImplementedException();
        }
    }
}
