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
    public class mahalleBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();
        
           
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_income"></param>
        /// <param name="_id"></param>
        //public void insert(string _income, int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        mahalleler mahalle = new mahalleler();

        //        mahalle.mahalleAdi = _income;
        //        mahalle.ilceId = _id;
        //        idc.mahallelers.InsertOnSubmit(mahalle);
        //        idc.SubmitChanges();
        //    }
        //}


        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_inNeigName"></param>
        /// <param name="_inDistId"></param>
        //public void update(int _id, string _inNeigName, int _inDistId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.mahallelers.Where(q => q.mahalleId == _id).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.mahalleAdi = _inNeigName;
        //            value.ilceId = _inDistId;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public mahalleler search(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.mahallelers.Where(q => q.mahalleId == _id).FirstOrDefault();
        //        return value;
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inDistId"></param>
        /// <returns></returns>
        public string select(int _inDistId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from m in idc.mahallelers.Where(q => q.ilceId == _inDistId)
                             select new
                             {
                                 m.mahalleId,
                                 m.mahalleAdi
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
        /// <param name="_inDistId"></param>
        /// <returns></returns>
        //public IEnumerable<mahalleler> list(int _inDistId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.mahallelers.Where(q => q.ilceId == _inDistId).ToList();
        //    }
        //}

        public class CityAreaUTFType
        {
            public int Id { get; set; }
            public string CityArea { get; set; }
            public string CityAreaUTF { get; set; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<CityAreaUTFType> getUTFList()
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from m in idc.mahallelers
                    select new CityAreaUTFType
                    {
                        Id = m.mahalleId,
                        CityArea = m.mahalleAdi,
                        CityAreaUTF = PublicHelper.Tools.URLConverter(m.mahalleAdi)
                    };


                return query.ToList();
            }
        }
    }
}
