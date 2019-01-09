using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;
using DAL.Enums;

namespace DAL.Abstract
{
    public interface IIlanlarDal : IEntityRepository<ilan>
    {
        List<Ilan> GetByLastDate();

        List<Ilan> GetBySale();

        ilan GetLast();

        ilan GetLastByUserId(int UserId);

        bool IsOwnerAds(int AdsId, int UserId, int StoreId);

        List<Ilan> GetByLastDateFaceted(SortTypeString SortType);

        List<Ilan> GetBySaleFaceted(SortTypeString SortType);

        List<Ilan> GetByUserIdFaceted(int UserId);

        int CountByStoreId(int StoreId);

        void UpdatePicturesByAdsId(int AdsId, string Pictures);

        void UpdateStatus(int AdsId, int IsVerify, bool IsPass, bool IsDelete, bool IsSale);
    }
}
