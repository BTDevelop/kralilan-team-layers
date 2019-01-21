using KralilanProject.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Enums;

namespace KralilanProject.Interfaces
{
    public interface IIlanService
    {
        List<ilan> GetAll();

        ilan Get(int Id);

        void Add(ilan entity);

        void Delete(ilan entity);

        void Update(ilan entity);

        List<Ilan> GetByLastDate();

        List<Ilan> GetBySale();

        ilan GetLast();

        ilan GetLastByUserId(int UserId);

        bool IsOwnerAds(int AdsId, int UserId, int StoreId);

        List<Ilan> GetByLastDateFaceted(SortTypeString SortType);

        List<Ilan> GetBySaleFaceted(SortTypeString SortType);

        List<Ilan> GetByUserIdFaceted(int UserId);

        List<IlanSayi> GetAllRegion();

        List<Ilan> GetByLocationRound(int RegionId, int CityId);

        List<Ilan> GetFaceted(int Index, int[] GeneralFilter, Filtre OtherFilter);

        int CountByStoreId(int StoreId);

        int CountByUserStoreId(int UserId, int StoreId);

        void UpdatePicturesByAdsId(int AdsId, string Pictures);

        void UpdateStatus(int AdsId, int IsVerify, bool IsPass, bool IsDelete, bool IsSale);

        List<Ilan> GetSitemap(int Year, int Month);

        int CountLastDate();

        int CountSale();

    }
}
