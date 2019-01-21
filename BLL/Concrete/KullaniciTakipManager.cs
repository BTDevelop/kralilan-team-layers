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
    public class KullaniciTakipManager : IKullaniciTakipService
    {
        private IKullaniciTakipcilerDal _kullaniciTakipcilerDal;
        public KullaniciTakipManager(IKullaniciTakipcilerDal kullaniciTakipcilerDal)
        {
            _kullaniciTakipcilerDal = kullaniciTakipcilerDal;
        }
        public void Add(kullaniciTakip entity)
        {
            _kullaniciTakipcilerDal.Add(entity);
        }

        public int CountFollowed(int Id)
        {
            return _kullaniciTakipcilerDal.CountFollowed(Id);
;        }

        public int CountFollower(int Id)
        {
            return _kullaniciTakipcilerDal.CountFollower(Id);
        }

        public void Delete(kullaniciTakip entity)
        {
            _kullaniciTakipcilerDal.Delete(entity);
        }

        public kullaniciTakip Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<kullaniciTakip> GetAll()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<object> GetFollowed(int Id)
        {
            return _kullaniciTakipcilerDal.GetFollowed(Id);
        }

        public IEnumerable<object> GetFollower(int Id)
        {
            return _kullaniciTakipcilerDal.GetFollower(Id);
        }

        public kullaniciTakip GetUserFollowerId(int UserId, int FollowerId)
        {
            return _kullaniciTakipcilerDal.GetUserFollowerId(UserId, FollowerId);
        }

        public void Update(kullaniciTakip entity)
        {
            throw new NotImplementedException();
        }
    }
}
