using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace PL.management.araclar
{
    public partial class mesajoku : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["how"]) == 1)
            {
                //DAL.mesajlar _mesaj = mesajb.search(Convert.ToInt32(Request.QueryString["mesajId"]));
                //hKim.InnerText = _mesaj.kullanici.kullaniciAdSoyad;
                //spTarih.InnerText = _mesaj.tarih.ToString();
                //pnlMesaj.InnerHtml = _mesaj.mesaj.ToString();
                //mesajb.update(1, 3, -1, -1, -1, Convert.ToInt32(Request.QueryString["mesajId"]));
            }
            else if (Convert.ToInt32(Request.QueryString["how"]) == 2)
            {
                //DAL.mesajlar _mesaj = mesajb.search(Convert.ToInt32(Request.QueryString["mesajId"]));
                //hKim.InnerText = _mesaj.kullanici.kullaniciAdSoyad;
                //spTarih.InnerText = _mesaj.tarih.ToString();
                //pnlMesaj.InnerHtml = _mesaj.mesaj.ToString();
            }
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            //if (Convert.ToInt32(Request.QueryString["how"]) == 1)
            //{
            //    mesajb.update(1, 1, -1, -1, -1, Convert.ToInt32(Request.QueryString["mesajId"]));
            //}

            //else if (Convert.ToInt32(Request.QueryString["how"]) == 2)
            //{
            //    mesajb.update(1, 2, -1, -1, -1,Convert.ToInt32(Request.QueryString["mesajId"]));
            //}
        }
    }
}