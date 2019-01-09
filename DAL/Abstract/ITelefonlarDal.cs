using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface ITelefonlarDal : IEntityRepository<telefonlar>
    {
        telefonlar GetByUserId(int UserId, int Type);

        List<telefonlar> GetAllByUserId(int UserId);

        List<telefonlar> GetAllByUserTypeId(int UserId, int Type);
    }
}
