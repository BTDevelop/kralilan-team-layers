using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IIlanSayilarDal : IEntityRepository<ilanSayi>
    {
        List<IlanSayi> GetAllByTopCategoriId(int TopCategoriId);
        List<IlanSayi> GetAllCategoriByTopCategoriId(int TopCategoriId);

    }
}
