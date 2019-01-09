using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL
{
    public partial class iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MetaDescription = "Kral ilan'a ulaşabileceğiniz telefon numaraları ve e posta adresinin bulunduğu sayfadır.";
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            string name = Request.Form["name"];
            string surname = Request.Form["surname"];
            string email = Request.Form["email"];
            string message = Request.Form["message"];
            string detail = "Ad: " + name + "<br/>" +
                          "Soyad: " + surname + "<br/>" +
                          "İletişim Epostası: " + email + "<br/>" +
                          "Bildirimim: " + message + "<br/>";
            try
            {
                DAL.toolkit.HtmlMailSender("info@kralilan.com", "~/email-temp/single-column/build.html", "Benimle iletişime geç", "Benimle iletişime geç", "Editör", "Ben iletişim sayfasından size mail gönderdim, bana mutlaka ulaşın.", detail);
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);

                throw;
            }
        }
    }
}