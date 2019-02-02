using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.CrossCuttingConcerns
{
    public interface ICacheRepository<T>
    {
        void AddToCache(List<T> values);

        void UpdateToCache(List<T> values);

        void DeleteToCache(T value);

        List<T> GetAllFromCache();
    }
}
