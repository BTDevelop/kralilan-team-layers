using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IMagazaKategorilerDal : IEntityRepository<magazaKategori>
    {
        magazaKategori GetByPackageCategoriId(int CategoriId, int PackageTimeId, int StorePackageId);

        magazaKategori GetByCategoriId(int CategoriId);

    }
}
