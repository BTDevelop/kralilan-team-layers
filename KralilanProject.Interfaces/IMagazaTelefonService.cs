using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IMagazaTelefonService
    {
        List<magazaTelefon> GetAll();

        magazaTelefon Get(int Id);

        void Add(magazaTelefon entity);

        void Delete(magazaTelefon entity);

        void Update(magazaTelefon entity);

        magazaTelefon GetStoreTypeId(int StoreId, int Type);
        List<magazaTelefon> GetAllByStoreId(int StoreId);
    }
}
