using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using Newtonsoft.Json;

namespace PL.Endpoint
{
    /// <summary>
    /// Summary description for LocationService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LocationService : System.Web.Services.WebService
    {
        private IIlService _ilManager = new IlManager(new LTSIllerDal());
        private IIlceService _ilceManager = new IlceManager(new LTSIlcelerDal());
        private IMahalleService _mahalleManager = new MahalleManager(new LTSMahallelerDal());

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetLocation(int RegionId, int CityId)
        {
            if (RegionId == -1 && CityId == -1)
            {
                return JsonConvert.SerializeObject(_ilManager.GetRegions());
            }
            else if (CityId == -1)
            {
                return JsonConvert.SerializeObject(_ilceManager.GetByRegionId(RegionId));
            }
            else if (RegionId == -1)
            {
                return JsonConvert.SerializeObject(_mahalleManager.GetAllByCityId(CityId));
            }
            else
            {
               return null;
            }

        }
    }
}
