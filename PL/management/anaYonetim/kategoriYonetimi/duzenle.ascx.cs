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

namespace PL.management.anaYonetim.kategoriYonetimi
{
    public partial class duzenle : System.Web.UI.UserControl
    {
        kategoriBll kategorib = new kategoriBll();

        private IKategoriService _kategoriManager;
        public duzenle()
        {
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            kategori _kategori = _kategoriManager.Get(Convert.ToInt32(Request.QueryString["kategoriId"]));
            txtKategori.Value = _kategori.kategoriAdi;

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            kategori _kategori = _kategoriManager.Get(Convert.ToInt32(Request.QueryString["kategoriId"]));

            try
            {
                int kategoriId = Convert.ToInt32(Request.QueryString["kategoriId"]);
                DAL.kategori kategori = new DAL.kategori
                {
                    kategoriId = kategoriId,
                    kategoriAdi = txtKategori.Value
                };
                _kategoriManager.Update(kategori);
                //kategorib.update(kategoriId, txtKategori.Value);
                Response.Redirect("~/management/anaYonetim/kategoriYonetimi/kategoriler.aspx?page=listele&kategoriId=" + _kategori.ustKategoriId);

            }
            catch (Exception)
            {

                throw;
            }
            }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}