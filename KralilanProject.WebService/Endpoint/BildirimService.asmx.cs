using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DAL.Concrete.LINQ;
using KralilanProject.BLL.Concrete;
using KralilanProject.Interfaces;
using Newtonsoft.Json;
using BLL.Concrete;

namespace KralilanProject.WebService.Endpoint
{
    /// <summary>
    /// Summary description for BildirimService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class BildirimService : System.Web.Services.WebService
    {

        public IBildirimService bildirimService = new BildirimManager(new LTSBildirimlerDal());


        [WebMethod]
        public string HelloWorld()
        {
            return null;
        }

        [WebMethod]
        public string GetByUserId(int UserId, int Index)
        {
            try
            {
                string result = JsonConvert.SerializeObject(bildirimService.GetByUserId(UserId, Index));
                return result;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }
    }
}
