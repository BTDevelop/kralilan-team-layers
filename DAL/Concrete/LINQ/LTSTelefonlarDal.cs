using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSTelefonlarDal : ITelefonlarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(telefonlar entity)
        {
            telefonlar telefon = new telefonlar();
            telefon.kullaniciId = entity.kullaniciId;
            telefon.telefon = entity.telefon;
            telefon.telefonTur = entity.telefonTur;
            idc.telefonlars.InsertOnSubmit(telefon);
            idc.SubmitChanges();
        }

        public void Delete(telefonlar entity)
        {
            var value = idc.telefonlars.Where(q => q.kullaniciId == entity.kullaniciId && q.telefonTur == entity.telefonTur).FirstOrDefault();
            if (value != null)
            {
                idc.telefonlars.DeleteOnSubmit(value);
                idc.SubmitChanges();
            }
        }

        public telefonlar Get(int Id)
        {
            throw new NotImplementedException();
        }

        public telefonlar Get(telefonlar entity)
        {
            throw new NotImplementedException();
        }

        public List<telefonlar> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<telefonlar> GetAllByUserId(int UserId)
        {
            var query = idc.telefonlars.Where(q => q.kullaniciId == UserId).ToList();
            return query;
        }

        public List<telefonlar> GetAllByUserTypeId(int UserId, int Type)
        {
            var query = idc.telefonlars.Where(q => q.kullaniciId == UserId && q.telefonTur == Type).ToList();
            return query;
        }

        public telefonlar GetByUserId(int UserId, int Type)
        {
            var value = idc.telefonlars.Where(q => q.kullaniciId == UserId & q.telefonTur == Type).FirstOrDefault();
            return value;
        }

        public void Update(telefonlar entity)
        {
            var value = idc.telefonlars.Where(q => q.kullaniciId == entity.kullaniciId && q.telefonTur == entity.telefonTur).FirstOrDefault();
            if (value != null)
            {
                value.telefon = entity.telefon;
                idc.SubmitChanges();
            }
        }
    }
}
