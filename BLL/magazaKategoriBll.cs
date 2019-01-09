using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.EnumHelper;
using DAL;

namespace BLL
{
    public class magazaKategoriBll
    {
        public enum StoreTimeType
        {
            UcAylik = 1,
            AltiAylik = 2,
            OnIkiAylik = 3,
        }

        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}

        //public void insert(params object[] _income)
        //{
        //    throw new NotImplementedException();
        //}

        //public void update(int _inPacCatId, double _inPrice)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazaKategoris.Where(q => q.magazaKategoriId == _inPacCatId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.fiyat = _inPrice;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_incatid"></param>
        /// <param name="_inpactimeid"></param>
        /// <param name="_instrpacid"></param>
        /// <returns></returns>
        //public magazaKategori search(int _inCatId, int _inPacTimeId, int _inStorePacId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.magazaKategoris.Where(q =>
        //                q.kategoriId == _inCatId & q.paketSureId == _inPacTimeId & q.magazaPaketId == _inStorePacId)
        //            .FirstOrDefault();
        //        return value;
        //    }
        //}

        public magazaKategori getStoreCategoriByCatId(int _inCatId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.magazaKategoris.Where(q => q.magazaKategoriId == _inCatId).FirstOrDefault();
                return value;
            }
        }

        public object select(int _index, int _count, string _insearch, string _inecho)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from m in idc.magazaKategoris
                            select new
                            {
                                m.kategori.kategoriAdi,
                                paket = EnumHelper.EnumHelper.GetDescription((StorePackageTypeString)Enum.Parse(typeof(StorePackageTypeString), m.magazaPaketId.ToString())),
                                sure = m.paketSureId == 1 ? "6 Aylık" : "12 Aylık",
                                m.fiyat,
                                m.magazaKategoriId

                            };


                if (String.IsNullOrEmpty(_insearch) == false)
                {
                    query = query.Where(x => x.kategoriAdi.IndexOf(_insearch) != -1);
                }

                int totalCount = idc.magazaKategoris.Count();

                int filterCount = query.Count();


                query = query.OrderBy(x => x.magazaKategoriId).Skip(_index).Take(_count);
                List<ExternalClass.dopingKategoriDT> list = new List<ExternalClass.dopingKategoriDT>();
                var data = query.ToList();

                for (int i = 0; i < data.Count(); i++)
                {
                    list.Add(
                        new ExternalClass.dopingKategoriDT
                        {
                            catname = data[i].kategoriAdi,
                            showcasename = data[i].paket,
                            showcasetime = data[i].sure,
                            price = Convert.ToDouble(data[i].fiyat),
                            option =
                                @"<a class='btn btn-success btn-xs' href='/management/genelAyarlar/genelayarlar.aspx?page=magazaucretayar&package=" +
                                data[i].magazaKategoriId + @"'>Düzenle</a>"
                        }
                    );
                }

                var cmd = new
                {
                    draw = _inecho,
                    recordsTotal = totalCount,
                    recordsFiltered = filterCount,
                    data = list
                };

                return cmd;

            }
        }
    }
}

