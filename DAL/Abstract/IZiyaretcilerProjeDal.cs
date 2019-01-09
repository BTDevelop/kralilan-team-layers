using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IZiyaretcilerProjeDal : IEntityRepository<ziyaretproje>
    {
        int Count(int ProjectId, bool Type);
    }
}
