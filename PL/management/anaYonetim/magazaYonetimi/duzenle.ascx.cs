using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using BLL.PublicHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class duzenle : System.Web.UI.UserControl
    {

        private IVergiDaireService _vergiDaireManager;
        private IMahalleService _mahalleManager;
        private IMagazaTelefonService _magazaTelefonManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IMagazaService _magazaManager;
        public duzenle()
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

            DAL.magaza _magaza = _magazaManager.Get(Convert.ToInt32(Request.QueryString["magazaId"]));
            txtMagazaAdi.Value = _magaza.magazaAdi;
            txtTcNo.Value = _magaza.vergiNo;

            if (_magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 3) != null)
            {
                magazaTelefon _telefon = _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 3);
                txtIsTlf.Value = _telefon.telefon;
            }

            if (_magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 4) != null)
            {
                magazaTelefon _telefon2 = _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 4);
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
                lst_3.Text = "il Seçiniz";
                lst_3.Selected = true;
                drpIl.Items.Insert(0, lst_3);

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

                drpVergi.DataSource = _vergiDaireManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                drpVergi.DataTextField = "vergiDairesi";
                drpVergi.DataValueField = "vergiDaireId";
                drpVergi.DataBind();

                ListItem lst = new ListItem();
                lst.Value = null;
                lst.Text = "Vergi Dairesi Seçiniz";
                lst.Selected = true;
                drpVergi.Items.Insert(0, lst);

                drpVergi.SelectedValue = _magaza.vergiDaireId.ToString();

                rdKurumsal.SelectedValue = _magaza.kurumsalMi.ToString();

                if (rdKurumsal.SelectedValue == "True")
                {
                    lblTc.InnerText = "Vergi No";
                }
                else
                {
                    lblTc.InnerText = "TC Kimlik No";
                }


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


        protected void Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                DAL.magaza _magazaUpdate = new DAL.magaza
                {
                    magazaId = Convert.ToInt32(Request.QueryString["magazaId"]),
                    magazaAdi = txtMagazaAdi.Value,
                    kurumsalMi = Convert.ToBoolean(rdKurumsal.SelectedValue),
                    ilId = Convert.ToInt32(drpIl.SelectedValue),
                    ilceId = Convert.ToInt32(drpIlce.SelectedValue),
                    mahalleId = Convert.ToInt32(drpMahalle.SelectedValue),
                    vergiNo = txtTcNo.Value,
                    vergiDaireId = Convert.ToInt32(drpVergi.SelectedValue)
                };

                _magazaManager.UpdateManager(_magazaUpdate);

                //magazab.update(Convert.ToInt32(Request.QueryString["magazaId"]), txtMagazaAdi.Value, Convert.ToBoolean(rdKurumsal.SelectedValue), Convert.ToInt32(drpIl.SelectedValue), Convert.ToInt32(drpIlce.SelectedValue), Convert.ToInt32(drpMahalle.SelectedValue), txtTcNo.Value, Convert.ToInt32(drpVergi.SelectedValue));

                if (txtIsTlf.Value != "" && _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 3) != null)
                {
                    magazaTelefon _magazaTelefon = new magazaTelefon
                    {
                        magazaId = Convert.ToInt32(Request.QueryString["magazaId"]),
                        telefon = Tools.PhoneNumberOrganizer(txtIsTlf.Value),
                        telefonTur = 3
                    };

                    _magazaTelefonManager.Update(_magazaTelefon);

                    //magazaTlfb.update(Convert.ToInt32(Request.QueryString["magazaId"]), 3, Tools.PhoneNumberOrganizer(txtIsTlf.Value));
                }
                else if (txtIsTlf.Value != "" && _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 3) == null)
                {
                    magazaTelefon _magazaTelefon = new magazaTelefon
                    {
                        magazaId = Convert.ToInt32(Request.QueryString["magazaId"]),
                        telefon = Tools.PhoneNumberOrganizer(txtIsTlf.Value),
                        telefonTur = 3
                    };

                    _magazaTelefonManager.Add(_magazaTelefon);

                    //magazaTlfb.insert(Convert.ToInt32(Request.QueryString["magazaId"]), Tools.PhoneNumberOrganizer(txtIsTlf.Value), 3);
                }
                else
                {
                    magazaTelefon _telefon = _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 3);
                    _magazaTelefonManager.Delete(_telefon);
                    //magazaTlfb.delete(_telefon.magazaTelefonId);
                }

                if (txtIsTlf2.Value != "" && _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 4) != null)
                {
                    magazaTelefon _magazaTelefon = new magazaTelefon
                    {
                        magazaId = Convert.ToInt32(Request.QueryString["magazaId"]),
                        telefon = Tools.PhoneNumberOrganizer(txtIsTlf2.Value),
                        telefonTur = 4
                    };

                    _magazaTelefonManager.Update(_magazaTelefon);

                    //magazaTlfb.update(Convert.ToInt32(Request.QueryString["magazaId"]), 4, Tools.PhoneNumberOrganizer(txtIsTlf2.Value));
                }
                else if (txtIsTlf2.Value != "" && _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 4) == null)
                {
                    magazaTelefon _magazaTelefon = new magazaTelefon
                    {
                        magazaId = Convert.ToInt32(Request.QueryString["magazaId"]),
                        telefon = Tools.PhoneNumberOrganizer(txtIsTlf2.Value),
                        telefonTur = 4
                    };

                    _magazaTelefonManager.Add(_magazaTelefon);

                    //magazaTlfb.insert(Convert.ToInt32(Request.QueryString["magazaId"]), Tools.PhoneNumberOrganizer(txtIsTlf2.Value), 4);
                }
                else
                {
                    magazaTelefon _telefon = _magazaTelefonManager.GetStoreTypeId(Convert.ToInt32(Request.QueryString["magazaId"]), 4);
                    _magazaTelefonManager.Delete(_telefon);
                    //magazaTlfb.delete(_telefon.magazaTelefonId);
                }

                DAL.magaza _magaza = _magazaManager.Get(Convert.ToInt32(Request.QueryString["magazaId"]));


                Response.Redirect("~/management/anaYonetim/magazaYonetimi/magaza.aspx?page=duzenle-icerik&edit=" + Request.QueryString["magazaId"] + "&cat=1&pac=" + _magaza.magazaKategoriId);
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