using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ziyaretciprojeBll
    {  
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}

        public int getVisitorByProjectId(int _inProId, bool _inType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = idc.ziyaretprojes.Where(x => x.gpid == _inProId && x.gtip == _inType).Count();
                return query;
            }
        }

        //public void insert(string _inIPAdrr, int _inProId, bool _inType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        ziyaretproje ziyaret = new ziyaretproje();
        //        var query = idc.ziyaretprojes.Where(z => z.gip.Equals(_inIPAdrr) && DateTime.Equals(DateTime.Now.Date, Convert.ToDateTime(z.gtarih).Date) && z.gpid == _inProId & z.gtip == _inType).FirstOrDefault();
        //        if (query == null)
        //        {
        //            ziyaret.gip = _inIPAdrr;
        //            ziyaret.gpid = _inProId;
        //            ziyaret.gtarih = DateTime.Now;
        //            ziyaret.gtip = _inType;
        //            idc.ziyaretprojes.InsertOnSubmit(ziyaret);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        //public void update(params object[] _income)
        //{
        //    throw new NotImplementedException();
        //}
    }
}
