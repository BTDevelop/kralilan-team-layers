using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSKullaniciTakipcilerDal : IKullaniciTakipcilerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(kullaniciTakip entity)
        {
            kullaniciTakip kullaniciTakip = new kullaniciTakip();
            kullaniciTakip.kullaniciId = entity.kullaniciId;
            kullaniciTakip.takipciId = entity.takipciId;
            idc.kullaniciTakips.InsertOnSubmit(kullaniciTakip);
            idc.SubmitChanges();
        }

        public int CountFollowed(int Id)
        {
            return idc.kullaniciTakips.Count(i => i.takipciId == Id && i.kullanici.silindiMi == false);
        }

        public int CountFollower(int Id)
        {
            return idc.kullaniciTakips.Count(i => i.kullaniciId == Id && i.kullanici.silindiMi == false);
        }

        public void Delete(kullaniciTakip entity)
        {
            var value = idc.kullaniciTakips.Where(q => q.kullaniciId == entity.kullaniciId & q.takipciId == entity.takipciId).FirstOrDefault();
            if (value != null)
            {
                idc.kullaniciTakips.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public kullaniciTakip Get(int Id)
        {
            throw new NotImplementedException();
        }

        public kullaniciTakip Get(kullaniciTakip entity)
        {
            throw new NotImplementedException();
        }

        public List<kullaniciTakip> GetAll()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<object> GetFollowed(int Id)
        {
            var query = from t in idc.kullaniciTakips.Where(t => t.kullaniciId == Id && t.kullanici.silindiMi == false)
                select new
                {
                    t.kullanici.kullaniciId,
                    t.kullanici.profilResim
                };
            return query.ToList();
        }

        public IEnumerable<object> GetFollower(int Id)
        {
            var query = from t in idc.kullaniciTakips.Where(t => t.takipciId == Id && t.kullanici.silindiMi == false)
                select new
                {
                    t.kullanici.kullaniciId,
                    t.kullanici.profilResim
                };
            return query.ToList();
        }

        public kullaniciTakip GetUserFollowerId(int UserId, int FollowerId)
        {
            var value = idc.kullaniciTakips.Where(t => t.kullaniciId == UserId & t.takipciId == FollowerId).FirstOrDefault();
            return value;
        }

        public void Update(kullaniciTakip entity)
        {
            throw new NotImplementedException();
        }
    }
}
