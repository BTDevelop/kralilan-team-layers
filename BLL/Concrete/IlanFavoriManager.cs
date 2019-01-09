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
    public class IlanFavoriManager : IIlanFavoriService
    {
        private IIlanFavorilerDal _ilanFavorilerDal;
        public IlanFavoriManager(IIlanFavorilerDal ilanFavorilerDal)
        {
            _ilanFavorilerDal = ilanFavorilerDal;
        }

        public void Add(ilanFavori entity)
        {
            throw new NotImplementedException();
        }

        public int Count(int UserId)
        {
            return _ilanFavorilerDal.Count(UserId);
        }

        public void Delete(ilanFavori entity)
        {
           _ilanFavorilerDal.Delete(entity);
        }

        public ilanFavori Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<ilanFavori> GetAll()
        {
            throw new NotImplementedException();
        }

        public ilanFavori GetByAdsUserId(int AdsId, int UserId)
        {
            throw new NotImplementedException();
        }

        public IQueryable GetByUserId(int UserId)
        {
            throw new NotImplementedException();
        }

        public void Update(ilanFavori entity)
        {
            throw new NotImplementedException();
        }
    }
}
