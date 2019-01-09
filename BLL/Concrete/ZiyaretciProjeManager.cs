using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class ZiyaretciProjeManager : IZiyaretciProjeService
    {
        private IZiyaretcilerProjeDal _ziyaretcilerProje;
        public ZiyaretciProjeManager(IZiyaretcilerProjeDal ziyaretcilerProje)
        {
            _ziyaretcilerProje = ziyaretcilerProje;
        }

        public void Add(ziyaretproje entity)
        {
            _ziyaretcilerProje.Add(entity);
        }

        public int Count(int ProjectId, bool Type)
        {
            throw new NotImplementedException();
        }

        public void Delete(ziyaretproje entity)
        {
            throw new NotImplementedException();
        }

        public ziyaretproje Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<ziyaretproje> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(ziyaretproje entity)
        {
            throw new NotImplementedException();
        }
    }
}
