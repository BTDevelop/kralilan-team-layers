using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IKullaniciTakipcilerDal : IEntityRepository<kullaniciTakip>
    {
        kullaniciTakip GetUserFollowerId(int UserId, int FollowerId);

        int CountFollower(int Id);

        int CountFollowed(int Id);

        IEnumerable<object> GetFollower(int Id);

        IEnumerable<object> GetFollowed(int Id);

    }
}
