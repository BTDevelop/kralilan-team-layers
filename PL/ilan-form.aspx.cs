using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;
using System.IO;
using System.Drawing;
using Newtonsoft.Json.Linq;
using System.Web.UI.HtmlControls;
using BLL.Concrete;
using BLL.PublicHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using KralilanProject.Entities;

namespace PL
{
    public partial class ilan_form1 : System.Web.UI.Page
    {

        ilanBll ilnBll = new ilanBll();
        kullanici _kullanici;

        public int magazaId = -1;

        public string kategoriId = "",
                      ilanTurId = "",
                      userName = "",
                      geciciIlanId = "";


        private IOzellikService _ozellikManager;
        private IMahalleService _mahalleManager;
        private IMagazaKullaniciService _magazaKullaniciManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IIlanService _ilanManager;
        public ilan_form1()
        {
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _magazaKullaniciManager = new MagazaKullaniciManager(new LTSMagazaKullanicilarDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected override void OnInit(EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                if (Session["cat"] != null)
                {
                    if (Session["tur"] != null)
                    {
                        string category_name = Session["cat"].ToString();
                        string type_name = Session["tur"].ToString();


                        try
                        {
                            CreateDynamicControls(category_name, type_name);

                        }
                        catch (Exception exception)
                        {
                            Console.WriteLine(exception);
                            throw;
                        }
                    }
                }
            }
        }

        public void CreateDynamicControls(string incat, string intype)
        {

            List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> slctlist = new List<BLL.ExternalClass.secilenDataType>();
            List<Ozellik> formlist = new List<Ozellik>();

            formlist = _ozellikManager.GetAllByCategoriId(Convert.ToInt32(incat));

            if (formlist.Count() > 0)
            {
                foreach (var item in formlist)
                {

                    HtmlGenericControl td1 = new HtmlGenericControl("div");
                    td1.Attributes.Add("class", "form-group");

                    String FieldName = Convert.ToString(item.OzellikAdi);
                    String FieldType = Convert.ToString(item.Tipi);
                    String FieldNum = Convert.ToString(item.OzellikId);

                    if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                    {
                        int ilanId = Convert.ToInt32(Request.QueryString["ilan"]);
                        DAL.ilan iln = _ilanManager.Get(ilanId);

                        txtlist = (List<BLL.ExternalClass.girilenDataType>)toolkit.GetObjectInXml(iln.girilenOzellik, typeof(List<BLL.ExternalClass.girilenDataType>));
                        slctlist = (List<BLL.ExternalClass.secilenDataType>)toolkit.GetObjectInXml(iln.secilenOzellik, typeof(List<BLL.ExternalClass.secilenDataType>));
                    }


                    if (FieldType.ToLower().Trim() == "text")
                    {
                        if (!String.IsNullOrEmpty(item.Kategori))
                        {
                            var label = new HtmlGenericControl("label");
                            label.InnerHtml = FieldName;
                            td1.Controls.Add(label);

                            TextBox txtcustombox = new TextBox();
                            txtcustombox.ID = "txt" + FieldName;

                            if (item.SayisalMi)
                            {
                                txtcustombox.CssClass = "form-control double " + Tools.URLConverter(FieldName);
                            }
                            else
                            {
                                txtcustombox.CssClass = "form-control " + Tools.URLConverter(FieldName);
                            }

                            txtcustombox.Attributes.Add("name", FieldNum);
                            txtcustombox.Attributes.Add("data-wid", FieldNum);

                            if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                            {
                                foreach (var value in txtlist)
                                {
                                    if (Convert.ToInt32(FieldNum) == value.ozellikId)
                                    {
                                        txtcustombox.Text = value.deger;
                                    }
                                }
                            }

                            td1.Controls.Add(txtcustombox);
                            PlaceHolder1.Controls.Add(td1);
                        }
                        else
                        {

                            if (item.OzellikId == 3 || item.OzellikId == 4)
                            {
                                var label = new HtmlGenericControl("label");
                                label.InnerHtml = FieldName;
                                td1.Controls.Add(label);

                                TextBox txtcustombox = new TextBox();
                                txtcustombox.ID = "txt" + FieldName;

                                if (item.SayisalMi)
                                {
                                    txtcustombox.CssClass = "form-control double";
                                }
                                else
                                {
                                    txtcustombox.CssClass = "form-control";
                                }

                                txtcustombox.Attributes.Add("name", FieldNum);
                                txtcustombox.Attributes.Add("data-wid", FieldNum);

                                if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                                {
                                    foreach (var value in txtlist)
                                    {
                                        if (Convert.ToInt32(FieldNum) == value.ozellikId)
                                        {
                                            txtcustombox.Text = value.deger;
                                        }
                                    }
                                }

                                td1.Controls.Add(txtcustombox);
                                PlaceHolder3.Controls.Add(td1);
                            }

                        }
                    }
                    else if (FieldType.ToLower().Trim() == "check")
                    {
                        td1.InnerHtml += @"<div class='box box-danger collapsed-box box-solid'>
                                               <div class='box-header with-border'>
                                                    <h3 class='box-title'>" + FieldName + @"</h3>
                                                    <div class='box-tools pull-right'>
                                                        <button class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-plus'></i></button>
                                                    </div>
                                               </div>
                                                <div class='box-body'>
                                                        <div class='form-group'>";


                        string[] checkarray = item.Degeri.Split('|');

                        foreach (var item1 in checkarray)
                        {

                            HtmlGenericControl div4 = new HtmlGenericControl("div");
                            div4.Attributes.Add("class", "col-md-3 col-xs-6");
                            td1.Controls.Add(div4);

                            HtmlGenericControl div5 = new HtmlGenericControl("div");
                            div5.Attributes.Add("class", "checkbox icheck");
                            div4.Controls.Add(div5);

                            String chckid = item1.Split('#')[0];

                            CheckBox chkbox = new CheckBox();
                            chkbox.ID = "chk" + item1.Split('#')[1] + item1.Split('#')[0];
                            chkbox.Attributes.Add("name", FieldNum);
                            chkbox.Attributes.Add("value", chckid);
                            chkbox.Attributes.Add("type", "checkbox");
                            chkbox.Text = item1.Split('#')[1];

                            Label lbcustomename = new Label();
                            lbcustomename.ID = "lb" + FieldName;
                            lbcustomename.Text = FieldName;


                            if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                            {
                                foreach (var value in slctlist)
                                {

                                    if (Convert.ToInt32(chckid) == value.deger)
                                    {
                                        chkbox.Checked = true;
                                    }
                                }
                            }

                            div5.Controls.Add(chkbox);
                        }

                        td1.Controls.Add(new LiteralControl(@"</div></div></div>"));
                        PlaceHolder2.Controls.Add(td1);


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
                        var label = new HtmlGenericControl("label");
                        label.InnerHtml = FieldName;
                        td1.Controls.Add(label);

                        DropDownList ddllst = new DropDownList();
                        ddllst.ID = "ddl" + FieldName;
                        ddllst.Items.Add(new ListItem("Seçiniz", ""));
                        ddllst.CssClass = "form-control slct-values";
                        ddllst.Attributes.Add("name", FieldNum);
                        ddllst.Attributes.Add("data-wid", FieldNum);


                        string[] array = item.Degeri.Split('|');

                        foreach (var item1 in array)
                        {
                            ddllst.Items.Add(new ListItem(item1.Split('#')[1], item1.Split('#')[0]));
                        }

                        if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                        {
                            foreach (var value in slctlist)
                            {
                                if (Convert.ToInt32(FieldNum) == value.ozellikId)
                                {
                                    ddllst.SelectedValue = value.deger.ToString();
                                }
                            }
                        }

                        td1.Controls.Add(ddllst);
                        PlaceHolder1.Controls.Add(td1);

                    }

                }

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (_kullanici != null)
            {
                if (!IsPostBack)
                {
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "none", "ShowUserAds();", true);

                    geciciIlanId = DateTime.Now.Ticks.ToString();
                    txtgecici.Value = geciciIlanId;

                    drpIl.DataSource = _ilManager.GetAll();
                    drpIl.DataTextField = "ilAdi";
                    drpIl.DataValueField = "ilId";
                    drpIl.DataBind();

                    ListItem lst = new ListItem();
                    lst.Value = "";
                    lst.Text = "Seçiniz";
                    drpIl.Items.Insert(0, lst);

                    if (Request.Files.Count <= 0)
                    {
                        if(_kullanici!=null)
                        {
                            userName = _kullanici.kullaniciAdSoyad;
                        }

                    }
                }

                if (Session["cat"] != null)
                {
                    kategoriId = Session["cat"].ToString();
                }

                if (Session["tur"] != null)
                {
                    ilanTurId = Session["tur"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
            }
        }

        protected void devam_Click1(object sender, EventArgs e)
        {
            int onay = 2;

            List<BLL.ExternalClass.girilenDataType> girilenler = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> secilenler = new List<BLL.ExternalClass.secilenDataType>();
            List<BLL.ExternalClass.resimDataType> resimler = new List<BLL.ExternalClass.resimDataType>();

            foreach (Control item in box_footer.Controls)
            {
                if (item is PlaceHolder)
                {
                    foreach (Control item2 in item.Controls)
                    {
                        foreach (Control item3 in item2.Controls)
                        {
                            if (item3 is DropDownList)
                            {
                                if (((DropDownList)item3).SelectedValue != "")
                                {
                                    var slctdata = new BLL.ExternalClass.secilenDataType
                                    {
                                        ozellikId = Convert.ToInt32(((DropDownList)item3).Attributes["name"]),
                                        deger = Convert.ToInt32(((DropDownList)item3).SelectedValue)
                                    };

                                    secilenler.Add(slctdata);
                                }
                            }
                            else if (item3 is TextBox)
                            {
                                if (((TextBox)item3).Text != "")
                                {
                                    var txtdata = new BLL.ExternalClass.girilenDataType
                                    {
                                        ozellikId = Convert.ToInt32(((TextBox)item3).Attributes["name"]),
                                        deger = ((TextBox)item3).Text
                                    };

                                    girilenler.Add(txtdata);

                                }
                            }
                            else if (item3 is CheckBox) 
                            {
                                string[] partialchc = ((CheckBox)item3).Attributes["value"].Split('_');
                                if (((CheckBox)item3).Checked)
                                {
                                    var slctdata = new BLL.ExternalClass.secilenDataType
                                    {
                                        ozellikId = Convert.ToInt32(((CheckBox)item3).Attributes["name"]),
                                        deger = Convert.ToInt32(partialchc[0])
                                    };

                                    secilenler.Add(slctdata);
                                }
                                else
                                {
                                    var slctdata = new BLL.ExternalClass.secilenDataType
                                    {
                                        ozellikId = Convert.ToInt32(((CheckBox)item3).Attributes["name"]),
                                        deger = Convert.ToInt32(partialchc[1])
                                    };

                                    secilenler.Add(slctdata);
                                }
                            }
                            else
                            {
                                foreach (Control item4 in item3.Controls)
                                {
                                    foreach (Control item5 in item4.Controls)
                                    {
                                        if (item5 is CheckBox)
                                        {
                                            if (((CheckBox)item5).Checked)
                                            {
                                                var slctdata = new BLL.ExternalClass.secilenDataType
                                                {
                                                    ozellikId = Convert.ToInt32(((CheckBox)item5).Attributes["name"]),
                                                    deger = Convert.ToInt32(((CheckBox)item5).Attributes["value"])
                                                };

                                                secilenler.Add(slctdata);
                                            }
                                        }

                                    }
                                }
                            }
                        }
                    }
                }
            }


            foreach (Control item in box_loc.Controls)
            {
                if (item is PlaceHolder)
                {
                    foreach (Control item2 in item.Controls)
                    {
                        foreach (Control item3 in item2.Controls)
                        {
                            if (item3 is TextBox)
                            {
                                if (((TextBox)item3).Text != "")
                                {
                                    var txtdata = new BLL.ExternalClass.girilenDataType
                                    {
                                        ozellikId = Convert.ToInt32(((TextBox)item3).Attributes["name"]),
                                        deger = ((TextBox)item3).Text
                                    };

                                    girilenler.Add(txtdata);
                                }
                            }
                        }
                    }
                }
            }

            bool numberpublish = true;

            if (!String.IsNullOrEmpty(Request.Form["optionsRadios"]))
            {
                if (Request.Form["optionsRadios"] == "1")
                {
                    numberpublish = true;
                }
                else
                {
                    numberpublish = false;
                }
            }

            string txtstr = DAL.toolkit.GetXmlDataInObject(girilenler);
            txtstr = txtstr.Replace("\r\n", "").Trim();
            txtstr = txtstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
            txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.girilenDataType>));

            string slctstr = DAL.toolkit.GetXmlDataInObject(secilenler);
            slctstr = slctstr.Replace("\r\n", "").Trim();
            slctstr = slctstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> slctlist = new List<BLL.ExternalClass.girilenDataType>();
            slctlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(slctstr, typeof(List<BLL.ExternalClass.girilenDataType>));

            var _userWorkingStore = _magazaKullaniciManager.GetByUserId(_kullanici.kullaniciId);
            if (_userWorkingStore != null) { magazaId = _userWorkingStore.magazaId; onay = 1; }
            else magazaId = -1;

            DAL.ilan _ilan = new DAL.ilan
            {
                ilanTurId = Convert.ToInt32(Session["tur"].ToString()),
                kategoriId = Convert.ToInt32(Session["cat"].ToString()),
                fiyat = Convert.ToDouble(txtFiyat.Text),
                fiyatTurId = 1,
                kullaniciId = Convert.ToInt32(_kullanici.kullaniciId),
                ilId = Convert.ToInt32(drpIl.SelectedValue),
                ilceId = Convert.ToInt32(drpIlce.SelectedValue),
                mahalleId = Convert.ToInt32(drpMahalle.SelectedValue),
                baslik = txtBaslik.Text,
                aciklama = txtCKeditorAdi.Text,
                magazaId = Convert.ToInt32(magazaId),
                onay = onay,
                numaraYayinlansinMi = numberpublish,
                koordinat = "",
                girilenOzellik = txtstr,
                secilenOzellik = slctstr,
                resim = "",
                ilat = -1,
                ilng = -1
            };

            _ilanManager.Add(_ilan);

            //ilnBll.insert(
            //        Convert.ToInt32(Session["tur"].ToString()),
            //        Convert.ToInt32(Session["cat"].ToString()),
            //        Convert.ToDouble(txtFiyat.Text),
            //        1,
            //        Convert.ToInt32(_kullanici.kullaniciId),
            //        Convert.ToInt32(drpIl.SelectedValue),
            //        Convert.ToInt32(drpIlce.SelectedValue),
            //        Convert.ToInt32(drpMahalle.SelectedValue),
            //        txtBaslik.Text,
            //        txtCKeditorAdi.Text,
            //        Convert.ToInt32(magazaId),
            //        onay,
            //        numberpublish,
            //        "",
            //        txtstr,
            //        slctstr,
            //        "",
            //        -1,
            //        -1
            //       );

            ilan classified = _ilanManager.GetLast();

            string str_image = "";
            var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(@"\upload\ilan\"));
            string pathString = System.IO.Path.Combine(originalDirectory.ToString(), txtgecici.Value);
            bool isExistsone = System.IO.Directory.Exists(pathString);

            if (isExistsone)
            {
                string[] strlist = System.IO.Directory.GetFiles(pathString, "*.*");
                for (int i = 0; i < strlist.Length; i++)
                {

                    bool secili = false;
                    if (i == 0)
                    {
                        secili = true;
                    }

                    FileInfo file = new System.IO.FileInfo(strlist[i]);

                    string fileName = file.Name;
                    string fileExtension = Path.GetExtension(fileName);
                    str_image = classified.ilanId.ToString() + "_" + (i + 1).ToString() + fileExtension;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(strlist[i]);

                    StrategyPhoto.FixedSize(imgOrijinalResim, 600, 400, "kralilan.com", classified.ilanId.ToString(), str_image);
                    StrategyPhoto.FixedSize(imgOrijinalResim, 120, 80, null, classified.ilanId.ToString(), str_image);

                    var picdata = new BLL.ExternalClass.resimDataType
                    {
                        resim = str_image,
                        seciliMi = secili
                    };
                    imgOrijinalResim.Dispose();
                    resimler.Add(picdata);

                }

                System.IO.Directory.Delete(pathString, true);
            }

            string picstr = toolkit.GetXmlDataInObject(resimler);
            picstr = picstr.Replace("\r\n", "").Trim();
            picstr = picstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> piclist = new List<BLL.ExternalClass.girilenDataType>();
            piclist = (List<BLL.ExternalClass.girilenDataType>)toolkit.GetObjectInXml(picstr, typeof(List<BLL.ExternalClass.girilenDataType>));

            _ilanManager.UpdatePicturesByAdsId(classified.ilanId, picstr);

            Session["ilanNo"] = classified.ilanId;

            Response.Redirect("~/hizli-satisi-gor/");
        }

        public void SaveUploadedFile(HttpFileCollection httpFileCollection)
        {
            string fName = "";
            foreach (string fileName in httpFileCollection)
            {
                HttpPostedFile file = httpFileCollection.Get(fileName);
                fName = file.FileName;
                if (file != null && file.ContentLength > 0)
                {

                    var originalDirectory = new DirectoryInfo(Server.MapPath(@"\upload\ilantemp\"));

                    string pathString = System.IO.Path.Combine(originalDirectory.ToString(), geciciIlanId);

                    var fileName1 = Path.GetFileName(file.FileName);

                    bool isExists = System.IO.Directory.Exists(pathString);

                    if (!isExists)
                        System.IO.Directory.CreateDirectory(pathString);

                    var path = string.Format("{0}\\{1}", pathString, file.FileName);
                    file.SaveAs(path);

                }

            }

        }

        protected void drpIl_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpMahalle.Items.Clear();
            drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
            drpIlce.DataTextField = "ilceAdi";
            drpIlce.DataValueField = "ilceId";
            drpIlce.DataBind();

            ListItem lst = new ListItem();
            lst.Value = "";
            lst.Text = "Seçiniz";
            drpIlce.Items.Insert(0, lst);
        }

        protected void drpIlce_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpMahalle.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
            drpMahalle.DataTextField = "mahalleAdi";
            drpMahalle.DataValueField = "mahalleId";
            drpMahalle.DataBind();

            ListItem lst = new ListItem();
            lst.Value = "";
            lst.Text = "Seçiniz";
            drpMahalle.Items.Insert(0, lst);
        }

        protected void priceAds_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "none", "NonShowUserAds();", true);
            Session["priceAds"] = true;
        }

    }
}