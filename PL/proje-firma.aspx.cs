using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class proje_firma : System.Web.UI.Page
    {

        firmalarBll firmab = new firmalarBll();

        public int firmaid;
        public string fadi;
        public string ftelefon;
        public string ffaks;
        public string fhakkinda;
        public string flogo;
        public string fadres;

        private IFirmaService _firmaManager;
        public proje_firma()
        {
            _firmaManager = new FirmaManager(new LTSFirmalarDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            firmaid = Convert.ToInt32(RouteData.Values["ComNo"]);
            DAL.firmalar _firma = _firmaManager.Get(firmaid);
            Page.Title = _firma.fadi+ " Projeleri kralilan.com'da";

            fadi = _firma.fadi;
            ftelefon = _firma.ftelefon;
            ffaks = _firma.ffaks;
            fhakkinda = _firma.fhakkinda;
            flogo = _firma.flogo;
            fadres = _firma.fadres;

        }
    }
}