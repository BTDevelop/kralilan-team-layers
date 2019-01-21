using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Web.UI.HtmlControls;
using BLL.PublicHelper;
using BLL.EnumHelper;

namespace PL
{
    public partial class ilan_detaylari : System.Web.UI.Page
    {

        List<BLL.ExternalClass.ilanDataType> nearPositionClassified = new List<BLL.ExternalClass.ilanDataType>();
        kullanici _kullanici;

        public string magazaId, kullaniciId, postResim, sellerProfil = "", link = "", classifiedURI;
        public int whoFromId, phindex = 0;
        public string heading = "",
                      fromWho = "",
                      date = "",
                      location = "",
                      price = "",
                      visitor = "",
                      number = "",
                      adsType = "",
                      explanation = "",
                      profileImage = "",
                      sellername = "",
                      adsId = "";
                        

        public string userName = "", email = "";

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            try
            {
                //if (_kullanici == null)
                //{
                //    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup2();", true);
                //}
                //else
                //{
                //    classifiedURI = "https://www.kralilan.com/ilan/" + Tools.URLConverter(heading) + "/" + adsId + "/" + "detay";
                //    string userMail = kullanicib.search(Convert.ToInt32(kullaniciId)).email;
                //    toolkit.HtmlMailMessageSender(userMail, senderEmail.Value,"~/email-temp/three-cols-images/build.html", location + "İlanı için 1 e-posta alındı.", location + "İlanınız için 1 mesaj alındı.", heading, price, "Burak Tahtacıoğlu", "Mesaj", location, "https://www.kralilan.com/upload/ilan/" + postResim, classifiedURI);
                //    ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
                //}
            }
            catch (Exception)
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);
                throw;
            }
        }

        public List<BLL.ExternalClass.resimDataType> resimler = new List<BLL.ExternalClass.resimDataType>();

        protected override void OnInit(EventArgs e)
        {
            Response.Status = "301 Moved Permanently";
            Response.RedirectPermanent("~/" + String.Format("/ilan/{0}-{1}/detay", RouteData.Values["Baslik"], RouteData.Values["IlanNo"]));

            //CreateDynamicControls();
        }

        //public void CreateDynamicControls()
        //{
        //    List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
        //    List<BLL.ExternalClass.secilenDataType> slctlist = new List<BLL.ExternalClass.secilenDataType>();
        //    List<BLL.ExternalClass.ozelliklerDT> formlist = new List<BLL.ExternalClass.ozelliklerDT>();

        //    ilan _ilan = ilanb.search(Convert.ToInt32(RouteData.Values["IlanNo"]));

        //    formlist = property.select(_ilan.kategoriId.ToString());
        //    if (formlist.Count() > 0)
        //    {
        //        foreach (var item in formlist)
        //        {
        //            String FieldName = Convert.ToString(item.propertname);
        //            String FieldType = Convert.ToString(item.properttype);
        //            String FieldNum = Convert.ToString(item.propertid);

        //            if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
        //            {
        //                int ilanId = Convert.ToInt32(RouteData.Values["IlanNo"].ToString());
        //                ilan iln = ilanb.search(ilanId);

        //                txtlist = (List<BLL.ExternalClass.girilenDataType>)toolkit.GetObjectInXml(iln.girilenOzellik, typeof(List<BLL.ExternalClass.girilenDataType>));
        //                slctlist = (List<BLL.ExternalClass.secilenDataType>)toolkit.GetObjectInXml(iln.secilenOzellik, typeof(List<BLL.ExternalClass.secilenDataType>));
        //            }

        //            HtmlGenericControl ul1 = new HtmlGenericControl("ul");

        //            if (FieldType.ToLower().Trim() == "text")
        //            {
        //                if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
        //                {
        //                    if (item.propdetail)
        //                    {
        //                        foreach (var value in txtlist)
        //                        {
        //                            if (Convert.ToInt32(FieldNum) == value.ozellikId)
        //                            {
        //                                ul1.InnerHtml = "<div class='media'><div class='media-body'><span class='data-type'>" + FieldName + "</span><span class='media-heading'>" + value.deger + "</span></div></div>";
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //            else if (FieldType.ToLower().Trim() == "check")
        //            {
        //                HtmlGenericControl td1 = new HtmlGenericControl("div");
        //                td1.Attributes.Add("class", "form-group");

        //                HtmlGenericControl div1 = new HtmlGenericControl("div");
        //                div1.Attributes.Add("class", "box box-default collapsed-box box-solid");
        //                td1.Controls.Add(div1);
        //                div1.InnerHtml = @"<div class='box-header with-border'>
        //                                <h3 class='box-title'>" + FieldName + @"</h3>
        //                                <div class='box-tools pull-right'>
        //                                    <button class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-plus'></i></button>
        //                                </div>
        //                                <!-- /.box-tools -->
        //                                </div>";

        //                HtmlGenericControl div2 = new HtmlGenericControl("div");
        //                div2.Attributes.Add("class", "box-body");
        //                div1.Controls.Add(div2);

        //                HtmlGenericControl div3 = new HtmlGenericControl("div");
        //                div3.Attributes.Add("class", "form-group");
        //                div2.Controls.Add(div3);

        //                string[] checkarray = item.propertvalue.Split('|');

        //                foreach (var item1 in checkarray)
        //                {

        //                    HtmlGenericControl div4 = new HtmlGenericControl("div");
        //                    div4.Attributes.Add("class", "col-md-3 col-xs-6");
        //                    div3.Controls.Add(div4);

        //                    HtmlGenericControl div5 = new HtmlGenericControl("div");
        //                    div5.Attributes.Add("class", "checkbox icheck");
        //                    div4.Controls.Add(div5);

        //                    String chckid = item1.Split('#')[0];

        //                    CheckBox chkbox = new CheckBox();
        //                    chkbox.ID = "chk" + item1.Split('#')[1] + item1.Split('#')[0];
        //                    chkbox.Attributes.Add("name", FieldNum);
        //                    chkbox.Attributes.Add("value", chckid);
        //                    chkbox.Attributes.Add("type", "checkbox");
        //                    chkbox.Text = item1.Split('#')[1];

        //                    if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
        //                    {
        //                        foreach (var value in slctlist)
        //                        {

        //                            if (Convert.ToInt32(chckid) == value.deger)
        //                            {
        //                                chkbox.Checked = true;
        //                            }
        //                        }
        //                    }

        //                    div5.Controls.Add(chkbox);
        //                }

        //                placeholder.Controls.Add(td1);
        //            }
        //            else if (FieldType.ToLower().Trim() == "select")
        //            {
        //                string[] array = item.propertvalue.Split('|');

        //                if (!String.IsNullOrEmpty(RouteData.Values["IlanNo"].ToString()))
        //                {
        //                    foreach (var value in slctlist)
        //                    {
        //                        if (Convert.ToInt32(FieldNum) == value.ozellikId)
        //                        {
        //                            foreach (var item1 in array)
        //                            {
        //                                if (value.deger == Convert.ToInt32(item1.Split('#')[0]))
        //                                {
        //                                    ul1.InnerHtml = "<div class='media'><div class='media-body'><span class='data-type'>" + FieldName + "</span><span class='media-heading'>" + item1.Split('#')[1] + "</span></div></div>";

        //                                }
        //                            }

        //                        }

        //                    }
        //                }

        //            }

        //            PlaceHolder1.Controls.Add(ul1);
        //        }

        //    }

        //}

        protected void Page_Load(object sender, EventArgs e)
        {

            //ilan _ilan = _.search(Convert.ToInt32(RouteData.Values["IlanNo"]));
            ////ziyaretcib.insert(Request.UserHostAddress.ToString(), _ilan.ilanId);

            //heading = _ilan.baslik.ToString();
            //date = String.Format("{0:dd MMMM yyyy}", _ilan.baslangicTarihi);
            //location = _ilan.iller.ilAdi + " / " + _ilan.ilceler.ilceAdi + " / " + _ilan.mahalleler.mahalleAdi;
            ////visitor = ziyaretcib.getVisitorByAdsId(_ilan.ilanId).ToString() + " kişi görüntüledi";
            //price = _ilan.fiyat == 0 ? "Fiyat Belirtilmemiş" : EnumHelper.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), _ilan.fiyatTurId.ToString())) + " " + String.Format(" {0:N0}", _ilan.fiyat);
            //number = _ilan.ilanId.ToString();
            //adsType = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), _ilan.ilanTurId.ToString())) + " " + _ilan.kategori.kategoriAdi;
            //explanation = _ilan.aciklama;
            //adsId = _ilan.ilanId.ToString();
            //_kullanici = kullaniciBll.getUsersBlock();

            //messageAuth.Visible = false;
            //messageNonAuth.Visible = true;

            //if (_kullanici != null)
            //{
            //    userName = _kullanici.kullaniciAdSoyad;
            //    email = _kullanici.email;
            //    senderEmail.Value = _kullanici.email;
            //    recipientName.Value = _kullanici.kullaniciAdSoyad;
               
            //    messageAuth.Visible = true;
            //    messageNonAuth.Visible = false;
            //}


            //intro.Visible = false;
            //if (Convert.ToBoolean(_ilan.satildiMi))
            //    intro.Visible = true;

            //resimler = (List<BLL.ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(ilanb.search(_ilan.ilanId).resim, typeof(List<BLL.ExternalClass.resimDataType>));

            //if (resimler.Count() == 0)
            //{

            //    resimler.Add(new BLL.ExternalClass.resimDataType()
            //    {
            //        resim = "not-found-image.jpg",
            //        seciliMi = true

            //    });

            //    rpbxslider.DataSource = resimler;
            //    rpbxslider.DataBind();

            //    rpbxpager.Visible = false;
            //}
            //else
            //{
            //    postResim = resimler[0].resim;

            //    rpbxslider.DataSource = resimler.ToList();
            //    rpbxslider.DataBind();

            //    rpbxpager.DataSource = resimler.ToList();
            //    rpbxpager.DataBind();
            //}

            //if (_ilan.magazaId == null)
            //{
            //    fromWho = "Sahibinden";
            //    link = "/satici/" + _ilan.kullanici.kullaniciId + "/" + Tools.URLConverter(_ilan.kullanici.kullaniciAdSoyad) + "/";
            //    whoFromId = 0;
            //    sellername = _ilan.kullanici.kullaniciAdSoyad;
            //    profileImage = (_ilan.kullanici.profilResim == null ? "default-images/no-user.jpg" : "profil/" + _ilan.kullanici.profilResim);
            //    //if (_ilan.numaraYayinlansinMi == true)
            //    //{
            //    //    rpuserphone.DataSource = telefonb.getPhonesByUserId(2, _ilan.kullaniciId, -1);
            //    //    rpuserphone.DataBind();
            //    //}

            //    kullaniciId = _ilan.kullaniciId.ToString();
            //}
            //else
            //{

            //    link = "/magaza/" + _ilan.magazaId + "/" + Tools.URLConverter(_ilan.magaza.magazaAdi) + "/";

            //    magazaId = _ilan.magazaId.ToString();
            //    sellername = _ilan.magaza.magazaAdi;

            //    profileImage = "default-images/no-store.jpg";

            //    if (!String.IsNullOrEmpty(_ilan.magaza.magazaLogo))
            //    {
            //        profileImage = "ads-providers/" + _ilan.magaza.magazaLogo;
            //    }

            //    int strId = Convert.ToInt32(_ilan.magazaId);

            //    //if (_ilan.numaraYayinlansinMi == true)
            //    //{

            //    //    rpuserphone.DataSource = magazaTlfb.list(Convert.ToInt32(_ilan.magazaId));
            //    //    rpuserphone.DataBind();
            //    //}

            //    fromWho = EnumHelper.GetDescription((StoreTypeString)Enum.Parse(typeof(StoreTypeString), _ilan.magaza.magazaTur.turId.ToString()));
            //    whoFromId = Convert.ToInt32(_ilan.magaza.magazaTur.turId);

            //    if(whoFromId != 7 && whoFromId != 8)
            //    {
            //        messageAuth.Visible = false;
            //        messageNonAuth.Visible = false;
            //    }

            //    if (_ilan.numaraYayinlansinMi == true)
            //    {
            //        rpuserphone.DataSource = null;
            //        rpuserphone.DataBind();
            //    }

            //}

            ////int[] arr = new int[] { };

            //int catid = _ilan.kategoriId;


            ////specialplace.Controls.Add(projeb.randomproject(arr, _ilan.iller.ilId, Request.UserHostAddress.ToString(), true));
            //if (_ilan.fiyat == 0)
            //{
            //    Page.Title = _ilan.iller.ilAdi + " " + _ilan.ilceler.ilceAdi + " " + fromWho + " " + adsType + " - kralilan.com #" + number;
            //    Page.MetaDescription = "En ucuz " + _ilan.iller.ilAdi + " " + _ilan.ilceler.ilceAdi + " " + fromWho + " " + adsType + " fiyatları ve tüm kiralık - satılık emlak ilanlarını takip etme ve uydu haritasından doğru yerini görme imkanı sadece kralilan.com da. #" + number;

            //}
            //else
            //{
            //    Page.Title = String.Format(" {0:N0}", _ilan.fiyat) + " TL " + _ilan.iller.ilAdi + " " + _ilan.ilceler.ilceAdi + " " + fromWho + " " + adsType + " - kralilan.com #" + number;
            //    Page.MetaDescription = String.Format(" {0:N0}", _ilan.fiyat) + " TL " + "En ucuz " + _ilan.iller.ilAdi + " " + _ilan.ilceler.ilceAdi + " " + fromWho + " " + adsType + " fiyatları ve tüm kiralık - satılık emlak ilanlarını takip etme ve uydu haritasından doğru yerini görme imkanı sadece kralilan.com da #" + number;

            //}
            //Page.MetaKeywords = fromWho + "," + adsType + "," + "Emlak" + "," + _ilan.iller.ilAdi + "," + _ilan.ilceler.ilceAdi + "," + _ilan.mahalleler.mahalleAdi;

            //nearPositionClassified = (List<BLL.ExternalClass.ilanDataType>)toolkit.GetObjectInXml(ilanb.getAdsByNearPosition(0, 10, _ilan.ilat, _ilan.ilng, _ilan.ilId, _ilan.ilceId, _ilan.kategoriId, _ilan.ilanId), typeof(List<BLL.ExternalClass.ilanDataType>));

            //rpNearPosition.DataSource = nearPositionClassified;
            //rpNearPosition.DataBind();

        }
    }
}