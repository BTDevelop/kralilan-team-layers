using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data.Objects;

namespace BLL
{
    public class ziyaretciBll
    {
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}

        //public int getVisitorByAdsId(int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = idc.ziyaretcis.Where(p => p.ilanId == _inAdsId).Count();
        //        return query;
        //    }
        //}

        //public void insert(string _inIPAddr, int _inAdsId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        ziyaretci ziyaretci = new ziyaretci();
        //        var query = idc.ziyaretcis.Where(z => z.ipAdres.Equals(_inIPAddr) && DateTime.Equals(DateTime.Now.Date, z.sonGirisTarihi) & z.ilanId == _inAdsId).FirstOrDefault();
        //        if (query == null)
        //        {
        //            ziyaretci.ipAdres = _inIPAddr;
        //            ziyaretci.ilanId = _inAdsId;
        //            ziyaretci.sonGirisTarihi = DateTime.Now.Date;
        //            idc.ziyaretcis.InsertOnSubmit(ziyaretci);
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
