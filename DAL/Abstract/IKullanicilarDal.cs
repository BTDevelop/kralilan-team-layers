using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IKullanicilarDal : IEntityRepository<kullanici>
    {

        void UpdateByPassword(int UserId, string Password);

        void UpdateBySessionInfo(int UserId, string Browser, string IPAddress);

        void UpdateByOnlineStatus(int UserId, int SessionTime);

        void UpdateByEmail(int UserId, string Email);

        kullanici GetByEmail(string Email);

        bool IsDuplicate(string Email, string Phone);

        kullanici GetLast();

        void UpdateByManager(kullanici entity);

        IQueryable GetOnline();

        IQueryable GetAllLast();

        void UpdateJetonByUserId(int UserId, int JetonCount);

    }
}
