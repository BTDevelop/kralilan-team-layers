using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IZiyaretcilerDal : IEntityRepository<ziyaretci>
    {
        int Count(int AdsId);
    }
}
