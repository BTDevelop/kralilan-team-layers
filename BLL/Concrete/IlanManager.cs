using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using DAL.Enums;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class IlanManager : IIlanService
    {
        private IIlanlarDal _ilanlarDal;

        public IlanManager(IIlanlarDal ilanlarDal)
        {
            _ilanlarDal = ilanlarDal;
        }

        public void Add(ilan entity)
        {
           _ilanlarDal.Add(entity);
        }

        public int CountByStoreId(int StoreId)
        {
            return _ilanlarDal.CountByStoreId(StoreId);
        }

        public int CountByUserStoreId(int UserId, int StoreId)
        {
            return _ilanlarDal.CountByUserStoreId(UserId, StoreId);
        }

        public int CountLastDate()
        {
            return _ilanlarDal.CountLastDate();
        }

        public int CountSale()
        {
            return _ilanlarDal.CountSale();
        }

        public void Delete(ilan entity)
        {
            throw new NotImplementedException();
        }

        public ilan Get(int Id)
        {
            return _ilanlarDal.Get(Id);
        }

        public List<ilan> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<IlanSayi> GetAllRegion()
        {
            return _ilanlarDal.GetAllRegion();
        }

        public List<Ilan> GetByLastDate()
        {
           return _ilanlarDal.GetByLastDate();
        }

        public List<Ilan> GetByLastDateFaceted(SortTypeString SortType)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetByLocationRound(int RegionId, int CityId)
        {
            return _ilanlarDal.GetByLocationRound(RegionId, CityId);
        }

        public List<Ilan> GetBySale()
        {
            return _ilanlarDal.GetBySale();
        }

        public List<Ilan> GetBySaleFaceted(SortTypeString SortType)
        {
            return _ilanlarDal.GetBySaleFaceted(SortType);
        }

        public List<Ilan> GetByUserIdFaceted(int UserId)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetFaceted(int Index, int[] GeneralFilter, Filtre OtherFilter)
        {
            return _ilanlarDal.GetFaceted(Index, GeneralFilter, OtherFilter);
        }

        public ilan GetLast()
        {
            return _ilanlarDal.GetLast();
        }

        public ilan GetLastByUserId(int UserId)
        {
            return _ilanlarDal.GetLastByUserId(UserId);
        }

        public List<Ilan> GetSitemap(int Year, int Month)
        {
            return _ilanlarDal.GetSitemap(Year, Month);
        }

        public bool IsOwnerAds(int AdsId, int UserId, int StoreId)
        {
            return _ilanlarDal.IsOwnerAds(AdsId, UserId, StoreId);
        }

        public void Update(ilan entity)
        {
           _ilanlarDal.Update(entity);
        }

        public void UpdatePicturesByAdsId(int AdsId, string Pictures)
        {
            _ilanlarDal.UpdatePicturesByAdsId(AdsId, Pictures);
        }

        public void UpdateStatus(int AdsId, int IsVerify, bool IsPass, bool IsDelete, bool IsSale)
        {
            _ilanlarDal.UpdateStatus(AdsId, IsVerify, IsPass, IsDelete, IsSale);
        }
    }
}
