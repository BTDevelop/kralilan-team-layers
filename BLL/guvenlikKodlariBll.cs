using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class guvenlikKodlariBll
    {
        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_income"></param>
        /// <param name="_insecurcode"></param>
        //public void insert(string _income, string _inSecurCode)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        guvenlikKodlari guvenlikKodu = new guvenlikKodlari();
        //        guvenlikKodu.cepTelefonu = _income;
        //        guvenlikKodu.guvenlikKodu = _inSecurCode;
        //        guvenlikKodu.tarih = DateTime.Now;
        //        idc.guvenlikKodlaris.InsertOnSubmit(guvenlikKodu);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_income"></param>
        /// <param name="_insecurcode"></param>
        //public void update(string _income, string _inSecurCode)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.guvenlikKodlaris.Where(q => q.cepTelefonu == _income).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.guvenlikKodu = _inSecurCode;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_income"></param>
        /// <returns></returns>
        //public guvenlikKodlari search(string _inSecureCode)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.guvenlikKodlaris.Where(q => q.guvenlikKodu == _inSecureCode).FirstOrDefault();
        //    }
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_income"></param>
        /// <returns></returns>
        //public guvenlikKodlari searchSecureCodeByPhone(string _inPhone)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.guvenlikKodlaris.Where(q => q.cepTelefonu == _inPhone).FirstOrDefault();
        //    }
        //}
    }
}
