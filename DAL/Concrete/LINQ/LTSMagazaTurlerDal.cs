using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSMagazaTurlerDal : IMagazaTurlerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(magazaTur entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(magazaTur entity)
        {
            throw new NotImplementedException();
        }

        public magazaTur Get(int Id)
        {
            return idc.magazaTurs.Where(q => q.magazaTurId == Id).FirstOrDefault();
        }

        public magazaTur Get(magazaTur entity)
        {
            throw new NotImplementedException();
        }

        public List<magazaTur> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(magazaTur entity)
        {
            throw new NotImplementedException();
        }
    }
}
