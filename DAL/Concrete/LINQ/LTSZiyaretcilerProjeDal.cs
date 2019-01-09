using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSZiyaretcilerProjeDal : IZiyaretcilerProjeDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(ziyaretproje entity)
        {
            ziyaretproje ziyaretProje = new ziyaretproje();
            var query = idc.ziyaretprojes.Where(z => z.gip.Equals(entity.gip) && DateTime.Equals(DateTime.Now.Date, Convert.ToDateTime(z.gtarih).Date) && z.gpid == entity.gpid & z.gtip == entity.gtip).FirstOrDefault();
            if (query == null)
            {
                ziyaretProje.gip = entity.gip;
                ziyaretProje.gpid = entity.gpid;
                ziyaretProje.gtarih = entity.gtarih;
                ziyaretProje.gtip = entity.gtip;
                idc.ziyaretprojes.InsertOnSubmit(ziyaretProje);
                idc.SubmitChanges();
            }
        }

        public int Count(int ProjectId, bool Type)
        {
            var query = idc.ziyaretprojes.Where(x => x.gpid == ProjectId && x.gtip == Type).Count();
            return query;
        }

        public void Delete(ziyaretproje entity)
        {
            throw new NotImplementedException();
        }

        public ziyaretproje Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<ziyaretproje> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(ziyaretproje entity)
        {
            throw new NotImplementedException();
        }
    }
}
