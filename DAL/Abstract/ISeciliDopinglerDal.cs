using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Enums;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface ISeciliDopinglerDal : IEntityRepository<seciliDoping>
    {
        List<Ilan> GetAllByCategoriShowcase(int CategoriId);

        List<Ilan> GetAllByDopingId(int DopingId);

        List<Ilan> GetAllByDopingIdFaceted(int DopingId, int Index, SortTypeString SortType);

        int CountByDopingId(int DopingId);

        seciliDoping GetByAdsId(int AdsId);

        List<SeciliDoping> GetAllByAdsId(int AdsId);

        void UpdateByAdsId(int AdsId);
    }
}
