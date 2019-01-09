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
    public class GuvenlikKodManager : IGuvenlikKodService
    {
        private IGuvenlikKodlarDal _guvenlikKodlarDal;
        public GuvenlikKodManager(IGuvenlikKodlarDal guvenlikKodlarDal)
        {
            _guvenlikKodlarDal = guvenlikKodlarDal;
        }
        public void Add(guvenlikKodlari entity)
        {
            _guvenlikKodlarDal.Add(entity);
        }

        public void Delete(guvenlikKodlari entity)
        {
            throw new NotImplementedException();
        }

        public guvenlikKodlari Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<guvenlikKodlari> GetAll()
        {
            throw new NotImplementedException();
        }

        public guvenlikKodlari GetByPhone(string Phone)
        {
            return _guvenlikKodlarDal.GetByPhone(Phone);
        }

        public guvenlikKodlari GetBySecureCode(string Code)
        {
            return _guvenlikKodlarDal.GetBySecureCode(Code);
        }

        public void Update(guvenlikKodlari entity)
        {
            _guvenlikKodlarDal.Update(entity);
        }
    }
}
