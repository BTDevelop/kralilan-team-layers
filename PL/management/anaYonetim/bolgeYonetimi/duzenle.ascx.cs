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
    public partial class ilduzenle : System.Web.UI.UserControl
    {
        ilBll il = new ilBll();
        kullaniciBll kullanicib = new kullaniciBll();

        private IIlService _ilManager;
        public ilduzenle()
        {
            _ilManager = new IlManager(new LTSIllerDal()); 
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                iller _il = _ilManager.Get(Convert.ToInt32(Request.QueryString["ilId"]));
                txtIl.Value = _il.ilAdi;
         
            }
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                int ilId = Convert.ToInt32(Request.QueryString["ilId"]);

                DAL.iller _il = new DAL.iller
                {
                    ilId = ilId,
                    ilAdi = txtIl.Value
                };

                _ilManager.Update(_il);

                //il.update(ilId, txtIl.Value);
                Response.Redirect("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=listele");
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