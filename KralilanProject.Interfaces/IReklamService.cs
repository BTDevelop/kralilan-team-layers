using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IReklamService
    {
        List<reklam> GetAll();

        reklam Get(int Id);

        void Add(reklam entity);

        void Delete(reklam entity);

        void Update(reklam entity);

        reklam GetTypeLocationId(int Type, int LocationId);
    }
}
