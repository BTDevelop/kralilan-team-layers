using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IDopingKategoriService
    {
        List<dopingKategori> GetAll();

        dopingKategori Get(int Id);

        void Add(dopingKategori entity);

        void Delete(dopingKategori entity);

        void Update(dopingKategori entity);

        List<DopingKategori> GetByDopingKategoriId(int DopingId, int KategoriId);

    }
}
