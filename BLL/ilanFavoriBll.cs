using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.EnumHelper;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using DAL;
using BLL.Formatter;

namespace BLL
{
    public class ilanFavoriBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();
        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_inadsid"></param>
        /// <param name="_inuserid"></param>
        //public void delete(int _inAdsId, int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilanFavoris.Where(q => q.ilanId == _inAdsId && q.kullaniciId == _inUserId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            idc.ilanFavoris.DeleteOnSubmit(value);
        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_inadsid"></param>
        /// <param name="_inuserid"></param>
        //public void insert(int _inAdsId, int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        ilanFavori favoriIlan = new ilanFavori();
        //        favoriIlan.ilanId = _inAdsId;
        //        favoriIlan.kullaniciId = _inUserId;
        //        idc.ilanFavoris.InsertOnSubmit(favoriIlan);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_income"></param>
        //public void update()
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_inadsid"></param>
        /// <param name="_inuserid"></param>
        /// <returns></returns>
        //public ilanFavori search(int _inAdsId, int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ilanFavoris.Where(f => f.ilanId == _inAdsId && f.kullaniciId == _inUserId).FirstOrDefault();
        //        return value;
        //    }
        //}
        /// <summary>
        /// listele
        /// </summary>
        /// <param name="_index"></param>
        /// <param name="_count"></param>
        /// <param name="_inadsid"></param>
        /// <returns></returns>
        public string select(int _inWhoFrom, int _index, int _inCount, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.ilanFavoris.Where(i => i.ilan.silindiMi == false & i.kullaniciId == _inWhoFrom)
                            select new
                            {
                                i.ilanId,
                                i.ilan.baslik,
                                i.ilan.baslangicTarihi,
                                i.ilan.iller.ilAdi,
                                i.ilan.ilceler.ilceAdi,
                                i.ilan.mahalleler.mahalleAdi,
                                i.ilan.fiyat,
                                i.ilan.kategori.kategoriAdi,
                                ilanTur = EnumHelper.EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilan.ilanTurId.ToString())),
                                fiyatTur = EnumHelper.EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.ilan.fiyatTurId.ToString())),
                                resim = i.ilan.resim,
                                i.ilan.satildiMi,
                                baslikFormat = PublicHelper.Tools.URLConverter(i.ilan.baslik),
                                fiyatFormat = String.Format(" {0:N0}", i.ilan.fiyat),
                                tarihFormat = String.Format(" {0:dd MMMM yyyy}", i.ilan.baslangicTarihi),
                            };

                query = query.OrderByDescending(x => x.baslangicTarihi).Skip(_inCount * (_index)).Take(_inCount);
                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }

            //string sonuc = "";
            //foreach (var item in query.ToArray())
            //{
            //    string status = "";
            //    string resdata = item.resim;
            //    List<ExternalClass.resimDataType> resler = new List<ExternalClass.resimDataType>();
            //    resler = (List<ExternalClass.resimDataType>)toolkit.GetObjectInXml(resdata, typeof(List<ExternalClass.resimDataType>));

            //    ExternalClass.resimDataType seciliresim = new ExternalClass.resimDataType();
            //    if (resler.Count() == 0)
            //    {
            //        seciliresim.resim = "noImage.jpg";
            //    }
            //    else
            //    {
            //        foreach (ExternalClass.resimDataType rs in resler)
            //        {
            //            if (rs.seciliMi)
            //            {
            //                seciliresim.resim = "thmb_" + rs.resim;
            //                seciliresim.seciliMi = true;
            //            }
            //        }
            //    }

            //    if (item.satildiMi == true)
            //        status += @"<span class='item-location'><i class='icon-docs'></i>&nbsp; satıldı </span>";


            //    sonuc += @"<div class='item-list'>

            //                                        <div class='col-sm-2 no-padding photobox'>
            //                                            <div>              
            //                                                <a href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + @"-" + item.ilanId + @"/detay'
            //                                                    title='" + item.baslik + @"'>
            //                                                        <img
            //                                                           class='thumbnail no-margin' src='/upload/ilan/" + seciliresim.resim + @"'
            //                                                            alt='" + item.baslik + @"'></a>
            //                                            </div>
            //                                        </div>
            //                                        <!--/.photobox-->
            //                                        <div class='col-sm-7 add-desc-box'>
            //                                            <div class='add-details'>
            //                                                <h5 class='add-title'>
            //                                                <a href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + @"-" + item.ilanId + @"/detay'
            //                                                        title='" + item.baslik + @"'>" + item.baslik + @" </a></h5>
            //                                                <span class='info-row'><span
            //                                                        class='date'><i class=' icon-clock'></i>" + item.baslangicTarihi.ToString("dd MMMM yyyy") + @" </span>- <span
            //                                                            class='category'>" + item.ilanTur + " " + item.kategoriAdi + @" </span>- <span
            //                                                                class='item-location'><i class='icon-location-2'></i>&nbsp;" + item.ilAdi + " / " + item.ilceAdi + " / " + item.mahalleAdi + @" </span>
            //                                                                "+status+@"
            //                                                </span>
            //                                            </div>
            //                                        </div>
            //                                        <!--/.add-desc-box-->
            //                                        <div class='col-sm-3 text-right price-box'>
            //                                            <h2 class='item-price'>" + item.fiyatTur + " " + String.Format(" {0:N0}", item.fiyat) + @" </h2>
            //                                        </div>
            //                                        <!--/.add-desc-box-->
            //                                    </div>";
            //}
            //return sonuc;

        }
        //public int count(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.ilanFavoris.Count(i => i.kullaniciId == _inUserId && i.ilan.onay == 1 && i.ilan.silindiMi == false);
        //    }
        //}
    }
}
