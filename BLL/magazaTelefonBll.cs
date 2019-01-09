using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BLL.EnumHelper;
using BLL.Formatter;

namespace BLL
{
    public class magazaTelefonBll
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
        //        var value = idc.magazaTelefons.Where(q => q.magazaTelefonId == _id).FirstOrDefault();
        //        if (value != null)
        //        {
        //            idc.magazaTelefons.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_income"></param>
        //public void insert(int _inStoreId, string _inPhone, int _inPhoneType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        magazaTelefon magazaTlf = new magazaTelefon();
        //        magazaTlf.magazaId = _inStoreId;
        //        magazaTlf.telefon = _inPhone;
        //        magazaTlf.telefonTur = _inPhoneType;
        //        idc.magazaTelefons.InsertOnSubmit(magazaTlf);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_instrid"></param>
        /// <param name="_inphtype"></param>
        /// <param name="_inphone"></param>
        //public void update(int _inStoreId, int _inPhoneType, string _inPhone)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazaTelefons.Where(q => q.magazaId == _inStoreId & q.telefonTur == _inPhoneType).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.telefon = _inPhone;
        //            idc.SubmitChanges();
        //        }
        //        else
        //        {
        //            magazaTelefon magazaTelefon = new magazaTelefon();
        //            magazaTelefon.telefon = _inPhone;
        //            magazaTelefon.telefonTur = _inPhoneType;
        //            magazaTelefon.magazaId = _inStoreId;
        //            idc.magazaTelefons.InsertOnSubmit(magazaTelefon);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_instrid"></param>
        /// <param name="_inphtype"></param>
        /// <returns></returns>
        //public magazaTelefon search(int _inStoreId, int _inPhoneType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazaTelefons.Where(q => q.magazaId == _inStoreId & q.telefonTur == _inPhoneType).FirstOrDefault();
        //        return value;
        //    }
        //}

        public string select(int _inStoreId, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.magazaTelefons.Where(q => q.magazaId == _inStoreId)
                    select new
                    {
                        i.telefon,
                        telefonTur = EnumHelper.EnumHelper.GetDescription((PhoneTypeString)Enum.Parse(typeof(PhoneTypeString), i.telefonTur.ToString())),
                        telefonFormat = i.telefon.ToString().Substring(0, 3) + "-" +
                                        i.telefon.ToString().Substring(3, 7)
                    };

                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }


        //public IEnumerable<magazaTelefon> list(int _inStoreId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.magazaTelefons.Where(q => q.magazaId == _inStoreId).ToList();
        //    }         
        //}
    }
}
