using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IProjelerDal : IEntityRepository<projeler>
    {
        void UpdateLast(projeler entity);

        void UpdateStatus(projeler entity);

        List<Proje> GetRandom(int RegionId);

        projeler GetLast();

        int Count();

        bool IsByUserId(int UserId);

        List<Proje> GetByUserId(int UserId);

        List<Proje> GetByCompanyId(int CompanyId);

        List<IlanSayi> CountAllByRegionId();

    }
}
