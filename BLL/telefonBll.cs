using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using BLL;
using DAL;

namespace BLL
{
    public class telefonBll
    {

        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inphtype"></param>
        //public void delete(int _inUserId, int _inType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.telefonlars.Where(q => q.kullaniciId == _inUserId && q.telefonTur == _inType).FirstOrDefault();
        //        if (value != null)
        //        {
        //            idc.telefonlars.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inphone"></param>
        /// <param name="_inphtype"></param>
        //public void insert(int _inUserId, string _inPhone, int _inType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        telefonlar telefon = new telefonlar();
        //        telefon.kullaniciId = _inUserId;
        //        telefon.telefon = _inPhone;
        //        telefon.telefonTur = _inType;
        //        idc.telefonlars.InsertOnSubmit(telefon);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inphone"></param>
        /// <param name="_inphtype"></param>
        //public void update(int _inUserId, string _inPhone, int _inType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.telefonlars.Where(q => q.kullaniciId == _inUserId && q.telefonTur == _inType).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.telefon = _inPhone;
        //            idc.SubmitChanges();
        //        }
        //        else
        //        {
        //            telefonlar telefon = new telefonlar();
        //            telefon.telefon = _inPhone;
        //            telefon.telefonTur = _inType;
        //            telefon.kullaniciId = _inUserId;
        //            idc.telefonlars.InsertOnSubmit(telefon);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_inphtype"></param>
        /// <returns></returns>
        //public telefonlar search(int _inUserId, int _inType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.telefonlars.Where(q => q.kullaniciId == _inUserId & q.telefonTur == _inType).FirstOrDefault();
        //        return value;
        //    }
        //}

        //public IEnumerable<telefonlar> getPhonesByUserId(int _inOpt, int _inUserId, int _inType)
        //{
        //    if (_inOpt == 1)
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            var query = idc.telefonlars.Where(q => q.kullaniciId == _inUserId && q.telefonTur == _inType).ToList();
        //            return query;
        //        }
        //    }
        //    else
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            var query = idc.telefonlars.Where(q => q.kullaniciId == _inUserId).ToList();
        //            return query;
        //        }
        //    }
        //}
    }
}
