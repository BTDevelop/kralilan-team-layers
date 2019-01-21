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
    public class MahalleManager : IMahalleService
    {
        private IMahallelerDal _mahallelerDal;
        public MahalleManager(IMahallelerDal mahallelerDal)
        {
            _mahallelerDal = mahallelerDal;
        }

        public void Add(mahalleler entity)
        {
            _mahallelerDal.Add((entity));
        }

        public void Delete(mahalleler entity)
        {
            throw new NotImplementedException();
        }

        public mahalleler Get(int Id)
        {
           return _mahallelerDal.Get(Id);
        }

        public List<mahalleler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Mahalle> GetAllByCityId(int CityId)
        {
            return _mahallelerDal.GetAllByCityId(CityId);
        }

        public void Update(mahalleler entity)
        {
            _mahallelerDal.Update(entity);
        }
    }
}
