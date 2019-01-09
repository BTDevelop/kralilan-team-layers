using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IMahalleService
    {
        List<mahalleler> GetAll();

        mahalleler Get(int Id);

        void Add(mahalleler entity);

        void Delete(mahalleler entity);

        void Update(mahalleler entity);
        List<mahalleler> GetAllByCityId(int CityId);

    }
}
