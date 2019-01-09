using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using DAL.Enums;
using KralilanProject.Interfaces;
using Newtonsoft.Json;

namespace KralilanProject.WebService.Endpoint
{
    /// <summary>
    /// Summary description for IlanService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class IlanService : System.Web.Services.WebService
    {
        public IIlanService ilanService = new IlanManager(new LTSIlanlarDal());

        [WebMethod]
        public string GetBySaleFaceted(SortTypeString sortTypeString)
        {
            return JsonConvert.SerializeObject(ilanService.GetBySaleFaceted(sortTypeString));
        }

        [WebMethod]
        public string GetByLastDateFaceted(SortTypeString sortTypeString)
        {
            return JsonConvert.SerializeObject(ilanService.GetByLastDateFaceted(sortTypeString));
        }
    }
}
