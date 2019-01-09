using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class VergiDaireManager : IVergiDaireService
    {
        private IVergiDairelerDal _vergiDaireDal;

        public VergiDaireManager(IVergiDairelerDal vergiDaireDal)
        {
            _vergiDaireDal = vergiDaireDal;
        }

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
            return _vergiDaireDal.GetByRegionId(RegionId);
        }

        public void Update(vergiDaire entity)
        {
            throw new NotImplementedException();
        }
    }
}
