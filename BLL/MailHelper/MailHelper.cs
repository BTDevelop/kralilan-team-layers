using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.MailHelper
{
    public class MailHelper
    {

        private const int Timeout = 180000;
        private readonly string _host = "smtp.yandex.com";
        private readonly int _port = 587;
        private readonly string _user = "info@kralilan.com";
        private readonly string _pass = "zaxscdvfbgnhmj";
        private readonly bool _ssl = true;

        public string Sender { get; set; }
        public string Recipient { get; set; }
        public string RecipientName { get; set; }
        public string RecipientCC { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public string HtmlBodyPath { get; set; }
        public List<HttpPostedFile> AttachmentFile { get; set; }

        public void Send()
        {
            try
            {
                MailMessage Msg = new MailMessage();
                Msg.From = new MailAddress(_user);
                Msg.To.Add(Recipient); //Mesajın gideceği müşterinin mail adresi
                if (RecipientCC != null)
                {
                    Msg.Bcc.Add(RecipientCC);
                }
                StreamReader reader = new StreamReader(System.Web.Hosting.HostingEnvironment.MapPath(HtmlBodyPath)); // Oluşturmuş olduğumuz html mail dosyanın yolu
                string readFile = reader.ReadToEnd();
                string StrContent = "";
                StrContent = readFile;
                //Burada html sayfada oluşturmuş olduğumuz [title],[mail] gibi alanları değiştiriyoruz.
                StrContent = StrContent.Replace("[title]", Subject);
                StrContent = StrContent.Replace("[username]", RecipientName);
                StrContent = StrContent.Replace("[info]", Subject);
                StrContent = StrContent.Replace("[detail]", Body);
                Msg.Subject = Subject;//mesaj konusu
                Msg.Body = StrContent.ToString();
                Msg.IsBodyHtml = true; //mail gövdesinde html e izin veriyoruz.

                if (AttachmentFile.Count() > 0)
                {
                    foreach (HttpPostedFile file in AttachmentFile)
                    {
                        if (File.Exists(file.FileName))
                        {
                            Msg.Attachments.Add(new Attachment(file.InputStream, Path.GetFileName(file.FileName), file.ContentType));
                        }
                    }
                }

                foreach (HttpPostedFile file in AttachmentFile)
                {
                    Msg.Attachments.Add(new Attachment(file.InputStream, Path.GetFileName(file.FileName), file.ContentType));
                }

                SmtpClient smtp = new SmtpClient();
                smtp.Host = _host;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = _user;
                NetworkCred.Password = _pass;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = _port;
                smtp.EnableSsl = _ssl;
                smtp.Send(Msg);

                Msg.Dispose();

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}

