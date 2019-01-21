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
using BLL.PublicHelper;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.profil
{
    public partial class kisisel_bilgiler : System.Web.UI.UserControl
    {

        string profilePic = "";
        kullanici _kullanici;

        private IMahalleService _mahalleManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IKullaniciService _kullaniciManager;
        public kisisel_bilgiler()
        {
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                if (!Page.IsPostBack)
                {
                    kullanici _kullanici = _kullaniciManager.Get(_authority.kullaniciId);

                    drpIl.DataSource = _ilManager.GetAll();
                    drpIl.DataTextField = "ilAdi";
                    drpIl.DataValueField = "ilId";
                    drpIl.DataBind();

                    ListItem lst = new ListItem();
                    lst.Value = "-1";
                    lst.Text = "Seçiniz";
                    drpIl.Items.Insert(0, lst);

                    drpIl.SelectedValue = _kullanici.ilId.ToString();

                    drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                    drpIlce.DataTextField = "ilceAdi";
                    drpIlce.DataValueField = "ilceId";
                    drpIlce.DataBind();

                    ListItem lst1 = new ListItem();
                    lst.Value = "-1";
                    lst.Text = "Seçiniz";
                    drpIlce.Items.Insert(0, lst);

                    drpIlce.SelectedValue = _kullanici.ilceId.ToString();

                    drpMahalle.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
                    drpMahalle.DataTextField = "mahalleAdi";
                    drpMahalle.DataValueField = "mahalleId";
                    drpMahalle.DataBind();

                    ListItem lst2 = new ListItem();
                    lst.Value = "-1";
                    lst.Text = "Seçiniz";
                    drpMahalle.Items.Insert(0, lst);

                    drpMahalle.SelectedValue = _kullanici.mahalleId.ToString();

                    string[] name = Tools.StringOrganizer(_kullanici.kullaniciAdSoyad);

                    txtAd.Value = name[0].ToString();
                    txtSoyad.Value = name[1].ToString();
                    txtKimlikNo.Value = _kullanici.tckimlikNo;
                    txtTarih.Value = _kullanici.dogumTarihi.ToString();

                    drpEgitim.SelectedValue = _kullanici.egitimDurumuId.ToString();
                    drpIl.SelectedValue = _kullanici.ilId.ToString();
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


        protected void Guncelle_Click(object sender, EventArgs e)
        {
            kullanici _authority = _kullanici;

            HttpFileCollection updateFiles = Request.Files;
            if (fuprofile.HasFile)
            {
                for (int i = 0; i < updateFiles.Count; i++)
                {
                    HttpPostedFile file = updateFiles[i];
                    string fileName = file.FileName;
                    string fileExtension = Path.GetExtension(fileName);
                    profilePic = "prf_" + Tools.URLConverter(txtAd.Value + " " + txtSoyad.Value) + fileExtension;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                    DAL.toolkit.FixedSize(imgOrijinalResim, 300, 200, null, "profil", "~/upload/profil/"+profilePic);
                }
            }


            int il = Convert.ToInt32(drpIl.SelectedValue.ToString());
            int ilce = Convert.ToInt32(drpIlce.SelectedValue.ToString());
            int mahalle = Convert.ToInt32(drpMahalle.SelectedValue.ToString());
            int egitim = Convert.ToInt32(drpEgitim.SelectedValue.ToString());

            string isim = txtAd.Value + " " + txtSoyad.Value;

            DAL.kullanici kullanici = new DAL.kullanici
            {
                kullaniciId = _authority.kullaniciId,
                kullaniciAdSoyad = isim,
                ilId = il,
                ilceId = ilce,
                mahalleId = mahalle,
                tckimlikNo = txtKimlikNo.Value,
                egitimDurumuId = egitim,
                profilResim = profilePic
            };

            _kullaniciManager.Add(kullanici);

            //kll.update(
            //        _authority.kullaniciId,  
            //        isim,
            //        il,
            //        ilce,
            //        mahalle,
            //        txtKimlikNo.Value,
            //        egitim,
            //        -1,
            //        txtTarih.Value,
            //        profilePic
            //    );
        }
    }
}
