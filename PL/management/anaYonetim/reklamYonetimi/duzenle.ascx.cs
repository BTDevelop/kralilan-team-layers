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
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.reklamYonetimi
{
    public partial class duzenle : System.Web.UI.UserControl
    {
       
        public string path = "";
        int vReklamId;

        private IVerilenReklamService _verilenReklamManager;
        private IReklamService _reklamManager;
        private IIlService _ilManager;
        public duzenle()
        {
            _verilenReklamManager = new VerilenReklamManager(new LTSVerilenReklamlarDal());
            _reklamManager = new ReklamManager(new LTSReklamlarDal());
            _ilManager = new IlManager(new LTSIllerDal());

        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            Page.RegisterRequiresControlState(this);
            drpIl.Enabled = false;
            drpKonum.Enabled = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            vReklamId = Convert.ToInt32(Request.QueryString["advertisement"]);
            if (!Page.IsPostBack)
            {
                verilenReklam vRklmd = _verilenReklamManager.Get(Convert.ToInt32(Request.QueryString["advertisement"]));
                int reklamId = Convert.ToInt32(vRklmd.reklamId);
                DAL.reklam rklmd = _reklamManager.Get(reklamId);

                drpIl.DataSource = _ilManager.GetAll();
                drpIl.DataTextField = "ilAdi";
                drpIl.DataValueField = "ilId";
                drpIl.DataBind();

                ListItem lst = new ListItem();
                lst.Text = "Seçiniz";
                lst.Value = "null";
                drpIl.Items.Insert(0, lst);


                drpKullanici.SelectedValue = vRklmd.kullaniciId.ToString();
                drpReklamTur.SelectedValue = rklmd.reklamTurId.ToString();
                txtReklamAd.Text = vRklmd.reklamAdi.ToString();
                DateTime bast = Convert.ToDateTime(vRklmd.baslangicTarihi);
                DateTime bitt = Convert.ToDateTime(vRklmd.bitisTarihi);
                txtTarih.Text = bast.ToShortDateString() + " - " + bitt.ToShortDateString();


                if (vRklmd.reklamLink != null)
                {
                    txtReklamLink.Text = vRklmd.reklamLink.ToString();
                }

                path = "../../../upload/reklam/" + vRklmd.reklamResim.ToString();
                reklamResim.Attributes["src"] = path;


                if (vRklmd.ilId != null)
                {
                    drpIl.SelectedValue = vRklmd.ilId.ToString();
                    drpIl.Enabled = true;
                }

                if (rklmd.reklamKonumuId != null)
                {
                    drpKonum.SelectedValue = rklmd.reklamKonumuId.ToString();
                    drpKonum.Enabled = true;

                    if (rklmd.reklamKonumuId == 1 || rklmd.reklamKonumuId == 4)
                    {
                        reklamResim.Width = 728;
                        reklamResim.Height = 90;
                    }
                    if (rklmd.reklamKonumuId == 2 || rklmd.reklamKonumuId == 3 || rklmd.reklamKonumuId == 5)
                    {
                        reklamResim.Width = 230;
                        reklamResim.Height = 230;
                    }
                }
                else
                {
                    reklamResim.Width = 250;
                    reklamResim.Height = 150;
                }

            }
        }

        protected void drpReklamTur_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpReklamTur.SelectedValue == "1") // site içi sçilmişse
            {
                drpKonum.Enabled = true;
                drpIl.Enabled = false;
                drpIl.SelectedValue = "null";
            }
            else if (drpReklamTur.SelectedValue == "2") // harita çevresi seçilmişse
            {
                drpIl.Enabled = true;
                drpKonum.Enabled = false;
                drpKonum.SelectedValue = "null";
            }
            else // Her ikisi de seçilmemişse
            {
                drpIl.Enabled = false;
                drpIl.SelectedValue = "null";
                drpKonum.Enabled = false;
                drpKonum.SelectedValue = "null";
            }
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            int kullaniciId = Convert.ToInt32(drpKullanici.SelectedValue);
            string reklamAdi = txtReklamAd.Text;
            int reklamTur = Convert.ToInt32(drpReklamTur.SelectedValue);

            int reklamKonum = Convert.ToInt32(drpKonum.SelectedValue);
            string il = drpIl.SelectedValue;

            string[] tarihDizi = txtTarih.Text.Split('-');

            tarihDizi[0] = tarihDizi[0].Trim();
            tarihDizi[1] = tarihDizi[1].Trim();

            DateTime baslangicTar = Convert.ToDateTime(tarihDizi[0].Replace('/', '-'));
            DateTime bitisTar = Convert.ToDateTime(tarihDizi[1].Replace('/', '-'));

            DAL.reklam reklamd = _reklamManager.GetTypeLocationId(reklamTur, reklamKonum);

            string reklamResmi = "";
            if (chcYeniResim.Checked)
            {
                if (FileUpload1.HasFile)
                {
                    HttpFileCollection updateFiles = Request.Files;
                    string str_image = "";

                    if (FileUpload1.HasFile)
                    {
                        string[] segments = FileUpload1.FileName.Split('.');
                        string fileExt = segments[segments.Length - 1];

                        verilenReklam _verilenReklam = new verilenReklam
                        {
                            verilenReklamId = vReklamId,
                            reklamId = reklamd.reklamId,
                            kullaniciId = kullaniciId,
                            reklamAdi = reklamAdi,
                            ilId = Convert.ToInt32(il),
                            baslangicTarihi = Convert.ToDateTime(baslangicTar.ToShortDateString()),
                            bitisTarihi = Convert.ToDateTime(bitisTar.ToShortDateString()),
                            onay = true,
                            pasifMi = false
                        };
                        _verilenReklamManager.Update(_verilenReklam);

                        //vRklm.update(3, vReklamId, kullaniciId, reklamAdi, reklamd.reklamId, Convert.ToInt32(il), Convert.ToDateTime(baslangicTar.ToShortDateString()), Convert.ToDateTime(bitisTar.ToShortDateString()), false, true,vReklamId+"."+fileExt, txtReklamLink.Text);
                        for (int i = 0; i < updateFiles.Count; i++)
                        {
                            bool secili = false;
                            if (i == 0)
                            {
                                secili = true;
                            }

                            HttpPostedFile file = updateFiles[i];

                            string fileName = file.FileName;
                            string fileExtension = file.ContentType;

                            if (!string.IsNullOrEmpty(fileName))
                            {
                                fileExtension = Path.GetExtension(fileName);
                                str_image = vReklamId.ToString() + fileExtension;
                                string pathToSave_100 = HttpContext.Current.Server.MapPath("~/upload/reklam/") + str_image;
                                file.SaveAs(pathToSave_100);
                            }
                        }
                    }

                }
            }
            else
            {
                string[] dizi = reklamResim.Attributes["src"].Split('/');
                reklamResmi = dizi[5];
                verilenReklam _verilenReklam = new verilenReklam
                {
                    verilenReklamId = vReklamId,
                    reklamId = reklamd.reklamId,
                    kullaniciId = kullaniciId,
                    reklamAdi = reklamAdi,
                    ilId = Convert.ToInt32(il),
                    baslangicTarihi = Convert.ToDateTime(baslangicTar.ToShortDateString()),
                    bitisTarihi = Convert.ToDateTime(bitisTar.ToShortDateString()),
                    onay = true,
                    pasifMi = false
                };
                _verilenReklamManager.Update(_verilenReklam);

            }
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}