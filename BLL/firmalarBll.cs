using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Newtonsoft.Json;
using System.IO;
using BLL.Formatter;
using BLL.ExternalClass;

namespace BLL
{
    public class firmalarBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_incomname"></param>
        /// <param name="_incompost"></param>
        /// <param name="_inphone"></param>
        /// <param name="_infaks"></param>
        /// <param name="_inaddress"></param>
        /// <param name="_inwebsite"></param>
        /// <param name="_inabout"></param>
        /// <param name="_inlogo"></param>
        //public void insert(string _inComName, string _inComPost, string _inPhone,
        //                   string _inFaks, string _inAddress, string _inWebsite, string _inAbout, string _inLogo)
        //{
        //    try
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            firmalar firma = new firmalar();
        //            firma.fadi = _inComName;
        //            firma.feposta = _inComPost;
        //            firma.ftelefon = _inPhone;
        //            firma.ffaks = _inFaks;
        //            firma.fadres = _inAddress;
        //            firma.fwebsite = _inWebsite;
        //            firma.fhakkinda = _inAbout;
        //            firma.flogo = _inLogo;
        //            firma.ftarih = DateTime.Now;
        //            firma.fsilindimi = false;
        //            idc.firmalars.InsertOnSubmit(firma);
        //            idc.SubmitChanges();
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        ex.ToString();
        //    }
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_incomid"></param>
        /// <param name="_incomname"></param>
        /// <param name="_incompost"></param>
        /// <param name="_inphone"></param>
        /// <param name="_infaks"></param>
        /// <param name="_inaddress"></param>
        /// <param name="_inwebsite"></param>
        /// <param name="_inabout"></param>
        /// <param name="_inlogo"></param>
        //public void update(int _inComId, string _inComName, string _inComPost, string _inPhone, string _inFaks, string _inAddress, 
        //                   string _inWebsite, string _inAbout, string _inLogo)
        //{
        //    try
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            var value = idc.firmalars.Where(q => q.firmaid == _inComId).FirstOrDefault();
        //            if (value != null)
        //            {
        //                value.fadi = _inComName;
        //                value.feposta = _inComPost;
        //                value.ftelefon = _inPhone;
        //                value.ffaks = _inFaks;
        //                value.fadres = _inAddress;
        //                value.fwebsite = _inWebsite;
        //                value.fhakkinda = _inAbout;
        //                value.flogo = _inLogo;
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
        /// 
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public firmalar search(int _id)
        //{
        //    try
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            var value = idc.firmalars.Where(q => q.firmaid == _id).FirstOrDefault();
        //            return value;
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <returns></returns>
        //public string getCompanyByUserId(int _inUserId, IFormatter _inReturnType)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from i in idc.firmalars.Where(i => i.fsilindimi == false && i.fkullanicid == _inUserId)
        //                    select new
        //                    {
        //                        i.firmaid,
        //                        i.fadi,
        //                        i.ftarih,
        //                        i.flogo
        //                    };

        //        formatter.FormatTo(_inReturnType);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }

        //}
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        //public firmalar getLastCompany()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.firmalars.OrderByDescending(x => x.firmaid).First();
        //        return value;
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_index"></param>
        /// <param name="_count"></param>
        /// <param name="_inads"></param>
        /// <param name="_inecho"></param>
        /// <param name="_income"></param>
        /// <returns></returns>
        public object getCompaniesJDatatables(int _index, int _inCount, string _inCompanyId, string _inEcho, int _income)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.firmalars.Where(i => i.fsilindimi == false)
                            select new ilanDataType
                            {
                                ilanId = i.firmaid,
                                resim = i.fadi,
                                baslik = i.feposta,
                                ilAdi = i.ftelefon,
                                baslangicTarihi = Convert.ToDateTime(i.ftarih),
								aciklama = String.Format("<a class='btn btn-primary btn-xs' target='_blank' href='/projeler/firma/{0}/{1}'>Görüntüle</a><a class='btn btn-warning btn-xs' target='_blank' href='/management/anaYonetim/projeYonetimi/proje.aspx?page=firma-duzenle&firma={0}'>Düzenle</a>", i.firmaid, PublicHelper.Tools.URLConverter(i.fadi))

								//aciklama = @"<a class='btn btn-primary btn-xs' target='_blank' href='/projeler/firma/" + i.firmaid + "/" + PublicHelper.Tools.URLConverter(i.fadi) + @"/'>Görüntüle</a>
								//<a class='btn btn-warning btn-xs' target='_blank' href='/management/anaYonetim/projeYonetimi/proje.aspx?page=firma-duzenle&firma=" + i.firmaid + @"'>Düzenle</a>"
							};


                if (!String.IsNullOrEmpty(_inCompanyId)) query = query.Where(q => q.resim.ToString() == _inCompanyId);

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

