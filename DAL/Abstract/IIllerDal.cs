using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IIllerDal : IEntityRepository<iller>
    {
        List<Il> GetRegions();
    }
}
