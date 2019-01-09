using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BLL.Formatter;

namespace BLL
{
    public class mesajBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();

        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        ///// <summary>
        ///// ekle
        ///// </summary>
        ///// <param name="_intoid"></param>
        ///// <param name="_infrmid"></param>
        ///// <param name="_innumber"></param>
        ///// <param name="_inmessage"></param>
        //public void insert(int _inToId, int _inUserId, int _inNumber, string _inMessage)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        mesajlar mesaj = new mesajlar();
        //        mesaj.kimeId = _inToId;
        //        mesaj.kullaniciId = _inUserId;
        //        if (_inNumber != -1) mesaj.ilanId = _inNumber;
        //        mesaj.mesaj = _inMessage;
        //        mesaj.tarih = DateTime.Now;
        //        mesaj.okunduMu = false;
        //        mesaj.aliciSildiMi = false;
        //        mesaj.gonderenSildiMi = false;
        //        idc.mesajlars.InsertOnSubmit(mesaj);
        //        idc.SubmitChanges();
        //    }
        //}
        ///// <summary>
        ///// ara
        ///// </summary>
        ///// <param name="_id"></param>
        ///// <returns></returns>
        //public mesajlar search(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.mesajlars.Where(q => q.mesajId == _id).FirstOrDefault();
        //        return value;
        //    }
        //}

        //public void update(int _inOpt, int _inType, int _inUserId, int _inFromId,  int _inAdsId, int _inMessageId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        if (_inOpt == 1)
        //        {
        //            var value = idc.mesajlars.Where(q => q.mesajId == _inMessageId).FirstOrDefault();
        //            if (value != null)
        //            {
        //                if (_inType == 1)
        //                {
        //                    value.aliciSildiMi = true;
        //                    idc.SubmitChanges();
        //                }
        //                else if (_inType == 2)
        //                {
        //                    value.gonderenSildiMi = true;
        //                    idc.SubmitChanges();
        //                }
        //                else
        //                {
        //                    value.okunduMu = true;
        //                    idc.SubmitChanges();
        //                }
        //            }
        //        }
        //        else if (_inOpt == 2)
        //        {
        //            var value = idc.mesajlars.Where(q => q.kimeId == _inFromId && q.kullaniciId == _inUserId && q.ilanId == _inAdsId).ToList();
        //            value.ForEach(f => f.aliciSildiMi = true);
        //            idc.SubmitChanges();
        //        }
        //        else
        //        {
        //            var value = idc.mesajlars.Where(q => q.kimeId == _inFromId & q.kullaniciId == _inUserId & q.ilanId == _inAdsId).ToList();
        //            value.ForEach(f => f.gonderenSildiMi = true);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        //public string select(int _index, int _inCount, int _inFirstId, int _inSecondId, int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from m in idc.mesajlars.Where(m => ((m.kullaniciId == _inFirstId & m.kimeId == _inSecondId) | (m.kullaniciId == _inSecondId & m.kimeId == _inFirstId)) & m.ilanId == _inAdsId)
        //                    select new
        //                    {
        //                        m.mesajId,
        //                        m.kullaniciId,
        //                        m.kimeId,
        //                        m.mesaj,
        //                        m.kullanici.kullaniciAdSoyad,
        //                        m.kullanici.profilResim,
        //                        m.tarih
        //                    };
        //        query = query.OrderBy(x => x.mesajId).Skip(_inCount * (_index)).Take(_inCount);

        //        JsonFormat jsonFormat = new JsonFormat();
        //        formatter.FormatTo(jsonFormat);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }

        //}

        //public int count(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {

        //        var query = from k in idc.kullanicis
        //                    join m in idc.mesajlars.Where(m => m.kimeId == _inUserId && m.okunduMu == false & m.aliciSildiMi == false)
        //                    on k.kullaniciId equals m.kullaniciId
        //                    select new
        //                    {
        //                        m.mesajId,
        //                    };

        //        return query.Count();
        //    }
        //}

        //public void updateReadMessages(int _inFirstId, int _inSecondId, int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.mesajlars.Where(q => q.kimeId == _inFirstId && q.kullaniciId == _inSecondId && q.ilanId == _inAdsId && q.okunduMu == false).ToList();
        //        if (value != null)
        //        {
        //            value.ForEach(x => x.okunduMu = true);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

    }
}
