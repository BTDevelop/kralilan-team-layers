using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

namespace PL.management.anaYonetim.ilanYonetimi
{
    public partial class ilan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["page"] == "listele")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/listele.ascx"));
            }
            if (Request.QueryString["page"] == "yeni")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/yeni.ascx"));
            }
            if (Request.QueryString["page"] == "ekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/ekle.ascx"));
            }
            if (Request.QueryString["page"] == "ilan-kategori")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/ilan-kategori.ascx"));
            }
            if (Request.QueryString["page"] == "dopingekle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/dopingekle.ascx"));
            }
            if (Request.QueryString["page"] == "fiyatdusenilan")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/fiyatdusenilan.ascx"));
            }
            if (Request.QueryString["page"] == "dopingilan")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/dopingilan.ascx"));
            }
            if (Request.QueryString["page"] == "acililan")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/acililan.ascx"));
            }
            if (Request.QueryString["page"] == "sikayetilan")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/sikayetilan.ascx"));
            }
            if (Request.QueryString["page"] == "onaybekleyenilan")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/onaybekleyenilan.ascx"));
            }
            if (Request.QueryString["page"] == "duzenle")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/duzenle.ascx"));
            }
            if (Request.QueryString["page"] == "ilan-verildi")
            {
                PlaceHolder1.Controls.Add(Page.LoadControl("~/management/anaYonetim/ilanYonetimi/ilan-verildi.ascx"));
            }
        }
    }
}