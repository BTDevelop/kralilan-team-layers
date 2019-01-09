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

namespace PL.management.anaYonetim.kategoriYonetimi
{
    public partial class listele : System.Web.UI.UserControl
    {
        kategoriBll kategori = new kategoriBll();

        private IKategoriService _kategoriManager;
        public listele()
        {
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            kategoriRepeater.DataSource = _kategoriManager.GetAllByCategoriId(Convert.ToInt32(Request.QueryString["kategoriId"]));
            kategoriRepeater.DataBind();
        }
    }
}