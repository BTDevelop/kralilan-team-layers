using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IIlService
    {
        List<iller> GetAll();

        iller Get(int Id);

        void Add(iller entity);

        void Delete(iller entity);

        void Update(iller entity);

        List<Il> GetRegions();
    }
}
