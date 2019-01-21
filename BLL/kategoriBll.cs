using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.IO;
using BLL.ExternalClass;
using static DAL.toolkit;
using static DAL.StrategyData;
using Newtonsoft.Json;
using BLL.Formatter;

namespace BLL
{
    public class kategoriBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();

        //public class TypeAds
        //{
        //    public int typeId { get; set; }
        //    public string typeName { get; set; }
        //    public string typeUTF { get; set; }
        //}

        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_income"></param>
        /// <param name="_id"></param>
        //public void insert(string _inCatName, int _inCatId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        kategori kategori = new kategori();

        //        kategori.kategoriAdi = _inCatName;
        //        kategori.ustKategoriId = _inCatId;
        //        idc.kategoris.InsertOnSubmit(kategori);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_income"></param>
        //public void update(int _inCatId, string _inCatName)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.kategoris.Where(q => q.kategoriId == _inCatId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.kategoriAdi = _inCatName;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public kategori search(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.kategoris.Where(q => q.kategoriId == _id).FirstOrDefault();
        //    }
        //}

        /// <summary>
        /// üst kategori bul
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public kategori getTopCategories(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.kategoris.Where(q => q.ustKategoriId == _id).FirstOrDefault();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_income"></param>
        /// <returns></returns>
        //public IEnumerable<kategori> list(int _inCatId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.kategoris.Where(q => q.ustKategoriId == _inCatId).ToList();
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<CategoriCS> getCategoriesFormat()
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from k in idc.kategoris
                            select new CategoriCS
                            {

                                kategoriId = k.kategoriId,
                                kategoriAdi = k.kategoriAdi,
                                kateogoriTip = PublicHelper.Tools.URLConverter(k.kategoriAdi),

                            };

                return query.ToList();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inTopCategoriId"></param>
        /// <param name="inDataType"></param>
        /// <returns></returns>
        //public string getTopCategoriViewHomePage(int _inTopCatId, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = StrategyData.GetTopCategoriWithCount(idc, _inTopCatId);

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }

        //}

        //public string getTopCategoriViewHomePageTest(int _inTopCatId, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = StrategyData.GetTopesCategoriWithCount(idc, _inTopCatId);

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }

        //}

    }
}


