using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.Web.Security;
using System.Collections;
using Newtonsoft.Json.Linq;
using System.Web.UI.HtmlControls;
using BLL.EnumHelper;

namespace PL
{
    public partial class ilan_liste_test : System.Web.UI.Page
    {

        public string mesaj = "";
        public string typename;

        protected override void OnInit(EventArgs e)
        {

            if (RouteData.Values["KategoriNo"].ToString() != null)
            {
        
                Response.Status = "301 Moved Permanently";
                Response.RedirectPermanent("~/liste/" + RouteData.Values["Tur"] + "-" + RouteData.Values["Kategori"]);  

            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {


        }
    }
}
