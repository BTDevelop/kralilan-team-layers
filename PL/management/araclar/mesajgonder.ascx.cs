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
    public partial class mesajgonder : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //drpKime.DataSource = kullanicib.receiveList();
                //drpKime.DataTextField = "kullaniciAdSoyad";
                //drpKime.DataValueField = "kullaniciId";
                //drpKime.DataBind();
            }

            if (Session["unique-user"] != null)
            {
                kullanici _authority = (kullanici)Session["unique-user"];
                txtKimden.Value = _authority.kullaniciAdSoyad;
            }

        }

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            int kimeId = Convert.ToInt32(drpKime.SelectedValue);
            if (Session["unique-user"] != null)
            {
                kullanici _authority = (kullanici)Session["unique-user"];
               
            }
        }

        protected void Vazgec_Click(object sender, EventArgs e)
        {

        }
    }
}