using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IIlceService
    {
        List<ilceler> GetAll();

        ilceler Get(int Id);

        void Add(ilceler entity);

        void Delete(ilceler entity);

        void Update(ilceler entity);

        List<Ilce> GetByRegionId(int RegionId);

    }
}
