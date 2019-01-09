using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSVergiDairelerDal : IVergiDairelerDal
    {
        private ilanDataContext idc= new ilanDataContext();
        public void Add(vergiDaire entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(vergiDaire entity)
        {
            throw new NotImplementedException();
        }

        public vergiDaire Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<vergiDaire> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<VergiDaire> GetByRegionId(int RegionId)
        {
            var query = from v in idc.vergiDaires.Where(q => q.ilId == RegionId)
                select new VergiDaire
                {
                   VergiDaireId = v.vergiDaireId,
                   VergiDaireAdi = v.vergiDairesi
                };

            return query.ToList();
        }

        public void Update(vergiDaire entity)
        {
            throw new NotImplementedException();
        }
    }
}
