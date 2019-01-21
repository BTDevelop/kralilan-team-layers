using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace PL.profil
{
    public partial class mesaj_oku : System.Web.UI.UserControl
    {
        public string header = "";
        public string classifiedPic = "";
        public string name ="";
        public string pic = "";
        public int userid;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["unique-site-user"] != null)
            //{
            //    kullanici _authority = (kullanici)Session["unique-site-user"];
            //    userid = _authority.kullaniciId;
            //    if (!String.IsNullOrEmpty(Request.QueryString["user"]) && !String.IsNullOrEmpty(Request.QueryString["ads"]))
            //    {
            //        int userid = Convert.ToInt32(Request.QueryString["user"]);
            //        int adsid = Convert.ToInt32(Request.QueryString["ads"]);

            //        DAL.kullanici user = kullanicib.search(userid);
            //        name = user.kullaniciAdSoyad;
            //        pic = user.profilResim;
            //        if (String.IsNullOrEmpty(pic))
            //        {
            //            pic = "noUser.jpg";
            //        }
            //        DAL.ilan ads = ilanb.search1(adsid);
            //        header = ads.baslik.Substring(0,10)+"...";
            //        string resdata = ads.resim;
            //        ExternalClass.resimDataType seciliresim = new ExternalClass.resimDataType();
            //        if (resdata != null)
            //        {
            //            List<BLL.deff.ExternalClass.resimDataType> resler = new List<ExternalClass.resimDataType>();
            //            resler = (List<ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(resdata, typeof(List<ExternalClass.resimDataType>));

            //            if (resler.Count() == 0)
            //            {
            //                seciliresim.resim = "noImage.jpg";
            //            }
            //            else
            //            {
            //                foreach (ExternalClass.resimDataType rs in resler)
            //                {
            //                    if (rs.seciliMi)
            //                    {
            //                        seciliresim.resim = "thmb_" + rs.resim;
            //                        seciliresim.seciliMi = true;
            //                    }
            //                }
            //            }
            //        }
            //        else
            //        {
            //            seciliresim.resim = "noImage.jpg";
            //        }

            //        classifiedPic = seciliresim.resim;
            //    }
            //    if (!Page.IsPostBack)
            //    {
                   
            //    }
            //}
        }
    }
}