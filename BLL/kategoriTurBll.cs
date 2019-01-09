using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BLL.Formatter;
using BLL.ExternalClass;
using BLL.EnumHelper;

namespace BLL
{
    public class kategoriTurBll
    {
        kategoriBll kategoriBLL = new kategoriBll();
        Formatter.Formatter formatter = new Formatter.Formatter();
        ilanBll ilanBLL = new ilanBll();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="_income"></param>
        //public void insert(params object[] _income)
        //{
        //    throw new NotImplementedException();
        //}
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="_income"></param>
        //public void update(params object[] _income)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public kategoriTur search(int _inCatId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.kategoriTurs.Where(q => q.kategoriId == _inCatId).FirstOrDefault();
        //    }
        //}

        //public string getTypesByCatId(int opt, int _inCatId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from k in idc.kategoriTurs.Where(q => q.kategoriId == _inCatId)
        //                    select new TypesCS
        //                    {
        //                        turId = k.turId,
        //                        kategoriId = k.kategoriId,
        //                        turAdi = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), k.turId.ToString())),
        //                        kategoriAdi = k.kategori.kategoriAdi,
        //                        count = ilanBLL.count(k.kategoriId, k.turId, -1)
        //                    };

        //        XmlFormat xmlFormat = new XmlFormat();
        //        formatter.FormatTo(xmlFormat);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }
        //}

        //public string getTypesStrByCatId(int _inCatId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = from k in idc.kategoriTurs.Where(q => q.kategoriId == _inCatId)
        //                    select new
        //                    {
        //                        turAdi = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), k.turId.ToString())),
        //                    };

        //        if (value.Count() > 0)
        //        {
        //            string typeText = "";
        //            foreach (var item in value)
        //            {
        //                typeText += item.turAdi + " ";
        //            }

        //            return typeText;
        //        }
        //        else
        //        {
        //            return "";
        //        }
        //    }
        //}

        public class TypeAds
        {
            public int typeId
            { get; set; }
            public String typeName
            { get; set; }
            public String typeUTF
            { get; set; }
        }

        public List<TypeAds> getTypesFormat()
        {
            List<TypeAds> lstType = new List<TypeAds>();

            var _item1 = new TypeAds
            {
                typeId = 1,
                typeName = "Satılık",
                typeUTF = "satilik"
            };
            var _item2 = new TypeAds
            {
                typeId = 2,
                typeName = "Kiralık",
                typeUTF = "kiralik"
            };
            var _item3 = new TypeAds
            {
                typeId = 3,
                typeName = "Günlük Kiralık",
                typeUTF = "gunluk-kiralik"
            };
            var _item4 = new TypeAds
            {
                typeId = 4,
                typeName = "Devren",
                typeUTF = "devren"
            };
            var _item5 = new TypeAds
            {
                typeId = 6,
                typeName = "Devren Satılık",
                typeUTF = "devren-satilik"
            };

            lstType.Add(_item1);
            lstType.Add(_item2);
            lstType.Add(_item3);
            lstType.Add(_item4);
            lstType.Add(_item5);


            return lstType;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="catid"></param>
        /// <param name="typeid"></param>
        /// <returns></returns>
        public IEnumerable<object> getListCategoriWithType(int _inCatId, int _inTypeId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                int staticdata = Convert.ToInt32(idc.kategoris.Where(q => q.kategoriId == _inCatId).FirstOrDefault().ustKategoriId);
                if (_inTypeId == -1)
                {
                    if (idc.kategoriTurs.Where(q => q.kategoriId == _inCatId).FirstOrDefault() == null)
                    {
                        if (idc.kategoris.Where(q => q.ustKategoriId == _inCatId).FirstOrDefault() == null)
                        {
                            var query = idc.kategoris.Where(x => x.kategoriId == -1);
                            return query.ToList();
                        }
                        else
                        {

                            var query = idc.kategoris.Where(x => x.ustKategoriId == _inCatId);
                            return query.ToList();
                        }
                    }
                    else
                    {
                        var dataaaaaa = idc.kategoriTurs.Where(q => q.kategoriId == staticdata).FirstOrDefault(); ;

                        if (idc.kategoris.Where(q => q.ustKategoriId == _inCatId).FirstOrDefault() == null)
                        {
                            if (dataaaaaa != null)
                            {
                                var query = idc.kategoris.Where(x => x.ustKategoriId == _inCatId);
                                return query.ToList();
                            }
                            else
                            {
                                var query = idc.kategoriTurs.Where(x => x.kategoriId == _inCatId);

                                return query.ToList();
                            }
                        }
                        else
                        {
                            var query = idc.kategoriTurs.Where(x => x.kategoriId == _inCatId);

                            return query.ToList();
                        }
                    }

                }
                else
                {
                    if (_inTypeId != -1)
                    {
                        if (idc.kategoris.Where(q => q.ustKategoriId == _inCatId).FirstOrDefault() == null)
                        {
                            var query = idc.kategoris.Where(x => x.ustKategoriId == _inCatId);
                            return query.ToList();
                        }
                        else
                        {
                            var query = idc.kategoriTurs.Where(x => x.turId == _inTypeId & x.kategori.ustKategoriId == _inTypeId);
                            return query.ToList();
                        }
                    }
                    else
                    {
                        var query = idc.kategoris.Where(x => x.ustKategoriId == _inCatId);
                        return query.ToList();
                    }
                }
            }
        }

        //public IEnumerable<object> getListTypesByCatId(int _inCatId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from kt in idc.kategoriTurs
        //                    join k in idc.kategoris
        //                    on kt.kategoriId equals k.kategoriId
        //                    where kt.kategoriId == _inCatId
        //                    select new
        //                    {
        //                        kt.turId
        //                    };

        //        return query.ToList();

        //    }
        //}

        //public IEnumerable<object> getListCategoriesByCatIdAndType(int _inCatId, int _inType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from kt in idc.kategoriTurs
        //                    join k in idc.kategoris
        //                    on kt.kategoriId equals k.kategoriId
        //                    where k.ustKategoriId == _inCatId && kt.turId == _inType
        //                    select new
        //                    {
        //                        k.kategoriAdi,
        //                        k.kategoriId,

        //                    };

        //        return query.ToList();

        //    }
        //}
    }
}
