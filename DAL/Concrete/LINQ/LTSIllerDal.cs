using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

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

        public List<Il> GetRegions()
        {
            var query = from i in idc.illers
                select new Il
                {
                   IlId = i.ilId,
                   IlAdi = i.ilAdi,
                   Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.ilAdi)
                };

            return query.ToList();
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
