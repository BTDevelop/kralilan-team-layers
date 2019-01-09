using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using DAL;
using BLL;
using System.Web.Script.Services;
using System.Net;
using BLL.ExternalClass;
using static BLL.ozelliklerBll;
using static DAL.toolkit;
using BLL.Formatter;
using BLL.PublicHelper;

namespace PL.Services
{
    /// <summary>
    /// Summary description for ki_operation
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]


    public class ki_operation : System.Web.Services.WebService
    {
        ilanBll ilanBll = new ilanBll();
        seciliDopingBll secDopingBll = new seciliDopingBll();
        ilBll il = new ilBll();
        ilceBll ilce = new ilceBll();
        mahalleBll mahalle = new mahalleBll();
        ilanFavoriBll favori = new ilanFavoriBll();
        magazaTakipciBll magazaTakip = new magazaTakipciBll();
        vergiDaireBll vergiBll = new vergiDaireBll();
        magazaTurBll magazaTurb = new magazaTurBll();
        odemeBll odemeb = new odemeBll();
        kullaniciBll kullanicib = new kullaniciBll();
        magazaTelefonBll magazaTlfb = new magazaTelefonBll();
        magazaTakipciBll magazaTkpb = new magazaTakipciBll();
        magazaKullaniciBll magazaKllb = new magazaKullaniciBll();
        dopingKategoriBll dopingKtgb = new dopingKategoriBll();
        mesajBll mesajb = new mesajBll();
        kullaniciTakipciBll kullaniciTb = new kullaniciTakipciBll();
        bildirimBll bildirimb = new bildirimBll();
        magazaTakipciBll magazaTb = new magazaTakipciBll();
        projelerBll projeb = new projelerBll();
        ozelliklerBll ozelliklerBLL = new ozelliklerBll();
        magazaBll magazaBLL = new magazaBll();

        JsonFormat jsonFormat = new JsonFormat();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inprovname"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getProvinAdsCnt(string inprovname, int opt)
        {
            try
            {
                int _inProvId = String.IsNullOrEmpty(inprovname) ? -1 : Convert.ToInt32(inprovname);

                if (_inProvId == -1) return ilanBll.getAdsCountByProvince();
                else return ilanBll.getAdsCountByDistrict(_inProvId);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inprovname"></param>
        /// <returns></returns>
        [WebMethod]
        public string getProviProjectCnt(string inprovname)
        {
            try
            {
                return projeb.getProjectCountByProvince();
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inuserid"></param>
        /// <param name="operationtype"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getPaymentInfo(int inuserid, int operationtype, int index, int count, int opt)
        {
            try
            {
                string result = "";
                if (opt == 1)
                    result = odemeb.getPayByUserId(inuserid, operationtype, index, count, jsonFormat);

                return result;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <param name="tur"></param>
        /// <param name="whoFrom"></param>
        /// <param name="sort"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListSeller(int index, int count, int opt, int tur, int whoFrom, int sort)
        {
            try
            {
                var pageSize = count;
                var pageIndex = index;

                if (opt == 1) return ilanBll.getAdsBySellerUser(whoFrom, pageIndex, pageSize, jsonFormat);

                else return ilanBll.getAdsByStoreId(whoFrom, pageIndex, pageSize, jsonFormat, sort);

            }
            catch (Exception)
            {

                return "error:";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <param name="tur"></param>
        /// <param name="whoFrom"></param>
        /// <param name="sort"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListCompanyProject(int index, int count, int opt, int tur, int whoFrom, int sort)
        {
            try
            {
                bool ctrl = true;
                if (opt == 1)
                    ctrl = true;
                else
                    ctrl = false;

                var pageSize = count;
                var pageIndex = index;

                return projeb.CompanyProject(whoFrom, pageIndex, pageSize, ctrl);

            }
            catch (Exception)
            {

                return "error:";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <param name="tur"></param>
        /// <param name="doping"></param>
        /// <param name="datatype"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListDoping(int index, int count, int opt, int tur, int doping, int datatype)
        {
            try
            {
                var pageSize = count;
                var pageIndex = index;
                if (opt == 1)
                {
                    return secDopingBll.select(pageIndex, pageSize, tur, doping, jsonFormat);
                }
                else if (opt == 2)
                {
                    string result = ilanBll.getLastHoursAds(pageIndex, pageSize, tur, jsonFormat, 1);
                    return result;
                }
                else
                {
                    return ilanBll.getSalesAds(pageIndex, pageSize, tur, jsonFormat);
                }

            }
            catch (Exception)
            {

                return "error:";
            }
        }
      

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_incomestr"></param>
        /// <param name="_intextstr"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <param name="tur"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListFiltre(string _incomestr, string _intextstr, int index, int count, int opt, int tur)
        {       
            try
            {
                int[] _income = JsonConvert.DeserializeObject<int[]>(_incomestr);
                var _intext = JsonConvert.DeserializeObject<jsonintextDataType>(_intextstr);
                var pageSize = count;
                var pageIndex = index;

                string sonuc = ilanBll.FilterClassified(pageIndex, pageSize, _income, _intext, tur);

                return sonuc;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="incomestr"></param>
        /// <param name="intextstr"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        [WebMethod]
        public string getFilter(string incomestr, string intextstr, int index, int count, int opt, int type)
        {
            string[] income = JsonConvert.DeserializeObject<string[]>(incomestr);
            var intext = JsonConvert.DeserializeObject<jsonintextDataType>(intextstr);
            try
            {
                var pageSize = count;
                var pageIndex = index;
                string result = ilanBll.getMultipleFilterAds(pageIndex, pageSize, income, intext, (FormatDataType)type);
                return result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="provid"></param>
        /// <param name="distid"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListLocation(int provid, int distid, int opt)
        {
            try
            {
                if (opt == 1)
                    return il.select();
                else if (opt == 2)
                    return ilce.select(provid);
                else if (opt == 3)
                    return mahalle.select(distid);
                else
                    return null;
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inuserid"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListUserAds(int inuserid, int index, int count, int opt)
        {
            try
            {
                if (opt == 1)
                    return favori.select(inuserid, index, count, jsonFormat);
                else if (opt == 2)
                    return magazaTakip.select(inuserid, index, count);
                else
                    return kullaniciTb.select(inuserid, index, count);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="catid"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListStore(int catid, int opt)
        {
            try
            {
                if (opt == 1)
                    return magazaTurb.select(catid);
                else
                    return null;
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inuserid"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListSpclUserAds(int inuserid, int index, int count, int opt)
        {
            try
            {
                if (opt == 1)
                    return ilanBll.getAdsUserOrStore(inuserid, index, count, opt, jsonFormat);
                else
                    return ilanBll.getAdsUserOrStore(inuserid, index, count, opt, jsonFormat);
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inuserid"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListSpclUserProject(int inuserid, int index, int count, int opt)
        {
            try
            {
                return projeb.SpecialUserProject(inuserid, index, count, jsonFormat);

            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inadsid"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getDetailAds(int inadsid, int opt)
        {
            try
            {
                if (opt == 1)
                {
                    //List<girilenDataType> girilenler = new List<girilenDataType>();
                    //List<secilenDataType> secilenler = new List<secilenDataType>();
                    //List<detayDataType> ozellikler = new List<detayDataType>();

                    //secilenler = (List<secilenDataType>)toolkit.GetObjectInXml(ilanBll.search(inadsid).secilenOzellik, typeof(List<secilenDataType>));

                    //foreach (var item in secilenler)
                    //{
                    //    ozellikler prop = ozelliklerBLL.search(item.ozellikId);
                    //    if (prop.ozellikTipi == selectVal)
                    //    {
                    //        var detailData = new detayDataType
                    //        {
                    //            ozellikAd = prop.ozellikAdi,
                    //            deger = ozelliklerBLL.searchPropValue(item.ozellikId, item.deger)
                    //        };

                    //        ozellikler.Add(detailData);
                    //    }
                    //}

                    //girilenler = (List<girilenDataType>)toolkit.GetObjectInXml(ilanBll.search(inadsid).girilenOzellik, typeof(List<girilenDataType>));

                    //foreach (var item in girilenler)
                    //{
                    //    ozellikler prop = ozelliklerBLL.search(item.ozellikId);

                    //    if (prop.ozellikTipi == textVal)
                    //    {
                    //        var income = new detayDataType
                    //        {
                    //            ozellikAd = prop.ozellikAdi,
                    //            deger = item.deger
                    //        };

                    //        ozellikler.Add(income);

                    //    }
                    //}

                    string _result = null;
                    return _result;
                }
                else if (opt == 2)
                {
                    List<resimDataType> resimler = new List<resimDataType>();
                    resimler = (List<resimDataType>)DAL.toolkit.GetObjectInXml(ilanBll.search(inadsid).resim, typeof(List<resimDataType>));
                    string _result = JsonConvert.SerializeObject(resimler);
                    return _result;
                }
                else if (opt == 3)
                {
                    string coordinates = "";
                    coordinates = ilanBll.search(inadsid).koordinat;
                    return coordinates;
                }
                else
                {
                    string store = "";
                    store = ilanBll.search(inadsid).magaza.magazaTur.turId.ToString();
                    return store;
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inproid"></param>
        /// <returns></returns>
        [WebMethod]
        public string getProjectCoords(int inproid)
        {
            try
            {
                string coordinates = "";
                coordinates = projeb.search(inproid).pkoordinat;
                return coordinates;
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inadsdata"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string ctrlClassified(string inadsdata, int opt)
        {
            try
            {
                var result = ilanBll.getAdsUniqueControl(inadsdata);
                return result;
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="instoreid"></param>
        /// <param name="opt"></param>
        /// <param name="datatype"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListPhone(int instoreid, int opt, int datatype)
        {
            try
            {
                string result = "";
                if (opt == 1)
                    result = magazaTlfb.select(instoreid, jsonFormat);

                return result;
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="instoreid"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <param name="datatype"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListStoreInfo(int instoreid, int index, int count, int opt, int datatype)
        {
            string sonuc = "";
            if (opt == 1)
                sonuc = magazaTkpb.getStoreFollowers(instoreid, index, count, jsonFormat);
            else if (opt == 2)
                sonuc = magazaKllb.select(instoreid, jsonFormat);

            return sonuc;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="catid"></param>
        /// <param name="dopingid"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListDopingType(int catid, int dopingid)
        {
            string result = "";
            try
            {
                result = dopingKtgb.select(catid, dopingid, jsonFormat);
                return result;
            }
            catch (Exception)
            {

                return "error:";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="oneid"></param>
        /// <param name="twoid"></param>
        /// <param name="adsid"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListMessage(int index, int count, int oneid, int twoid, int adsid, int opt)
        {
            try
            {
                string result = "";

                //if (opt == 1)
                //{
                //    result = mesajb.select(index, count, oneid, twoid, adsid);
                //}
              

                return result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="oneid"></param>
        /// <param name="twoid"></param>
        /// <param name="adsid"></param>
        /// <param name="message"></param>
        /// <param name="opt"></param>
        [WebMethod]
        public void ctrlMessage(int oneid, int twoid, int adsid, string message, int opt)
        {
            try
            {
                //if (opt == 1)
                //    mesajb.insert(twoid, oneid, adsid, message);
                //else
                //    mesajb.updateReadMessages(oneid, twoid, adsid);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="oneid"></param>
        /// <param name="twoid"></param>
        /// <param name="opt"></param>
        [WebMethod]
        public void ctrlSellerFollow(int oneid, int twoid, int opt)
        {
            try
            {
                if (opt == 1) kullaniciTb.delete(oneid, twoid);
                else kullaniciTb.insert(oneid, twoid);
            }
            catch (Exception)
            {
                throw;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="oneid"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListNotification(int index, int count, int oneid, int opt)
        {
            try
            {
                string result = "";
                if (opt == 1) result = bildirimb.select(index, count, oneid);
                return result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="oneid"></param>
        /// <param name="twoid"></param>
        /// <param name="opt"></param>
        [WebMethod]
        public void ctrlStoreFollow(int oneid, int twoid, int opt)
        {
            try
            {
                if (opt == 1) magazaTb.delete(oneid, twoid);
                else magazaTb.insert(oneid, twoid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="adsid"></param>
        /// <returns></returns>
        [WebMethod]
        public string getAdsPic(int adsid)
        {
            try
            {
                List<resimDataType> resimler = new List<resimDataType>();
                resimler = (List<resimDataType>)DAL.toolkit.GetObjectInXml(ilanBll.search(adsid).resim, typeof(List<resimDataType>));
                string result = JsonConvert.SerializeObject(resimler);

                return result;
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// /
        /// </summary>
        /// <param name="instoreid"></param>
        /// <returns></returns>
        [WebMethod]
        public string getStoreType(int instoreid)
        {
            try
            {
                return magazaBLL.getStoreTypeByStoreId(instoreid);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inuserid"></param>
        /// <param name="_indtrange"></param>
        /// <returns></returns>
        [WebMethod]
        public string getEditorAdsCount(int _inuserid, int _indtrange)
        {
            try
            {
                return ilanBll.getAdsCountByEditorId(_inuserid, _indtrange).ToString();
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="inuserid"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getListEditorAds(int inuserid, int index, int count, int opt)
        {
            try
            {
                return ilanBll.EditorClassified(inuserid, index, count, opt);
            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <returns></returns>
        [WebMethod]
        public string getLastetsUser(int index, int count, int opt)
        {
            try
            {
                return kullanicib.getLastRecorUsers(index, count);

            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="income"></param>
        /// <returns></returns>
        [WebMethod]
        public string getUrlConverter(string income)
        {
            try
            {
                return Tools.URLConverter(income);

            }
            catch (Exception)
            {

                throw;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_incomestr"></param>
        /// <param name="_intextstr"></param>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="opt"></param>
        /// <param name="tur"></param>
        /// <returns></returns>
        [WebMethod]
        public string getFilterProject(string _incomestr, string _intextstr, int index, int count, int opt, int tur)
        {
            int[] _income = JsonConvert.DeserializeObject<int[]>(_incomestr);
            var _intext = JsonConvert.DeserializeObject<jsonintextDataType>(_intextstr);
            try
            {
                var pageSize = count;
                var pageIndex = index;

                string sonuc = projeb.FilterProject(pageIndex, pageSize, _income, _intext, tur);

                ilanDataType ilantype = new ilanDataType();
                List<ilanDataType> list = new List<ilanDataType>();

                return sonuc;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="proid"></param>
        /// <returns></returns>
        [WebMethod]
        public string getProjectGalery(int proid)
        {
            try
            {
                List<resimDataType> resimler = new List<resimDataType>();

                resimler = (List<resimDataType>)DAL.toolkit.GetObjectInXml(projeb.search(proid).pgaleri, typeof(List<resimDataType>));

                string result = JsonConvert.SerializeObject(resimler);
                return result;
            }
            catch (Exception)
            {

                throw;
            }
         
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="index"></param>
        /// <param name="count"></param>
        /// <param name="userId"></param>
        /// <param name="storeId"></param>
        /// <param name="searchWord"></param>
        /// <param name="status"></param>
        /// <param name="dataType"></param>
        /// <returns></returns>
        [WebMethod]
        public string getClassifiedBySeller(int index, int count, int userId, int storeId, string searchWord, int status, int dataType)
        {
            try
            {
                string _result = ilanBll.getAdsByStore(index, count, userId, storeId, searchWord, status, jsonFormat);
                return _result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="storeId"></param>
        /// <param name="dataRange"></param>
        /// <returns></returns>
        [WebMethod]
        public string getViewsClassifiedByStore(int storeId, int dataRange)
        {
            try
            {
                string _result = ilanBll.GetViewsReportByStore(storeId, dataRange);
                return _result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="storeId"></param>
        /// <returns></returns>
        [WebMethod]
        public string getReportClassifiedByStore(int storeId)
        {
            try
            {
                string _result = ilanBll.getAdsClaimByStore(storeId);
                return _result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        //[WebMethod]
        //public string getFilterCount(string incomestr, string intextstr, int index, int count, int opt, int type)
        //{
        //    string[] income = JsonConvert.DeserializeObject<string[]>(incomestr);
        //    var intext = JsonConvert.DeserializeObject<jsonintextDataType>(intextstr);
        //    try
        //    {
        //        var pageSize = count;
        //        var pageIndex = index;

        //        string sonuc = ilanBll.CountFilterClassified(pageIndex, pageSize, income, intext, (FormatDataType)type);
        //        return sonuc;
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.ToString();
        //    }
        //}

        //[WebMethod]
        //public string getSpecialCa(int catid, int typeid)
        //{

        //    string result = "";
        //    int staticdata = Convert.ToInt32(kategoriBll.search(catid).ustKategoriId);


        //    if (typeid == -1)
        //    {

        //        if (kategoriTurb.search(catid) == null)
        //        {
        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                result = "bitti";

        //            }
        //            else
        //            {

        //                var query = idc.kategoris.Where(x => x.ustKategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-id='" + item.kategoriId + "' href='#'>" + item.kategoriAdi + "</a>";
        //                }
        //            }
        //        }
        //        else
        //        {
        //            var dataaaaaa = kategoriTurb.getTypeByCategori(staticdata);

        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                if (dataaaaaa != null)
        //                {
        //                    result = "bitti";
        //                }
        //                else
        //                {
        //                    var query = idc.kategoriTurs.Where(x => x.kategoriId == catid);

        //                    foreach (var item in query)
        //                    {
        //                        result += "<a data-wid='" + item.turId + "' href='#'>" + DAL.toolkit.AdsType(item.turId) + "</a>";
        //                    }
        //                }

        //            }
        //            else
        //            {
        //                var query = idc.kategoriTurs.Where(x => x.kategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-wid='" + item.turId + "' href='#'>" + DAL.toolkit.AdsType(item.turId) + "</a>";
        //                }
        //            }
        //        }

        //    }
        //    else
        //    {
        //        if (typeid != -1)
        //        {
        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                result = "bitti";
        //            }
        //            else
        //            {
        //                var query = idc.kategoriTurs.Where(x => x.turId == typeid & x.kategori.ustKategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-id='" + item.kategoriId + "' href='#'>" + item.kategori.kategoriAdi + "</a>";
        //                }
        //            }

        //        }
        //    }

        //    string data = result;

        //    return result;

        //}


        //[WebMethod]
        //public string getListSpclStoreAds(int instoreid, int index, int count, int opt)
        //{
        //    if (opt == 1)
        //        return ilanBll.SpecialStoreClassified(instoreid, index, count, opt);
        //    else
        //        return "";
        //}

        //[WebMethod]
        //public string getListSearching(string _incity, string _intext, int index, int count, int opt, int tur, int sort)
        //{
        //    try
        //    {
        //        string sonuc = ilanBll.SearchingClassified(index, count, _incity, _intext, tur, sort);

        //        return sonuc;
        //    }
        //    catch (Exception ex)
        //    {
        //        return ex.ToString();
        //    }
        //}

        //[WebMethod]

        //public string getMapProperties(int index, int count, int proid, int datatype)
        //{
        //    try
        //    {
        //        var pageSize = count;
        //        var pageIndex = index;

        //        return secDopingBll.LocationEmerClassified(pageIndex, pageSize, proid, datatype);

        //    }
        //    catch
        //    {
        //        throw;
        //    }

        //}

        //[WebMethod]
        //public string getListAds(int index, int count, int opt, int tur, int whoFrom, int catId, int turId)
        //{
        //    try
        //    {
        //        var pageSize = count;
        //        var pageIndex = index;
        //        if (opt == 1)
        //        {
        //            var query = from x in idc.ilans.Where(i => i.onay == 1 & i.silindiMi == false)
        //                        select new
        //                        {
        //                            RowIndex = index + 1,
        //                            x.ilanId,
        //                            x.baslik,
        //                            x.baslangicTarihi,
        //                            x.iller.ilAdi,
        //                            x.ilceler.ilceAdi,
        //                            x.kategori,
        //                            x.kategoriId,
        //                            x.ilanTurId,
        //                            x.fiyat,
        //                            x.mahalleler.mahalleAdi,
        //                            ilanTur = DAL.toolkit.AdsType(x.ilanTurId),
        //                            fiyatTur = DAL.toolkit.GiveCurrency(x.fiyatTurId),
        //                            x.magazaId,
        //                            magazaTur = x.magaza.magazaTur.turId,
        //                            x.resim
        //                        };

        //            if (catId != -1)
        //            {
        //                if (idc.kategoris.Where(x => x.ustKategoriId == catId).FirstOrDefault() == null)
        //                {/*alt kategori ve tur varsa*/
        //                    query = query.Where(q => q.kategoriId == catId);
        //                }
        //                else
        //                {
        //                    query = query.Where(q => q.kategori.ustKategoriId == catId);

        //                }
        //            }

        //            if (turId != -1)
        //            {
        //                query = query.Where(q => q.ilanTurId == turId);
        //            }


        //            if (whoFrom != -1)
        //            {
        //                if (whoFrom != 0)
        //                {
        //                    query = query.Where(q => q.magazaTur == whoFrom);
        //                }
        //                else
        //                {
        //                    query = query.Where(q => q.magazaId == null);
        //                }
        //            }

        //            if (tur == 1)
        //            {
        //                query = query.OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);
        //            }

        //            else if (tur == 2)
        //            {
        //                query = query.OrderBy(x => x.fiyat).OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);
        //            }
        //            else if (tur == 3)
        //            {
        //                query = query.OrderByDescending(x => x.fiyat).OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);
        //            }

        //            else if (tur == 4)
        //            {
        //                query = query.OrderBy(x => x.baslangicTarihi).OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);
        //            }
        //            else if (tur == 5)
        //            {
        //                query = query.OrderByDescending(x => x.baslangicTarihi).OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);
        //            }
        //            else if (tur == 6)
        //            {
        //                query = query.OrderBy(x => x.ilAdi).OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);
        //            }
        //            else if (tur == 7)
        //            {
        //                query = query.OrderByDescending(x => x.ilAdi).OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);
        //            }

        //            string sonuc = "";
        //            foreach (var item in query)
        //            {
        //                string resdata = item.resim;
        //                List<resimDataType> resler = new List<resimDataType>();
        //                resler = (List<resimDataType>)DAL.toolkit.GetObjectInXml(resdata, typeof(List<resimDataType>));

        //                resimDataType seciliresim = new resimDataType();
        //                if (resler.Count() == 0)
        //                {
        //                    seciliresim.resim = "noImage.jpg";
        //                }
        //                else
        //                {
        //                    foreach (resimDataType rs in resler)
        //                    {

        //                        seciliresim.resim = "thmb_" + rs.resim;
        //                        seciliresim.seciliMi = true;
        //                        break;

        //                    }
        //                }
        //                sonuc += @"<div class='list-r-b-div clearfix'>
        //                        			<div class='list-r-b-d list-r-b-d-1'>
        //                        				<a target='_blank' href='/ilan/" + PublicHelper.Tools.URLConverter(item.baslik) + @"-" + item.ilanId + @"/detay'><img src='/upload/ilan/" + seciliresim.resim + @"' alt='" + item.baslik + @"' width='90' height='60'></a>
        //                        			</div>
        //                        			<div class='list-r-b-d list-r-b-d-2'>
        //                        				<h5 class='add-title'><strong>" + item.baslik + @"</strong></h5>
        //                        			</div>
        //                        			<div class='list-r-b-d list-r-b-d-3'>
        //                        				<h5 class='item-price'>" + item.fiyatTur + "  " + String.Format(" {0:N0}", item.fiyat) + @"</h5>
        //                        			</div>
        //                        			<div class='list-r-b-d list-r-b-d-4'>
        //                        				<span class='date'><i class='icon-clock'></i> " + item.baslangicTarihi.ToString("dd MMMM yyyy") + @" </span>
        //                        			</div>
        //                        			<div class='list-r-b-d list-r-b-d-5'>
        //                        				<span class='item-location'><i class='fa fa-map-marker'></i>" + item.ilAdi + @"<br />/" + item.ilceAdi + @"</span>
        //                                    </div>
        //                        		</div>";
        //            }
        //            return sonuc;

        //        }
        //        else
        //        {
        //            return null;
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        return "error:";
        //    }

        //}


        //[WebMethod]
        //public string getSpecialCategories(int catid, int typeid)
        //{

        //    string result = "";
        //    int staticdata = Convert.ToInt32(kategoriBll.search(catid).ustKategoriId);


        //    if (typeid == -1)
        //    {

        //        if (kategoriTurb.search(catid) == null)
        //        {
        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                result = "bitti";

        //            }
        //            else
        //            {

        //                var query = idc.kategoris.Where(x => x.ustKategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-id='" + item.kategoriId + "' href='#'>" + item.kategoriAdi + "</a>";
        //                }
        //            }
        //        }
        //        else
        //        {
        //            var dataaaaaa = kategoriTurb.getTypeByCategori(staticdata);

        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                if (dataaaaaa != null)
        //                {
        //                    result = "bitti";
        //                }
        //                else
        //                {
        //                    var query = idc.kategoriTurs.Where(x => x.kategoriId == catid);

        //                    foreach (var item in query)
        //                    {
        //                        result += "<a data-wid='" + item.turId + "' href='#'>" + DAL.toolkit.AdsType(item.turId) + "</a>";
        //                    }
        //                }

        //            }
        //            else
        //            {
        //                var query = idc.kategoriTurs.Where(x => x.kategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-wid='" + item.turId + "' href='#'>" + DAL.toolkit.AdsType(item.turId) + "</a>";
        //                }
        //            }
        //        }

        //    }
        //    else
        //    {
        //        if (typeid != -1)
        //        {
        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                result = "bitti";
        //            }
        //            else
        //            {
        //                var query = idc.kategoriTurs.Where(x => x.turId == typeid & x.kategori.ustKategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-id='" + item.kategoriId + "' href='#'>" + item.kategori.kategoriAdi + "</a>";
        //                }
        //            }

        //        }
        //    }

        //    string data = result;

        //    return result;

        //}


        //[WebMethod]
        //public string getCat(int catid, int typeid)
        //{

        //    string result = "";
        //    int staticdata = Convert.ToInt32(kategoriBll.search(catid).ustKategoriId);


        //    if (typeid == -1)
        //    {

        //        if (kategoriTurb.search(catid) == null)
        //        {
        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                result = "bitti";

        //            }
        //            else
        //            {

        //                var query = idc.kategoris.Where(x => x.ustKategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-id='" + item.kategoriId + "' href='#'>" + item.kategoriAdi + "</a>";
        //                }
        //            }
        //        }
        //        else
        //        {
        //            var dataaaaaa = kategoriTurb.getTypeByCategori(staticdata);

        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                if (dataaaaaa != null)
        //                {
        //                    result = "bitti";
        //                }
        //                else
        //                {
        //                    var query = idc.kategoriTurs.Where(x => x.kategoriId == catid);

        //                    foreach (var item in query)
        //                    {
        //                        result += "<a data-wid='" + item.turId + "' href='#'>" + DAL.toolkit.AdsType(item.turId) + "</a>";
        //                    }
        //                }

        //            }
        //            else
        //            {
        //                var query = idc.kategoriTurs.Where(x => x.kategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-wid='" + item.turId + "' href='#'>" + DAL.toolkit.AdsType(item.turId) + "</a>";
        //                }
        //            }
        //        }

        //    }
        //    else
        //    {
        //        if (typeid != -1)
        //        {
        //            if (kategoriBll.TopCategories(catid) == null)
        //            {
        //                result = "bitti";
        //            }
        //            else
        //            {
        //                var query = idc.kategoriTurs.Where(x => x.turId == typeid & x.kategori.ustKategoriId == catid);

        //                foreach (var item in query)
        //                {
        //                    result += "<a data-id='" + item.kategoriId + "' href='#'>" + item.kategori.kategoriAdi + "</a>";
        //                }
        //            }

        //        }
        //    }

        //    string data = result;

        //    return result;

        //}

    }

}
