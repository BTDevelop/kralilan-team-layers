using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSIlanBakilanlarDal : IIlanBakilanlarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10;

        public void Add(ilanBakilanlar entity)
        {
            idc.ilanBakilanlars.InsertOnSubmit(entity);
        }

        public void Delete(ilanBakilanlar entity)
        {
            throw new NotImplementedException();
        }

        public ilanBakilanlar Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<ilanBakilanlar> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(ilanBakilanlar entity)
        {
            throw new NotImplementedException();
        }

        public ilanBakilanlar GetByAdsUserId(int AdsId, int UserId)
        {
            return idc.ilanBakilanlars.Where(x => x.ilanId == AdsId && x.kullaniciId == UserId).SingleOrDefault();
        }
    }
}
