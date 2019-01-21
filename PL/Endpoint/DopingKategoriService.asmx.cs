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
    /// Summary description for DopingKategoriService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DopingKategoriService : System.Web.Services.WebService
    {
        private IDopingKategoriService _dopingKategoriManager =
            new DopingKategoriManager(new LTSDopingKategorilerDal());
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetByDopingKategoriId(int DopingId, int CategoriId)
        {
            return JsonConvert.SerializeObject(_dopingKategoriManager.GetByDopingKategoriId(DopingId, CategoriId));
        }
    }
}
