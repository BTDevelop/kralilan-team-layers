using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSGuvenlikKodlarDal : IGuvenlikKodlarDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(guvenlikKodlari entity)
        {
            guvenlikKodlari guvenlikKodu = new guvenlikKodlari();
            guvenlikKodu.cepTelefonu = entity.cepTelefonu;
            guvenlikKodu.guvenlikKodu = entity.guvenlikKodu;
            guvenlikKodu.tarih = DateTime.Now;
            idc.guvenlikKodlaris.InsertOnSubmit(guvenlikKodu);
            idc.SubmitChanges();
        }

        public void Delete(guvenlikKodlari entity)
        {
            throw new NotImplementedException();
        }

        public guvenlikKodlari Get(int Id)
        {
            throw new NotImplementedException();
        }

        public guvenlikKodlari Get(guvenlikKodlari entity)
        {
            throw new NotImplementedException();
        }

        public List<guvenlikKodlari> GetAll()
        {
            throw new NotImplementedException();
        }

        public guvenlikKodlari GetByPhone(string Phone)
        {
            return idc.guvenlikKodlaris.Where(q => q.cepTelefonu == Phone).FirstOrDefault();
        }

        public guvenlikKodlari GetBySecureCode(string Code)
        {
            return idc.guvenlikKodlaris.Where(q => q.guvenlikKodu == Code).FirstOrDefault();
        }

        public void Update(guvenlikKodlari entity)
        {
            var value = idc.guvenlikKodlaris.Where(q => q.cepTelefonu == entity.cepTelefonu).FirstOrDefault();
            if (value != null)
            {
                value.guvenlikKodu = entity.guvenlikKodu;
                idc.SubmitChanges();
            }
        }
    }
}
