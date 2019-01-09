using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IDopingKategorilerDal : IEntityRepository<dopingKategori>
    {
        IQueryable GetByDopingKategoriId(int DopingId, int KategoriId);
    }
}
