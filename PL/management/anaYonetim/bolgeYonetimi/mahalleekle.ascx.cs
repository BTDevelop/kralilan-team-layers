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
    public partial class mahalleekle : System.Web.UI.UserControl
    {

        private IMahalleService _mahalleManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        public mahalleekle()
        {
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
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

                drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                drpIlce.DataTextField = "ilceAdi";
                drpIlce.DataValueField = "ilceId";
                drpIlce.DataBind();

                drpIlce.SelectedValue = Request.QueryString["ilceId"];
                drpIl.Enabled = false;
                drpIlce.Enabled = false;


            }
        }

        protected void drpIl_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
            drpIlce.DataTextField = "ilceAdi";
            drpIlce.DataValueField = "ilceId";
            drpIlce.DataBind();
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                int distId = Convert.ToInt32(drpIlce.SelectedValue);
                DAL.mahalleler mahalle = new DAL.mahalleler
                {
                    mahalleAdi = txtMahalle.Value,
                    ilceId = distId
                };
                _mahalleManager.Add(mahalle);
                Response.Redirect("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=mahallelistele&ilceId=" + drpIlce.SelectedValue);
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