using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IIlanFavorilerDal : IEntityRepository<ilanFavori>
    {
        ilanFavori GetByAdsUserId(int AdsId, int UserId);

        IQueryable GetByUserId(int UserId);

        int Count(int UserId);

    }
}
