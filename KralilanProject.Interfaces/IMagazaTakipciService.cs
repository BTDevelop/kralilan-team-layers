using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IMagazaTakipciService
    {
        List<magazaTakip> GetAll();

        magazaTakip Get(int Id);

        void Add(magazaTakip entity);

        void Delete(magazaTakip entity);

        void Update(magazaTakip entity);

        int CountByStoreId(int StoreId);

        magazaTakip GetStoreUserId(int StoreId, int UserId);

        int CountByUserId(int UserId);


    }
}
