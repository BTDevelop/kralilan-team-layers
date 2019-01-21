using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IVerilenReklamlarDal : IEntityRepository<verilenReklam>
    {
        verilenReklam GetLast();

        void UpdatePicture(int AdsId, string Picture);

        Reklam GetByRegionTypeId(int RegionId, int Type);

    }
}
