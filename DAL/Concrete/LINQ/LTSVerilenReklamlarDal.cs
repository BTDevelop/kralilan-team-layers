using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;

namespace DAL.Concrete.LINQ
{
    public class LTSVerilenReklamlarDal : IVerilenReklamlarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(verilenReklam entity)
        {
            verilenReklam reklam = new verilenReklam();
            reklam.reklamId = entity.reklamId;
            reklam.kullaniciId = entity.kullaniciId;
            reklam.reklamAdi = entity.reklamAdi;
            reklam.reklamResim = entity.reklamResim;
            if (entity.ilId != -1) reklam.ilId = Convert.ToInt32(entity.ilId);
            reklam.baslangicTarihi = entity.baslangicTarihi;
            reklam.bitisTarihi = entity.bitisTarihi;
            reklam.reklamLink = entity.reklamLink;
            reklam.pasifMi = entity.pasifMi;
            reklam.onay = entity.onay;
            idc.verilenReklams.InsertOnSubmit(reklam);
            idc.SubmitChanges();
        }

        public void Delete(verilenReklam entity)
        {
            throw new NotImplementedException();
        }

        public verilenReklam Get(int Id)
        {
            return idc.verilenReklams.Where(q => q.reklamId == Id).FirstOrDefault();
        }

        public List<verilenReklam> GetAll()
        {
            throw new NotImplementedException();
        }

        public verilenReklam GetLast()
        {
            var value = idc.verilenReklams.OrderByDescending(x => x.verilenReklamId).First();
            return value;
        }

        public void Update(verilenReklam entity)
        {
            var value = idc.verilenReklams.Where(q => q.verilenReklamId == entity.verilenReklamId).FirstOrDefault();
            if (value != null)
            {
                value.kullaniciId = entity.kullaniciId;
                value.reklamAdi = entity.reklamAdi;
                value.reklamId = entity.reklamId;
                if (entity.ilId != -1) value.ilId = entity.ilId;
                value.baslangicTarihi = entity.baslangicTarihi;
                value.bitisTarihi = entity.bitisTarihi;
                value.pasifMi = entity.pasifMi;
                value.onay = entity.onay;
                idc.SubmitChanges();
            }
        }

        public void UpdatePicture(int AdsId, string Picture)
        {
            var value = idc.verilenReklams.Where(q => q.verilenReklamId == AdsId).FirstOrDefault();
            if (value != null)
            {
                value.reklamResim = Picture;
                idc.SubmitChanges();
            }
        }
    }
}
