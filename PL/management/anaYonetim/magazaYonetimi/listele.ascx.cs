using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class listele : System.Web.UI.UserControl
    {
        magazaBll magazab = new magazaBll();
        public string proc;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["store"] != null)
            //{
            //    if (Request.QueryString["proc"] == "3")
            //    {
            //        magazab.update(3, Request.QueryString["store"], true, false, false);
            //    }
            //    if (Request.QueryString["proc"] == "1")
            //    {
            //        magazab.update(3, Request.QueryString["store"], false, false, true);
            //    }
            //    if (Request.QueryString["proc"] == "2")
            //    {
            //        magazab.update(3, Request.QueryString["store"], false, false, false);
            //    }
            //}

            //if (Request.QueryString["rem"] == "4")
            //{
            //    magazab.update(3, Request.QueryString["store"], false, true, false);
            //}
            //if (Request.QueryString["proc"] == "1")
            //{
            //    magazaRepeater.DataSource = magazab.list(1, false, false, true); //aktif
            //    proc = "1";
            //}
            //if (Request.QueryString["proc"] == "2")
            //{
            //    magazaRepeater.DataSource = magazab.list(1, false, true, false); //pasif
            //    proc = "2";
            //}
            //if (Request.QueryString["proc"] == "3")
            //{
            //    magazaRepeater.DataSource = magazab.list(1, false, false, false); //onay bekleyen
            //    proc = "3";
            //}
            //magazaRepeater.DataBind();

        }
    }
}