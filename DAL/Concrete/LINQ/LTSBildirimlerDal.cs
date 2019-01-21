using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

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

        public List<Bildirim> GetByUserId(int UserId, int Index)
        {
            var query = from b in idc.bildirimlers.Where(i => i.aliciSildiMi == false && i.kimeId == UserId)
                        select new Bildirim
                        {
                           Id = b.bildirimId,
                           Tarih = b.tarih,
                           Mesaj = b.mesaj,
                           Konu = b.konu,
                           BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", b.tarih),
                        };


            query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (Index)).Take(pageCount);
            return query.ToList();
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
