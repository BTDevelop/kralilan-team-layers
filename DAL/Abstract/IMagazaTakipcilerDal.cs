using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IMagazaTakipcilerDal : IEntityRepository<magazaTakip>
    {
        int CountByStoreId(int StoreId);

        magazaTakip GetStoreUserId(int StoreId, int UserId);

        int CountByUserId(int UserId);

    }
}
