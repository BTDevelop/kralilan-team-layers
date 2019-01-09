using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ReCaptchaHelper
{
    public class ReCaptchaHelper
    {
        private readonly string _secretkey = "6LcAzR8UAAAAANJZb4-gJpaMLzMhE6XuZ7kRgRw1";

        public bool Success { get; set; }
        public List<string> ErrorCodes { get; set; }

        public bool Validate(string encodedResponse)
        {
            if (String.IsNullOrEmpty(encodedResponse)) return false;

            var client = new System.Net.WebClient();
            var secret = _secretkey;

            if (String.IsNullOrEmpty(secret)) return false;

            var googleReply = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secret, encodedResponse));

            var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

            var reCaptcha = serializer.Deserialize<ReCaptchaHelper>(googleReply);

            return reCaptcha.Success;
        }
    }
}
