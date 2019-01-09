using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSBildirimlerDal : IBildirimlerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10;
        public void Add(bildirimler entity)
        {
            bildirimler bildirim = new bildirimler();
            bildirim.kimeId = entity.kimeId;
            bildirim.konu = entity.konu;
            bildirim.mesaj = entity.mesaj;
            idc.bildirimlers.InsertOnSubmit(bildirim);
            idc.SubmitChanges();
        }

        public void Delete(bildirimler entity)
        {
            throw new NotImplementedException();
        }

        public List<bildirimler> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(bildirimler entity)
        {
            throw new NotImplementedException();
        }

        public int Count(int toId)
        {
            var query = idc.bildirimlers.Where(b => b.kimeId == toId && b.aliciSildiMi == false && b.okunduMu == false);
            return query.Count();
        }

        public bildirimler Get(int Id)
        {
            var value = idc.bildirimlers.Where(q => q.bildirimId == Id).FirstOrDefault();
            return value;
        }

        public IQueryable GetByUserId(int UserId)
        {
            var query = from b in idc.bildirimlers.Where(i => i.aliciSildiMi == false && i.kimeId == UserId)
                        select new
                        {
                            b.bildirimId,
                            b.okunduMu,
                            b.tarih,
                            b.mesaj,
                            b.konu
                        };


            query = query.OrderByDescending(x => x.tarih).Skip(pageCount * (pageIndex)).Take(pageCount);
            return query;
        }

        public void UpdateByReceiver(int Id)
        {
            var value = idc.bildirimlers.Where(q => q.bildirimId == Id).FirstOrDefault();
            if (value != null)
            {
                value.aliciSildiMi = true;
                idc.SubmitChanges();
            }
        }

        public void UpdateByRead(int Id)
        {
            var value = idc.bildirimlers.Where(q => q.bildirimId == Id).FirstOrDefault();
            if (value != null)
            {
                value.okunduMu = true;
                idc.SubmitChanges();
            }
        }
    }
}
