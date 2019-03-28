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
    public class IlanBakilanManager : IIlanBakilanService
    {
        private IIlanBakilanlarDal _ilanBakilanlarDal;
        public IlanBakilanManager(IIlanBakilanlarDal ilanBakilanlarDal)
        {
            _ilanBakilanlarDal = ilanBakilanlarDal;
        }

        public void Add(ilanBakilanlar entity)
        {
            _ilanBakilanlarDal.Add(entity);
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

        public ilanBakilanlar GetByAdsUserId(int AdsId, int UserId)
        {
            return _ilanBakilanlarDal.GetByAdsUserId(AdsId, UserId);
        }

        public void Update(ilanBakilanlar entity)
        {
            throw new NotImplementedException();
        }
    }
}
