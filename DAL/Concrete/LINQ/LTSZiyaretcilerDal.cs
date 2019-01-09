using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSZiyaretcilerDal : IZiyaretcilerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(ziyaretci entity)
        {
            ziyaretci ziyaretci = new ziyaretci();
            var query = idc.ziyaretcis.Where(z => z.ipAdres.Equals(entity.ipAdres) && DateTime.Equals(DateTime.Now.Date, z.sonGirisTarihi) & z.ilanId == entity.ilanId).FirstOrDefault();
            if (query == null)
            {
                ziyaretci.ipAdres = entity.ipAdres;
                ziyaretci.ilanId = entity.ilanId;
                ziyaretci.sonGirisTarihi = entity.sonGirisTarihi;
                idc.ziyaretcis.InsertOnSubmit(ziyaretci);
                idc.SubmitChanges();
            }
        }

        public int Count(int AdsId)
        {
            var query = idc.ziyaretcis.Where(p => p.ilanId == AdsId).Count();
            return query;
        }

        public void Delete(ziyaretci entity)
        {
            throw new NotImplementedException();
        }

        public ziyaretci Get(int Id)
        {
            throw new NotImplementedException();
        }

        public ziyaretci Get(ziyaretci entity)
        {
            throw new NotImplementedException();
        }

        public List<ziyaretci> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(ziyaretci entity)
        {
            throw new NotImplementedException();
        }
    }
}
