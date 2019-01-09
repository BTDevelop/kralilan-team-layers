using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Interfaces
{
    public interface IBildirimService
    {
        List<bildirimler> GetAll();

        bildirimler Get(int Id);

        void Add(bildirimler entity);

        void Delete(bildirimler entity);

        void Update(bildirimler entity);

        int Count(int toId);

        IQueryable GetByUserId(int UserId);

        void UpdateByReceiver(int Id);

        void UpdateByRead(int Id);
    }
}
