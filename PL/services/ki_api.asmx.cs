using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL;
using DAL;
using Newtonsoft.Json;
using System.Text;

namespace PL.services
{
    /// <summary>
    /// Summary description for ki_api
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called s script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ki_api : System.Web.Services.WebService
    {
        kullaniciBll kullanicib = new kullaniciBll();

        //[WebMethod]
        //public string giveMeUserInfo(string mail)
        //{

        //    string _result = "";

        //    var _value = idc.kullanicis.Where(q => q.email == mail && q.silindiMi == false).Select(x => new
        //    {
        //        x.kullaniciAdSoyad,
        //        x.kullaniciId

        //    }).FirstOrDefault();


        //    _result = JsonConvert.SerializeObject(_value);

        //    return _result;
        //}

        [WebMethod]
        public string giveMeOnlineUser(int _index, int _count)
        {
            string result = kullanicib.getOnlineUsers(_index,_count);
            return result;
        }

    }
}

