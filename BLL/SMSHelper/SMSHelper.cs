using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace BLL.SMSHelper
{
    public class UserModel
    {
        private string _Username;

        public string username
        {
            get { return _Username; }
            set { _Username = value; }
        }

        private string _Password;

        public string password
        {
            get { return _Password; }
            set { _Password = value; }
        }
    }
    public class SingleSms
    {
        public string apikey { get; set; }
        public string type = "single";
        public string orjin { get; set; }
        public string gonderimzamani { get; set; }
        public string dil { get; set; }
        public string flashsms { get; set; }
        public string mesajmetni { get; set; }
        public string[] numaralar { get; set; }
    }
    public class apimodel
    {
        public string apikey { get; set; }
    }
    public static class SMSSender
    {
        public static string getbasliklar()
        {
            apimodel post = new apimodel();
            post.apikey = apikey;
            string json = JsonConvert.SerializeObject(apikey);

            string result = apipost("/settings/getOrgins", json);
            return result;
        }
        public static string getkontur()
        {
            apimodel post = new apimodel();
            post.apikey = apikey;
            string json = JsonConvert.SerializeObject(apikey);

            string result = apipost("/reports/getcredit", json);
            return result;
        }
        public static string apipost(string Url, string Json)
        {
            string result = "";
            string _Url = "http://apiv5.basscell.com" + Url;
            using (WebClient wc = new WebClient())
            {
                wc.Encoding = ASCIIEncoding.UTF8;
                result = wc.UploadString(_Url, Json);
            }
            return result;

        }
        private static string _apikey;
        public static string simdi()
        {
            DateTime theDate = DateTime.Now;
            return theDate.ToString("yyyy-MM-dd HH:mm:ss");
        }
        public static string apikey
        {
            get { return _apikey; }
            set { _apikey = value; }
        }
        public static string singlesmsgonder(string orjin, List<string> numaralar, string mesajmetni, string gonderimzamani, string dil, string flashsms)
        {
            SingleSms singlesms = new SingleSms();
            singlesms.orjin = orjin;
            singlesms.mesajmetni = mesajmetni;
            singlesms.gonderimzamani = gonderimzamani;
            singlesms.flashsms = "0";
            singlesms.dil = dil;
            singlesms.numaralar = numaralar.ToArray();
            singlesms.apikey = apikey;
            string json = JsonConvert.SerializeObject(singlesms);
            string result = apipost("/sms/sendsms", json);
            return result;
        }
    }

    public class SMSHelper
    {
        private readonly string _user = "05325070367";
        private readonly string _pass = "3284310";
        private readonly string _title = "kral ilan";

        public string Message { get; set; }
        public List<string> PhoneNumbers { get; set; }

        public bool Send()
        {
            UserModel model = new UserModel();
            model.username = _user;
            model.password = _pass;
            string json = JsonConvert.SerializeObject(model);
            string result = SMSSender.apipost("/core/loginUser", json);
            JObject serverresponse = JObject.Parse(result);
            string status = (string)serverresponse["status"];
            string apikey = (string)serverresponse["token"];
            string result2 = "";

            if (status == "success")
            {
                SMSSender.apikey = apikey;
                result2 = SMSSender.singlesmsgonder(_title, PhoneNumbers, Message, SMSSender.simdi(), "tr", "0");
                JObject jObject = JObject.Parse(result2);

                if (jObject["status"].ToString() == "success")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}

