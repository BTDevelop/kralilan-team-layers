using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace PL.management.anaYonetim.reklamYonetimi
{
    public partial class listele : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

        public string turDondur(int id)
        {
            string tur = "";

            if(id==1)
            {
                tur = "Site İçi";
            }
            else
            {
                tur = "Harita Çevresi";
            }
            return tur;
        }

        public string konumDondur(int id)
        {
            string konum = "";

            if (id == 1)
            {
                konum = "Anasayfa - 728 * 90";
            }
            else if(id==2)
            {
                konum = "Anasayfa - Sağ Üst 230 * 230";
            }
            else if (id == 3)
            {
                konum = "Anasayfa - Sağ Alt 230 * 230";
            }
            else if (id == 4)
            {
                konum = "Liste - 728 * 90";
            }
            else if (id == 5)
            {
                konum = "Detay - 230 * 230";
            }
            else
            {
                konum = "-";
            }
            return konum;
        }

      
    }
}