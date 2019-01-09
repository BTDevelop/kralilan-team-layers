using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Collections;
using System.Security.Cryptography;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using Iyzipay.Request;
using Iyzipay;
using Iyzipay.Model;

namespace DAL
{
    /// <summary>
    /// kralilan fonksiyon çantası
    /// </summary>
    public class toolkit
    {
        #region kralilan data toolkit 

        public enum FormatDataType
        {
            JSON = 1,
            XML = 2,
            HTML = 3
        }

     
        /// <summary>
        /// Html tipinde mail gönderir.
        /// </summary>
        /// <param name="_inmail"></param>
        /// <param name="_inpath"></param>
        /// <param name="_insubject"></param>
        /// <param name="_intitle"></param>
        /// <param name="_inusername"></param>
        /// <param name="_info"></param>
        /// <param name="_indetail"></param>
        public static void HtmlMailSender(string _inmail, string _inpath, string _insubject, string _intitle, string _inusername, string _info, string _indetail)
        {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress("info@kralilan.com");
            Msg.To.Add(_inmail); //Mesajın gideceği müşterinin mail adresi

            StreamReader reader = new StreamReader(System.Web.Hosting.HostingEnvironment.MapPath(_inpath)); // Oluşturmuş olduğumuz html mail dosyanın yolu
            string readFile = reader.ReadToEnd();
            string StrContent = "";
            StrContent = readFile;
            //Burada html sayfada oluşturmuş olduğumuz [title],[mail] gibi alanları değiştiriyoruz.
            StrContent = StrContent.Replace("[title]", _intitle);
            StrContent = StrContent.Replace("[username]", _inusername);
            StrContent = StrContent.Replace("[info]", _info);
            StrContent = StrContent.Replace("[detail]", _indetail);
            Msg.Subject = _insubject;//mesaj konusu
            Msg.Body = StrContent.ToString();
            Msg.IsBodyHtml = true; //mail gövdesinde html e izin veriyoruz.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.yandex.com";
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "info@kralilan.com";
            NetworkCred.Password = "zaxscdvfbgnhmj";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587; //Port
            smtp.EnableSsl = true;
            smtp.Send(Msg);
        }
        /// <summary>
        /// /
        /// </summary>
        /// <param name="_inmail"></param>
        /// <param name="_inpath"></param>
        /// <param name="_insubject"></param>
        /// <param name="_intitle"></param>
        /// <param name="_inusername"></param>
        /// <param name="_info"></param>
        /// <param name="_indetail"></param>
        public static void HtmlMailMessageSender(string _inmail, string _inreplymail, string _inpath, string _insubject, string _intitle, string _insubtitle, string _inprice, string _inusername, string _inmessage, string _inlocation, string _incontentimage, string _inlink)
        {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress("info@kralilan.com");
            Msg.To.Add(_inmail); //Mesajın gideceği müşterinin mail adresi
            Msg.ReplyToList.Add(new MailAddress(_inreplymail, "reply-to"));

            StreamReader reader = new StreamReader(System.Web.Hosting.HostingEnvironment.MapPath(_inpath)); // Oluşturmuş olduğumuz html mail dosyanın yolu
            string readFile = reader.ReadToEnd();
            string StrContent = "";
            StrContent = readFile;
            //Burada html sayfada oluşturmuş olduğumuz [title],[mail] gibi alanları değiştiriyoruz.
            StrContent = StrContent.Replace("[title]", _intitle);
            StrContent = StrContent.Replace("[subtitle]", _insubtitle);
            StrContent = StrContent.Replace("[price]", _inprice);
            StrContent = StrContent.Replace("[location]", _inlocation);
            StrContent = StrContent.Replace("[messageowner]", _inusername);
            StrContent = StrContent.Replace("[message]", _inmessage);
            StrContent = StrContent.Replace("[contentImage]", _incontentimage);
            StrContent = StrContent.Replace("[link]", _inlink);

            Msg.Subject = _insubject;//mesaj konusu
            Msg.Body = StrContent.ToString();
            Msg.IsBodyHtml = true; //mail gövdesinde html e izin veriyoruz.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.yandex.com";
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "info@kralilan.com";
            NetworkCred.Password = "zaxscdvfbgnhmj";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587; //Port
            smtp.EnableSsl = true;
            smtp.Send(Msg);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inmail"></param>
        /// <param name="_inpath"></param>
        /// <param name="_insubject"></param>
        /// <param name="_intitle"></param>
        /// <param name="_inusername"></param>
        /// <param name="_info"></param>
        /// <param name="_indetail"></param>
        /// <param name="files"></param>
        public static void AttachmentMailSender(string _inmail, string _inpath, string _insubject, string _intitle, string _inusername, string _info, string _indetail, List<HttpPostedFile> files)
        {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress("agent@kralilan.com");
            Msg.To.Add(_inmail); //Mesajın gideceği müşterinin mail adresi

            StreamReader reader = new StreamReader(System.Web.Hosting.HostingEnvironment.MapPath(_inpath)); // Oluşturmuş olduğumuz html mail dosyanın yolu
            string readFile = reader.ReadToEnd();
            string StrContent = "";
            StrContent = readFile;
            //Burada html sayfada oluşturmuş olduğumuz [title],[mail] gibi alanları değiştiriyoruz.
            StrContent = StrContent.Replace("[title]", _intitle);
            StrContent = StrContent.Replace("[username]", _inusername);
            StrContent = StrContent.Replace("[info]", _info);
            StrContent = StrContent.Replace("[detail]", _indetail);
            Msg.Subject = _insubject;//mesaj konusu
            Msg.Body = StrContent.ToString();
            Msg.IsBodyHtml = true; //mail gövdesinde html e izin veriyoruz.

            foreach (HttpPostedFile file in files)
            {
                Msg.Attachments.Add(new Attachment(file.InputStream, Path.GetFileName(file.FileName), file.ContentType));
            }

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.yandex.com";
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "agent@kralilan.com";
            NetworkCred.Password = "q1w2e3r4t5y6u7";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587; //Port
            smtp.EnableSsl = true;
            smtp.Send(Msg);
        }
        
        /// <summary>
        /// Object veriyi XML return et
        /// </summary>
        /// <param name="_income"></param>
        /// <returns></returns>
        public static string GetXmlDataInObject(object _income)
        {
            TextWriter txtwrt = new StringWriter();
            var serializer = new System.Xml.Serialization.XmlSerializer(_income.GetType());

            try
            {
                serializer.Serialize(txtwrt, _income);
                txtwrt.Close();
            }
            catch (Exception)
            {
                txtwrt.Close();
                throw;
            }
            return txtwrt.ToString();
        }
        /// <summary>
        /// XML veriyi objecte return et
        /// </summary>
        /// <param name="_income"></param>
        /// <param name="tp"></param>
        /// <returns></returns>
        public static object GetObjectInXml(string _income, Type tp)
        {
            TextReader txtrd = new StringReader(_income);
            var serializer = new System.Xml.Serialization.XmlSerializer(tp);
            try
            {
                var obj = serializer.Deserialize(txtrd);
                txtrd.Close();
                return obj;
            }
            catch (Exception)
            {
                txtrd.Close();
            }
            finally
            {

            }

            return null;
        }
     
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inphoto"></param>
        /// <param name="_inwidth"></param>
        /// <param name="_inheight"></param>
        /// <param name="_inwatermark"></param>
        /// <param name="_infolder"></param>
        /// <param name="_inpath"></param>
        public static void FixedSize(System.Drawing.Image _inphoto, int _inwidth, int _inheight, string _inwatermark, string _infolder, string _inpath)
        {
            int sourceWidth = _inphoto.Width;
            int sourceHeight = _inphoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)_inwidth / (float)sourceWidth);
            nPercentH = ((float)_inheight / (float)sourceHeight);

            if (nPercentH < nPercentW)
            {
                nPercent = nPercentH;
                destX = (int)((_inwidth - (sourceWidth * nPercent)) / 2);
            }
            else
            {
                nPercent = nPercentW;
                destY = (int)((_inheight - (sourceHeight * nPercent)) / 2);
            }

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);
            Bitmap bmPhoto = new Bitmap(_inwidth, _inheight, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(_inphoto.HorizontalResolution, _inphoto.VerticalResolution);
            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.Clear(Color.White);
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;

            grPhoto.DrawImage(_inphoto,
                new Rectangle(destX, destY, destWidth, destHeight),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                GraphicsUnit.Pixel);
            grPhoto.Dispose();

           bmPhoto.Save(HttpContext.Current.Server.MapPath("~/upload/"+_infolder+"/" + _inpath), ImageFormat.Jpeg);
           bmPhoto.Dispose();

        }
              
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_innum"></param>
        /// <returns></returns>
        public static string NofRoomTemp(string _innum)
        {
            int _inid = Convert.ToInt32(_innum);

            if (_inid == 1) return "Stüdyo";
            else if (_inid == 2) return "1";
            else if (_inid == 3) return "1 + 1";
            else if (_inid == 4) return "2 + 1";
            else if (_inid == 5) return "2 + 2";
            else if (_inid == 6) return "3 + 1";
            else if (_inid == 7) return "3 + 2";
            else if (_inid == 8) return "4 + 1";
            else if (_inid == 9) return "4 + 2";
            else if (_inid == 10) return "4 + 3";
            else if (_inid == 11) return "4 + 4";
            else if (_inid == 12) return "5";
            else if (_inid == 13) return "5 + 1";
            else if (_inid == 14) return "5 + 2";
            else if (_inid == 15) return "5 + 3";
            else if (_inid == 16) return "5 + 4";
            else if (_inid == 17) return "6 + 1";
            else if (_inid == 18) return "6 + 2";
            else if (_inid == 19) return "6 + 3";
            else if (_inid == 20) return "7 + 1";
            else if (_inid == 21) return "7 + 2";
            else if (_inid == 22) return "7 + 3";
            else if (_inid == 23) return "8 + 1";
            else if (_inid == 24) return "8 + 2";
            else if (_inid == 25) return "8 + 4";
            else if (_inid == 26) return "9 + 1";
            else if (_inid == 27) return "9 + 2";
            else if (_inid == 28) return "9 + 3";
            else if (_inid == 29) return "9 + 4";
            else if (_inid == 30) return "9 + 5";
            else if (_inid == 31) return "9 + 6";
            else if (_inid == 32) return "10 + 1";
            else if (_inid == 33) return "10 + 2";
            else if (_inid == 34) return "10 üzeri";
            else if (_inid == 35) return "3 + 3";
            else if (_inid == 36) return "11 + 1";
            else if (_inid == 37) return "3 + 3";
            else if (_inid == 38) return "Ticari";
            else if (_inid == 39) return "0 + 1";
            else if (_inid == 40) return "3,5 + 1";
            else if (_inid == 41) return "4,5 + 1";
            else if (_inid == 42) return "2,5 + 1";
            else if (_inid == 43) return "5,5 + 1";
            else if (_inid == 44) return "6,5 + 2";
            else if (_inid == 46) return "1,5 + 1";
            else if (_inid == 47) return "2,5";
            else if (_inid == 48) return "4,5 + 2";
            else if (_inid == 49) return "4";
            else if (_inid == 50) return "3";
            else if (_inid == 51) return "2";
            else if (_inid == 52) return "1 + 0";
            else if (_inid == 53) return "0 + 2";
            else if (_inid == 54) return "1 + 1,5";
            else if (_inid == 55) return "1 + 0,5";
            else if (_inid == 56) return "6 + 0";
            else if (_inid == 57) return "8 + 0";
            else if (_inid == 58) return "3 + 0";
            else if (_inid == 59) return "4";
            else if (_inid == 60) return "6";
            else if (_inid == 62) return "Dükkan";
            else if (_inid == 63) return "2 + 0";
            else if (_inid == 64) return "6,5 + 1";
            else if (_inid == 65) return "Ofis";
            else return "-";
                                                                                                            
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_innum"></param>
        /// <returns></returns>
        public static string EstateTypeTemp(string _innum)
        {
            int _inid = Convert.ToInt32(_innum);

            if (_inid == 1) return "Daire";
            else if (_inid == 4) return "Villa";
            else if (_inid == 5) return "Ofis";
            else if (_inid == 6) return "Ev Ofis";
            else if (_inid == 2) return "Residence";
            else if (_inid == 11) return "Dükkan";
            else return "-";
        }
        #endregion
    }
}