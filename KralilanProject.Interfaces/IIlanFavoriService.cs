using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IIlanFavoriService
    {
        List<ilanFavori> GetAll();

        ilanFavori Get(int Id);

        void Add(ilanFavori entity);

        void Delete(ilanFavori entity);

        void Update(ilanFavori entity);

        ilanFavori GetByAdsUserId(int AdsId, int UserId);

        List<Ilan> GetByUserId(int UserId, int Index);

        int Count(int UserId);
    }
}
