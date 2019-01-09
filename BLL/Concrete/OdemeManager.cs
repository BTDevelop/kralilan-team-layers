using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class OdemeManager : IOdemeService
    {
        private IOdemelerDal _odemelerDal;
        public OdemeManager(IOdemelerDal odemelerDal)
        {
            _odemelerDal = odemelerDal;
        }
        public void Add(odeme entity)
        {
            _odemelerDal.Add(entity);
        }

        public void Delete(odeme entity)
        {
            throw new NotImplementedException();
        }

        public odeme Get(int Id)
        {
            return _odemelerDal.Get(Id);
        }

        public List<odeme> GetAll()
        {
            throw new NotImplementedException();
        }

        public odeme GetLast()
        {
            return _odemelerDal.GetLast();
        }

        public void Update(odeme entity)
        {
            _odemelerDal.Update(entity);
        }
    }
}
