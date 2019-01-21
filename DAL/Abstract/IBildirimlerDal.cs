using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IBildirimlerDal : IEntityRepository<bildirimler>
    {
        int Count(int toId);

        List<Bildirim> GetByUserId(int UserId, int Index);

        void UpdateByReceiver(int Id);

        void UpdateByRead(int Id);

    }
}
