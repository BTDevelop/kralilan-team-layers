using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSIlcelerDal : IIlcelerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(ilceler entity)
        {
            ilceler ilce = new ilceler();
            ilce.ilceAdi = entity.ilceAdi;
            ilce.ilId = entity.ilId;
            idc.ilcelers.InsertOnSubmit(ilce);
            idc.SubmitChanges();
        }

        public void Delete(ilceler entity)
        {
            var value = idc.ilcelers.Where(q => q.ilceId == entity.ilceId).FirstOrDefault();
            if (value != null)
            {
                idc.ilcelers.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public ilceler Get(int Id)
        {
            return idc.ilcelers.Where(q => q.ilceId == Id).FirstOrDefault();

        }

        public ilceler Get(ilceler entity)
        {
            throw new NotImplementedException();
        }

        public List<ilceler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<ilceler> GetByRegionId(int RegionId)
        {
            return idc.ilcelers.Where(q => q.ilId == RegionId).ToList();
        }

        public void Update(ilceler entity)
        {
            var value = idc.ilcelers.Where(q => q.ilceId == entity.ilceId).FirstOrDefault();

            if (value != null)
            {
                value.ilceAdi = entity.ilceAdi;
                value.ilId = entity.ilId;
                idc.SubmitChanges();
            }
        }
    }
}
