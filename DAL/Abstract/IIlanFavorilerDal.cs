using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IIlanFavorilerDal : IEntityRepository<ilanFavori>
    {
        ilanFavori GetByAdsUserId(int AdsId, int UserId);

        List<Ilan> GetByUserId(int UserId, int Index);

        int Count(int UserId);

    }
}
