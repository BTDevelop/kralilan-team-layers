using KralilanProject.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using Newtonsoft.Json;

namespace PL.Endpoint
{
    /// <summary>
    /// Summary description for VergiDaireService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]

   

    public class VergiDaireService : System.Web.Services.WebService
    {
        private IVergiDaireService _vergiDaireManager = new VergiDaireManager(new LTSVergiDairelerDal());

        [WebMethod]
        public string GetByRegionId(int RegionId)
        {
            return JsonConvert.SerializeObject(_vergiDaireManager.GetByRegionId(RegionId));
        }


    }
}
