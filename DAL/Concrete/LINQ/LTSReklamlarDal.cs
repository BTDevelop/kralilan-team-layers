using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSReklamlarDal : IReklamlarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(reklam entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(reklam entity)
        {
            throw new NotImplementedException();
        }

        public reklam Get(int Id)
        {
            var value = idc.reklams.Where(q => q.reklamId == Id).FirstOrDefault();
            return value;
        }

        public reklam Get(reklam entity)
        {
            throw new NotImplementedException();
        }

        public List<reklam> GetAll()
        {
            throw new NotImplementedException();
        }

        public reklam GetTypeLocationId(int Type, int LocationId)
        {
            var value = idc.reklams.Where(q => q.reklamTurId == Type & q.reklamKonumuId == LocationId).FirstOrDefault();
            return value;
        }

        public void Update(reklam entity)
        {
            throw new NotImplementedException();
        }
    }
}
