using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using DAL;
using BLL.Formatter;

namespace BLL
{
    public class ilceBll 
    {

        Formatter.Formatter formatter = new Formatter.Formatter();
 
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilcelers.Where(q => q.ilceId == _id).FirstOrDefault();
        //        if (value != null)
        //        {
        //            idc.ilcelers.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inDistName"></param>
        /// <param name="_id"></param>
        //public void insert(string _inDistName, int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        ilceler ilce = new ilceler();
        //        ilce.ilceAdi = _inDistName;
        //        ilce.ilId = _id;
        //        idc.ilcelers.InsertOnSubmit(ilce);
        //        idc.SubmitChanges();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_inDistName"></param>
        /// <param name="_inProId"></param>
        //public void update(int _id, string _inDistName, int _inProId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilcelers.Where(q => q.ilceId == _id).FirstOrDefault();

        //        if (value != null)
        //        {
        //            value.ilceAdi = _inDistName;
        //            value.ilId = _inProId;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public ilceler search(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.ilcelers.Where(q => q.ilceId == _id).FirstOrDefault();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public string select(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from i in idc.ilcelers.Where(q => q.ilId == _id)
        //                    select new
        //                    {
        //                        i.ilceId,
        //                        i.ilceAdi
        //                    };

        //        JsonFormat jsonFormat = new JsonFormat();
        //        formatter.FormatTo(jsonFormat);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inProvId"></param>
        ///// <returns></returns>
        //public IEnumerable<ilceler> list(int _inProvId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.ilcelers.Where(q => q.ilId == _inProvId).ToList();
        //    }
        //}

        public class CityUTFType
        {
            public int Id { get; set; }
            public string City { get; set; }
            public string CityUTF { get; set; }
        }

        public List<CityUTFType> getUTFList()
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilcelers
                    select new CityUTFType
                    {
                        Id = i.ilceId,
                        City = i.ilceAdi,
                        CityUTF = PublicHelper.Tools.URLConverter(i.ilceAdi)
                    };


                return query.ToList();
            }
        }
    }
}
