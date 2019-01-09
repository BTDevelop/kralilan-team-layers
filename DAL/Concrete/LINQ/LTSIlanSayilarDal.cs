using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using DAL.Enums;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSIlanSayilarDal : IIlanSayilarDal
    {
        private ilanDataContext idc = new ilanDataContext();

        /// <summary>
        /// Compiled Queries
        /// </summary>
        public static Func<ilanDataContext, int, IQueryable<IlanSayi>> GetByTopCategoriIdCompiled =
            CompiledQuery.Compile((ilanDataContext idc, int CategoriId) =>
                (idc.ilanSayis.Where(x => x.ustKategoriId == CategoriId)
                    .GroupBy(l => l.kategoriId)
                    .Select(cl => new IlanSayi
                    {
                        Id = Convert.ToInt32(cl.First().kategoriId),
                        Adi = cl.First().kategori.kategoriAdi,
                        Sayi = Convert.ToInt32(cl.Sum(c => c.sayi)),
                    }).OrderBy(x => x.Id)));

        public static Func<ilanDataContext, int,IQueryable<IlanSayi>> GetByTopCategoriIdTypeIdCompiled =
            CompiledQuery.Compile((ilanDataContext idc, int CategoriId) =>
                (idc.ilanSayis.Where(x => x.ustKategoriId == CategoriId)
                    .GroupBy(l => l.turId)
                    .Select(cl => new IlanSayi
                    {
                        Id = Convert.ToInt32(cl.First().turId),
                        Adi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), cl.First().turId.ToString())),
                        Sayi = Convert.ToInt32(cl.Sum(c => c.sayi)),
                    }).OrderBy(x => x.Id)));

        public void Add(ilanSayi entity)
        {
            throw new NotImplementedException();
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

        public void Update(ilanSayi entity)
        {
            throw new NotImplementedException();
        }

        public List<IlanSayi> GetAllByTopCategoriId(int TopCategoriId)
        {
            var query = GetByTopCategoriIdTypeIdCompiled(idc, TopCategoriId);
            return query.ToList();
        }

        public List<IlanSayi> GetAllCategoriByTopCategoriId(int TopCategoriId)
        {
            var query = GetByTopCategoriIdCompiled(idc, TopCategoriId);
            return query.ToList();
        }
    }
}
