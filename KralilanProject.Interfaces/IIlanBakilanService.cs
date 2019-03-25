using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;

namespace KralilanProject.Interfaces
{
    public interface IIlanBakilanService 
    {
        List<ilanBakilanlar> GetAll();
        ilanBakilanlar Get(int Id);

        void Add(ilanBakilanlar entity);

        void Delete(ilanBakilanlar entity);

        void Update(ilanBakilanlar entity);

        ilanBakilanlar GetByAdsUserId(int AdsId, int UserId);
    }
}
