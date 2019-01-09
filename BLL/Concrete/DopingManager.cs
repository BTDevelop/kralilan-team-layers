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
    public class DopingManager : IDopingService
    {
        private IDopinglerDal _dopinglerDal;
        public DopingManager(IDopinglerDal dopinglerDal)
        {
            _dopinglerDal = dopinglerDal;
        }

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
            return _dopinglerDal.GetAll();
        }

        public void Update(doping entity)
        {
            throw new NotImplementedException();
        }
    }
}
