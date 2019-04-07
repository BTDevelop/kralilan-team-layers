using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using BLL.ExternalClass;
using DAL.Concrete.ADONET;
using DAL.Concrete.LINQ;
using DAL.Enums;
using KralilanProject.Entities;
using KralilanProject.Interfaces;
using Newtonsoft.Json;
using NLog.Filters;

namespace PL.Endpoint
{
    /// <summary>
    /// Summary description for IlanService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class IlanService : System.Web.Services.WebService
    {
        private IIlanService _ilanManager = new IlanManager(new LTSIlanlarDal());
        private IIlanService _ilanAdoManager = new IlanManager(new ADOIlanlarDal());
        private IIlanSatilanService _ilanSatilanManager = new IlanSatilanManager(new LTSIlanSatilanDal());

        [WebMethod]
        public string Get(int Id)
        {
            return JsonConvert.SerializeObject(_ilanManager.Get(Id));
        }

        [WebMethod]
        public string GetAllRegion()
        {
            return JsonConvert.SerializeObject(_ilanManager.GetAllRegion());
        }


        [WebMethod]
        public string GetFaceted(int Index, string GeneralFilter, string OtherFilter)
        {
            int[] _generalFilter = JsonConvert.DeserializeObject<int[]>(GeneralFilter);
            var _otherFilter = JsonConvert.DeserializeObject<Filtre>(OtherFilter);

            string a = JsonConvert.SerializeObject(_ilanAdoManager.GetFaceted(Index, _generalFilter, _otherFilter));

            return a;
        }

        [WebMethod]
        public string GetBySaleFaceted(int Index)
        {
            var result = JsonConvert.SerializeObject(_ilanSatilanManager.GetBySaleFaceted(Index, SortTypeString.IdDesc));
            return result;
        }

        [WebMethod]
        public string GetCoordinatesById(int Id)
        {
            var ads = _ilanManager.Get(Id);
            if (ads == null)
            {
                var adsSale = _ilanSatilanManager.Get(Id);
                return adsSale.koordinat;
            }

            return ads.koordinat;
        }
    }
}
