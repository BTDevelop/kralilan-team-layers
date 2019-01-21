using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Web;
using System.Data.Linq;
using System.Data.Entity;
using Newtonsoft.Json;
using System.Web.Security;
using BLL.Formatter;

namespace BLL
{
    public class kullaniciBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();

        //public void delete(int _inuserid)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_inusername"></param>
        /// <param name="_inpassword"></param>
        /// <param name="_inmail"></param>
        /// <param name="_inrank"></param>
        //public void insert(string _inUserName, string _inPassword, string _inEmail, int _inRank)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        kullanici kullanici = new kullanici();

        //        kullanici.kullaniciAdSoyad = _inUserName;
        //        kullanici.sifre = _inPassword;
        //        kullanici.email = _inEmail;
        //        kullanici.rol = _inRank;
        //        kullanici.silindiMi = false;
        //        idc.kullanicis.InsertOnSubmit(kullanici);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public kullanici search(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId && q.silindiMi == false).FirstOrDefault();
        //        return value;
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inusername"></param>
        /// <param name="_inproid"></param>
        /// <param name="_indistid"></param>
        /// <param name="_inneigid"></param>
        /// <param name="_intc"></param>
        /// <param name="_ineduid"></param>
        /// <param name="_insexid"></param>
        /// <param name="_inborndt"></param>
        /// <param name="_inphoto"></param>
        //public void update(int _inUserId, string _inUserName, int _inProId, int _inDistId, int _inNeigId, string _inIdentityNum,
        //                   int _inEduId, int _inSexId, string _inBornDate, string _inPhoto)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            if (!String.IsNullOrEmpty(_inUserName)) value.kullaniciAdSoyad = _inUserName;
        //            if (_inProId != -1) value.ilId = _inProId;
        //            if (_inDistId != -1) value.ilceId = _inDistId;
        //            if (_inNeigId != -1) value.mahalleId = _inNeigId;
        //            if (!String.IsNullOrEmpty(_inIdentityNum)) value.tckimlikNo = _inIdentityNum;
        //            if (_inEduId != -1) value.egitimDurumuId = _inEduId;
        //            if (_inSexId != -1) value.cinsiyetId = Convert.ToBoolean(_inSexId);
        //            if (!String.IsNullOrEmpty(_inBornDate)) value.dogumTarihi = Convert.ToDateTime(_inBornDate);
        //            if (!String.IsNullOrEmpty(_inPhoto)) value.profilResim = _inPhoto;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        /// <summary>
        /// şifre değiştir
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inpassword"></param>
        //public void updatePasswordByUserId(int _inUserId, string _inPassword)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.sifre = _inPassword;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// kullanıcı oturum bilgileri
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inexplorer"></param>
        /// <param name="_inipadd"></param>
        //public void updateSessionInfoByUserId(int _inUserId, string _inExplorer, string _inIpAdd)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.tarayici = _inExplorer;
        //            value.sonGirisTarihi = DateTime.Now;
        //            value.ipAdres = _inIpAdd;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// online durum kontrolü
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_income"></param>
        //public void updateOnlineStatus(int _inUserId, int _inOpt)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            if (_inOpt == 1) value.online = DateTime.Now.AddMinutes(10);

        //            else value.online = DateTime.Now.AddMinutes(-10);

        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// mail bilgisi değiştir
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inmail"></param>
        //public void updateEmailByUserId(int _inUserId, string _inEmail)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.email = _inEmail;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// mail kontrolü
        /// </summary>
        /// <param name="_income"></param>
        /// <returns></returns>
        //public kullanici getUserByEmail(string _inEmail)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.kullanicis.Where(q => q.email == _inEmail && q.silindiMi == false).FirstOrDefault();
        //    }
        //}
        /// <summary>
        /// telefon ve mail daha önce kullanılmış mı
        /// </summary>
        /// <param name="_inmail"></param>
        /// <param name="_inphone"></param>
        /// <returns></returns>
        //public bool getIsUserDuplicate(string _inEmail, string _inPhone)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        telefonlar telefon = idc.telefonlars.Where(q => q.telefon == _inPhone).FirstOrDefault();
        //        kullanici kullanici = idc.kullanicis.Where(q => q.email == _inEmail).FirstOrDefault();

        //        if (telefon != null || kullanici != null) return false;
        //        else return true;
        //    }
        //}

        //public kullanici getLastUser()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.OrderByDescending(x => x.kullaniciId).First();
        //        return value;
        //    }
        //}

        public bool getUserLoginOn(string _inUserName, string _inPassword)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.kullanicis.Where(q => q.email == _inUserName && q.sifre == _inPassword && (q.rol == 1 || q.rol == 2 || q.rol == 3) & q.silindiMi == false).FirstOrDefault();
                if (value != null)
                {
                    FormsAuthentication.SetAuthCookie(value.kullaniciId.ToString(), false);
                    getUsersBlock(value.kullaniciId, true);
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public static Dictionary<int, kullanici> usersDic = new Dictionary<int, kullanici>();

        public static kullanici getUsersBlock(int _inUserId = -1, bool _inRefresher = false)
        {
            kullanici memoryBlock = null;
            using (ilanDataContext idc = new ilanDataContext())
            {
                if (_inUserId == -1)
                {
                    if (String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name) == false)
                    {
                        _inUserId = Convert.ToInt32(HttpContext.Current.User.Identity.Name);
                        if (usersDic.TryGetValue(_inUserId, out memoryBlock) == true && _inRefresher == false)
                        {
                            return memoryBlock;
                        }
                        else
                        {
                            var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
                            if (value != null)
                            {
                                if (_inRefresher == true) usersDic.Remove(_inUserId);
                                usersDic.Add(_inUserId, value);
                                memoryBlock = value;
                                return memoryBlock;
                            }
                            else
                            {
                                return null;
                            }
                        }

                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
                    if (value != null)
                    {
                        if (_inRefresher == true) usersDic.Remove(_inUserId);
                        usersDic.Add(_inUserId, value);
                        memoryBlock = value;
                        return memoryBlock;
                    }
                    else
                    {
                        return null;

                    }
                }
            }
        }

        public bool getUserAppLoginOn(string _inUserName, string _inPassword)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = idc.kullanicis.Where(q => q.email == _inUserName && q.sifre == _inPassword && (q.rol == 1 || q.rol == 2 || q.rol == 3 || q.rol == 4) && q.silindiMi == false).FirstOrDefault();
                if (query != null)
                {
                    FormsAuthentication.SetAuthCookie(query.kullaniciId.ToString(), false);
                    getUsersBlock(query.kullaniciId, true);
                    return true;
                }

                else
                {
                    return false;
                }
            }
        }

        //public void updateByManager(int _inUserId, string _inUserName, string _inPassword, string _inEmail, int _inRank, bool _inDeleted)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kullanicis.Where(q => q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            if (!String.IsNullOrEmpty(_inUserName)) value.kullaniciAdSoyad = _inUserName;
        //            if (!String.IsNullOrEmpty(_inPassword)) value.sifre = _inPassword;
        //            if (!String.IsNullOrEmpty(_inEmail)) value.email = _inEmail;
        //            value.rol = _inRank;
        //            value.silindiMi = _inDeleted;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}



        ////ilana alıanacak
        //public int countAdsByUserId(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = idc.ilans.Count(i => i.kullaniciId == _inUserId && i.onay == 1 && i.silindiMi == false && i.satildiMi == false && i.magazaId == null);
        //        return query;
        //    }
        //}


        /// <summary>
        /// online kullanıcılar
        /// </summary>
        /// <returns></returns>
        public string getOnlineUsers(int _index, int _inCount)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from k in idc.kullanicis.Where(k => k.silindiMi == false && DateTime.Compare(Convert.ToDateTime(k.online), DateTime.Now) > 0)
                            select new
                            {
                                k.kullaniciId,
                                k.kullaniciAdSoyad,
                                k.sonGirisTarihi,
                                k.ipAdres,
                                k.online,
                                cevrimIci = k.online.Value.AddMinutes(-10)
                            };


                query = query.OrderByDescending(x => x.sonGirisTarihi).OrderBy(x => x.kullaniciId).Skip(_inCount * (_index)).Take(_inCount);

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        /// <summary>
        /// listele
        /// </summary>
        /// <param name="_index"></param>
        /// <param name="_count"></param>
        /// <param name="_inuserid"></param>
        /// <returns></returns>
        /// 

        public string getLastRecorUsers(int _index, int _inCount)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.kullanicis.Where(k => k.silindiMi == false && k.rol == 4)
                    select new
                    {
                        i.kullaniciId,
                        i.kullaniciAdSoyad,
                        i.telefonlars.Where(t => t.telefonTur == 1).FirstOrDefault().telefon,
                        i.email,
                        i.sonGirisTarihi,
                        tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.sonGirisTarihi)
                    };
                query = query.OrderByDescending(x => x.kullaniciId).Skip(_index).Take(_inCount);

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        public class KullaniciType
        {
            public int kullaniciId
            { get; set; }
            public string kullaniciAdSoyad
            { get; set; }
            public string profilResim
            { get; set; }
            public string email
            { get; set; }
            public string sonGirisTarihi
            { get; set; }
            public string sifre
            { get; set; }
        }

        public object getUsersJDatatables(int _index, int _inCount, int _inRole, string _inSearch, string _inEcho)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.kullanicis.Where(k => k.silindiMi == false & k.rol == _inRole)
                            select new KullaniciType
                            {

                                kullaniciId = i.kullaniciId,
                                kullaniciAdSoyad = i.kullaniciAdSoyad,
                                profilResim = i.telefonlars.Where(t => t.telefonTur == 1).FirstOrDefault().telefon,
                                email = i.email,
                                sonGirisTarihi = String.Format(" {0:dd MMMM yyyy}", i.sonGirisTarihi),
                                sifre = @"<a href='/satici-profil.aspx?seller=" + i.kullaniciId + @"' class='btn btn-primary btn-xs'>Görüntüle</a>
                                                <a href = '/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=duzenle&user=" + i.kullaniciId + @"' class='btn btn-warning btn-xs'>Düzenle</a>
                                                <a href = '/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=listele&dlt=" + i.kullaniciId + @"'  class='btn btn-danger btn-xs' >Sil</a>"
                            };

                if (String.IsNullOrEmpty(_inSearch) == false) query = query.Where(x => x.kullaniciAdSoyad.IndexOf(_inSearch) != -1);

                int totalCount = query.Count();
                int filteredCount = query.Count();
                query = query.OrderByDescending(x => x.kullaniciId).Skip(_index).Take(_inCount);


                var cmd = new
                {
                    draw = _inEcho,
                    recordsTotal = totalCount,
                    recordsFiltered = filteredCount,
                    data = query.ToList()
                };

                return cmd;
            }
        }
    }
}
