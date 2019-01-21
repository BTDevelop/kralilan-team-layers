using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IKategoriTurService
    {
        List<kategoriTur> GetAll();

        kategoriTur Get(int Id);

        void Add(kategoriTur entity);

        void Delete(kategoriTur entity);

        void Update(kategoriTur entity);

        string GetByCategoriIdStr(int CategoriId);

        IEnumerable<object> GetByCategoriId(int CategoriId);

        IEnumerable<object> GetByCategoriTypeId(int CategoriId, int TypeId);

        IEnumerable<object> GetAllByCategoriTypeId(int CategoriId, int TypeId);

    }
}
