using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IDopingKategorilerDal : IEntityRepository<dopingKategori>
    {
        List<DopingKategori> GetByDopingKategoriId(int DopingId, int KategoriId);
    }
}
