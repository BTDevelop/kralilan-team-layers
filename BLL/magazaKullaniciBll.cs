using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.IO;
using BLL.Formatter;
using BLL.EnumHelper;

namespace BLL
{
    public class magazaKullaniciBll
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
        //        var value = idc.magazaKullanicis.Where(q => q.magazaId == _inStoreId & q.kullaniciId == _inUserId).FirstOrDefault();

        //        if (value != null)
        //        {
        //            idc.magazaKullanicis.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_instrid"></param>
        /// <param name="_inuserid"></param>
        /// <param name="_inrank"></param>
        //public void insert(int _inStoreId, int _inUserId, int _inRank)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        magazaKullanici magazaKullanici = new magazaKullanici();

        //        magazaKullanici.magazaId = _inStoreId;
        //        magazaKullanici.kullaniciId = _inUserId;
        //        magazaKullanici.rol = _inRank;
        //        idc.magazaKullanicis.InsertOnSubmit(magazaKullanici);
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
        /// <returns></returns>
        //public magazaKullanici search(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazaKullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
        //        return value;
        //    }
        //}

        //public magazaKullanici getUserIsStoreUser(int _inUserId)
        //{
        //    //using (ilanDataContext idc = new ilanDataContext())
        //    //{
        //        ilanDataContext idc = new ilanDataContext();
        //        var value = idc.magazaKullanicis.Where(q => q.kullaniciId == _inUserId && q.kullanici.silindiMi == false && q.magaza.silindiMi == false && q.magaza.onay == true && q.magaza.pasifMi == false).FirstOrDefault();
        //        return value;
        //    //}
        //}


        public class StoreConsultantType
        {
            public int kullaniciId { get; set; }
            public string kullaniciAdSoyad { get; set; }
            public string rol { get; set; }
            public  string online { get; set; }
            public  string email { get; set; }
            public  string aksiyon { get; set; }
        }

        public string getUserByStoreId(int _inStoreId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from mk in idc.magazaKullanicis.Where(mk => mk.magazaId == _inStoreId & mk.kullanici.silindiMi == false)
                            select new StoreConsultantType
                            {
                                kullaniciId = mk.kullanici.kullaniciId,
                                kullaniciAdSoyad = mk.kullanici.kullaniciAdSoyad,
                                rol = EnumHelper.EnumHelper.GetDescription((StoreUserTypeString)Enum.Parse(typeof(StoreUserTypeString), mk.rol.ToString())),
                                online = String.Format(" {0:dd MMMM yyyy}", mk.kullanici.online),
                                email = mk.kullanici.email,
                                aksiyon = @" <a href='/secure/magaza-danismanlarim/?dlt=" + mk.kullanici.kullaniciId + "' class='btn btn-danger btn-xs'> Sil</a>"
                            };


                XmlFormat xmlFormat = new XmlFormat();
                formatter.FormatTo(xmlFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

        }

        //public IQueryable list(int _inStoreId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from mk in idc.magazaKullanicis.Where(mk => mk.magazaId == _inStoreId && mk.kullanici.silindiMi == false)
        //                    select new
        //                    {
        //                        mk.kullanici.kullaniciId,
        //                        mk.kullanici.kullaniciAdSoyad
        //                    };
        //        return query.Take(5);
        //    }
        //}

        //public int countStoreUser(int _inStoreId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        int count = idc.magazaKullanicis.Where(mk => mk.magazaId == _inStoreId).Count();
        //        return count;
        //    }
        //}

        public string select(int _inStoreId, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.magazaKullanicis.Where(i => i.magazaId == _inStoreId && i.magaza.pasifMi == false && i.magaza.silindiMi == false)
                            select new
                            {
                                i.kullanici.kullaniciId,
                                i.kullanici.kullaniciAdSoyad,
                                i.kullanici.profilResim,
                                i.rol,
                                kullaniciFormat = PublicHelper.Tools.URLConverter(i.kullanici.kullaniciAdSoyad)
                            };


                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

        }

    }
}
