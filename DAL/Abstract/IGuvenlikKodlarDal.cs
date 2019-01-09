using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IGuvenlikKodlarDal : IEntityRepository<guvenlikKodlari>
    {
        guvenlikKodlari GetBySecureCode(string Code);

        guvenlikKodlari GetByPhone(string Phone);

    }
}
