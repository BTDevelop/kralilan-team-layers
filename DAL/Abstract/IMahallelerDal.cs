using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IMahallelerDal : IEntityRepository<mahalleler>
    {
        List<mahalleler> GetAllByCityId(int CityId);
    }
}
