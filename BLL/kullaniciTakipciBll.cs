using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BLL.Formatter;

namespace BLL
{
    public class kullaniciTakipciBll
    {
        kullaniciBll kullaniciBLL = new kullaniciBll();
        Formatter.Formatter formatter = new Formatter.Formatter();
        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_infolid"></param>
        public void delete(int _inUserId, int _inFollowerId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.kullaniciTakips.Where(q => q.kullaniciId == _inUserId & q.takipciId == _inFollowerId).FirstOrDefault();
                if (value != null)
                {
                    idc.kullaniciTakips.DeleteOnSubmit(value);
                    idc.SubmitChanges();
                }
            }
        }
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_infolid"></param>
        public void insert(int _inUserId, int _inFollowerId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                kullaniciTakip kullaniciTakip = new kullaniciTakip();
                kullaniciTakip.kullaniciId = _inUserId;
                kullaniciTakip.takipciId = _inFollowerId;
                idc.kullaniciTakips.InsertOnSubmit(kullaniciTakip);
                idc.SubmitChanges();
            }
        }
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
        /// <param name="_infolid"></param>
        /// <returns></returns>
        //public kullaniciTakip search(int _inUserId, int _inFollowerId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullaniciTakips.Where(t => t.kullaniciId == _inUserId & t.takipciId == _inFollowerId).FirstOrDefault();
        //        return value;
        //    }
        //}

        //public int countUserFollower(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.kullaniciTakips.Count(i => i.kullaniciId == _inUserId && i.kullanici.silindiMi == false);
        //    }
        //}

        //public int countUserFollowed(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.kullaniciTakips.Count(i => i.takipciId == _inUserId && i.kullanici.silindiMi == false);
        //    }
        //}

        //public IEnumerable<object> getUserFollowed(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from t in idc.kullaniciTakips.Where(t => t.kullaniciId == _inUserId && t.kullanici.silindiMi == false)
        //                    select new
        //                    {
        //                        t.kullanici.kullaniciId,
        //                        t.kullanici.profilResim
        //                    };
        //        return query.ToList(); 
        //    }

        //}

        //public IEnumerable<object> getUserFollower(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from t in idc.kullaniciTakips.Where(t => t.takipciId == _inUserId && t.kullanici.silindiMi == false)
        //                    select new
        //                    {
        //                        t.kullanici.kullaniciId,
        //                        t.kullanici.profilResim
        //                    };
        //        return query.ToList();
        //    }

        //}

        public string select(int _inWhoFrom, int _index, int _inCount)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {

                var query = from i in idc.kullaniciTakips.Where(i =>
                        i.kullanici.silindiMi == false & i.takipciId == Convert.ToInt32(_inWhoFrom))
                    select new
                    {
                        i.kullanici.kullaniciAdSoyad,
                        i.kullanici.kullaniciId,
                        i.kullanici.profilResim,
                        i.kullanici.sonGirisTarihi,
                        kullaniciFormat = PublicHelper.Tools.URLConverter(i.kullanici.kullaniciAdSoyad)

                    };

                query = query.OrderBy(x => x.kullaniciId).Skip(_inCount * (_index)).Take(_inCount);

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

        }
    }
}
