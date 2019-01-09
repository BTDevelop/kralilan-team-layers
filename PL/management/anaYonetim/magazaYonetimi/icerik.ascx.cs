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
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.magazaYonetimi
{

    public partial class icerik : System.Web.UI.UserControl
    {
        magazaTurBll magazaTurb = new magazaTurBll();
        magazaBll magazab = new magazaBll();
        magazaKategoriBll magazaKtgb = new magazaKategoriBll();

        private IMagazaKategoriService _magazaKategoriManager;
        private IMagazaService _magazaManager;
        public icerik()
        {
            _magazaKategoriManager = new MagazaKategoriManager(new LTSMagazaKategorilerDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void devam_Click(object sender, EventArgs e)
        {
            //string[] segments = FileUpload1.FileName.Split('.');
            //string storelogo = segments[segments.Length - 1];

            string storelogo = "";
            DateTime magazaSure = DateTime.Now;
            int magazaKategoriId = Convert.ToInt32(Request.QueryString["pac"]);
            int storetype = Convert.ToInt32(Request.Form["storetype"]);
            string storename = Request.Form["storename"];
            string storeexp = Request.Form["storexp"];
            int sureId = Convert.ToInt32(_magazaKategoriManager.GetByCategoriId(magazaKategoriId).paketSureId);
            int storeid = Convert.ToInt32(Request.QueryString["sto"]);
            if (sureId == 1)
                magazaSure = DateTime.Now.AddMonths(6);
            if (sureId == 2)
                magazaSure = DateTime.Now.AddMonths(12);

            HttpFileCollection updateFiles = Request.Files;
            if (FileUpload1.HasFile)
            {
                for (int i = 0; i < updateFiles.Count; i++)
                {
                    HttpPostedFile file = updateFiles[i];
                    string fileName = file.FileName;
                    string fileExtension = Path.GetExtension(fileName);
                    storelogo = Tools.URLConverter(storeid+"_"+storename) + fileExtension;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                    DAL.toolkit.FixedSize(imgOrijinalResim, 300, 200, null, "magaza", storelogo);
                }
            }


            DAL.magaza _magaza = new DAL.magaza
            {
                magazaId = storeid,
                magazaKategoriId = magazaKategoriId,
                magazaTurId = storetype,
                magazaAdi = storename,
                magazaLogo = storelogo,
                baslangicTarihi = DateTime.Now,
                bitisTarihi = magazaSure,
                ilId = -1,
                ilceId = -1,
                mahalleId = -1,
                vergiNo = null,
                krediSayisi = -1,
                onay = true,
                pasifMi = false,
                //kurumsalMi = -1,
                silindiMi = false,
                aciklama = storeexp
            };

            _magazaManager.Add(_magaza);



            //magazab.update1(storeid, magazaKategoriId, storetype, storename, storelogo, DateTime.Now, magazaSure, -1, -1, -1, null, -1, 1, 0, -1, 0, storeexp);

            Response.Redirect("~/management/anaYonetim/magazaYonetimi/magaza.aspx?page=odeme&sto=" + Request.QueryString["sto"] + "&pac=" + Request.QueryString["pac"]);
        }
    }
}