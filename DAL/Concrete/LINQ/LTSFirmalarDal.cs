using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSFirmalarDal : IFirmalarDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(firmalar entity)
        {
            firmalar firma = new firmalar();
            firma.fadi = entity.fadi;
            firma.feposta = entity.feposta;
            firma.ftelefon = entity.ftelefon;
            firma.ffaks = entity.ffaks;
            firma.fadres = entity.fadres;
            firma.fwebsite = entity.fwebsite;
            firma.fhakkinda = entity.fhakkinda;
            firma.flogo = entity.flogo;
            firma.ftarih = DateTime.Now;
            firma.fsilindimi = false;
            idc.firmalars.InsertOnSubmit(firma);
            idc.SubmitChanges();
        }

        public void Delete(firmalar entity)
        {
            throw new NotImplementedException();
        }

        public firmalar Get(int Id)
        {
            var value = idc.firmalars.Where(q => q.firmaid == Id).FirstOrDefault();
            return value;
        }

        public firmalar Get(firmalar entity)
        {
            throw new NotImplementedException();
        }

        public List<firmalar> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Firma> GetAllByUserId(int UserId)
        {

            var query = from i in idc.firmalars.Where(i => i.fsilindimi == false && i.fkullanicid == UserId)
                select new Firma
                {
                    FirmaId = i.firmaid,
                    FirmaAdi = i.fadi,
                    Tarih = Convert.ToDateTime(i.ftarih),
                    Logo = i.flogo
                };

            return query.ToList();
        }


        public firmalar GetLast()
        {
            var value = idc.firmalars.OrderByDescending(x => x.firmaid).First();
            return value;
        }

        public void Update(firmalar entity)
        {
            var value = idc.firmalars.Where(q => q.firmaid == entity.firmaid).FirstOrDefault();
            if (value != null)
            {
                value.fadi = entity.fadi;
                value.feposta = entity.feposta;
                value.ftelefon = entity.ftelefon;
                value.ffaks = entity.ffaks;
                value.fadres = entity.fadres;
                value.fwebsite = entity.fwebsite;
                value.fhakkinda = entity.fhakkinda;
                value.flogo = entity.flogo;
                idc.SubmitChanges();
            }
        }
    }
}
