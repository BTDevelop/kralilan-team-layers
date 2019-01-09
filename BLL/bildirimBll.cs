using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Newtonsoft.Json;
using BLL.Formatter;

namespace BLL
{
    public class bildirimBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();
        //public enum NotiStatus
        //{
        //    receiverDeleted = 1,
        //    isItRead = 3
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        ///// <summary>
        ///// ekle
        ///// </summary>
        ///// <param name="_into"></param>
        ///// <param name="_insubject"></param>
        ///// <param name="_inmessage"></param>
        //public void insert(int _inTo, string _inSubject, string _inMessage)
        //{

        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        bildirimler bildirim = new bildirimler();
        //        bildirim.kimeId = _inTo;
        //        bildirim.konu = _inSubject;
        //        bildirim.mesaj = _inMessage;
        //        idc.bildirimlers.InsertOnSubmit(bildirim);
        //        idc.SubmitChanges();
        //    }

        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_inopt"></param>
        /// <param name="_id"></param>
        //public void update(int _inNotiId, int _inOpt)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.bildirimlers.Where(q => q.bildirimId == _inNotiId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            if (_inOpt == (int)NotiStatus.receiverDeleted)
        //            {
        //                value.aliciSildiMi = true;
        //                idc.SubmitChanges();
        //            }
        //            else if (_inOpt == (int)NotiStatus.isItRead)
        //            {
        //                value.okunduMu = true;
        //                idc.SubmitChanges();
        //            }
        //        }
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public bildirimler search(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.bildirimlers.Where(q => q.bildirimId == _id).FirstOrDefault();
        //        return value;
        //    }
        //}
        /// <summary>
        /// listele
        /// </summary>
        /// <param name="_index"></param>
        /// <param name="_count"></param>
        /// <param name="_inuserid"></param>
        /// <returns></returns>
        public string select(int _index, int _inCount, int _inUserId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from b in idc.bildirimlers.Where(i => i.aliciSildiMi == false && i.kimeId == _inUserId)
                            select new
                            {
                                b.bildirimId,
                                b.okunduMu,
                                b.tarih,
                                b.mesaj,
                                b.konu
                            };


                query = query.OrderByDescending(x => x.tarih).Skip(_inCount * (_index)).Take(_inCount);

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }
        /// <summary>
        /// sayısını döndür
        /// </summary>
        /// <param name="_intoid"></param>
        /// <returns></returns>
        //public int count(int _inToId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = idc.bildirimlers.Where(b => b.kimeId == _inToId && b.aliciSildiMi == false && b.okunduMu == false);
        //        return query.Count();
        //    }
        //}
    }
}
