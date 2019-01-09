using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSIllerDal : IIllerDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(iller entity)
        {
            iller il = new iller();
            il.ilAdi = entity.ilAdi;
            idc.illers.InsertOnSubmit(il);
            idc.SubmitChanges();
        }

        public void Delete(iller entity)
        {
            var value = idc.illers.Where(q => q.ilId == entity.ilId).FirstOrDefault();
            if (value != null)
            {
                idc.illers.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public iller Get(int Id)
        {
            return idc.illers.Where(q => q.ilId == Id).FirstOrDefault();
        }

        public iller Get(iller entity)
        {
            throw new NotImplementedException();
        }

        public List<iller> GetAll()
        {
            return idc.illers.ToList();
        }

        public IQueryable GetRegions()
        {
            var query = from i in idc.illers
                select new
                {
                    i.ilId,
                    i.ilAdi
                };

            return query;
        }

        public void Update(iller entity)
        {
            var value = idc.illers.Where(q => q.ilId == entity.ilId).FirstOrDefault();
            if (value != null)
            {
                value.ilAdi = entity.ilAdi;
                idc.SubmitChanges();
            }
        }
    }
}
