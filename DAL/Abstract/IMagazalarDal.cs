using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IMagazalarDal : IEntityRepository<magaza>
    {

        magaza GetLast();

        List<Magaza> GetAllByStoreCategori(int StoreCategori);

        void UpdateStatus(int StoreId, bool Status, bool Deleted);

        void UpdateManager(magaza entity);
    }
}
