using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IMagazaKullanicilarDal : IEntityRepository<magazaKullanici>
    {

        magazaKullanici GetByUserId(int UserId);

        List<MagazaKullanici> GetByStoreId(int StoreId);
        int Count(int StoreId);

        IQueryable GetAllByStoreId(int StoreId);
    }
}
