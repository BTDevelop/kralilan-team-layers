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
    public partial class listele : System.Web.UI.UserControl
    {
        private IIlService _ilManager;
        public listele()
        {
            _ilManager = new IlManager(new LTSIllerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ilRepeater.DataSource = _ilManager.GetAll();
                ilRepeater.DataBind();
            }
        }
    }
}