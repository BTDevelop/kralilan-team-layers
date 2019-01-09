using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface ITelefonService
    {
        List<telefonlar> GetAll();

        telefonlar Get(int Id);

        void Add(telefonlar entity);

        void Delete(telefonlar entity);

        void Update(telefonlar entity);

        telefonlar GetByUserId(int UserId, int Type);

        List<telefonlar> GetAllByUserId(int UserId);

        List<telefonlar> GetAllByUserTypeId(int UserId, int Type);
    }
}
