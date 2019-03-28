using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.IO;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class duzenle_icerik : System.Web.UI.UserControl
    {
        private IVergiDaireService _vergiDaireManager;
        private IMahalleService _mahalleManager;
        private IMagazaTelefonService _magazaTelefonManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IMagazaService _magazaManager;
        public duzenle_icerik()
        {
            _vergiDaireManager = new VergiDaireManager(new LTSVergiDairelerDal());
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _magazaTelefonManager = new MagazaTelefonManager(new LTSMagazaTelefonlarDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.magaza _magaza = _magazaManager.Get(Convert.ToInt32(Request.QueryString["store"]));
            txtMagazaAdi.Value = _magaza.magazaAdi;
            txtTcNo.Value = _magaza.vergiNo;
            txtAciklama.Text = _magaza.aciklama;
            drpTur.SelectedValue = _magaza.magazaTurId.ToString();

            if (_magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["store"]), 3) != null)
            {
                magazaTelefon _telefon = _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["store"]), 3);
                txtIsTlf.Value = _telefon.telefon;
            }

            if (_magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["store"]), 4) != null)
            {
                magazaTelefon _telefon2 = _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["store"]), 4);
                txtIsTlf2.Value = _telefon2.telefon;
            }

            if (!IsPostBack)
            {
                drpIl.DataSource = _ilManager.GetAll();
                drpIl.DataTextField = "ilAdi";
                drpIl.DataValueField = "ilId";
                drpIl.DataBind();

                ListItem lst_3 = new ListItem();
                lst_3.Value = null;
                lst_3.Text = "İl Seçiniz";
                lst_3.Selected = true;
                drpIl.Items.Insert(0, lst_3);

                if (!String.IsNullOrEmpty(_magaza.ilId.ToString()))
                {
                    drpIl.SelectedValue = _magaza.ilId.ToString();

                    drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                    drpIlce.DataTextField = "ilceAdi";
                    drpIlce.DataValueField = "ilceId";
                    drpIlce.DataBind();

                    ListItem lst_2 = new ListItem();
                    lst_2.Value = null;
                    lst_2.Text = "İlçe Seçiniz";
                    lst_2.Selected = true;
                    drpIlce.Items.Insert(0, lst_2);
                    if (!String.IsNullOrEmpty(_magaza.ilceId.ToString()))
                    {

                        drpIlce.SelectedValue = _magaza.ilceId.ToString();

                        drpMahalle.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
                        drpMahalle.DataTextField = "mahalleAdi";
                        drpMahalle.DataValueField = "mahalleId";
                        drpMahalle.DataBind();

                        ListItem lst_1 = new ListItem();
                        lst_1.Value = null;
                        lst_1.Text = "Mahalle Seçiniz";
                        lst_1.Selected = true;
                        drpMahalle.Items.Insert(0, lst_1);

                        drpMahalle.SelectedValue = _magaza.mahalleId.ToString();
                       
                    }

                    drpVergi.DataSource = _vergiDaireManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                    drpVergi.DataTextField = "VergiDaireAdi";
                    drpVergi.DataValueField = "vergiDaireId";
                    drpVergi.DataBind();

                    ListItem lst = new ListItem();
                    lst.Value = null;
                    lst.Text = "Vergi Dairesi Seçiniz";
                    lst.Selected = true;
                    drpVergi.Items.Insert(0, lst);

                    drpVergi.SelectedValue = _magaza.vergiDaireId.ToString();

                }

                rdKurumsal.SelectedValue = _magaza.kurumsalMi.ToString();
            }
        }

        protected void rdKurumsal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdKurumsal.SelectedValue == "True")
            {
                lblTc.InnerText = "Vergi No";
            }
            else
            {
                lblTc.InnerText = "TC Kimlik No";
            }
        }

        protected void drpIl_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpIlce.Items.Clear();
            drpMahalle.Items.Clear();
            drpVergi.Items.Clear();

            drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
            drpIlce.DataTextField = "ilceAdi";
            drpIlce.DataValueField = "ilceId";
            drpIlce.DataBind();

            ListItem lst_1 = new ListItem();
            lst_1.Value = null;
            lst_1.Text = "İlçe Seçiniz";
            lst_1.Selected = true;

            drpIlce.Items.Insert(0, lst_1);


            drpVergi.DataSource = _vergiDaireManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
            drpVergi.DataTextField = "vergiDairesi";
            drpVergi.DataValueField = "vergiDaireId";
            drpVergi.DataBind();

            ListItem lst = new ListItem();
            lst.Value = null;
            lst.Text = "Vergi Dairesi Seçiniz";
            lst.Selected = true;
            drpVergi.Items.Insert(0, lst);
        }

        protected void drpIlce_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpMahalle.Items.Clear();

            drpMahalle.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
            drpMahalle.DataTextField = "mahalleAdi";
            drpMahalle.DataValueField = "mahalleId";
            drpMahalle.DataBind();

            ListItem lst = new ListItem();
            lst.Value = null;
            lst.Text = "Mahalle Seçiniz";
            lst.Selected = true;

            drpMahalle.Items.Insert(0, lst);
        }

        protected void devam_Click(object sender, EventArgs e)
        {
            magazaBll storeObject = new magazaBll();
            DAL.magaza _magaza = _magazaManager.Get(Convert.ToInt32(Request.QueryString["store"]));

            if (Request.Form["ctrlselect"] != null)
            {
                if(Request.Form["ctrlselect"].Equals("0"))
                    storeObject.updateStoreStatus(_magaza.magazaId, false, false);
                if (Request.Form["ctrlselect"].Equals("1"))
                    storeObject.updateStoreStatus(_magaza.magazaId, true, false);
                if (Request.Form["ctrlselect"].Equals("2"))
                    storeObject.updateStoreStatus(_magaza.magazaId, false, true);
            }

            //string[] segments = FileUpload1.FileName.Split('.');
            //string fileExt = segments[segments.Length - 1];
            //DateTime magazaSure = default(DateTime);

            //int magazaKategoriId = Convert.ToInt32(Request.QueryString["pac"]);
            //if (magazaKtgb.StoreCategories(magazaKategoriId).paketSureId == 1)
            //{
            //    magazaSure = DateTime.Now.AddMonths(6);
            //}
            //if (magazaKtgb.StoreCategories(magazaKategoriId).paketSureId == 2)
            //{
            //    magazaSure = DateTime.Now.AddMonths(12);
            //}


            //string[] segments = FileUpload1.FileName.Split('.');
            //string fileExt = segments[segments.Length - 1];
            ////if (chcYeniResim.Checked)
            ////{
            //    if (FileUpload1.HasFile)
            //    {
            //        HttpFileCollection updateFiles = Request.Files;
            //        string str_image = "";

            //        if (FileUpload1.HasFile)
            //        {

            //            for (int i = 0; i < updateFiles.Count; i++)
            //            {

            //                bool secili = false;
            //                if (i == 0)
            //                {
            //                    secili = true;
            //                }

            //                HttpPostedFile file = updateFiles[i];

            //                string fileName = file.FileName;
            //                string fileExtension = file.ContentType;

            //                if (!string.IsNullOrEmpty(fileName))
            //                {
            //                    fileExtension = Path.GetExtension(fileName);
            //                    str_image = Request.QueryString["edit"] + fileExtension;
            //                    string pathToSave_100 = HttpContext.Current.Server.MapPath("~/upload/magaza/") + str_image;
            //                    file.SaveAs(pathToSave_100);
            //                }
            //            }
            //        }

            //    }
            ////}

            //magazab.update1(Convert.ToInt32(Request.QueryString["store"]), 1, Convert.ToInt32(drpTur.SelectedValue), txtMagazaAdi.Value, "foto",Convert.ToDateTime(null),Convert.ToDateTime(null), Convert.ToInt32(drpIl.SelectedValue), Convert.ToInt32(drpIlce.SelectedValue), Convert.ToInt32(drpMahalle.SelectedValue), txtTcNo.Value, 0, 1, 0, Convert.ToInt32(rdKurumsal.SelectedValue), 0, txtAciklama.Text);
            ////magazab.update(2, Request.QueryString["edit"], Request.QueryString["pac"], drpTur.SelectedValue, txtMagazaAdi.Value, Request.QueryString["edit"] + "." + fileExt, magazaSure, txtAciklama.Text);
            //Response.Redirect("~/management/anaYonetim/magazaYonetimi/magaza.aspx?page=listele&proc=3");

        }
    }
}