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
using System.Web.Services;
using System.Web.UI.HtmlControls;
using BLL.Concrete;
using BLL.PublicHelper;
using BLL.EnumHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using KralilanProject.Entities;

namespace PL.management.anaYonetim.ilanYonetimi
{
    public partial class ekle : System.Web.UI.UserControl
    {

        ilanBll ilanBLL = new ilanBll();  
        kullanici _kullanici;

        public string geciciIlanId = "";

        private IOzellikService _ozellikManager;
        private IMahalleService _mahalleManager;
        private IKategoriService _kategoriManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IMagazaService _magazaManager;
        private IIlanService _ilanManager;
        public ekle()
        {
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
        }

        protected override void OnInit(EventArgs e)
        {
            lblKind.InnerText = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), Request.QueryString["tur"]));
            lblCat.InnerText = _kategoriManager.Get(Convert.ToInt32(Request.QueryString["cat"])).kategoriAdi;

            string category_name = Request.QueryString["cat"].ToString();
            string type_name = Request.QueryString["tur"].ToString();

            CreateDynamicControls(category_name, type_name);
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

                        txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(iln.girilenOzellik, typeof(List<BLL.ExternalClass.girilenDataType>));
                        slctlist = (List<BLL.ExternalClass.secilenDataType>)DAL.toolkit.GetObjectInXml(iln.secilenOzellik, typeof(List<BLL.ExternalClass.secilenDataType>));
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

                            if (item.OzellikId == 3 || item.OzellikId == 4 || item.OzellikId == 71)
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
                                PlaceHolder3.Controls.Add(td1);
                            }
                            else
                            {

                                var label = new HtmlGenericControl("label");
                                label.InnerHtml = FieldName;
                                td1.Controls.Add(label);

                                if (item.OzellikId == 63 || item.OzellikId == 64)
                                {
                                    td1.Controls.Add(new LiteralControl(@"<div class='input-group date'>
                                                        <div class='input-group-addon'>
                                                            <i class='fa fa-calendar'></i>
                                                        </div>"));

                                }

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
                                if (item.OzellikId == 63 || item.OzellikId == 64)
                                {
                                    td1.Controls.Add(new LiteralControl(@"</div>"));
                                }
                                PlaceHolder4.Controls.Add(td1);
                            }
                        }
                    }
                    else if (FieldType.ToLower().Trim() == "check")
                    {

                        td1.InnerHtml += @"<div class='box box-primary collapsed-box box-solid'>
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
                        ddllst.CssClass = "form-control select2 slct-values";
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
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici != null)
            {
                kullanici _authority = _kullanici;

                if (!IsPostBack)
                {
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
                }

                drpKimden.DataSource = _magazaManager.GetAllByStoreCategori(-1);
                drpKimden.DataTextField = "MagazaAdi";
                drpKimden.DataValueField = "MagazaId";
                drpKimden.DataBind();

                ListItem lst_1 = new ListItem();
                lst_1.Value = "";
                lst_1.Text = "Seçiniz";
                drpKimden.Items.Insert(0, lst_1);
            }
        }

        protected void drpIlce_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpMahalle.DataSource =_mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
            drpMahalle.DataTextField = "mahalleAdi";
            drpMahalle.DataValueField = "mahalleId";
            drpMahalle.DataBind();

            ListItem lst = new ListItem();
            lst.Value = "";
            lst.Text = "Seçiniz";
            drpMahalle.Items.Insert(0, lst);
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

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            //kullanici _authority = (kullanici)Session["unique-user"];
            kullanici _authority = _kullanici;

            if (drpKimden.SelectedValue != "")
            {
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
                                else if (item3 is CheckBox) // Eğer checkbox tek ise
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
                                else // eğer control group checkbox ise
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
                string coordinates = "";
                Single lat = 0;
                Single lng = 0;
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
                                        if (((TextBox)item3).Attributes["name"] == "71")
                                        {
                                            JObject obj = JObject.Parse(((TextBox)item3).Text);

                                            if (obj["features"] != null)
                                            {
                                                coordinates = "{\"type\":\"MultiPolygon\",\"coordinates\":[" + obj["features"][0]["geometry"]["coordinates"].ToString().Replace("\r", "").Replace("\n", "").Replace(" ", "") + "]}";
                                            }

                                            if (obj["geometry"] != null)
                                            {
                                                coordinates = "{\"type\":\"MultiPolygon\",\"coordinates\":[" + obj["geometry"]["coordinates"][0].ToString().Replace("\r", "").Replace("\n", "").Replace(" ", "") + "]}";
                                            }

                                            JObject mean = JObject.Parse(coordinates);
                                            var dt = mean["coordinates"];
                                            if (dt != null)
                                            {
                                                var dts = dt[0][0];
                                                int art = 0;

                                                for (int i = 0; i < dts.Count(); i++)
                                                {
                                                    lat += Convert.ToSingle(dts[i][1]);
                                                    lng += Convert.ToSingle(dts[i][0]);
                                                    art++;
                                                }
                                                lat = lat / art;
                                                lng = lng / art;
                                            }
                                        }
                                        else
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

                DAL.ilan _ilan = new DAL.ilan
                {
                    ilanTurId = Convert.ToInt32(Request.QueryString["tur"]), // ilan türü
                    kategoriId = Convert.ToInt32(Request.QueryString["cat"]), // ilan kategorisi
                    fiyat = Convert.ToDouble(txtFiyat.Text), // fiyat
                    fiyatTurId = 1, // fiyat türü (TL)
                    kullaniciId = _authority.kullaniciId, // buraya oturum açan kullanıcının id değeri gelecek 
                    ilId = Convert.ToInt32(drpIl.SelectedValue),
                    ilceId = Convert.ToInt32(drpIlce.SelectedValue),
                    mahalleId = Convert.ToInt32(drpMahalle.SelectedValue),
                    baslik = txtBaslik.Text,
                    aciklama = txtCKeditorAdi.Text,
                    magazaId = Convert.ToInt32(drpKimden.SelectedValue), // mağazanın id değeri gelecek
                    onay = 1, // onay durumu
                    numaraYayinlansinMi = false, //numaraYayinlansin.Checked // numara yayınlansın mı
                    koordinat = coordinates,
                    girilenOzellik = txtstr,
                    secilenOzellik = slctstr,
                    resim = "",
                    ilat = lat,
                    ilng = lng
                };

                _ilanManager.Add(_ilan);



                //ilanBLL.insert1(
                //                Convert.ToInt32(Request.QueryString["tur"]), // ilan türü
                //                Convert.ToInt32(Request.QueryString["cat"]), // ilan kategorisi
                //                Convert.ToDouble(txtFiyat.Text), // fiyat
                //                1, // fiyat türü (TL)
                //                _authority.kullaniciId, // buraya oturum açan kullanıcının id değeri gelecek 
                //                Convert.ToInt32(drpIl.SelectedValue),
                //                Convert.ToInt32(drpIlce.SelectedValue),
                //                Convert.ToInt32(drpMahalle.SelectedValue),
                //                txtBaslik.Text,
                //                txtCKeditorAdi.Text,
                //                Convert.ToInt32(drpKimden.SelectedValue), // mağazanın id değeri gelecek
                //                1, // onay durumu
                //                false, //numaraYayinlansin.Checked // numara yayınlansın mı
                //                coordinates,
                //                txtstr,
                //                slctstr,
                //                "",
                //                lat,
                //                lng
                //            );


                DAL.ilan classified = _ilanManager.GetLast();

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

                string picstr = DAL.toolkit.GetXmlDataInObject(resimler);
                picstr = picstr.Replace("\r\n", "").Trim();
                picstr = picstr.Replace("  ", "");
                List<BLL.ExternalClass.girilenDataType> piclist = new List<BLL.ExternalClass.girilenDataType>();
                piclist = (List<BLL.ExternalClass.girilenDataType>)toolkit.GetObjectInXml(picstr, typeof(List<BLL.ExternalClass.girilenDataType>));

                _ilanManager.UpdatePicturesByAdsId(classified.ilanId, picstr);
                Response.Redirect("~/management/anaYonetim/ilanYonetimi/ilan.aspx?page=ilan-verildi&classified=" + classified.ilanId);
            }
            else
            {
                Panel pnl = new Panel();
                Label lbl = new Label();
                lbl.Text = "Lütfen 'kimden' seçiniz";
                pnl.Attributes["class"] = "alert alert-danger";
                pnl.Controls.Add(lbl);
                box_body.Controls.AddAt(0, pnl);

            }
        }

        protected void Vazgeç_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/management/anaYonetim/ilanYonetimi/ilan.aspx?page=listele");
        }

    }

}