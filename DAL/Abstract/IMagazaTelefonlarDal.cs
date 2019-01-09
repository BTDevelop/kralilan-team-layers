using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IMagazaTelefonlarDal : IEntityRepository<magazaTelefon>
    {
        magazaTelefon GetStoreTypeId(int StoreId, int Type);
        List<magazaTelefon> GetAllByStoreId(int StoreId);
    }
}
