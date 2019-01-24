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
    public class KullaniciManager : IKullaniciService
    {
        private IKullanicilarDal _kullanicilarDal;
        public KullaniciManager(IKullanicilarDal kullanicilarDal)
        {
            _kullanicilarDal = kullanicilarDal;
        }

        public void Add(kullanici entity)
        {
            _kullanicilarDal.Add(entity);
        }

        public void Delete(kullanici entity)
        {
            throw new NotImplementedException();
        }

        public kullanici Get(int Id)
        {
            return _kullanicilarDal.Get(Id);
        }

        public List<kullanici> GetAll()
        {
            throw new NotImplementedException();
        }

        public IQueryable GetAllLast()
        {
            throw new NotImplementedException();
        }

        public kullanici GetByEmail(string Email)
        {
            return _kullanicilarDal.GetByEmail(Email);
        }

        public kullanici GetLast()
        {
            return _kullanicilarDal.GetLast();
        }

        public IQueryable GetOnline()
        {
            throw new NotImplementedException();
        }

        public bool IsDuplicate(string Email, string Phone)
        {
            return _kullanicilarDal.IsDuplicate(Email, Phone);
        }

        public void Update(kullanici entity)
        {
            _kullanicilarDal.Update(entity);
        }

        public void UpdateByEmail(int UserId, string Email)
        {
            _kullanicilarDal.UpdateByEmail(UserId, Email);
        }

        public void UpdateByManager(kullanici entity)
        {
            _kullanicilarDal.UpdateByManager(entity);
        }

        public void UpdateByOnlineStatus(int UserId, int SessionTime)
        {
            _kullanicilarDal.UpdateByOnlineStatus(UserId, SessionTime);
        }

        public void UpdateByPassword(int UserId, string Password)
        {
            _kullanicilarDal.UpdateByPassword(UserId, Password);
        }

        public void UpdateBySessionInfo(int UserId, string Browser, string IPAddress)
        {
            _kullanicilarDal.UpdateBySessionInfo(UserId, Browser, IPAddress);
        }
    }
}
