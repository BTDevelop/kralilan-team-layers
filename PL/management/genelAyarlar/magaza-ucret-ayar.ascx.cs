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

namespace PL.management.genelAyarlar
{
    public partial class magaza_ucret_ayar : System.Web.UI.UserControl
    {
        kategoriBll kategorib = new kategoriBll();
        magazaKategoriBll magazaKatb = new magazaKategoriBll();
        public int packageCatId;

        private IMagazaKategoriService _magazaKategoriManager;
        private IKategoriService _kategoriManager;
        public magaza_ucret_ayar()
        {
            _magazaKategoriManager = new MagazaKategoriManager(new LTSMagazaKategorilerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            drpKategori.DataSource = _kategoriManager.GetAllByCategoriId(0);
            drpKategori.DataTextField = "kategoriAdi";
            drpKategori.DataValueField = "kategoriId";
            drpKategori.DataBind();

            ListItem lst = new ListItem();
            lst.Value = "-1";
            lst.Text = "Kategori Seçiniz";
            lst.Selected = true;

            drpKategori.Items.Insert(0, lst);
       
            drpKategori.SelectedValue = "1";

            packageCatId = Convert.ToInt32(Request.QueryString["package"]);

            magazaKategori _magazaKat = _magazaKategoriManager.GetByCategoriId(packageCatId);
            drpTur.SelectedValue = _magazaKat.magazaPaketId.ToString();
            drpSure.SelectedValue = _magazaKat.paketSureId.ToString();
            txtFiyat.Value = String.Format(" {0:N0}", _magazaKat.fiyat);

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                double price = Convert.ToDouble(txtFiyat.Value);
                magazaKategori _magazaKategori = new magazaKategori
                {
                    magazaKategoriId = packageCatId,
                    fiyat = price
                };

                _magazaKategoriManager.Update(_magazaKategori);

                //magazaKatb.update(packageCatId, price);
            }
            catch (Exception)
            {
                Response.Redirect("~/management/diger/diger.aspx?page=500");
            }
        }

    }
}