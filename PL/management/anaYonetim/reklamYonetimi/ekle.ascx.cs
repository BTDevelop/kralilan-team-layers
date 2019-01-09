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
    public partial class ekle : System.Web.UI.UserControl
    {
        ilBll il = new ilBll();
        kullaniciBll kullanicib = new kullaniciBll();
        verilenReklamBll verilenReklam = new verilenReklamBll();
        reklamBll rklm = new reklamBll();
        public string tempnumber;

        private IVerilenReklamService _verilenReklamManager;
        private IKullaniciService _kullaniciManager;
        public ekle()
        {
            _verilenReklamManager = new VerilenReklamManager(new LTSVerilenReklamlarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                tempnumber = DateTime.Now.Ticks.ToString();
                txtgecici.Value = tempnumber;
            }
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {        
            string adsname = Request.Form["adsname"];
            int ilId = Convert.ToInt32(Request.Form["slctprovi"]);
            string[] daterange = Request.Form["reservation"].Split('-');

            daterange[0] = daterange[0].Trim();
            daterange[1] = daterange[1].Trim();

            DateTime startdate = Convert.ToDateTime(daterange[0].Replace("/", "-"));
            DateTime enddate = Convert.ToDateTime(daterange[1].Replace("/", "-"));

            string adslink = Request.Form["adslink"];

            int kullaniciId = _kullaniciManager.GetByEmail(Request.Form["adminmail"]).kullaniciId;

            try
            {
                verilenReklam _verilenReklam = new verilenReklam
                {
                    reklamId  = 12,
                    kullaniciId = kullaniciId,
                    reklamAdi = adsname,
                    reklamResim = "",
                    ilId = ilId,
                    baslangicTarihi = startdate,
                    bitisTarihi = enddate,
                    reklamLink = adslink,
                    onay = false,
                    pasifMi = false
                };

                _verilenReklamManager.Add(_verilenReklam);

                _verilenReklam = _verilenReklamManager.GetLast();

                string str_image = "";

                var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(@"\upload\reklam\"));
                string pathString = System.IO.Path.Combine(originalDirectory.ToString(), txtgecici.Value);
                bool isExistsone = System.IO.Directory.Exists(pathString);

                if (isExistsone)
                {
                    string[] strlist = System.IO.Directory.GetFiles(pathString, "*.*");
                    for (int i = 0; i < strlist.Length; i++)
                    {

                        FileInfo file = new System.IO.FileInfo(strlist[i]);

                        string fileName = file.Name;
                        string fileExtension = Path.GetExtension(fileName);
                        str_image = _verilenReklam.verilenReklamId.ToString() + fileExtension;
                        System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(strlist[i]);

                        StrategyPhoto.FixedSize(imgOrijinalResim, 120, 80, null, null, "~/upload/reklam/"+str_image);
                    }

                    System.IO.Directory.Delete(pathString, true);
                }

                _verilenReklamManager.UpdatePicture(_verilenReklam.verilenReklamId, str_image);
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/management/anaYonetim/reklamYonetimi/reklam.aspx?page=listele");
        }

        protected void drpReklamTur_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}