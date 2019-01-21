using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.IO;
using BLL.Concrete;
using BLL.EnumHelper;
using BLL.PublicHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class magaza_profil : System.Web.UI.UserControl
    {
        public int userid;
        public int storeid;
        public string storename;
        public string storeexp;
        public string storetype;
        public string phone1;
        public string phone2;
        public string province;
        public string district;
        public string neig;
        public string identitynum;
        public string taxadmin;
        public string storecat;
        public string storepac;
        public string storepactime;
        public string strdate;
        public string enddate;
        kullanici _user;

        private IMahalleService _mahalleManager;
        private IMagazaTelefonService _magazaTelefonManager;
        private IMagazaKullaniciService _magazaKullaniciManager;
        private IIlceService _ilceManager;
        private IIlService _ilmanager;
        private IMagazaService _magazaManager;
        public magaza_profil()
        {
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _magazaTelefonManager = new MagazaTelefonManager(new LTSMagazaTelefonlarDal());
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilmanager = new IlManager(new LTSIllerDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _user = kullaniciBll.getUsersBlock();

            if (_user != null)
            {
                kullanici _authority = _user;

                userid = _authority.kullaniciId;

                magazaKullanici _isUserStore = _magazaKullaniciManager.GetByUserId(userid);

                if (_isUserStore != null)
                {
                    storeid = _isUserStore.magaza.magazaId;
                    storename = _isUserStore.magaza.magazaAdi;
                    storetype = _isUserStore.magaza.kurumsalMi == true ? "Kurumsal" : "Bireysel";
                    storeexp = _isUserStore.magaza.aciklama;

                    if (_isUserStore.magaza.magazaTelefons.Where(x => x.telefonTur == 3).FirstOrDefault() != null)
                        phone1 = _isUserStore.magaza.magazaTelefons.Where(x => x.telefonTur == 3).FirstOrDefault().telefon;

                    if (_isUserStore.magaza.magazaTelefons.Where(x => x.telefonTur == 4).FirstOrDefault() != null)
                        phone2 = _isUserStore.magaza.magazaTelefons.Where(x => x.telefonTur == 4).FirstOrDefault().telefon;


                    if (_isUserStore.magaza.ilId != null) province = _isUserStore.magaza.iller.ilAdi;
                    if (_isUserStore.magaza.ilceId != null) district = _isUserStore.magaza.ilceler.ilceAdi;
                    if (_isUserStore.magaza.mahalleId != null) neig = _isUserStore.magaza.mahalleler.mahalleAdi;


                    identitynum = _isUserStore.magaza.vergiNo;
                    if (_isUserStore.magaza.vergiDaireId != null) taxadmin = _isUserStore.magaza.vergiDaire.vergiDairesi;
                    if (_isUserStore.magaza.magazaKategoriId != null) storecat = _isUserStore.magaza.magazaKategori.kategori.kategoriAdi;
                    if (_isUserStore.magaza.magazaKategoriId != null) storepac = EnumHelper.GetDescription((StorePackageTypeString)Enum.Parse(typeof(StorePackageTypeString), _isUserStore.magaza.magazaKategori.magazaPaketId.ToString()));
                    if (_isUserStore.magaza.magazaKategori.paketSureId == Convert.ToInt32(magazaKategoriBll.StoreTimeType.UcAylik)) storepactime = "3 Aylık";
                    else if (_isUserStore.magaza.magazaKategori.paketSureId == Convert.ToInt32(magazaKategoriBll.StoreTimeType.AltiAylik)) storepactime = "6 Aylık";
                    else if (_isUserStore.magaza.magazaKategori.paketSureId == Convert.ToInt32(magazaKategoriBll.StoreTimeType.OnIkiAylik)) storepactime = "12 Aylık";
                    //if (_isUserStore.magaza.magazaKategoriId != null) storepactime = _isUserStore.magaza.magazaKategori.paketSureId.ToString() == "1" ? "6 Aylık" : "12 Aylık";
                    strdate = _isUserStore.magaza.baslangicTarihi.ToString("dd MMMM yyyy");
                    //enddate = _isUserStore.magaza.bitisTarihi.ToString("dd MMMM yyyy");

                    if (!Page.IsPostBack)
                    {

                        drpIl.DataSource = _ilmanager.GetAll();
                        drpIl.DataTextField = "ilAdi";
                        drpIl.DataValueField = "ilId";
                        drpIl.DataBind();

                        ListItem lstPro = new ListItem();
                        lstPro.Value = "-1";
                        lstPro.Text = "Seçiniz";
                        drpIl.Items.Insert(0, lstPro);

                        drpIl.SelectedValue = _isUserStore.magaza.ilId.ToString();

                        drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                        drpIlce.DataTextField = "ilceAdi";
                        drpIlce.DataValueField = "ilceId";
                        drpIlce.DataBind();

                        ListItem lstDist = new ListItem();
                        lstDist.Value = "-1";
                        lstDist.Text = "Seçiniz";
                        drpIlce.Items.Insert(0, lstDist);

                        drpIlce.SelectedValue = _isUserStore.magaza.ilceId.ToString();

                        drpMahalle.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
                        drpMahalle.DataTextField = "mahalleAdi";
                        drpMahalle.DataValueField = "mahalleId";
                        drpMahalle.DataBind();

                        ListItem lstNeig = new ListItem();
                        lstNeig.Value = "-1";
                        lstNeig.Text = "Seçiniz";
                        drpMahalle.Items.Insert(0, lstNeig);

                        drpMahalle.SelectedValue = _isUserStore.magaza.mahalleId.ToString();

                    }

                }
            }
        }


        protected void drpIl_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpIlce.Items.Clear();
            drpMahalle.Items.Clear();

            drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
            drpIlce.DataTextField = "ilceAdi";
            drpIlce.DataValueField = "ilceId";
            drpIlce.DataBind();

            ListItem lst = new ListItem();
            lst.Value = "-1";
            lst.Text = "Seçiniz";
            drpIlce.Items.Insert(0, lst);

            ListItem lst_1 = new ListItem();
            lst_1.Value = "-1";
            lst_1.Text = "Seçiniz";
            drpMahalle.Items.Insert(0, lst_1);

        }

        protected void drpIlce_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpMahalle.Items.Clear();

            drpMahalle.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
            drpMahalle.DataTextField = "mahalleAdi";
            drpMahalle.DataValueField = "mahalleId";
            drpMahalle.DataBind();

            ListItem lst = new ListItem();
            lst.Value = "-1";
            lst.Text = "Seçiniz";
            drpMahalle.Items.Insert(0, lst);
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string storelogo = null;
            HttpFileCollection updateFiles = Request.Files;
            if (fuprofile.HasFile)
            {
                for (int i = 0; i < updateFiles.Count; i++)
                {
                    HttpPostedFile file = updateFiles[i];
                    string fileName = file.FileName;
                    string fileExtension = Path.GetExtension(fileName);
                    storelogo = Tools.URLConverter(Request.Form["storename"] + "-" + DateTime.Now) + fileExtension;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                    DAL.toolkit.FixedSize(imgOrijinalResim, 300, 200, null, "magaza", storelogo);
                }
            }


            DAL.magaza _magaza = new DAL.magaza
            {
                magazaId = storeid,
                magazaKategoriId = -1,
                magazaTurId = -1,
                magazaAdi = Request.Form["storename"],
                magazaLogo = storelogo,
                baslangicTarihi = Convert.ToDateTime(null),
                bitisTarihi = Convert.ToDateTime(null),
                ilId = Convert.ToInt32(drpIl.SelectedValue),
                ilceId = Convert.ToInt32(drpIlce.SelectedValue),
                mahalleId = Convert.ToInt32(drpMahalle.SelectedValue),
                vergiNo = null,
                krediSayisi = -1,
                //onay = true,
                //pasifMi = false,
                //kurumsalMi = -1,
                //silindiMi = false,
                aciklama = Request.Form["storeexp"]
            };

            _magazaManager.Add(_magaza);


            //magazab.update1(storeid, -1, -1, Request.Form["storename"], storelogo, Convert.ToDateTime(null), Convert.ToDateTime(null), Convert.ToInt32(drpIl.SelectedValue), Convert.ToInt32(drpIlce.SelectedValue), Convert.ToInt32(drpMahalle.SelectedValue), null, -1, -1, -1, -1, -1, Request.Form["storeexp"]);

            if (Request.Form["no1"] != "")
            {
                magazaTelefon _magazaTelefon = new magazaTelefon
                {
                    magazaId = storeid,
                    telefon = Tools.PhoneNumberOrganizer(Request.Form["no1"]),
                    telefonTur = 3
                };

                _magazaTelefonManager.Add(_magazaTelefon);
            }
            //magazaTlfb.insert(storeid, Tools.PhoneNumberOrganizer(Request.Form["no1"]), 3);
            if (Request.Form["no2"] != "")
            {
                magazaTelefon _magazaTelefon = new magazaTelefon
                {
                    magazaId = storeid,
                    telefon = Tools.PhoneNumberOrganizer(Request.Form["no2"]),
                    telefonTur = 4
                };

                _magazaTelefonManager.Add(_magazaTelefon);
            }
            //magazaTlfb.insert(storeid, Tools.PhoneNumberOrganizer(Request.Form["no2"]), 4);
        }

    }
}
