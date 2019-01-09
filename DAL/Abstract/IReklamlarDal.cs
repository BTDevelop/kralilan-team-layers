using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IReklamlarDal : IEntityRepository<reklam>
    {
        reklam GetTypeLocationId(int Type, int LocationId);

    }
}
