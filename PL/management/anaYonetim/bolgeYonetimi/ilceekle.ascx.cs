using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.bolgeYonetimi
{
    public partial class ilceekle : System.Web.UI.UserControl
    {
        ilBll il = new ilBll();
        ilceBll ilce = new ilceBll();
        kullaniciBll kullanicib = new kullaniciBll();

        private IIlceService _ilceManager;
        private IIlService _ilManager;
        public ilceekle()
        {
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                drpIl.DataSource = _ilManager.GetAll();
                drpIl.DataTextField = "ilAdi";
                drpIl.DataValueField = "ilId";
                drpIl.DataBind();

                drpIl.SelectedValue = Request.QueryString["ilId"];
                drpIl.Enabled = false;
            }
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                int ilId = Convert.ToInt32(drpIl.SelectedValue);
                ilceler _ilce = new ilceler
                {
                    ilceAdi = txtIlce.Value,
                    ilId = ilId
                };

                _ilceManager.Add(_ilce);
                //ilce.insert(txtIlce.Value, ilId);
                Response.Redirect("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=ilcelistele&ilId=" + drpIl.SelectedValue);
            }
            catch (Exception)
            {

                throw;
            }
           
        }

        protected void Vazgeç_Click(object sender, EventArgs e)
        {

        }
    }
}