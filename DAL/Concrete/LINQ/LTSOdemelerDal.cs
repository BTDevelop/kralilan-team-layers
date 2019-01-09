using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using DAL.Enums;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSOdemelerDal : IOdemelerDal
    {
        private ilanDataContext idc= new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10;
        public void Add(odeme entity)
        {
            odeme odeme = new odeme();
            odeme.kullaniciId = entity.kullaniciId;
            if (entity.odemeTutar != -1) odeme.odemeTutar = entity.odemeTutar;
            if (entity.islemId != -1) odeme.islemId = entity.islemId;
            if (entity.odemeTipId != -1) odeme.odemeTipId = entity.odemeTipId;
            odeme.tarih = DateTime.Now;
            if (!String.IsNullOrEmpty(entity.kartNo)) odeme.kartNo = entity.kartNo;
            odeme.basariliMi = entity.basariliMi;
            odeme.siparis = entity.siparis;
            idc.odemes.InsertOnSubmit(odeme);
            idc.SubmitChanges();
        }

        public void Delete(odeme entity)
        {
            var value = idc.odemes.Where(q => q.odemeId == entity.odemeId).FirstOrDefault();
            if (value != null)
            {
                idc.odemes.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public odeme Get(int Id)
        {
            var value = idc.odemes.Where(x => x.odemeId == Id).FirstOrDefault();
            return value;
        }

        public odeme Get(odeme entity)
        {
            throw new NotImplementedException();
        }

        public List<odeme> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Odeme> GetByUserId(int UserId)
        {
            var query = from o in idc.odemes.Where(x => x.kullaniciId == UserId)
                select new Odeme
                {
                    OdemeId = Convert.ToInt32(o.odemeTipId),
                    Tutar = Convert.ToDouble(o.odemeTutar),
                    Tarih = o.tarih,
                    YapanAdSoyad = o.kullanici.kullaniciAdSoyad,
                    OdemeKartNo = o.kartNo,
                    OdemeDurum = o.basariliMi == true ? "Başarılı": "Başarısız",
                    OdemeTip = Enums.Enums.GetDescription((PaymentTypeString)Enum.Parse(typeof(PaymentTypeString), o.odemeTipId.ToString())),
                    SiparisTip = Enums.Enums.GetDescription((PaymentOrderTypeString)Enum.Parse(typeof(PaymentOrderTypeString), o.islemId.ToString()))
                };

            //if (_inOrderType != -1) query = query.Where(x => x.islemId == _inOrderType);

            query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);
            return query.ToList();
        }

        public odeme GetLast()
        {
            var value = idc.odemes.OrderByDescending(x => x.odemeId).First();
            return value;
        }

        public void Update(odeme entity)
        {
            var value = idc.odemes.Where(q => q.odemeId == entity.odemeId).FirstOrDefault();
            if (value != null)
            {
                value.basariliMi = true;
                idc.SubmitChanges();
            }
        }
    }
}
