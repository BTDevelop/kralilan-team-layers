using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSMagazaTakipcilerDal : IMagazaTakipcilerDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(magazaTakip entity)
        {
            magazaTakip magazaTakip = new magazaTakip();
            magazaTakip.kullaniciId = entity.kullaniciId;
            magazaTakip.magazaId = entity.magazaId;
            idc.magazaTakips.InsertOnSubmit(magazaTakip);
            idc.SubmitChanges();
        }

        public int CountByStoreId(int StoreId)
        {
            return idc.magazaTakips.Count(i => i.magazaId == StoreId & i.kullanici.silindiMi == false);
        }

        public int CountByUserId(int UserId)
        {
            return idc.magazaTakips.Count(i => i.kullaniciId == UserId && i.magaza.onay == true && i.magaza.silindiMi == false);
        }

        public void Delete(magazaTakip entity)
        {
            var value = idc.magazaTakips.Where(q => q.magazaId == entity.magazaId & q.kullaniciId == entity.kullaniciId).FirstOrDefault();
            if (value != null)
            {
                idc.magazaTakips.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public magazaTakip Get(int Id)
        {
            throw new NotImplementedException();
        }

        public magazaTakip Get(magazaTakip entity)
        {
            throw new NotImplementedException();
        }

        public List<magazaTakip> GetAll()
        {
            throw new NotImplementedException();
        }

        public magazaTakip GetStoreUserId(int StoreId, int UserId)
        {
            return idc.magazaTakips.Where(f => f.kullaniciId == UserId & f.magazaId == StoreId).FirstOrDefault();
        }

        public void Update(magazaTakip entity)
        {
            throw new NotImplementedException();
        }
    }
}
