using KralilanProject.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IOzelliklerDal : IEntityRepository<ozellikler>
    {
        List<Ozellik> GetAllByCategoriId(int CategoriId);

        string GetPropValueId(int PropertyId, int PropertyValueId);
    }
}
