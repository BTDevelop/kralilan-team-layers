using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IMagazaKullaniciService
    {
        List<magazaKullanici> GetAll();

        magazaKullanici Get(int Id);

        void Add(magazaKullanici entity);

        void Delete(magazaKullanici entity);

        void Update(magazaKullanici entity);

        magazaKullanici GetByUserId(int UserId);

        List<MagazaKullanici> GetByStoreId(int StoreId);

        int Count(int StoreId);






    }
}
