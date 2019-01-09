using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IIlcelerDal : IEntityRepository<ilceler>
    {

        List<ilceler> GetByRegionId(int RegionId);
    }
}
