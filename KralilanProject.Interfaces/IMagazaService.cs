using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IMagazaService
    {

        List<magaza> GetAll();

        magaza Get(int Id);

        void Add(magaza entity);

        void Delete(magaza entity);

        void Update(magaza entity);

        magaza GetLast();

        List<Magaza> GetAllByStoreCategori(int StoreCategori);

        void UpdateStatus(int StoreId, bool Status, bool Deleted);

        void UpdateManager(magaza entity);

    }
}
