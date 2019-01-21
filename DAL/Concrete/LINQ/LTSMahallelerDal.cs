using System;
using System.Collections.Generic;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSMahallelerDal : IMahallelerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(mahalleler entity)
        {
            mahalleler mahalle = new mahalleler();

            mahalle.mahalleAdi = entity.mahalleAdi;
            mahalle.ilceId = entity.ilceId;
            idc.mahallelers.InsertOnSubmit(mahalle);
            idc.SubmitChanges();
        }

        public void Delete(mahalleler entity)
        {
            throw new NotImplementedException();
        }

        public mahalleler Get(int Id)
        {
            var value = idc.mahallelers.Where(q => q.mahalleId == Id).FirstOrDefault();
            return value;
        }

        public mahalleler Get(mahalleler entity)
        {
            throw new NotImplementedException();
        }

        public List<mahalleler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Mahalle> GetAllByCityId(int CityId)
        {
            var query = from i in idc.mahallelers.Where(q => q.ilceId == CityId)
                select new Mahalle
                {
                    MahalleId = i.mahalleId,
                    MahalleAdi = i.mahalleAdi
                };

            return query.ToList();

        }

        public void Update(mahalleler entity)
        {
            var value = idc.mahallelers.Where(q => q.mahalleId == entity.mahalleId).FirstOrDefault();
            if (value != null)
            {
                value.mahalleAdi = entity.mahalleAdi;
                value.ilceId = entity.ilceId;
                idc.SubmitChanges();
            }
        }
    }
}
