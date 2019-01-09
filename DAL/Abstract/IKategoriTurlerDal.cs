using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IKategoriTurlerDal : IEntityRepository<kategoriTur>
    {

        string GetByCategoriIdStr(int CategoriId);

        IEnumerable<object> GetByCategoriId(int CategoriId);

        IEnumerable<object> GetByCategoriTypeId(int CategoriId, int TypeId);
    }
}
