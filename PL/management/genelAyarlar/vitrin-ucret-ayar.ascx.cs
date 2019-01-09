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
    public partial class vitrin_ucret_ayar : System.Web.UI.UserControl
    {
        kategoriBll kategorib = new kategoriBll();
        dopingBll dopingb = new dopingBll();
        dopingKategoriBll dopingKtgb = new dopingKategoriBll();
        public int showcaseCatId;

        private IKategoriService _kategoriManager;
        private IDopingKategoriService _dopingKategoriManager;
        private IDopingService _dopingManager;
        public vitrin_ucret_ayar()
        {
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
            _dopingKategoriManager = new DopingKategoriManager(new LTSDopingKategorilerDal());
            _dopingManager = new DopingManager(new LTSDopinglerDal());
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

            drpTur.DataSource = _dopingManager.GetAll();
            drpTur.DataTextField = "dopingAdi";
            drpTur.DataValueField = "dopingId";
            drpTur.DataBind();

            ListItem lst1 = new ListItem();
            lst1.Value = "-1";
            lst1.Text = "Tür Seçiniz";
            lst1.Selected = true;

            drpTur.Items.Insert(0, lst1);

            drpKategori.SelectedValue = "1";

            showcaseCatId = Convert.ToInt32(Request.QueryString["showcase"]);

            dopingKategori _dopingKat = _dopingKategoriManager.Get(showcaseCatId);
            drpTur.SelectedValue =  _dopingKat.dopingId.ToString();
            drpSure.SelectedValue = _dopingKat.dopingSureId.ToString();
            txtFiyat.Value = String.Format(" {0:F}", _dopingKat.fiyat);

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                double price = Convert.ToDouble(txtFiyat.Value);
                DAL.dopingKategori _dopingKategori = new dopingKategori
                {
                    dopingKategoriId = showcaseCatId,
                    fiyat = price
                };
                _dopingKategoriManager.Update(_dopingKategori);

                //dopingKtgb.update(showcaseCatId, price);
            }
            catch (Exception)
            {
                Response.Redirect("~/management/diger/diger.aspx?page=500");
            }
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}