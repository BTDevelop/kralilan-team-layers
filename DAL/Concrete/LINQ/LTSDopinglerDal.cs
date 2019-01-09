using DAL.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Concrete.LINQ
{
    public class LTSDopinglerDal : IDopinglerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(doping entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(doping entity)
        {
            throw new NotImplementedException();
        }

        public doping Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<doping> GetAll()
        {
            return idc.dopings.ToList();
        }

        public void Update(doping entity)
        {
            throw new NotImplementedException();
        }
    }
}
