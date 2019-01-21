using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using DAL.Enums;
using KralilanProject.Interfaces;
using Microsoft.ApplicationInsights.Extensibility.Implementation;
using Newtonsoft.Json;

namespace PL.Endpoint
{
    /// <summary>
    /// Summary description for SeciliDopingService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class SeciliDopingService : System.Web.Services.WebService
    {
        private ISeciliDopingService _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());

        [WebMethod]
        public string GetByDopingIdFaceted(int DopingId, int Index, int SortType)
        {
            string _val = JsonConvert.SerializeObject(
                _seciliDopingManager.GetAllByDopingIdFaceted(DopingId, Index, (SortTypeString) SortType));

            return _val;
        }
    }
}
