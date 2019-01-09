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
    public class vergiDaireBll 
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
        
        //public string getTaxAdminByProvId(int _inProvId, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from v in idc.vergiDaires.Where(q => q.ilId == _inProvId)
        //                    select new
        //                    {
        //                        v.vergiDaireId,
        //                        v.vergiDairesi
        //                    };

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }       
        //}

        //public IEnumerable<vergiDaire> list(int _inProvId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.vergiDaires.Where(q => q.ilId == _inProvId);
        //    }
        //}
    }
}
