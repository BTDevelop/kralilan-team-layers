using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSMagazaTelefonlarDal : IMagazaTelefonlarDal
    {
        private ilanDataContext idc= new ilanDataContext();
        public void Add(magazaTelefon entity)
        {
            magazaTelefon magazaTelefon = new magazaTelefon();
            magazaTelefon.magazaId = entity.magazaId;
            magazaTelefon.telefon = entity.telefon;
            magazaTelefon.telefonTur = entity.telefonTur;
            idc.magazaTelefons.InsertOnSubmit(magazaTelefon);
            idc.SubmitChanges();
        }

        public void Delete(magazaTelefon entity)
        {
            var value = idc.magazaTelefons.Where(q => q.magazaTelefonId == entity.magazaTelefonId).FirstOrDefault();
            if (value != null)
            {
                idc.magazaTelefons.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public magazaTelefon Get(int Id)
        {
            throw new NotImplementedException();
        }

        public magazaTelefon Get(magazaTelefon entity)
        {
            throw new NotImplementedException();
        }

        public List<magazaTelefon> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<magazaTelefon> GetAllByStoreId(int StoreId)
        {
            return idc.magazaTelefons.Where(q => q.magazaId == StoreId).ToList();
        }

        public magazaTelefon GetStoreTypeId(int StoreId, int Type)
        {
            var value = idc.magazaTelefons.Where(q => q.magazaId == StoreId & q.telefonTur == Type).FirstOrDefault();
            return value;
        }

        public void Update(magazaTelefon entity)
        {
            var value = idc.magazaTelefons.Where(q => q.magazaId == entity.magazaId & q.telefonTur == entity.telefonTur).FirstOrDefault();
            if (value != null)
            {
                value.telefon = entity.telefon;
                idc.SubmitChanges();
            }
        }
    }
}
