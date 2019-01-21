using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IIlanSayiService
    {
        List<ilanSayi> GetAll();

        ilanSayi Get(int Id);

        void Add(ilanSayi entity);

        void Delete(ilanSayi entity);

        void Update(ilanSayi entity);

        List<IlanSayi> GetAllByTopCategoriId(int TopCategoriId);

        List<IlanSayi> GetAllCategoriByTopCategoriId(int TopCategoriId);

        int CountByCategoriTypeId(int CategoriId, int TypeId);

        int CountByCategoriId(int CategoriId);

        int CountAll();


    }
}
