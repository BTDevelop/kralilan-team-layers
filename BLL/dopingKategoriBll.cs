using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Newtonsoft.Json;
using BLL.Formatter;
using BLL.ExternalClass;

namespace BLL
{
    public class dopingKategoriBll
    {

        Formatter.Formatter formatter = new Formatter.Formatter();

        /// <summary>
        /// sil
        /// </summary>
        ///// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        ///// <summary>
        ///// ekle
        ///// </summary>
        ///// <param name="_income"></param>
        //public void insert(int _inCatId, int _inDopId, int _inDopTime, double _inPrice)
        //{
        //    try
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            dopingKategori dopingKategori = new dopingKategori();

        //            dopingKategori.kategoriId = _inCatId;
        //            dopingKategori.dopingId = _inDopId;
        //            dopingKategori.dopingSureId = _inDopTime;
        //            dopingKategori.fiyat = _inPrice;
        //            idc.dopingKategoris.InsertOnSubmit(dopingKategori);
        //            idc.SubmitChanges();
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_income"></param>
        //public void update(int _inShowcaseCatId, double _inPrice)
        //{
        //    try
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            var value = idc.dopingKategoris.Where(q => q.dopingKategoriId == _inShowcaseCatId).FirstOrDefault();
        //            if (value != null)
        //            {
        //                value.fiyat = _inPrice;
        //                idc.SubmitChanges();
        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        //public dopingKategori search(int _id)
        //{
        //    try
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            var value = idc.dopingKategoris.Where(q => q.dopingKategoriId == _id).FirstOrDefault();
        //            return value;
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
          
        //}
        /// <summary>
        /// kullanıcı tarafında vitrin fiyatları listele
        /// </summary>
        /// <param name="_incatid"></param>
        /// <param name="_indopid"></param>
        /// <returns></returns>
        public string select(int _inCatId, int _inDopId, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from dk in idc.dopingKategoris.Where(d => d.kategoriId == _inCatId && d.dopingId == _inDopId)
                            select new
                            {
                                dk.dopingKategoriId,
                                dopingFiyat = String.Format("{0} Haftalık ({1} TL)", dk.dopingSureId, dk.fiyat)
                            };

                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }


        /// <summary>
        /// admin vitrin fiyatlarının listesi
        /// </summary>
        /// <param name="_index"></param>
        /// <param name="_count"></param>
        /// <param name="_insearch"></param>
        /// <param name="_inecho"></param>
        /// <returns></returns>
        public object getDopingCategorisJDatatables(int _index, int _inCount, string _inSearch, string _inEcho)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from d in idc.dopingKategoris
                            select new dopingKategoriDT
                            {
                                catname = d.kategori.kategoriAdi,
                                showcasename = d.doping.dopingAdi,
                                showcasetime = d.dopingSureId + " Haftalık",
                                price = Convert.ToDouble(d.fiyat),
                                option = @"<a class='btn btn-success btn-xs' href='/management/genelAyarlar/genelayarlar.aspx?page=vitrinucretayar&showcase=" + d.dopingKategoriId + @"'>Düzenle</a>"

                            };

                if (String.IsNullOrEmpty(_inSearch) == false) query = query.Where(x => x.catname.IndexOf(_inSearch) != -1);

                int totalCount = query.Count();
                int filterCount = query.Count();


                query = query.Skip(_index).Take(_inCount);

                var cmd = new
                {
                    draw = _inEcho,
                    recordsTotal = totalCount,
                    recordsFiltered = filterCount,
                    data = query.ToList()
                };

                return cmd;
            }
        }
    }
}
