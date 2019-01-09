using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class IlceManager : IIlceService
    {
        private IIlcelerDal _ilcelerDal;
        public IlceManager(IIlcelerDal ilcelerDal)
        {
            _ilcelerDal = ilcelerDal;
        }
        public void Add(ilceler entity)
        {
           _ilcelerDal.Add(entity);
        }

        public void Delete(ilceler entity)
        {
            throw new NotImplementedException();
        }

        public ilceler Get(int Id)
        {
            return _ilcelerDal.Get(Id);
        }

        public List<ilceler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<ilceler> GetByRegionId(int RegionId)
        {
            return _ilcelerDal.GetByRegionId(RegionId);
        }

        public void Update(ilceler entity)
        {
            _ilcelerDal.Update(entity);
        }
    }
}
