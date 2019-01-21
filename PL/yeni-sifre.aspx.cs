using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using BLL.EncryptHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class yeni_sifre : System.Web.UI.Page
    {
        private IGuvenlikKodService _guvenlikKodManager;
        private IKullaniciService _kullaniciManager;
        public yeni_sifre()
        {
            _guvenlikKodManager = new GuvenlikKodManager(new LTSGuvenlikKodlarDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (_guvenlikKodManager.GetBySecureCode(Request.QueryString["act"]) == null)
            {
                Response.Redirect("~/giris-yap");
            }
        }

        protected void Gonder_Click(object sender, EventArgs e)
        {
            int kullaniciId = _kullaniciManager.GetByEmail((_guvenlikKodManager.GetBySecureCode(Request.QueryString["act"]).cepTelefonu)).kullaniciId;
            try
            {
                _kullaniciManager.UpdateByPassword(kullaniciId, EncryptHelper.SHA1HashEncryption(txtSifre.Value));
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
            }

            Response.Redirect("~/giris-yap");
        }
    }
}