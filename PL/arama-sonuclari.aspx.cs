using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace PL
{
    public partial class arama_sonuclari : System.Web.UI.Page
    {
        kategoriBll kategorib = new kategoriBll();
        seciliDopingBll seciliDpngb = new seciliDopingBll();
        public string search_data = "";
        public string provi = "";
        public string text = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<BLL.ExternalClass.CategoriCS> categori = new List<BLL.ExternalClass.CategoriCS>();

                //categori = (List<BLL.ExternalClass.CategoriCS>)DAL.toolkit.GetObjectInXml(kategorib.select(1), typeof(List<BLL.ExternalClass.CategoriCS>));

                //rpcategories.DataSource = categori;
                //rpcategories.DataBind();


                List<BLL.ExternalClass.ilanDataType> homeshw = new List<BLL.ExternalClass.ilanDataType>();

                //homeshw = (List<BLL.ExternalClass.ilanDataType>)DAL.toolkit.GetObjectInXml(seciliDpngb.select(0, 6, 2, 2, 2), typeof(List<BLL.ExternalClass.ilanDataType>));

                rphomeshowcase.DataSource = homeshw;
                rphomeshowcase.DataBind();

                provi = RouteData.Values["Il"].ToString();
                text = RouteData.Values["Kelime"].ToString();
            }

            provi = RouteData.Values["Il"].ToString();
            text = RouteData.Values["Kelime"].ToString();

            if (RouteData.Values["Il"].ToString() != "all")
                search_data += RouteData.Values["Il"].ToString();
            else

            search_data += " ";

            if (RouteData.Values["Kelime"].ToString() != "all")
                search_data += RouteData.Values["Kelime"].ToString();

            search_data = "'" + search_data + "'";


            search_data += " için ";


        }

    }
}