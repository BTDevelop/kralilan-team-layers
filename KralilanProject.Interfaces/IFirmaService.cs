using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IFirmaService
    {
        List<firmalar> GetAll();

        firmalar Get(int Id);

        void Add(firmalar entity);

        void Delete(firmalar entity);

        void Update(firmalar entity);

        List<Firma> GetAllByUserId(int UserId);

        firmalar GetLast();
    }
}
