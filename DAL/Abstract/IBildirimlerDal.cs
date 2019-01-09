using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IBildirimlerDal : IEntityRepository<bildirimler>
    {
        int Count(int toId);

        IQueryable GetByUserId(int UserId);

        void UpdateByReceiver(int Id);

        void UpdateByRead(int Id);

    }
}
