using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Enums;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IIlanSatilanDal : IEntityRepository<ilanSatilan>
    {
        List<Ilan> GetBySale();

        List<Ilan> GetBySaleFaceted(int Index, SortTypeString SortType);

        int Count();
    }
}
