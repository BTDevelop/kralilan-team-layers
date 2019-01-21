using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using DAL.Enums;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSKategoriTurlerDal : IKategoriTurlerDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(kategoriTur entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(kategoriTur entity)
        {
            throw new NotImplementedException();
        }

        public kategoriTur Get(int Id)
        {
            return idc.kategoriTurs.Where(q => q.kategoriId == Id).FirstOrDefault();
        }

        public kategoriTur Get(kategoriTur entity)
        {
            throw new NotImplementedException();
        }

        public List<kategoriTur> GetAll()
        {
            throw new NotImplementedException();
        }


        public IEnumerable<object> GetByCategoriTypeId(int CategoriId, int TypeId)
        {
            var query = from kt in idc.kategoriTurs
                        join k in idc.kategoris
                            on kt.kategoriId equals k.kategoriId
                        where k.ustKategoriId == CategoriId && kt.turId == TypeId
                        select new
                        {
                            k.kategoriAdi,
                            k.kategoriId,

                        };

            return query.ToList();
        }

        public IEnumerable<object> GetByCategoriId(int CategoriId)
        {
            var query = from kt in idc.kategoriTurs
                        join k in idc.kategoris
                            on kt.kategoriId equals k.kategoriId
                        where kt.kategoriId == CategoriId
                        select new
                        {
                            kt.turId
                        };

            return query.ToList();
        }

        public void Update(kategoriTur entity)
        {
            throw new NotImplementedException();
        }

        public string GetByCategoriIdStr(int CategoriId)
        {
            var value = from k in idc.kategoriTurs.Where(q => q.kategoriId == CategoriId)
                        select new
                        {
                            turAdi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), k.turId.ToString())),
                        };

            if (value.Count() > 0)
            {
                string typeText = "";
                foreach (var item in value) typeText += item.turAdi + " ";
                return typeText;
            }
            else return "";
        }

        public List<UrlUtf> GetUtf()
        {
            List<UrlUtf> UtfListe = new List<UrlUtf>();
            foreach (EstateTypeString item in (EstateTypeString[])Enum.GetValues(typeof(EstateTypeString)))
            {
                var value = new UrlUtf
                {
                    Id = (int)item,
                    Name = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), ((int)item).ToString())),
                    NameUtf = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), ((int)item).ToString())),
                };

                UtfListe.Add(value);
            }
            return UtfListe;
        }

        public IEnumerable<object> GetAllByCategoriTypeId(int CategoriId, int TypeId)
        {
            var IsCategoriTypes = idc.kategoriTurs.Where(q => q.kategoriId == CategoriId).FirstOrDefault();

            if (IsCategoriTypes == null)
            {
                var query = idc.kategoris.Where(x => x.ustKategoriId == CategoriId);
                return query.ToList();
            }
            else
            {
                var query = idc.kategoriTurs.Where(x => x.kategoriId == TypeId);
                return query.ToList();
            }
        }
    }
}
