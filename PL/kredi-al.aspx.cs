using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace PL
{
    public partial class kredi_al : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/giris-yap/");
        }

        double price;

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["unique-site-user"] != null)
            {

                if (Request.Form["method"] != "-1")
                {
                    if (Request.Form["method"] == "1")
                    {
                        price = 5;
                    }

                    if (Request.Form["method"] == "2")
                    {
                        price = 25;
                    }

                    if (Request.Form["method"] == "3")
                    {
                        price = 50;
                    }

                    if (Request.Form["method"] == "4")
                    {
                        price = 80;
                    }

                    if (Request.Form["method"] == "5")
                    {
                        price = 140;
                    }

                    if (Request.Form["method"] == "6")
                    {
                        price = 325;
                    }

                    if (Request.Form["method"] == "7")
                    {
                        price = 600;
                    }

                    if (Request.Form["method"] == "8")
                    {
                        price = 1000;
                    }

                    odemeBll odemeb = new odemeBll();
                    int islemId = 15;
                    int odemeTip = 3;
                    int kullaniciId = ((kullanici)Session["unique-site-user"]).kullaniciId;

                    DAL.odeme odeme = new DAL.odeme
                    {
                        kullaniciId = kullaniciId,
                        odemeTutar = price,
                        islemId = islemId,
                        odemeTipId = odemeTip,
                        kartNo = null,
                        basariliMi = false,
                        siparis = ""
                    };
                     

                    //odemeb.insert(kullaniciId, price, islemId, odemeTip, null, false, "");
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }
    }
}