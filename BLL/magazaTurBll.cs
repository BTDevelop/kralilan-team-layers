using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Newtonsoft.Json;
using BLL.Formatter;
using BLL.EnumHelper;

namespace BLL
{
    public class magazaTurBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();

        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        //public void insert(params object[] _income)
        //{
        //    throw new NotImplementedException();
        //}
        //public void update(params object[] _income)
        //{
        //    throw new NotImplementedException();
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inType"></param>
        /// <returns></returns>
        //public magazaTur search(int _inType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.magazaTurs.Where(q => q.magazaTurId == _inType).FirstOrDefault();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inCatId"></param>
        /// <returns></returns>
        public string select(int _inCatId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from m in idc.magazaTurs.Where(q => q.kategoriId == _inCatId)
                             select new
                             {
                                 turAdi = EnumHelper.EnumHelper.GetDescription((StoreTypeString)Enum.Parse(typeof(StoreTypeString), m.turId.ToString())),
                                 turId = m.magazaTurId
                             };

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        public class StoreUTFType
        {
            public int Id { get; set; }
            public string TypeName { get; set; }
            public string TypeNameUTF { get; set; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<StoreUTFType> getUTFList()
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from m in idc.magazaTurs
                    select new StoreUTFType
                    {
                        Id = Convert.ToInt32(m.turId),
                        TypeName = EnumHelper.EnumHelper.GetDescription((StoreTypeString)Enum.Parse(typeof(StoreTypeString), m.turId.ToString())),
                        TypeNameUTF = PublicHelper.Tools.URLConverter(EnumHelper.EnumHelper.GetDescription((StoreTypeString)Enum.Parse(typeof(StoreTypeString), m.turId.ToString())))
                    };


                return query.ToList();
            }
        }
    }
}
