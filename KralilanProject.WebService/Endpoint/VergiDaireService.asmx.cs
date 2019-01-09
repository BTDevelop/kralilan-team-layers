using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using Newtonsoft.Json;

namespace KralilanProject.WebService.Endpoint
{
    /// <summary>
    /// Summary description for VergiDaireService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class VergiDaireService : System.Web.Services.WebService
    {
        public IVergiDaireService vergiDaireService = new VergiDaireManager(new LTSVergiDairelerDal());


        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetByRegionId(int RegionId)
        {
            try
            {
                string result = JsonConvert.SerializeObject(vergiDaireService.GetByRegionId(RegionId));
                return result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }
    }
}
