using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Enums;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IIlanSatilanService
    {
        List<ilanSatilan> GetAll();

        ilanSatilan Get(int Id);

        void Add(ilanSatilan entity);

        void Delete(ilanSatilan entity);

        void Update(ilanSatilan entity);

        List<Ilan> GetBySale();

        List<Ilan> GetBySaleFaceted(int Index, SortTypeString SortType);

        int Count();
    }
}
