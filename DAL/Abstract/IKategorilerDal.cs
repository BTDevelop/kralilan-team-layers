using KralilanProject.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IKategorilerDal : IEntityRepository<kategori>
    {

        kategori GetByTopCategori(int topCategoriId);

        List<kategori> GetAllByTopCategori();

        List<Kategori> GetAllCategori();

        List<kategori> GetAllByCategoriId(int CategoriId);
    }
}
