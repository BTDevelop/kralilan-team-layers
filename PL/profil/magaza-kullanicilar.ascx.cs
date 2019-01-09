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
using static BLL.magazaKullaniciBll;

namespace PL.profil
{
    public partial class magaza_kullanıcılar : System.Web.UI.UserControl
    {
        magazaKullaniciBll magazaKllb = new magazaKullaniciBll();
        kullaniciBll kullanicib = new kullaniciBll();
        public int userid;
        kullanici _kullanici;

        private IMagazaKullaniciService _magazaKullaniciManager;
        private IKullaniciService _kullaniciManager;
        public magaza_kullanıcılar()
        {
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                userid = _authority.kullaniciId;

                magazaKullanici _magazakullanici = _magazaKullaniciManager.GetByUserId(_authority.kullaniciId);
                rpstoreusers.DataSource = (List<StoreConsultantType>)DAL.toolkit.GetObjectInXml(magazaKllb.getUserByStoreId(_magazakullanici.magazaId), typeof(List<StoreConsultantType>));
                rpstoreusers.DataBind();

                int kullaniciId = Convert.ToInt32(Request.QueryString["dlt"]);

                if (Request.QueryString["dlt"] != null)
                {
                    magazaKullanici _magazaKullanici = new magazaKullanici
                    {
                        magazaId = _magazakullanici.magazaId,
                        kullaniciId = kullaniciId
                    };

                    _magazaKullaniciManager.Delete(_magazaKullanici);
                    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
                    Response.Redirect("~/secure/magaza-danismanlarim/");
                }

                rpstoreusers.DataSource = (List<StoreConsultantType>)DAL.toolkit.GetObjectInXml(magazaKllb.getUserByStoreId(_magazakullanici.magazaId), typeof(List<StoreConsultantType>));
                rpstoreusers.DataBind();
            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {

            magazaKullanici _magazakullanici = _magazaKullaniciManager.GetByUserId(userid);
            //int passengernum = _magazakullanici.magaza.magazaKategori.magazaPaketId == 1 ? 3 : 5;
            //int storeid = _magazakullanici.magaza.magazaId;
            int defaultnum = _magazaKullaniciManager.Count(_magazakullanici.magazaId);

            if(defaultnum <= 5)
            {
                int kullaniciId = _kullaniciManager.GetByEmail(Request.Form["adminmail"]).kullaniciId;
                magazaKullanici _magazaKullanici = new magazaKullanici
                {
                    magazaId = _magazakullanici.magazaId,
                    kullaniciId = kullaniciId,
                    rol = 2
                };

                _magazaKullaniciManager.Add(_magazaKullanici);
                //magazaKllb.insert(_magazakullanici.magazaId, kullaniciId, 2);
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup2();", true);
            }

        }
    }
}