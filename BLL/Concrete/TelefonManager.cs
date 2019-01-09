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
    public class TelefonManager : ITelefonService
    {
        private ITelefonlarDal _telefonlarDal;
        public TelefonManager(ITelefonlarDal telefonlarDal)
        {
            _telefonlarDal = telefonlarDal;
        }

        public void Add(telefonlar entity)
        {
            _telefonlarDal.Add(entity);
        }

        public void Delete(telefonlar entity)
        {
            _telefonlarDal.Delete(entity);
        }

        public telefonlar Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<telefonlar> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<telefonlar> GetAllByUserId(int UserId)
        {
            return _telefonlarDal.GetAllByUserId(UserId);
        }

        public List<telefonlar> GetAllByUserTypeId(int UserId, int Type)
        {
            return _telefonlarDal.GetAllByUserTypeId(UserId, Type);
        }

        public telefonlar GetByUserId(int UserId, int Type)
        {
            return _telefonlarDal.GetByUserId(UserId, Type);
        }

        public void Update(telefonlar entity)
        {
            _telefonlarDal.Update(entity);
        }
    }
}
