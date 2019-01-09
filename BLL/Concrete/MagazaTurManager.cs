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
    public class MagazaTurManager : IMagazaTurService
    {
        private IMagazaTurlerDal _magazaTurlerDal;
        public MagazaTurManager(IMagazaTurlerDal magazaTurlerDal)
        {
            _magazaTurlerDal = magazaTurlerDal;
        }
        public void Add(magazaTur entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(magazaTur entity)
        {
            throw new NotImplementedException();
        }

        public magazaTur Get(int Id)
        {
           return _magazaTurlerDal.Get(Id);
        }

        public List<magazaTur> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(magazaTur entity)
        {
            throw new NotImplementedException();
        }
    }
}
