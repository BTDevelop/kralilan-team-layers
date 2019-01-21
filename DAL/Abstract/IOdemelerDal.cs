using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace DAL.Abstract
{
    public interface IOdemelerDal : IEntityRepository<odeme>
    {
        odeme GetLast();

        List<Odeme> GetByUserId(int UserId);

        List<Odeme> GetByProjeId(int ProjeId);
    }
}
