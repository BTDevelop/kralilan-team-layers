using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace PL.sysLogin
{
    public partial class syslock : System.Web.UI.Page
    {
        kullaniciBll kullanicib = new kullaniciBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtMail.InnerHtml= Request.Cookies["login"]["username"].ToString(); //Login Cookie içerisindeki kullanici adi değerini kullaniciadilbl içine atıyoruz.
        }


        protected void Giris_Click(object sender, EventArgs e)
        {
            //if (kullanicib.loginOn(txtMail.InnerText,  DAL.toolkit.SHA1HashEncryption(txtSifre.Value)))
            //{
            //    Response.Redirect("~/management/default.aspx");
            //}
            //else
            //{
            //    Response.Redirect("~/sysLogin/syslogin.aspx");
            //}
        }
    }
}