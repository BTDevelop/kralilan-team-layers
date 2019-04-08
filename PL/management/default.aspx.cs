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
		public string adscount = "";
		public string usercount = "";
		public string storecount = "";
		public string visitorcount = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				//kullaniciRepeater.DataSource = kullanicib.list(2);
				//kullaniciRepeater.DataBind();

				using (ilanDataContext idc = new ilanDataContext())
				{
					adscount = idc.ilans.Where(x => x.silindiMi == false).Count().ToString();
					usercount = idc.kullanicis.Where(x => x.silindiMi == false).Count().ToString();
					storecount = idc.magazas.Where(x => x.silindiMi == false).Count().ToString();
					visitorcount = Application["totalvisitor"].ToString();
				}
			}
		}
	}
}
