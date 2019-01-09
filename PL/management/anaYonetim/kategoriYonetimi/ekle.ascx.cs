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
    public partial class ekle : System.Web.UI.UserControl
    {
        private IKategoriService _kategoriManager;
        public ekle()
        {
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
        }

        kategoriBll kategori = new kategoriBll();

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                int kategoriId = Convert.ToInt32(Request.QueryString["kategoriId"]);
                DAL.kategori _kategori = new DAL.kategori
                {
                    kategoriAdi = txtKategori.Value,
                    kategoriId = kategoriId
                };
                _kategoriManager.Add(_kategori);

                //kategori.insert(txtKategori.Value, kategoriId);
                Response.Redirect("~/management/anaYonetim/kategoriYonetimi/kategoriler.aspx?page=listele&kategoriId=" + Request.QueryString["kategoriId"]);
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