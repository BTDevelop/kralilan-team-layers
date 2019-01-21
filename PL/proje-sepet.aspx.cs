using BLL;
using DAL;
using Newtonsoft.Json.Linq;
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
    public partial class proje_sepet : System.Web.UI.Page
    {
        public string mesaj = "";

        public JArray objDizi = new JArray();
        kullanici _kullanici;

        private IOdemeService _odemeManager;

        public proje_sepet()
        {
            _odemeManager = new OdemeManager(new LTSOdemelerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if(_kullanici!=null)
            { 
                if (!IsPostBack)
                {
                    objDizi = (JArray)Session["showcasebasket"];
                    if (objDizi.Count <= 0)
                    {
                        Response.Redirect("~/projeler/ekle/");
                    }
                    else
                    {
                        odemeRepeater.DataSource = objDizi.ToList();
                        odemeRepeater.DataBind();
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "temp", "<script language='javascript'>hesapla();</script>", false);
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<BLL.ExternalClass.siparisDT> siparisler = new List<BLL.ExternalClass.siparisDT>();
            int adsid = Convert.ToInt32(Session["ki-projectregnumeramble"]);
            JArray objDizi2 = ((JArray)Session["showcasebasket"]);

            for (int i = 0; i < objDizi2.Count; i++)
            {
                var siparisdata = new BLL.ExternalClass.siparisDT
                {
                    adsid = adsid,
                    optid = Convert.ToInt32(objDizi2[i]["islemId"]),
                    price = Convert.ToDouble(objDizi2[i]["tutar"]),
                };

                siparisler.Add(siparisdata);
            }

            if (Request.Form["optionsRadios"] == "1")
            {
                string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
                txtstr = txtstr.Replace("\r\n", "").Trim();
                txtstr = txtstr.Replace("  ", "");
                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));

                odemeBll odemeb = new odemeBll();

                double price = 0;
                for (int i = 0; i < objDizi2.Count; i++)
                {
                    price += Convert.ToDouble(objDizi2[i]["tutar"]);
                }

                int kullaniciId = _kullanici.kullaniciId;
                //odemeb.insert(
                //      kullaniciId,
                //      price,
                //      20,
                //      1,
                //      "",
                //      false,
                //      txtstr
                //      );

                DAL.odeme odeme = new DAL.odeme
                {
                    kullaniciId = kullaniciId,
                    odemeTutar = price,
                    islemId = 20,
                    odemeTipId = 1,
                    kartNo = "",
                    basariliMi = false,
                    siparis = txtstr
                };

                _odemeManager.Add(odeme);

                DAL.odeme _odeme = _odemeManager.GetLast();
                int order = _odeme.odemeId;


                //DAL.toolkit.VirtualPosPayment(this.Context, order, price, "dfdsfsd", "sdsadasd");

            }

            //else if (Request.Form["optionsRadios"] == "2")
            //{

            //    string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
            //    txtstr = txtstr.Replace("\r\n", "").Trim();
            //    txtstr = txtstr.Replace("  ", "");
            //    List<BLL.deff.siparisDT> siparislist = new List<BLL.deff.siparisDT>();
            //    siparislist = (List<BLL.deff.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.deff.siparisDT>));

            //    odemeBll odemeb = new odemeBll();

            //    int kullaniciId = ((kullanici)Session["unique-site-user"]).kullaniciId;
            //    odemeb.insert(
            //          kullaniciId,
            //          -1,
            //          10,
            //          2,
            //          "",
            //          false,
            //          txtstr
            //          );

            //    DAL.odeme _odeme = odemeb.LastPayment();
            //    int order = _odeme.odemeId;
            //    double price = 0;

            //    for (int i = 0; i < objDizi2.Count; i++)
            //    {
            //        price += Convert.ToDouble(objDizi2[i]["tutar"]);
            //    }

            //    DAL.toolkit.MobilePayment(this.Context, order.ToString(), "vitrin" , price.ToString("F2", CultureInfo.InvariantCulture), "dfdsfsd", "sdsadasd");



            //}
            else if (Request.Form["optionsRadios"] == "3")
            {

                string txtstr = DAL.toolkit.GetXmlDataInObject(siparisler);
                txtstr = txtstr.Replace("\r\n", "").Trim();
                txtstr = txtstr.Replace("  ", "");
                List<BLL.ExternalClass.siparisDT> siparislist = new List<BLL.ExternalClass.siparisDT>();
                siparislist = (List<BLL.ExternalClass.siparisDT>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.siparisDT>));

                odemeBll odemeb = new odemeBll();

                double price = 0;

                for (int i = 0; i < objDizi2.Count; i++)
                {
                    price += Convert.ToDouble(objDizi2[i]["tutar"]);
                }


                //int kullaniciId = ((kullanici)Session["unique-site-user"]).kullaniciId;
                int kullaniciId = _kullanici.kullaniciId;
                //odemeb.insert(
                //      kullaniciId,
                //      price,
                //      20,
                //      3,
                //      "",
                //      false,
                //      txtstr
                //      );

                DAL.odeme odeme = new DAL.odeme
                {
                    kullaniciId = kullaniciId,
                    odemeTutar = price,
                    islemId = 20,
                    odemeTipId = 3,
                    kartNo = "",
                    basariliMi = false,
                    siparis = txtstr
                };

                _odemeManager.Add(odeme);



            }


            Response.Redirect("~/projeler/basarili/");
        }


        protected void Devam_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);

        }


        //protected void odemeRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "Sil" && e.CommandArgument.ToString() != "")
        //    {
        //        //odemeBll odmB = new odemeBll();
        //        //odmB.delete(Convert.ToInt32(e.CommandArgument));
        //        JArray objDizi2 = ((JArray)Session["showcasebasket"]);

        //        for (int i = 0; i < objDizi2.Count; i++)
        //        {
        //            if (objDizi2[i]["primarykey"].ToString() == e.CommandArgument.ToString())
        //            {
        //                objDizi2[i].Remove();
        //                break;
        //            }
        //        }
        //        Session["showcasebasket"] = objDizi2;
        //        Response.Redirect(Request.RawUrl);
        //    }
        //}
    }
}