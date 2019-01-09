using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Interfaces
{
    public interface IKullaniciTakipService
    {
        List<kullaniciTakip> GetAll();

        kullaniciTakip Get(int Id);

        void Add(kullaniciTakip entity);

        void Delete(kullaniciTakip entity);

        void Update(kullaniciTakip entity);

        kullaniciTakip GetUserFollowerId(int UserId, int FollowerId);

        int CountFollower(int Id);

        int CountFollowed(int Id);

        IEnumerable<object> GetFollower(int Id);

        IEnumerable<object> GetFollowed(int Id);
    }
}
