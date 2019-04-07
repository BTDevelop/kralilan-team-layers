using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace PL.Management
{
    public partial class Default : System.Web.UI.Page
    {
        kullaniciBll kullanicib = new kullaniciBll();
        public string adscount = "";  // renklam sayısı
        public string usercount = "";  // kullanıcı sayısı
        public string storecount = ""; // mağaza sayısı
        public string visitorcount = ""; // ziyaretçi sayısı
        protected void Page_Load(object sender, EventArgs e) // sayfa yüklendiyse
        {
            if (!Page.IsPostBack)  // 
            {
                //kullaniciRepeater.DataSource = kullanicib.list(2);
                //kullaniciRepeater.DataBind();

                using (ilanDataContext idc = new ilanDataContext()) // ilan içeriği 
                {
                    adscount = idc.ilans.Where(x => x.silindiMi == false).Count().ToString();  // reklam ilan sayısı 
                    usercount = idc.kullanicis.Where(x => x.silindiMi == false).Count().ToString(); // kullanıcı sayısı 
                    storecount = idc.magazas.Where(x => x.silindiMi == false).Count().ToString(); // mağaza sayısı 
                    visitorcount = Application["totalvisitor"].ToString(); // ziyaretçi sayısı 
                }
            }
        }
    }
}
