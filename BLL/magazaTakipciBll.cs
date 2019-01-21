using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BLL.Formatter;

namespace BLL
{
    public class magazaTakipciBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();

        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_instrid"></param>
        /// <param name="_inuserid"></param>
        //public void delete(int _inStoreId, int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazaTakips.Where(q => q.magazaId == _inStoreId & q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            idc.magazaTakips.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        ///// <summary>
        ///// ekle
        ///// </summary>
        ///// <param name="_instrid"></param>
        ///// <param name="_inuserid"></param>
        //public void insert(int _instrid, int _inuserid)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        magazaTakip magazaTakipd = new magazaTakip();
        //        magazaTakipd.kullaniciId = _inuserid;
        //        magazaTakipd.magazaId = _instrid;
        //        idc.magazaTakips.InsertOnSubmit(magazaTakipd);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_income"></param>
        //public void update(params object[] _income)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_instrid"></param>
        /// <returns></returns>
        //public magazaTakip search(int _inUserId,int _inStoreId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.magazaTakips.Where(f => f.kullaniciId == _inUserId & f.magazaId == _inStoreId).FirstOrDefault();
        //    }
        //}

        //public int getFollowStoresByUserId(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.magazaTakips.Count(i => i.kullaniciId == _inUserId && i.magaza.onay == true && i.magaza.silindiMi == false);
        //    }
        //}

        public string select(int _inWhoFrom, int _index, int _inCount)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.magazaTakips.Where(i =>
                        i.magaza.silindiMi == false && i.kullaniciId == _inWhoFrom)
                    select new
                    {
                        i.magaza.magazaAdi,
                        i.magaza.kurumsalMi,
                        i.magazaId,
                        i.magaza.magazaLogo,
                        i.magaza.baslangicTarihi,
                        i.magaza.aciklama,
                        magazaFormat = PublicHelper.Tools.URLConverter(i.magaza.magazaAdi),
                        baslangicFormat = i.magaza.baslangicTarihi.ToString("dd MMMM yyyy")
                    };

                query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

        }

        public string getStoreFollowers(int _inWhoFrom, int _index, int _inCount, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from m in idc.magazaTakips.Where(i => i.magaza.magazaId == _inWhoFrom && i.magaza.silindiMi == false && i.kullanici.silindiMi == false)
                            select new
                            {
                                m.kullanici.profilResim,
                                m.kullanici.kullaniciId
                            };

                query = query.Skip(_inCount * (_index)).Take(_inCount);

                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

        }  
   
    }
}
