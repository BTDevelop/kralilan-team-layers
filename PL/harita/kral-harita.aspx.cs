using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.PublicHelper;
using DAL;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using BLL.Concrete;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.BLL.Concrete;
using KralilanProject.Interfaces;
using KralilanProject.Entities;

namespace PL.harita
{
    public partial class kral_harita : System.Web.UI.Page
    {


        kategoriTurBll kategoriTurb = new kategoriTurBll();
        kullanici _kullanici;

        public int topCatId = 0, catId = 0, typeId = 0;
        public string catname;
        public string typename;

        private IOzellikService _ozellikManager;
        private IKategoriTurService _kategoriTurManager;
        private IKategoriService _kategoriManager;
        private IBildirimService _bildirimManager;
        private IKullaniciService _kullaniciManager;
        private IIlanSayiService _ilanSayiManager;
        public kral_harita()
        {
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _kategoriTurManager = new KategoriTurManager(new LTSKategoriTurlerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
            _bildirimManager = new BildirimManager(new LTSBildirimlerDal());
            _kullaniciManager = new KullaniciManager(new LTSKullanicilarDal());
            _ilanSayiManager = new IlanSayiManager(new LTSIlanSayilarDal());
        }


        protected override void OnInit(EventArgs e)
        {
            if (!String.IsNullOrEmpty(RouteData.Values["KategoriNo"].ToString()))
            {
                CreateDynamicFilterControls(RouteData.Values["KategoriNo"].ToString());
            }
        }

        public void CreateDynamicFilterControls(string incat)
        {

            List<Ozellik> formlist = new List<Ozellik>();

            formlist = _ozellikManager.GetAllByCategoriId(Convert.ToInt32(incat));

            if (formlist.Count() > 0)
            {
                foreach (var item in formlist)
                {

                    HtmlGenericControl td1 = new HtmlGenericControl("div");

                    String FieldName = Convert.ToString(item.OzellikAdi);
                    String FieldType = Convert.ToString(item.Tipi);
                    String FieldNum = Convert.ToString(item.OzellikId);

                    if (FieldType.ToLower().Trim() == "text")
                    {
                        if (item.FiltreMi)
                        {
                            var label = new HtmlGenericControl("label");
                            label.InnerHtml = FieldName;
                            td1.Controls.Add(label);

                            td1.InnerHtml = "<h5 class='list-title'><strong><a href='#'>" + FieldName + "</a></strong></h5>";

                            HtmlGenericControl div1 = new HtmlGenericControl("div");
                            div1.Attributes.Add("class", "form-group");
                            div1.Attributes.Add("style", "padding-left: 0");
                            td1.Controls.Add(div1);

                            TextBox txtcustombox = new TextBox();
                            txtcustombox.ID = "txt" + FieldName;

                            if (item.SayisalMi)
                            {
                                txtcustombox.CssClass = "form-control txt-values double";

                            }
                            else
                            {
                                txtcustombox.CssClass = "form-control txt-values";
                            }

                            txtcustombox.Attributes.Add("name", FieldNum + "_1");
                            txtcustombox.Attributes.Add("data-wid", FieldNum + "_1");
                            txtcustombox.Attributes.Add("placeholder", "En az");


                            div1.Controls.Add(txtcustombox);

                            HtmlGenericControl div2 = new HtmlGenericControl("div");
                            div2.Attributes.Add("class", "form-group");
                            div2.Attributes.Add("style", "padding-left: 0");

                            td1.Controls.Add(div2);

                            TextBox txtcustombox1 = new TextBox();
                            txtcustombox1.ID = "txt" + FieldName;

                            if (item.SayisalMi)
                            {
                                txtcustombox1.CssClass = "form-control txt-values double";

                            }
                            else
                            {
                                txtcustombox1.CssClass = "form-control txt-values";
                            }

                            txtcustombox1.Attributes.Add("name", FieldNum + "_2");
                            txtcustombox1.Attributes.Add("data-wid", FieldNum + "_2");
                            txtcustombox1.Attributes.Add("placeholder", "En çok");


                            div2.Controls.Add(txtcustombox1);

                        }
                    }
                    else if (FieldType.ToLower().Trim() == "y")
                    {

                        HtmlGenericControl div1 = new HtmlGenericControl("div");
                        div1.Attributes.Add("class", "box box-primary collapsed-box box-solid");
                        td1.Controls.Add(div1);
                        div1.InnerHtml = @"<div class='box-header with-border'>
                                        <h3 class='box-title'>" + FieldName + @"</h3>
                                        <div class='box-tools pull-right'>
                                            <button class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-plus'></i></button>
                                        </div>
                                        <!-- /.box-tools -->
                                        </div>";

                        HtmlGenericControl div2 = new HtmlGenericControl("div");
                        div2.Attributes.Add("class", "box-body");
                        div1.Controls.Add(div2);

                        HtmlGenericControl div3 = new HtmlGenericControl("div");
                        div3.Attributes.Add("class", "form-group");
                        div2.Controls.Add(div3);



                        string[] checkarray = item.Degeri.Split('|');

                        foreach (var item1 in checkarray)
                        {

                            HtmlGenericControl div4 = new HtmlGenericControl("div");
                            div4.Attributes.Add("class", "col-md-3 col-xs-6");
                            div3.Controls.Add(div4);

                            HtmlGenericControl div5 = new HtmlGenericControl("div");
                            div5.Attributes.Add("class", "checkbox icheck");
                            div4.Controls.Add(div5);

                            String chckid = item1.Split('#')[0];

                            CheckBox chkbox = new CheckBox();
                            chkbox.ID = "chk" + FieldName;
                            chkbox.Attributes.Add("name", chckid);
                            chkbox.Attributes.Add("value", chckid);
                            chkbox.Text = item1.Split('#')[1];

                            div5.Controls.Add(chkbox);
                        }

                    }
                    else if (FieldType.ToLower().Trim() == "radiobutton")
                    {
                        RadioButtonList rbnlst = new RadioButtonList();
                        rbnlst.ID = "rbnlst" + FieldName;
                        rbnlst.Items.Add(new ListItem("Male", "1"));
                        rbnlst.Items.Add(new ListItem("Female", "2"));


                        rbnlst.RepeatDirection = RepeatDirection.Horizontal;
                        td1.Controls.Add(rbnlst);
                    }
                    else if (FieldType.ToLower().Trim() == "select")
                    {

                        td1.InnerHtml = "<h5 class='list-title'><strong><a href='#'>" + FieldName + "</a></strong></h5>";

                        DropDownList ddllst = new DropDownList();
                        ddllst.ID = "ddl" + FieldName;
                        ddllst.Items.Add(new ListItem("Seçim Yok", "-1"));
                        ddllst.CssClass = "form-control slct-values";
                        ddllst.Attributes.Add("name", FieldNum);
                        ddllst.Attributes.Add("data-wid", FieldNum);
                        ddllst.Attributes.Add("size", "4");


                        string[] array = item.Degeri.Split('|');

                        foreach (var item1 in array)
                        {
                            ddllst.Items.Add(new ListItem(item1.Split('#')[1], item1.Split('#')[0]));
                        }

                        td1.Controls.Add(ddllst);
                    }

                    placeHolder.Controls.Add(td1);

                }

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if (!String.IsNullOrEmpty(RouteData.Values["KategoriNo"].ToString()) && !String.IsNullOrEmpty(RouteData.Values["TurNo"].ToString()))
            {
                if (RouteData.Values["KategoriNo"] != null)
                    topCatId = Convert.ToInt32(RouteData.Values["KategoriNo"].ToString());

                if (RouteData.Values["TurNo"] != null)
                    typeId = Convert.ToInt32(RouteData.Values["TurNo"]);

                if (RouteData.Values["KategoriNo"] != null && RouteData.Values["TurNo"] != null)
                {
                    rpcategories.DataSource = _kategoriTurManager.GetByCategoriTypeId(topCatId, typeId);
                    rpcategories.DataBind();
                }

                if (_kategoriManager.Get(Convert.ToInt32(_kategoriManager.Get(topCatId).ustKategoriId)) != null)
                {
                    ustStr.InnerText = _kategoriManager.Get(Convert.ToInt32(_kategoriManager.Get(topCatId).ustKategoriId)).kategoriAdi;
                }
                if (_kategoriManager.Get(topCatId) != null)
                {
                    altStr.InnerText = _kategoriManager.Get(topCatId).kategoriAdi + " " + "(" + String.Format("{0:N0}", _ilanSayiManager.CountByCategoriId(topCatId).ToString()) + ")";
                }
                subcategori.Visible = true;
                Ul1.Visible = false;
                Ul2.Visible = false;

            }
            else if (!String.IsNullOrEmpty(RouteData.Values["TurNo"].ToString()))
            {
                subcategori.Visible = false;
                Ul1.Visible = false;
                Ul2.Visible = true;

                if (!String.IsNullOrEmpty(RouteData.Values["TurNo"].ToString()))
                    topCatId = Convert.ToInt32(RouteData.Values["TurNo"].ToString());
                else
                    topCatId = 1;

                Repeater2.DataSource = _kategoriTurManager.GetAllByCategoriTypeId(topCatId, -1);
                Repeater2.DataBind();


                if (_kategoriManager.Get(Convert.ToInt32(_kategoriManager.Get(topCatId).ustKategoriId)) != null)
                {
                    Strong1.InnerText = _kategoriManager.Get(Convert.ToInt32(_kategoriManager.Get(topCatId).ustKategoriId)).kategoriAdi;
                }
                if (_kategoriManager.Get(topCatId) != null)
                {
                    Strong2.InnerText = _kategoriManager.Get(topCatId).kategoriAdi + " " + "(" + String.Format("{0:N0}", _ilanSayiManager.CountByCategoriId(topCatId).ToString()) + ")";
                }
            }
            else
            {
                subcategori.Visible = false;
                Ul1.Visible = true;
                Ul2.Visible = false;

                if (!String.IsNullOrEmpty(RouteData.Values["KategoriNo"].ToString()))
                    topCatId = Convert.ToInt32(RouteData.Values["KategoriNo"].ToString());
                else
                    topCatId = 1;

                Repeater1.DataSource = _kategoriTurManager.GetAllByCategoriTypeId(topCatId, -1);
                Repeater1.DataBind();



                if (_kategoriManager.Get(Convert.ToInt32(_kategoriManager.Get(topCatId).ustKategoriId)) != null)
                {
                    topcategoristrong.InnerText = _kategoriManager.Get(Convert.ToInt32(_kategoriManager.Get(topCatId).ustKategoriId)).kategoriAdi;
                }
                if (_kategoriManager.Get(topCatId) != null)
                {
                    if (topCatId == 1)
                    {
                        topcategoristrong2.InnerText = "Emlak" + " " + "(" + String.Format("{0:N0}", _ilanSayiManager.CountAll().ToString()) + ")";
                    }
                    else
                    {
                        topcategoristrong2.InnerText = _kategoriManager.Get(topCatId).kategoriAdi + " " + "(" + String.Format("{0:N0}", _ilanSayiManager.CountByCategoriId(topCatId).ToString()) + ")";
                    }

                }
            }

            if (!Page.IsPostBack)
            {

                if (_kullanici != null)
                {

                    kullanici _authority = _kullanici;
                    HttpRequest _request = base.Request;

                    if (_authority.rol == 4 || _authority.rol == 3 || _authority.rol == 2 || _authority.rol == 1)
                    {
                        visitorPanel.Visible = false;
                        userPanel.Visible = true;
                        lblUserName.Text = _authority.kullaniciAdSoyad.ToString();
                    }

                    if (_bildirimManager.Count(_authority.kullaniciId) != 0)
                    {
                        span1.InnerText = _bildirimManager.Count(_authority.kullaniciId).ToString();
                    }

                    _kullaniciManager.UpdateBySessionInfo(_authority.kullaniciId, _request.Browser.Browser, _request.UserHostAddress);
                    _kullaniciManager.UpdateByOnlineStatus(_authority.kullaniciId, 10);

                }
            }

        }

        public string count(string catid, string typeId)
        {
            int CategoriId = Convert.ToInt32(catid);
            int TypeId = Convert.ToInt32(typeId);


            if (TypeId == -1) return " " + String.Format("{0:N0}", _ilanSayiManager.CountByCategoriId(CategoriId).ToString());
            else return " " + String.Format("{0:N0}", _ilanSayiManager.CountByCategoriTypeId(CategoriId, TypeId).ToString());
        }

        public bool catKind(object _income)
        {
            if (_kategoriTurManager.Get(Convert.ToInt32(_income)) != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void Cikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/");
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            Exception olusanHata = Server.GetLastError();
            ErrorPage = "HataSayfasi.aspx?EkBilgi=" + olusanHata.Message + "&HataMesaji=" + olusanHata.InnerException.Message + "&Sayfa=" + Page.AppRelativeVirtualPath;
            Response.Write(olusanHata.Message);
            //using (FileStream stream = new FileStream("C:\\HataLogDosyasi.txt", FileMode.Append, FileAccess.Write))
            //{
            //    StreamWriter writer = new StreamWriter(stream);
            //    writer.WriteLine("Hata Zamanı " + DateTime.Now.ToString() + " Hata Sayfası " + Page.AppRelativeVirtualPath + " Hata Mesajı " + olusanHata.InnerException.Message);
            //    writer.Close();
            //}
        }
    }
}