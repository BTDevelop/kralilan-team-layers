using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IVerilenReklamService
    {
        List<verilenReklam> GetAll();

        verilenReklam Get(int Id);

        void Add(verilenReklam entity);

        void Delete(verilenReklam entity);

        void Update(verilenReklam entity);

        verilenReklam GetLast();

        void UpdatePicture(int AdsId, string Picture);
    }
}
