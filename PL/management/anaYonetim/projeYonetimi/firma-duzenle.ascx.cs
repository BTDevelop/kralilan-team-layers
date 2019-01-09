using BLL;
using BLL.PublicHelper;
using DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.projeYonetimi
{
    public partial class firma_duzenle : System.Web.UI.UserControl
    {
        public int _infirmaid;
        public string _infirmaadi;
        public string _infirlogo;
        public string _infirtelefon;
        public string _infirfaks;
        public string _infirposta;
        public string _infiraddr;
        public string _infirweb;
        public string _infirabout;

        firmalarBll firmab = new firmalarBll();

        private IFirmaService _firmaManager;

        public firma_duzenle()
        {
            _firmaManager = new FirmaManager(new LTSFirmalarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _infirmaid = Convert.ToInt32(Request.QueryString["firma"]);
            firmalar firmad = _firmaManager.Get(_infirmaid);

            comname.Text = firmad.fadi;
            comphone.Text = firmad.ftelefon;
            comfaks.Text = firmad.ffaks;
            compost.Text = firmad.feposta;
            comaddr.Text = firmad.fadres;
            comweb.Text = firmad.fwebsite;
            comabout.Text = firmad.fhakkinda;
            _infirlogo = firmad.flogo;
        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string firmaadi = comname.Text;
            string firmaposta = compost.Text;
            string firmatelefon = Tools.PhoneNumberOrganizer(comphone.Text);
            string firmafaks = Tools.PhoneNumberOrganizer(comfaks.Text);
            string firmaweb = comweb.Text;
            string firmahakkinda = comabout.Text;
            string firmaadres = comaddr.Text;
            string firmalogo = "";

            HttpFileCollection updateFiles = Request.Files;
            if (comlogo.HasFile)
            {
                for (int i = 0; i < updateFiles.Count; i++)
                {
                    HttpPostedFile file = updateFiles[i];
                    string fileName = file.FileName;
                    string fileExtension = Path.GetExtension(fileName);
                    firmalogo = "company_" + Tools.URLConverter(comname.Text) + fileExtension;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                    DAL.toolkit.FixedSize(imgOrijinalResim, 99, 66, null, "estate-company", firmalogo);
                }
            }
            else
            {
                firmalogo = _infirlogo;
            }
            

            try
            {
                DAL.firmalar _firma = new DAL.firmalar
                {
                    firmaid = _infirmaid,
                    fadi = firmaadi,
                    feposta = firmaposta,
                    ftelefon = firmatelefon,
                    ffaks = firmafaks,
                    fadres = firmaadres,
                    fwebsite = firmaweb,
                    fhakkinda = firmahakkinda,
                    flogo = firmalogo
                };

                _firmaManager.Update(_firma);

                //firmab.update(_infirmaid, firmaadi, firmaposta, firmatelefon, firmafaks, firmaadres, firmaweb, firmahakkinda, firmalogo);
            }
            catch (Exception)
            {
                 throw;
            }

        }

        protected void Vezgec_Click(object sender, EventArgs e)
        {
            
        }
    }
}