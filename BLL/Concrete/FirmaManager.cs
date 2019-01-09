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
    public class FirmaManager : IFirmaService
    {
        private IFirmalarDal _firmalarDal;
        public FirmaManager(IFirmalarDal firmalarDal)
        {
            _firmalarDal = firmalarDal;
        }
        public void Add(firmalar entity)
        {
            _firmalarDal.Add(entity);
        }

        public void Delete(firmalar entity)
        {
            throw new NotImplementedException();
        }

        public firmalar Get(int Id)
        {
            return _firmalarDal.Get(Id);
        }

        public List<firmalar> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Firma> GetAllByUserId(int UserId)
        {
            return _firmalarDal.GetAllByUserId(UserId);
        }

        public firmalar GetLast()
        {
            return _firmalarDal.GetLast();
        }

        public void Update(firmalar entity)
        {
            throw new NotImplementedException();
        }
    }
}
