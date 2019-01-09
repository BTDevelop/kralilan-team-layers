using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSMagazalarDal : IMagazalarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        public void Add(magaza entity)
        {
            magaza magaza = new magaza();

            if (!String.IsNullOrEmpty(entity.magazaAdi)) magaza.magazaAdi = entity.magazaAdi;
            if (entity.magazaKategoriId != -1) magaza.magazaKategoriId = entity.magazaKategoriId;
            magaza.kurumsalMi = entity.kurumsalMi;
            if (entity.ilId != -1) magaza.ilId = entity.ilId;
            if (entity.ilceId != -1) magaza.ilceId = entity.ilceId;
            if (entity.mahalleId != -1) magaza.mahalleId = entity.mahalleId;
            if (!String.IsNullOrEmpty(entity.vergiNo)) magaza.vergiNo = entity.vergiNo;
            if (entity.vergiDaireId != -1) magaza.vergiDaireId = entity.vergiDaireId;
            if (!String.IsNullOrEmpty(entity.magazaLogo)) magaza.magazaLogo = entity.magazaLogo;
            if (!String.IsNullOrEmpty(entity.aciklama)) magaza.aciklama = entity.aciklama;
            magaza.pasifMi = true;
            magaza.silindiMi = false;
            magaza.onay = false;
            if (entity.magazaTurId != -1) magaza.magazaTurId = entity.magazaTurId;
            magaza.baslangicTarihi = DateTime.Now;
            magaza.bitisTarihi = entity.bitisTarihi;
            idc.magazas.InsertOnSubmit(magaza);
            idc.SubmitChanges();
        }

        public void Delete(magaza entity)
        {
            throw new NotImplementedException();
        }

        public magaza Get(int Id)
        {
            return idc.magazas.Where(q => q.magazaId == Id).FirstOrDefault();
        }

        public magaza Get(magaza entity)
        {
            throw new NotImplementedException();
        }

        public List<magaza> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Magaza> GetAllByStoreCategori(int StoreCategori)
        {

            var query = from m in idc.magazas.Where(m => m.silindiMi == false && m.pasifMi == false && m.onay == true)
                        select new Magaza
                        {
                            MagazaId = m.magazaId,
                            MagazaAdi = m.magazaAdi,
                            MagazaKategoriId = Convert.ToInt32(m.magazaKategoriId)

                        };

            if (StoreCategori == -1)
            {
                query = query.Where(m => m.MagazaKategoriId == null);
            }

            return query.ToList();
        }

        public magaza GetLast()
        {
            var value = idc.magazas.OrderByDescending(x => x.magazaId).First();
            return value;
        }

        public void Update(magaza entity)
        {
            var value = idc.magazas.Where(q => q.magazaId == entity.magazaId).FirstOrDefault();
            if (value != null)
            {
                if (entity.magazaKategoriId != -1) value.magazaKategoriId = entity.magazaKategoriId;
                if (entity.magazaTurId != -1) value.magazaTurId = entity.magazaTurId;
                if (!String.IsNullOrEmpty(entity.magazaAdi)) value.magazaAdi = entity.magazaAdi;
                if (!String.IsNullOrEmpty(entity.magazaLogo)) value.magazaLogo = entity.magazaLogo;
                if (entity.ilId != -1) value.ilId = entity.ilId;
                if (entity.ilceId != -1) value.ilceId = entity.ilceId;
                if (entity.mahalleId != -1) value.mahalleId = entity.mahalleId;
                if (!String.IsNullOrEmpty(entity.vergiNo)) value.vergiNo = entity.vergiNo;
                if (entity.krediSayisi != -1) value.krediSayisi = entity.krediSayisi;
                value.onay = Convert.ToBoolean(value.onay);
                value.pasifMi = Convert.ToBoolean(entity.pasifMi);
                value.kurumsalMi = Convert.ToBoolean(entity.kurumsalMi);
                value.silindiMi = Convert.ToBoolean(entity.silindiMi);
                if (!String.IsNullOrEmpty(entity.aciklama)) value.aciklama = entity.aciklama;
                idc.SubmitChanges();
            }
        }

        public void UpdateManager(magaza entity)
        {
            var value = idc.magazas.Where(q => q.magazaId == entity.magazaId).FirstOrDefault();
            if (value != null)
            {
                value.magazaAdi = entity.magazaAdi;
                value.kurumsalMi = entity.kurumsalMi;
                value.ilId = entity.ilId;
                value.ilceId = entity.ilceId;
                value.mahalleId = entity.mahalleId;
                value.vergiNo = entity.vergiNo;
                value.vergiDaireId = entity.vergiDaireId;
                idc.SubmitChanges();
            }
        }

        public void UpdateStatus(int StoreId, bool Status, bool Deleted)
        {
            var value = idc.magazas.Where(q => q.magazaId == StoreId).FirstOrDefault();
            if (value != null)
            {
                value.onay = Status;
                value.silindiMi = Convert.ToBoolean(Deleted);
                idc.SubmitChanges();
            }
        }
    }
}
