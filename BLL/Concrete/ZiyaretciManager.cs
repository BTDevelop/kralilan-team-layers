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
    public class ZiyaretciManager : IZiyaretciService
    {
        private IZiyaretcilerDal _ziyaretcilerDal;
        public ZiyaretciManager(IZiyaretcilerDal ziyaretcilerDal)
        {
            _ziyaretcilerDal = ziyaretcilerDal;
        }

        public void Add(ziyaretci entity)
        {
            _ziyaretcilerDal.Add(entity);
        }

        public int Count(int AdsId)
        {
           return _ziyaretcilerDal.Count(AdsId);
        }

        public void Delete(ziyaretci entity)
        {
            throw new NotImplementedException();
        }

        public ziyaretci Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<ziyaretci> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(ziyaretci entity)
        {
            throw new NotImplementedException();
        }
    }
}
