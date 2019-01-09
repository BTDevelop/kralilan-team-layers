using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IFirmalarDal : IEntityRepository<firmalar>
    {

        firmalar GetLast();

        List<Firma> GetAllByUserId(int UserId);

    }
}
