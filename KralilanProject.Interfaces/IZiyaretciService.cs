using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IZiyaretciService
    {
        List<ziyaretci> GetAll();
        ziyaretci Get(int Id);

        void Add(ziyaretci entity);

        void Delete(ziyaretci entity);

        void Update(ziyaretci entity);

        int Count(int AdsId);

    }
}
