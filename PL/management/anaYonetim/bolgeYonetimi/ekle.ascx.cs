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
    public partial class ekle : System.Web.UI.UserControl
    {

        private IIlService _ilManager;
        public ekle()
        {
            _ilManager = new IlManager(new LTSIllerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            DAL.iller _il = new DAL.iller
            {
                ilAdi = txtIl.Value
            };

            _ilManager.Add(_il);

            //il.insert(txtIl.Value);
            Response.Redirect("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=listele");
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}