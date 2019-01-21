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
        private IZiyaretcilerProjeDal _ziyaretcilerProjeDal;
        public ZiyaretciProjeManager(IZiyaretcilerProjeDal ziyaretcilerProjeDal)
        {
            _ziyaretcilerProjeDal = ziyaretcilerProjeDal;
        }

        public void Add(ziyaretproje entity)
        {
            _ziyaretcilerProjeDal.Add(entity);
        }

        public int Count(int ProjectId, bool Type)
        {
            return _ziyaretcilerProjeDal.Count(ProjectId, Type);
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
