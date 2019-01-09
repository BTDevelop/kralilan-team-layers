using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Interfaces
{
    public interface IKategoriService
    {
        List<kategori> GetAll();

        kategori Get(int Id);

        void Add(kategori entity);

        void Delete(kategori entity);

        void Update(kategori entity);

        List<kategori> GetAllByCategoriId(int CategoriId);


    }
}
