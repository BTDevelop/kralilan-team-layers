using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class ProjeManager : IProjeService
    {

        private IProjelerDal _projeDal;

        public ProjeManager(IProjelerDal projeDal)
        {
            _projeDal = projeDal;
        }

        public void Add(projeler entity)
        {
            _projeDal.Add(entity);
        }

        public int Count()
        {
            return _projeDal.Count();
        }

        public List<IlanSayi> CountAllByRegionId()
        {
            return _projeDal.CountAllByRegionId();
        }

        public void Delete(projeler entity)
        {
            throw new NotImplementedException();
        }

        public projeler Get(int Id)
        {
            return _projeDal.Get(Id);
        }

        public List<projeler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Proje> GetByCompanyId(int CompanyId)
        {
            throw new NotImplementedException();
        }

        public List<Proje> GetByUserId(int UserId)
        {
            throw new NotImplementedException();
        }

        public projeler GetLast()
        {
            return _projeDal.GetLast();
        }

        public Proje GetProjectRandom(int RegionId)
        {
            Random _Random = new Random();
            List<Proje> RandomList = new List<Proje>();
            RandomList = _projeDal.GetRandom(RegionId);

            int ProjeCount = 0;
            if (RegionId != -1) { ProjeCount = RandomList.Where(x => x.IlId == RegionId).Count(); }
            else { ProjeCount = RandomList.Count(); }

            Proje projeResult = null;
            if (ProjeCount > 0)
            {
                int index = _Random.Next(RandomList.Count());
                projeResult = RandomList[index];     
            }

            return projeResult;
        }

        public List<Proje> GetRandom(int RegionId)
        {
            throw new NotImplementedException();
        }

        public bool IsByUserId(int UserId)
        {
            return _projeDal.IsByUserId(UserId);
        }

        public void Update(projeler entity)
        {
            _projeDal.Update(entity);
        }

        public void UpdateLast(projeler entity)
        {
            _projeDal.UpdateLast(entity);
        }

        public void UpdateStatus(projeler entity)
        {
           _projeDal.UpdateStatus(entity);
        }
    }
}
