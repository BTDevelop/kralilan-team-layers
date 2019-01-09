using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IDopingService
    {
        List<doping> GetAll();
        doping Get(int Id);

        void Add(doping entity);

        void Delete(doping entity);

        void Update(doping entity);

    }
}
