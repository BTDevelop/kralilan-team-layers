using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace PL.management.anaYonetim.kullaniciYonetimi
{
    public partial class listele1 : System.Web.UI.UserControl
    {
        kullaniciBll kullanici = new kullaniciBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["dlt"] != null)
            {
                //int kullaniciId = Convert.ToInt32(Request.QueryString["dlt"]);
                //kullanici.DeletedUser(kullaniciId);
                //Response.Redirect("~/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=listele");
            }
        }
    }
}