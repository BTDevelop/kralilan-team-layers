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
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL.management.anaYonetim.magazaYonetimi
{
    public partial class ekle : System.Web.UI.UserControl
    {
      
        private IMagazaTelefonService _magazaTelefonManager;
        private IMagazaKullaniciService _magazaKullaniciManager;
        private IKullaniciService _kullaniciManager;
        private IMagazaService _magazaManager;
        public ekle()
        {
            _magazaTelefonManager = new MagazaTelefonManager(new LTSMagazaTelefonlarDal());
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Kaydet_Click(object sender, EventArgs e)
        {

            bool storeType = false;

            if (Request.Form["daterange"] == "1")
                storeType = true;


            string magazaAdi = Request.Form["storename"];
            bool magazaTipi = storeType;
            int ilId = Convert.ToInt32(Request.Form["slctprovi"]);
            int ilceId = Convert.ToInt32(Request.Form["slctdist"]);
            int mahalleId = Convert.ToInt32(Request.Form["slctneig"]);
            string vergiNo = Request.Form["uniquekey"];
            int vergiId = Convert.ToInt32(Request.Form["slcttax"]);

            try
            {

                DAL.magaza magaza = new DAL.magaza
                {
                    magazaAdi = magazaAdi,
                    kurumsalMi = magazaTipi,
                    ilId = ilId,
                    ilceId = ilceId,
                    mahalleId = mahalleId,
                    vergiNo = vergiNo,
                    vergiDaireId = vergiId
                };

                _magazaManager.Add(magaza);

                //magazab.insert(magazaAdi, magazaTipi, ilId, ilceId, mahalleId, vergiNo, vergiId);
                DAL.magaza _magaza = _magazaManager.GetLast();
                int storeId = _magaza.magazaId;

                if (Request.Form["phone1"] != "")
                {
                    magazaTelefon _magazaTelefon = new magazaTelefon
                    {
                        magazaId = storeId,
                        telefon = Tools.PhoneNumberOrganizer(Request.Form["phone1"]),
                        telefonTur = 3
                    };

                    _magazaTelefonManager.Add(_magazaTelefon);
                }
                if (Request.Form["phone2"] != "")
                {
                    magazaTelefon _magazaTelefon = new magazaTelefon
                    {
                        magazaId = storeId,
                        telefon = Tools.PhoneNumberOrganizer(Request.Form["phone2"]),
                        telefonTur = 4
                    };

                    _magazaTelefonManager.Add(_magazaTelefon);
                }

                int kullaniciId = _kullaniciManager.GetByEmail(Request.Form["adminmail"]).kullaniciId;
                magazaKullanici _magazaKullanici = new magazaKullanici
                {
                    magazaId = storeId,
                    kullaniciId = kullaniciId,
                    rol = 0
                };

                _magazaKullaniciManager.Add(_magazaKullanici);
                //magazaKllb.insert(storeId, kullaniciId, 0);
                Session["storeadmin"] = kullaniciId;
                Response.Redirect("~/management/anaYonetim/magazaYonetimi/magaza.aspx?page=kategori-secimi&sto=" + _magaza.magazaId);

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