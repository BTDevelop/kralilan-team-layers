using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IOzellikService
    {
        List<ozellikler> GetAll();

        ozellikler Get(int Id);

        void Add(ozellikler entity);

        void Delete(ozellikler entity);

        void Update(ozellikler entity);

        List<Ozellik> GetAllByCategoriId(int CategoriId);

    }
}
