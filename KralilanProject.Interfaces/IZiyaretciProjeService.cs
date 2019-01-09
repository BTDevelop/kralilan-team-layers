using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IZiyaretciProjeService
    {
        List<ziyaretproje> GetAll();

        ziyaretproje Get(int Id);

        void Add(ziyaretproje entity);

        void Delete(ziyaretproje entity);

        void Update(ziyaretproje entity);

        int Count(int ProjectId, bool Type);

    }
}
