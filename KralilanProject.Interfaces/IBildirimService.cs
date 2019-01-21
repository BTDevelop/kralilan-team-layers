using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

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

        List<Bildirim> GetByUserId(int UserId, int Index);

        void UpdateByReceiver(int Id);

        void UpdateByRead(int Id);
    }
}
