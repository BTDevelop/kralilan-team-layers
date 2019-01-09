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
    public partial class mahallelistele : System.Web.UI.UserControl
    {
        mahalleBll mahalle = new mahalleBll();

        private IMahalleService _mahalleManager;
        public mahallelistele()
        {
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mahalleRepeater.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(Request.QueryString["ilceId"]));
                mahalleRepeater.DataBind();
            }
        }
    }
}