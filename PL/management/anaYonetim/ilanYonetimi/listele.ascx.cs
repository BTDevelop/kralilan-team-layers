using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace PL.management.anaYonetim.ilanYonetimi
{
    public partial class listele : System.Web.UI.UserControl
    {
        ilanBll ilan = new ilanBll();
        public string tip;
        protected void Page_Load(object sender, EventArgs e)
        {
            //tip = Request.QueryString["tip"];

            //if (Request.QueryString["cla"] != null)
            //{
            //    if(Request.QueryString["proc"] == "sil")
            //    {
            //        ilan.update(3, Request.QueryString["cla"]); // silindiMi=true işlemini yapıyoruz
            //    }
            //    else
            //    {
            //        if (tip == "1")
            //        {
            //            if (Request.QueryString["proc"] == "1")
            //            {
            //                ilan.update(2, 1, Request.QueryString["cla"], 1); // onaylama işlemini yapıyoruz
            //            }
            //            else
            //            {
            //                ilan.update(2, 1, Request.QueryString["cla"], 3); // onaylamama işlemini yapıyoruz
            //            }

            //        }
            //        if (tip == "2")
            //        {
            //            ilan.update(2, 2, Request.QueryString["cla"]); // pasif=true işlemini yapıyoruz
            //        }
            //        if (tip == "3")
            //        {
            //            ilan.update(2, 3, Request.QueryString["cla"]); // pasif=false işlemini yapıyoruz
            //        }
            //        if (tip == "4")
            //        {
            //            ilan.update(2, 4, Request.QueryString["cla"]); // ilan üzerindeki tüm şikayetleri kaldırıyoruz
            //        }
            //        if (tip == "6")
            //        {
            //            ilan.update(2, 4, Request.QueryString["cla"]); // ilan üzerindeki tüm dopingleri kaldırıyoruz
            //        }

            //        if (tip == "10")
            //        {
            //            if (Request.QueryString["proc"] == "1")
            //            {
            //                ilan.update(2, 1, Request.QueryString["cla"], 1); // onaylama işlemini yapıyoruz
            //            }
                       
            //        }
            //    }
            //}

            //ilanRepeater.DataSource = ilan.list_admin(tip);
            //ilanRepeater.DataBind();
        }
        //protected void sil_Click(object sender, EventArgs e)
        //{
        //    string confirmValue = Request.Form["confirm_value"];
        //    if (confirmValue == "Evet")
        //    {
        //        foreach (RepeaterItem item in ilanRepeater.Items)
        //        {
        //            HiddenField gelenData = (HiddenField)item.FindControl("hfDelete");
        //            ilan.delete(Convert.ToInt32(gelenData.Value));
        //        }
        //    }
        //}

        //protected void pasif_Click(object sender, EventArgs e)
        //{
        //    //foreach (RepeaterItem item in ilanRepeater.Items)
        //    //{
        //    //    HiddenField gelenData = (HiddenField)item.FindControl("hfDelete");

        //    //    ilan.update(3, gelenData.Value, true);
        //    //}
        //    //ilanRepeater.DataSource = ilan.list(1);
        //    //ilanRepeater.DataBind();

        //}

        //protected void aktif_Click(object sender, EventArgs e)
        //{
        //    //foreach (RepeaterItem item in ilanRepeater.Items)
        //    //{
        //    //    HiddenField gelenData = (HiddenField)item.FindControl("hfDelete");

        //    //    ilan.update(3, gelenData.Value, true);
        //    //}
        //    //ilanRepeater.DataSource = ilan.list(1);
        //    //ilanRepeater.DataBind();                 
        //}

        //public bool pasifBul(string gelen)
        //{
        //    if (gelen == "False")
        //    {
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}
    }
}