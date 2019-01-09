using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IVerilenReklamlarDal : IEntityRepository<verilenReklam>
    {
        verilenReklam GetLast();

        void UpdatePicture(int AdsId, string Picture);
    }
}
