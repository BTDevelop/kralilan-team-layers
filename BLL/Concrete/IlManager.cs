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
    public class IlManager : IIlService
    {
        private IIllerDal _illerDal;
        public IlManager(IIllerDal illerDal)
        {
            _illerDal = illerDal;
        }

        public void Add(iller entity)
        {
            _illerDal.Add(entity);
        }

        public void Delete(iller entity)
        {
            throw new NotImplementedException();
        }

        public iller Get(int Id)
        {
            return _illerDal.Get(Id);
        }

        public List<iller> GetAll()
        {
            return _illerDal.GetAll();
        }

        public List<Il> GetRegions()
        {
            return _illerDal.GetRegions();
        }

        public void Update(iller entity)
        {
            _illerDal.Update(entity);
        }
    }
}
