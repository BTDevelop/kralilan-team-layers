using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL
{
    public partial class ilan_tamam : System.Web.UI.Page
    {
        public string ilanNo="";
        kullanici _kullanici;

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = BLL.kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {            
                if (Session["ilanNo"] != null)
                {
                    ilanNo = Session["ilanNo"].ToString();
                }
                else
                {
                    Response.Redirect("~/kategori-secimini-yap/");
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }
    }
}