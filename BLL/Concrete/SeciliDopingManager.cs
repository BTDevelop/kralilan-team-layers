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
    public class SeciliDopingManager : ISeciliDopingService
    {
        private ISeciliDopinglerDal _seciliDopingDal;

        public SeciliDopingManager(ISeciliDopinglerDal seciliDopingDal)
        {
            _seciliDopingDal = seciliDopingDal;
        }

        public void Add(seciliDoping entity)
        {
            _seciliDopingDal.Add(entity);
        }

        public int CountByDopingId(int DopingId)
        {
            return _seciliDopingDal.CountByDopingId(DopingId);
        }

        public void Delete(seciliDoping entity)
        {
            throw new NotImplementedException();
        }

        public seciliDoping Get(int Id)
        {
            return _seciliDopingDal.Get(Id);
        }

        public List<seciliDoping> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<SeciliDoping> GetAllByAdsId(int AdsId)
        {
            return _seciliDopingDal.GetAllByAdsId(AdsId);
        }

        public List<Ilan> GetAllByCategoriShowcase(int CategoriId)
        {
            return _seciliDopingDal.GetAllByCategoriShowcase(CategoriId);
        }

        public List<Ilan> GetAllByDopingId(int DopingId)
        {
            return _seciliDopingDal.GetAllByDopingId(DopingId);
        }

        public List<Ilan> GetAllByDopingIdFaceted(int DopingId, int Index, SortTypeString SortType)
        {
            return _seciliDopingDal.GetAllByDopingIdFaceted(DopingId, Index, SortType);
        }

        public seciliDoping GetByAdsId(int AdsId)
        {
            return _seciliDopingDal.GetByAdsId(AdsId);
        }

        public void Update(seciliDoping entity)
        {
            throw new NotImplementedException();
        }

        public void UpdateByAdsId(int AdsId)
        {
           _seciliDopingDal.UpdateByAdsId(AdsId);
        }
    }
}
