using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.bolgeYonetimi
{
    public partial class ilceListele : System.Web.UI.UserControl
    {
        ilceBll ilce = new ilceBll();

        private IIlceService _ilceManager;
        public ilceListele()
        {
            _ilceManager = new IlceManager(new LTSIlcelerDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ilceRepeater.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(Request.QueryString["ilId"]));
            ilceRepeater.DataBind();

        }

    }
}