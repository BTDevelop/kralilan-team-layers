using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class IlanSayiManager : IIlanSayiService
    {

        private IIlanSayilarDal _ilanSayiDal;

        public IlanSayiManager(IIlanSayilarDal ilanSayiDal)
        {
            _ilanSayiDal = ilanSayiDal;
        }

        public void Add(ilanSayi entity)
        {
            throw new NotImplementedException();
        }

        public int CountAll()
        {
            return _ilanSayiDal.CountAll();
        }

        public int CountByCategoriId(int CategoriId)
        {
            return _ilanSayiDal.CountByCategoriId(CategoriId);
        }

        public int CountByCategoriTypeId(int CategoriId, int TypeId)
        {
            return _ilanSayiDal.CountByCategoriTypeId(CategoriId, TypeId);
        }

        public void Delete(ilanSayi entity)
        {
            throw new NotImplementedException();
        }

        public ilanSayi Get(int Id)
        {
            throw new NotImplementedException();
        }

        public List<ilanSayi> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<IlanSayi> GetAllByTopCategoriId(int TopCategoriId)
        {
            return _ilanSayiDal.GetAllByTopCategoriId(TopCategoriId);
        }

        public List<IlanSayi> GetAllCategoriByTopCategoriId(int TopCategoriId)
        {
            return _ilanSayiDal.GetAllCategoriByTopCategoriId(TopCategoriId);
        }

        public void Update(ilanSayi entity)
        {
            throw new NotImplementedException();
        }
    }
}
