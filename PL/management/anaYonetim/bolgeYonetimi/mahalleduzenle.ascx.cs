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
    public partial class mahalleduzenle : System.Web.UI.UserControl
    {

        private IMahalleService _mahalleManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        public mahalleduzenle()
        {
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                mahalleler _mahalle = _mahalleManager.Get(Convert.ToInt32(Request.QueryString["mahalleId"]));
                txtMahalle.Value = _mahalle.mahalleAdi;

                drpIl.DataSource = _ilManager.GetAll();
                drpIl.DataTextField = "ilAdi";
                drpIl.DataValueField = "ilId";
                drpIl.DataBind();

                drpIl.SelectedValue = _ilceManager.Get(Convert.ToInt32(_mahalle.ilceId)).ilId.ToString();

                drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(Request.QueryString["ilId"]));
                drpIlce.DataTextField = "IlceAdi";
                drpIlce.DataValueField = "IlceId";
                drpIlce.DataBind();

                drpIlce.SelectedValue = _mahalle.ilceId.ToString();

            }
        }

        protected void drpIl_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpIlce.Items.Clear();

            drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
            drpIlce.DataTextField = "IlceAdi";
            drpIlce.DataValueField = "IlceId";
            drpIlce.DataBind();

            ListItem lst = new ListItem();
            lst.Value = null;
            lst.Text = "İlçe Seçiniz";
            lst.Selected = true;

            drpIlce.Items.Insert(0, lst);
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                int ilceId = Convert.ToInt32(Request.QueryString["ilceId"]),
                    ilId = Convert.ToInt32(drpIl.SelectedValue),
                    mahalleId = Convert.ToInt32(Request.QueryString["mahalleId"]),
                    distId = Convert.ToInt32(drpIlce.SelectedValue);

                DAL.mahalleler mahalle = new DAL.mahalleler
                {
                    mahalleId = mahalleId,
                    mahalleAdi = txtMahalle.Value,
                    ilceId = distId
                };

                _mahalleManager.Update(mahalle);

                DAL.ilceler _ilce = new DAL.ilceler
                {
                    ilceId = ilceId,
                    ilceAdi = drpIlce.SelectedItem.Text,
                    ilId = ilId
                };

                _ilceManager.Update(_ilce);
                Response.Redirect("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=mahallelistele&ilceId=" + drpIlce.SelectedValue);
            }
            catch (Exception)
            {

                throw;
            }
            ;
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}