using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using DAL.Enums;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class IlanSatilanManager : IIlanSatilanService
    {
        private IIlanSatilanDal _ilanSatilanDal;
        public IlanSatilanManager(IIlanSatilanDal ilanSatilanDal)
        {
            _ilanSatilanDal = ilanSatilanDal;
        }

        public void Add(ilanSatilan entity)
        {
            throw new NotImplementedException();
        }

        public int Count()
        {
            return _ilanSatilanDal.Count();
        }

        public void Delete(ilanSatilan entity)
        {
            throw new NotImplementedException();
        }

        public ilanSatilan Get(int Id)
        {
            return _ilanSatilanDal.Get(Id);
        }

        public List<ilanSatilan> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetBySale()
        {
            return _ilanSatilanDal.GetBySale();
        }

        public List<Ilan> GetBySaleFaceted(int Index, SortTypeString SortType)
        {
            return _ilanSatilanDal.GetBySaleFaceted(Index, SortType);
        }

        public void Update(ilanSatilan entity)
        {
            throw new NotImplementedException();
        }
    }
}
