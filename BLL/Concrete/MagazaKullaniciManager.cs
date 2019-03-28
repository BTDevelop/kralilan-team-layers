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
    public class MagazaKullaniciManager : IMagazaKullaniciService
    {
        private IMagazaKullanicilarDal _magazaKullanicilarDal;

        public MagazaKullaniciManager(IMagazaKullanicilarDal magazaKullanicilarDal)
        {
            _magazaKullanicilarDal = magazaKullanicilarDal;
        }

        public void Add(magazaKullanici entity)
        {
            _magazaKullanicilarDal.Add(entity);
        }

        public int Count(int StoreId)
        {
            return _magazaKullanicilarDal.Count(StoreId);
        }

        public void Delete(magazaKullanici entity)
        {
           _magazaKullanicilarDal.Delete(entity);
        }

        public magazaKullanici Get(int Id)
        {
            return _magazaKullanicilarDal.Get(Id);
        }

        public List<magazaKullanici> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<MagazaKullanici> GetByStoreId(int StoreId)
        {
            return _magazaKullanicilarDal.GetByStoreId(StoreId);
        }

        public magazaKullanici GetByUserId(int UserId)
        {
            return _magazaKullanicilarDal.GetByUserId(UserId);
        }

        public void Update(magazaKullanici entity)
        {
            throw new NotImplementedException();
        }
    }
}
