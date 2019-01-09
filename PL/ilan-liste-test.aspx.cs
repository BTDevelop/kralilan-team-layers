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
        ozelliklerBll property = new ozelliklerBll();

        public string mesaj = "";
        public string typename;

        protected override void OnInit(EventArgs e)
        {

            if (RouteData.Values["KategoriNo"].ToString() != null)
            {
        
                Response.Status = "301 Moved Permanently";
                Response.RedirectPermanent("~/liste/" + RouteData.Values["Tur"] + "-" + RouteData.Values["Kategori"]);
                

                //CreateDynamicFilterControls(RouteData.Values["KategoriNo"].ToString());
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            //if (RouteData.Values["KategoriNo"] != null)
            //    topCatId = Convert.ToInt32(RouteData.Values["KategoriNo"].ToString());

            //if (RouteData.Values["TurNo"] != null)
            //    typeId = Convert.ToInt32(RouteData.Values["TurNo"]);

            //if (RouteData.Values["KategoriNo"] != null && RouteData.Values["TurNo"] != null)
            //{
            //    rpcategories.DataSource = ktgTurb.getListCategoriesByCatIdAndType(topCatId, typeId);
            //    rpcategories.DataBind();
            //}

            //if (kategorib.search(Convert.ToInt32(kategorib.search(topCatId).ustKategoriId)) != null)
            //{
            //    ustStr.InnerText = kategorib.search(Convert.ToInt32(kategorib.search(topCatId).ustKategoriId)).kategoriAdi;
            //}
            //if (kategorib.search(topCatId) != null)
            //{
            //    altStr.InnerText = kategorib.search(topCatId).kategoriAdi+" "+"("+ String.Format("{0:N0}", ilanb.count(topCatId, -1, -1).ToString()) +")";
            //}


            //int cat;
            //int type;
            //cat = Convert.ToInt32(RouteData.Values["KategoriNo"]);
            //type = Convert.ToInt32(RouteData.Values["TurNo"]);

            //typename = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), type.ToString()));
            //catname = kategorib.search(cat).kategoriAdi;

        }

        //public string count(object catid,string typeId)
        //{
        //    int cat = Convert.ToInt32(catid);
        //    int type = Convert.ToInt32(typeId);

        //    return " "+String.Format("{0:N0}", ilanb.count(cat, type, -1).ToString());
        //}

        //public bool catKind(object _income)
        //{
        //    if (kategoriTurb.search(Convert.ToInt32(_income)) != null)
        //    {

        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}
    }
}
