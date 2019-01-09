using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Newtonsoft.Json;
using BLL.ExternalClass;
using BLL.Formatter;
using BLL.EnumHelper;

namespace BLL
{
    public class odemeBll
    {

        Formatter.Formatter formatter = new Formatter.Formatter();
        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.odemes.Where(q => q.odemeId == _id).FirstOrDefault();
        //        if (value != null)
        //        {
        //            idc.odemes.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_intotal"></param>
        /// <param name="_inproc"></param>
        /// <param name="_intotalty"></param>
        /// <param name="_incard"></param>
        /// <param name="_instatus"></param>
        //public void insert(int _inUserId, double _inTotalPrice, int _inOrderType, int _inPayType, string _inCardNumber, bool _inStatus, string _inOrder)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        odeme odeme = new odeme();
        //        odeme.kullaniciId = _inUserId;
        //        if (_inTotalPrice != -1) odeme.odemeTutar = _inTotalPrice;
        //        if (_inOrderType != -1) odeme.islemId = _inOrderType;
        //        if (_inPayType != -1) odeme.odemeTipId = _inPayType;
        //        odeme.tarih = DateTime.Now;
        //        if (!String.IsNullOrEmpty(_inCardNumber)) odeme.kartNo = _inCardNumber;
        //        odeme.basariliMi = _inStatus;
        //        odeme.siparis = _inOrder;
        //        idc.odemes.InsertOnSubmit(odeme);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_income"></param>
        //public void update(int _inPayId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.odemes.Where(q => q.odemeId == _inPayId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.basariliMi = true;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
       
        //public odeme getLastPay()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.odemes.OrderByDescending(x => x.odemeId).First();
        //        return value;
        //    }
        //}
        //public odeme search(int _inPayId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.odemes.Where(x => x.odemeId == _inPayId).FirstOrDefault();
        //        return value;
        //    }
        //}

        public string getProjectPaymentStatus(int _inProjeId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from o in idc.odemes.Where(x => x.islemId == 20 && x.siparis.Contains("<adsid>" + _inProjeId + "</adsid>"))
                             select new ilanDataType
                             {
                                 baslik = o.kullanici.kullaniciAdSoyad,
                                 aciklama = o.basariliMi == true ? "ödeme başarılı" : "ödeme başarısız",
                             };

                XmlFormat xmlFormat = new XmlFormat();
                formatter.FormatTo(xmlFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        public string getPayByUserId(int _inUserId, int _inOrderType, int _index, int _inCount, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from o in idc.odemes.Where(x => x.kullaniciId == _inUserId)
                    select new
                    {
                        o.odemeTipId,
                        o.odemeTutar,
                        o.tarih,
                        o.kullanici.kullaniciAdSoyad,
                        o.kartNo,
                        o.islemId,
                        o.basariliMi,
                        odemeTipFormat = EnumHelper.EnumHelper.GetDescription((PaymentTypeString)Enum.Parse(typeof(PaymentTypeString), o.odemeTipId.ToString())),
                        tarihFormat = String.Format(" {0:dd MMMM yyyy}", o.tarih),
                        siparisTipFormat = EnumHelper.EnumHelper.GetDescription((PaymentOrderTypeString)Enum.Parse(typeof(PaymentOrderTypeString), o.islemId.ToString()))

                    };

                if (_inOrderType != -1) query = query.Where(x => x.islemId == _inOrderType);

                query = query.OrderByDescending(x => x.tarih).Skip(_inCount * (_index)).Take(_inCount);

                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        public object select(int _index, int _inCount, string _inSearch, string _inEcho)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from o in idc.odemes
                            select new PaymentCS
                            {
                                id = o.odemeId,
                                paytype = EnumHelper.EnumHelper.GetDescription((PaymentTypeString)Enum.Parse(typeof(PaymentTypeString), o.odemeTipId.ToString())),
                                paytotal = String.Format(" {0:N0}", o.odemeTutar),
                                date = String.Format(" {0:dd MMMM yyyy}", o.tarih),
                                username = o.kullanici.kullaniciAdSoyad,
                                cardno = o.kartNo,
                                operation = EnumHelper.EnumHelper.GetDescription((PaymentOrderTypeString)Enum.Parse(typeof(PaymentOrderTypeString), o.islemId.ToString())),
                                success = o.basariliMi == true ? "<a class='btn btn-success btn-xs'>Başarılı</a>" : "<a class='btn btn-danger btn-xs'>Başarısız</a>",
                                exp = @"<a class='btn btn-success btn-xs' href='/management/genelAyarlar/genelayarlar.aspx?page=odemefatura&payment=" + o.odemeId + "'>Fatura Görüntüle</a>"
                            };

                if (String.IsNullOrEmpty(_inSearch) == false) query = query.Where(x => x.username.IndexOf(_inSearch) != -1);

                int totalCount = idc.odemes.Count();
                int filterCount = query.Count();

                query = query.Skip(_index).Take(_inCount);

                var cmd = new
                {
                    draw = _inEcho,
                    recordsTotal = totalCount,
                    recordsFiltered = filterCount,
                    data = query.ToList()
                };

                return cmd;
            }

        }

    }
}

