using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.PaymentHelper
{
    public class MobilePayment : IPayment
    {
        private readonly string _id = "566";
        private readonly string _service = "1253";
        private readonly string _category = "DIGITAL_CONTENT";
        private readonly string _secretkey = "Br6Feb";
        private readonly string _formId = "myForm1";

        public HttpContext context { get; set; }
        public string order { get; set; }
        public string product { get; set; }
        public string failureUrl { get; set; }
        public string successUrl { get; set; }
        public string price { get; set; }

        public object CheckoutForm()
        {
            throw new NotImplementedException();
        }

        public void Pay()
        {
            string cumulateData = _id + _service + _category + order + product + price + successUrl + failureUrl + _secretkey;
            string key = EncryptHelper.EncryptHelper.GetMd5Hash(cumulateData);

            StringBuilder htmlForm = new StringBuilder();
            htmlForm.AppendLine("<html>");
            htmlForm.AppendLine(String.Format("<body onload='document.forms[\"{0}\"].submit()'>", _formId));
            htmlForm.AppendLine(String.Format("<form id=\"{0}\" method=\"POST\" action=\"{1}\">", _formId, "https://cp.payguru.com"));
            htmlForm.AppendLine("<input type=\"hidden\" name=\"merchant\" value=\"" + _id + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"service\" value=\"" + _service + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"category\" value=\"" + _category + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"order\" value=\"" + order + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"product\" value=\"" + product + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"price\" value=\"" + price + "\"/>");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"successUrl\" value=\"" + successUrl + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"failureUrl\" value=\"" + failureUrl + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"currencyCode\" value=\"" + "TRY" + "\" />");
            htmlForm.AppendLine("<input type=\"hidden\" name=\"key\" value=\"" + key.ToLower() + "\" />");
            htmlForm.AppendLine("</form>");
            htmlForm.AppendLine("</body>");
            htmlForm.AppendLine("</html>");

            context.Response.Clear();
            context.Response.Write(htmlForm.ToString());
            context.Response.End();
        }
    }
}
