using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IMagazaTurService
    {
        List<magazaTur> GetAll();

        magazaTur Get(int Id);

        void Add(magazaTur entity);

        void Delete(magazaTur entity);

        void Update(magazaTur entity);
    }
}
