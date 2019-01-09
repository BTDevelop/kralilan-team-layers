using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IVergiDaireService
    {
        List<vergiDaire> GetAll();

        vergiDaire Get(int Id);

        void Add(vergiDaire entity);

        void Delete(vergiDaire entity);

        void Update(vergiDaire entity);

        List<VergiDaire> GetByRegionId(int RegionId);


    }
}
