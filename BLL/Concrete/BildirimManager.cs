using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace KralilanProject.BLL.Concrete
{
    public class BildirimManager : IBildirimService
    {

        private IBildirimlerDal _bildirimDal;

        public BildirimManager(IBildirimlerDal bildirimDal)
        {
            _bildirimDal = bildirimDal;
        }

        public void Add(bildirimler entity)
        {
            _bildirimDal.Add(entity);
        }

        public int Count(int toId)
        {
            return _bildirimDal.Count(toId);
        }

        public void Delete(bildirimler entity)
        {
            throw new NotImplementedException();
        }

        public bildirimler Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<bildirimler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Bildirim> GetByUserId(int UserId, int Index)
        {
           return _bildirimDal.GetByUserId(UserId, Index);
        }

        public void Update(bildirimler entity)
        {
            throw new NotImplementedException();
        }

        public void UpdateByRead(int Id)
        {
            throw new NotImplementedException();
        }

        public void UpdateByReceiver(int Id)
        {
            throw new NotImplementedException();
        }
    }
}
