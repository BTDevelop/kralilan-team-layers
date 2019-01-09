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
    public class ReklamManager : IReklamService
    {
        private IReklamlarDal _reklamlarDal;

        public ReklamManager(IReklamlarDal reklamlarDal)
        {
            _reklamlarDal = reklamlarDal;
        }

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
            return _reklamlarDal.Get(Id);
        }

        public List<reklam> GetAll()
        {
            throw new NotImplementedException();
        }

        public reklam GetTypeLocationId(int Type, int LocationId)
        {
            return _reklamlarDal.GetTypeLocationId(Type, LocationId);
        }

        public void Update(reklam entity)
        {
            throw new NotImplementedException();
        }
    }
}
