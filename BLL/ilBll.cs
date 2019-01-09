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
    public class ilBll
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
        //        var value = idc.illers.Where(q => q.ilId == _id).FirstOrDefault();
        //        if (value != null)
        //        {
        //            idc.illers.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inProvName"></param>
        //public void insert(string _inProvName)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        iller il = new iller();
        //        il.ilAdi = _inProvName;
        //        idc.illers.InsertOnSubmit(il);
        //        idc.SubmitChanges();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_inProvName"></param>
        //public void update(int _id, string _inProvName)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.illers.Where(q => q.ilId == _id).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.ilAdi = _inProvName;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public iller search(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.illers.Where(q => q.ilId == _id).FirstOrDefault();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string select()
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.illers
                            select new
                            {
                                i.ilId,
                                i.ilAdi
                            };

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();

            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        //public IEnumerable<iller> list()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.illers.ToList();
        //    }
        //}

        public class RegionUTFType
        {
            public int Id { get; set; }
            public string Region { get; set; }
            public string RegionUTF { get; set; }
        }

        public List<RegionUTFType> getUTFList()
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.illers
                    select new RegionUTFType
                    {
                        Id = i.ilId,
                        Region = i.ilAdi,
                        RegionUTF = PublicHelper.Tools.URLConverter(i.ilAdi)
                    };


                return query.ToList();
            }
        }

    }
}
