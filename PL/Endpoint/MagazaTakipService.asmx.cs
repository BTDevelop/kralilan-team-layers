using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.Endpoint
{
    /// <summary>
    /// Summary description for MagazaTakipService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class MagazaTakipService : System.Web.Services.WebService
    {
        private IMagazaTakipciService _magazaTakipciManager = new MagazaTakipciManager(new LTSMagazaTakipcilerDal());

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public void Add(int StoreId, int UserId)
        {
            magazaTakip _kullaniciTakip = new magazaTakip
            {
                kullaniciId = UserId,
                magazaId = StoreId
            };

            _magazaTakipciManager.Add(_kullaniciTakip);
        }

        [WebMethod]
        public void Delete(int StoreId, int UserId)
        {
            magazaTakip _kullaniciTakip = new magazaTakip
            {
                kullaniciId = UserId,
                magazaId = StoreId
            };

            _magazaTakipciManager.Delete(_kullaniciTakip);
        }
    }
}
