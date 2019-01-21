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
    /// Summary description for KullaniciTakipService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class KullaniciTakipService : System.Web.Services.WebService
    {
        private IKullaniciTakipService _kullaniciTakipManager =
            new KullaniciTakipManager(new LTSKullaniciTakipcilerDal());
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public void Delete(int UserId, int FollowerId)
        {
            kullaniciTakip _kullaniciTakip = new kullaniciTakip
            {
                kullaniciId = UserId,
                takipciId = FollowerId
            };

            _kullaniciTakipManager.Delete(_kullaniciTakip);

        }


        [WebMethod]
        public void Add(int UserId, int FollowerId)
        {
            kullaniciTakip _kullaniciTakip = new kullaniciTakip
            {
                kullaniciId = UserId,
                takipciId = FollowerId
            };

            _kullaniciTakipManager.Add(_kullaniciTakip);

        }
    }
}
