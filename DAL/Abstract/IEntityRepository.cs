using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Abstract
{
    public interface IEntityRepository<T>
    {
        List<T> GetAll();

        T Get(int Id);

        void Add(T entity);

        void Delete(T entity);

        void Update(T entity);
    }
}
