using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class vitrin_listele : System.Web.UI.Page
    {
        public string showcasename = "";
        public int _value;
        ilanBll ilanb = new ilanBll();

        private ISeciliDopingService _seciliDopingManager;
        public vitrin_listele()
        {
            _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (RouteData.Values["VitrinNo"] != null)
            {
                _value = Convert.ToInt32(RouteData.Values["VitrinNo"]);
                if (_value == 1)
                {
                    showcasename = "Anasayfa Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg_4.png')";
                }
                else if (_value == 2)
                {
                    showcasename = "Arama Sonuç Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg_4.png')";
                }
                else if (_value == 3)
                {
                    showcasename = "Kategori Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg_6.png')";
                }
                else if (_value == 5)
                {
                    showcasename = "Acil Acil Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg_3.png')";
                }
                else if (_value == 8)
                {
                    showcasename = "Fiyatı Düşenler Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg_6.png')";
                }
                else if (_value == 48)
                {
                    showcasename = "Son 48 Saat Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg_5.png')";
                }
                else if (_value == 50)
                {
                    showcasename = "Satılanlar Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg_2.png')";
                    title.Attributes["style"] = "color:#000;";
                }
                else
                {
                    showcasename = "Diğer Vitrini";
                    intro.Attributes["style"] = "background: url('/libraries/images/bg.png')";
                }
                Page.Title = showcasename + " İlanları İçin kralilan.com";

            }
        }

        public string count(int opt)
        {
            string cnt = "";
            if (opt == 1 || opt == 5 || opt == 8 || opt==3 || opt==2)
                cnt = String.Format("{0:N0}", _seciliDopingManager.CountByDopingId(opt));
            else
                cnt = String.Format("{0:N0}", ilanb.countOther(opt));

            return cnt;
        }
    }
}