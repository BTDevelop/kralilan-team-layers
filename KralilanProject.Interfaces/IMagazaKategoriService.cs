using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IMagazaKategoriService
    {
        List<magazaKategori> GetAll();

        magazaKategori Get(int Id);

        void Add(magazaKategori entity);

        void Delete(magazaKategori entity);

        void Update(magazaKategori entity);

        magazaKategori GetByPackageCategoriId(int CategoriId, int PackageTimeId, int StorePackageId);

        magazaKategori GetByCategoriId(int CategoriId);


    }
}
