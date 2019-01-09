using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSKategorilerDal : IKategorilerDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(kategori entity)
        {
            kategori kategori = new kategori();
            kategori.kategoriAdi = kategori.kategoriAdi;
            kategori.ustKategoriId = kategori.ustKategoriId;
            idc.kategoris.InsertOnSubmit(kategori);
            idc.SubmitChanges();
        }

        public void Delete(kategori entity)
        {
            throw new NotImplementedException();
        }

        public kategori Get(int Id)
        {
            return idc.kategoris.Where(q => q.kategoriId == Id).FirstOrDefault();
        }

        public kategori Get(kategori entity)
        {
            throw new NotImplementedException();
        }

        public List<kategori> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<kategori> GetAllByCategoriId(int CategoriId)
        {
            return idc.kategoris.Where(q => q.ustKategoriId == CategoriId).ToList();
        }

        public List<kategori> GetAllByTopCategori()
        {
            var query = from k in idc.kategoris
                select k;
               
            return query.ToList();
        }

        public List<Kategori> GetAllCategori()
        {
            var query = from k in idc.kategoris
                select new Kategori
                {

                    KategoriId = k.kategoriId,
                    KategoriAdi = k.kategoriAdi,
                };


            return query.ToList();
        }

        public kategori GetByTopCategori(int topCategoriId)
        {
            return idc.kategoris.Where(q => q.ustKategoriId == topCategoriId).FirstOrDefault();
        }

        public void Update(kategori entity)
        {
            var value = idc.kategoris.Where(q => q.kategoriId == entity.kategoriId).FirstOrDefault();
            if (value != null)
            {
                value.kategoriAdi = entity.kategoriAdi;
                idc.SubmitChanges();
            }
        }

       
    }
}
