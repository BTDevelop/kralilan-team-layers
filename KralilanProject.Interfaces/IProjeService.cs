using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IProjeService
    {

        List<projeler> GetAll();

        projeler Get(int Id);

        void Add(projeler entity);

        void Delete(projeler entity);

        void Update(projeler entity);

        void UpdateLast(projeler entity);

        void UpdateStatus(projeler entity);

        List<Proje> GetRandom(int RegionId);

        projeler GetLast();

        int Count();

        bool IsByUserId(int UserId);

        List<Proje> GetByUserId(int UserId);

        List<Proje> GetByCompanyId(int CompanyId);

        List<IlanSayi> CountAllByRegionId();

        Proje GetProjectRandom(int RegionId);
    }
}
