using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class VerilenReklamManager : IVerilenReklamService
    {
        private IVerilenReklamlarDal _verilenReklamlarDal;
        public VerilenReklamManager(IVerilenReklamlarDal verilenReklamlarDal)
        {
            _verilenReklamlarDal = verilenReklamlarDal;
        }

        public void Add(verilenReklam entity)
        {
            _verilenReklamlarDal.Add(entity);
        }

        public void Delete(verilenReklam entity)
        {
            throw new NotImplementedException();
        }

        public verilenReklam Get(int Id)
        {
           return _verilenReklamlarDal.Get(Id);
        }

        public List<verilenReklam> GetAll()
        {
            throw new NotImplementedException();
        }

        public verilenReklam GetLast()
        {
            return _verilenReklamlarDal.GetLast();
        }

        public void Update(verilenReklam entity)
        {
           _verilenReklamlarDal.Update(entity);
        }

        public void UpdatePicture(int AdsId, string Picture)
        {
           _verilenReklamlarDal.UpdatePicture(AdsId, Picture);
        }
    }
}
