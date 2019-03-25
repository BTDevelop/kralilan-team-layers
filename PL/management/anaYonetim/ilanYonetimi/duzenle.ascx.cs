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
using static DAL.toolkit;
using BLL.Formatter;
using BLL.PublicHelper;
using BLL.EnumHelper;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using KralilanProject.Entities;

namespace PL.management.anaYonetim.ilanYonetimi
{
    public partial class ilan_duzenle : System.Web.UI.UserControl
    {

        seciliDopingBll seciliDopb = new seciliDopingBll();
        kullanici _kullanici;

        public int ilanId,
                    kategoriId,
                    turId,
                    ilId,
                    ilceId,
                    mahalleId,
                    magazaId,
                    onay;

        public bool silindi = false;
        public bool satildiMi = false;


        public string ctrl = "-1", mailaddress = "", status = "";

        private ITelefonService _telefonManager;
        private IOzellikService _ozellikManager;
        private IMahalleService _mahalleManager;
        private IMagazaTurService _magazaTurManager;
        private IMagazaTelefonService _magazaTelefonManager;
        private IKategoriService _kategoriManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IKullaniciService _kullaniciManager;
        private IMagazaService _magazaManager;
        private IIlanService _ilanManager;
        private ISeciliDopingService _seciliDopingManager;
        public ilan_duzenle()
        {
            _telefonManager = new TelefonManager(new LTSTelefonlarDal());
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _mahalleManager = new MahalleManager(new LTSMahallelerDal());
            _magazaTurManager = new MagazaTurManager(new LTSMagazaTurlerDal());
            _magazaTelefonManager = new MagazaTelefonManager(new LTSMagazaTelefonlarDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _kullaniciManager =new KullaniciManager(new LTSKullanicilarDal());
            _magazaManager = new MagazaManager(new LTSMagazalarDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
            _seciliDopingManager = new SeciliDopingManager(new LTSSeciliDopinglerDal());
        }

        protected override void OnInit(EventArgs e)
        {
            ilanId = Convert.ToInt32(Request.QueryString["ilan"]);
            DAL.ilan iln = _ilanManager.Get(ilanId);

            string category_name = iln.kategoriId.ToString();
            string type_name = iln.ilanTurId.ToString();
            string store_name = "-1";

            if (iln.magazaId == null)
            {
                store_name = "-1";
            }
            else
            {
                int storeTypeId = (int)_magazaManager.Get(Convert.ToInt32(iln.magazaId)).magazaTurId;
                int typeId = (int)_magazaTurManager.Get(storeTypeId).turId;

                if (typeId == 7 || typeId == 8) store_name = "-1";
                
                else  store_name = "0";
                
            }


            CreateDynamicControls(category_name, type_name, store_name);
        }

        public void CreateDynamicControls(string incat, string intype, string instore)
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

                                    if (item.OzellikId == 71)
                                    {
                                        int ilanId = Convert.ToInt32(Request.QueryString["ilan"]);
                                        DAL.ilan iln = _ilanManager.Get(ilanId);
                                        txtcustombox.Text = iln.koordinat;
                                    }
                                }


                                td1.Controls.Add(txtcustombox);
                                PlaceHolder3.Controls.Add(td1);
                            }
                            else
                            {
                                if (instore != "-1")
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
                                else
                                {
                                    PlaceHolder4.Visible = false;
                                }
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
            kullanici _authority = _kullanici;

            ilanId = Convert.ToInt32(Request.QueryString["ilan"]);
            DAL.ilan iln = _ilanManager.Get(ilanId);

            status += _kullaniciManager.Get(iln.kullaniciId).kullaniciAdSoyad + " adlı kullanıcının eklediği " + iln.ilanId + " nolu ilan ";

            if (iln.onay == 1)
                status += "onaylı ve yayında";
            else if (iln.onay == 2)
                status += "onay bekliyor";
            else if (iln.onay == 3)
                status += "pasif durumda";
            else if (iln.onay == 0)
                status += "onaylanmamış";

            mailaddress = _kullaniciManager.Get(iln.kullaniciId).email;
            kategoriId = iln.kategoriId;
            turId = Convert.ToInt32(iln.ilanTurId);
            ilId = iln.ilId;
            ilceId = iln.ilceId;
            mahalleId = iln.mahalleId;
            lblKind.InnerText = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), iln.ilanTurId.ToString()));
            lblCat.InnerText = _kategoriManager.Get(iln.kategoriId).kategoriAdi;
            txtBaslik.Text = iln.baslik;
            txtCKeditorAdi.Text = iln.aciklama;
            txtFiyat.Text = iln.fiyat.ToString();

            if (iln.magazaId != null)
            {
                magazaId = Convert.ToInt32(iln.magazaId);
                sahipRepeater.DataSource = _magazaTelefonManager.GetAllByStoreId(Convert.ToInt32(iln.magazaId));
                sahipRepeater.DataBind();
            }
            else
            {
                magazaId = -1;
                sahipRepeater.DataSource = _telefonManager.GetAllByUserId(iln.kullaniciId);
                sahipRepeater.DataBind();
            }


            if (!Page.IsPostBack)
            {

                drpIl.DataSource = _ilManager.GetAll();
                drpIl.DataTextField = "ilAdi";
                drpIl.DataValueField = "ilId";
                drpIl.DataBind();

                drpIl.SelectedValue = ilId.ToString();

                drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                drpIlce.DataTextField = "ilceAdi";
                drpIlce.DataValueField = "ilceId";
                drpIlce.DataBind();

                drpIlce.SelectedValue = ilceId.ToString();

                drpMahalle.DataSource = _mahalleManager.GetAllByCityId(Convert.ToInt32(drpIlce.SelectedValue));
                drpMahalle.DataTextField = "mahalleAdi";
                drpMahalle.DataValueField = "mahalleId";
                drpMahalle.DataBind();

                drpMahalle.SelectedValue = mahalleId.ToString();

                drpKimden.DataSource = _magazaManager.GetAllByStoreCategori(1);
                drpKimden.DataTextField = "MagazaAdi";
                drpKimden.DataValueField = "MagazaId";
                drpKimden.DataBind();

                ListItem lst = new ListItem();
                lst.Value = "-1";
                lst.Text = "Sahibinden";
                drpKimden.Items.Insert(0, lst);
                drpKimden.SelectedValue = magazaId.ToString();
            }

            showcaseplace.Visible = false;

            if (_seciliDopingManager.Get(ilanId) != null)
            {
                showcaseplace.Visible = true;

                List<SeciliDoping> showcase = new List<SeciliDoping>();

                showcase = _seciliDopingManager.GetAllByAdsId(ilanId);

                rpshowcase.DataSource = showcase;
                rpshowcase.DataBind();
            }
        }

        protected void drpKimden_SelectedIndexChanged(object sender, EventArgs e)
        {
          
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

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            DAL.ilan iln = _ilanManager.Get(ilanId);

            ctrl = Request.Form["ctrlselect"];

            if (!String.IsNullOrEmpty(ctrl))
            {
                ctrl = Request.Form["ctrlselect"];
            }
            else
            {
                ctrl = "-1";
            }


            if (ctrl != "-1")
            {
                if (ctrl == "1")
                {
                    onay = 1;
                    silindi = false;

                }
                else if (ctrl == "2")
                {
                    onay = 0;
                    silindi = false;

                }
                else if (ctrl == "3")
                {
                    onay = 3;
                    silindi = false;

                }
                else if (ctrl == "4")
                {
                    onay = 2;
                    silindi = false;

                }
                else if (ctrl == "5")
                {
                    onay = 0;
                    silindi = true;

                }
                else if (ctrl == "6")
                {
                    onay = 1;
                    silindi = false;
                    satildiMi = true;
                }

            }
            else
            {
                onay = iln.onay;
                silindi = iln.silindiMi;
            }


            List<BLL.ExternalClass.girilenDataType> girilenler = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> secilenler = new List<BLL.ExternalClass.secilenDataType>();
            List<BLL.ExternalClass.resimDataType> resimler = new List<BLL.ExternalClass.resimDataType>();
            DateTime starterDate = DateTime.Today;
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

                                    if (Convert.ToInt32(((TextBox)item3).Attributes["name"]) == 63)
                                    {
                                        starterDate = Convert.ToDateTime(((TextBox)item3).Text);
                                    }

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
                                        else if (obj["geometry"] != null)
                                        {
                                            coordinates = "{\"type\":\"MultiPolygon\",\"coordinates\":[" + obj["geometry"]["coordinates"][0].ToString().Replace("\r", "").Replace("\n", "").Replace(" ", "") + "]}";
                                        }
                                        else
                                        {
                                            coordinates = iln.koordinat;
                                        }

                                        if (!String.IsNullOrEmpty(coordinates))
                                        {
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
                                            coordinates = iln.koordinat;
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

            //bool dipoint = false;
            List<BLL.ExternalClass.resimDataType> newpic = new List<BLL.ExternalClass.resimDataType>();

            List<BLL.ExternalClass.resimDataType> piclist = new List<BLL.ExternalClass.resimDataType>();
            piclist = (List<BLL.ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(_ilanManager.Get(ilanId).resim, typeof(List<BLL.ExternalClass.resimDataType>));

            foreach (var item in piclist)
            {
                var directory = new DirectoryInfo(HttpContext.Current.Server.MapPath(@"\upload\ilan\"));
                string strpath = System.IO.Path.Combine(directory.ToString(), item.resim.ToString());
                bool isExists = System.IO.File.Exists(strpath);
                if (isExists)
                {
                    var picdata = new BLL.ExternalClass.resimDataType
                    {
                        resim = item.resim,
                        seciliMi = item.seciliMi
                    };
                    resimler.Add(picdata);
                }

                //if(item.seciliMi==true)
                //{
                //    dipoint = true;
                //}
            }

            string str_image = "";
            var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(@"\upload\ilan\"));
            string pathString = System.IO.Path.Combine(originalDirectory.ToString(), ilanId.ToString());
            bool isExistsone = System.IO.Directory.Exists(pathString);

            if (isExistsone)
            {
                string[] strlist = System.IO.Directory.GetFiles(pathString, "*.*");
                for (int i = 0; i < strlist.Length; i++)
                {

                    bool secili = false;
                    //if (i == 0)
                    //{
                    //    secili = true;
                    //}

                    FileInfo file = new System.IO.FileInfo(strlist[i]);

                    string fileName = file.Name;
                    string fileExtension = Path.GetExtension(fileName);
                    str_image = ilanId + "_" + DateTime.Now.Ticks.ToString() + fileExtension;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(strlist[i]);

                    DAL.StrategyPhoto.FixedSize(imgOrijinalResim, 600, 400, "kralilan.com", ilanId.ToString(), str_image);
                    DAL.StrategyPhoto.FixedSize(imgOrijinalResim, 120, 80, null, ilanId.ToString(), str_image);

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



            //HttpFileCollection updateFiles = Request.Files;
            //string str_image = "";
            //if (FileUpload1.HasFile)
            //{

            //    for (int i = 0; i < updateFiles.Count; i++)
            //    {

            //        bool secili = false;
            //        if (i == 0)
            //        {
            //            secili = true;
            //        }

            //        HttpPostedFile file = updateFiles[i];

            //        string fileName = file.FileName;
            //        string fileExtension = Path.GetExtension(fileName);
            //        str_image = ilanId + "_" + (i + 1).ToString() + fileExtension;
            //        System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);

            //        DAL.fotograf.FixedSize(imgOrijinalResim, 600, 400, "kralilan.com", ilanId.ToString(), str_image);
            //        DAL.fotograf.FixedSize(imgOrijinalResim, 120, 80, null, ilanId.ToString(), str_image);

            //        var picdata = new BLL.deff.resimDataType
            //        {
            //            resim = str_image,
            //            seciliMi = secili
            //        };

            //        resimler.Add(picdata);
            //    }
            //}

            string picstr = DAL.toolkit.GetXmlDataInObject(resimler);
            picstr = picstr.Replace("\r\n", "").Trim();
            picstr = picstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> piclist2 = new List<BLL.ExternalClass.girilenDataType>();
            piclist2 = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(picstr, typeof(List<BLL.ExternalClass.girilenDataType>));

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

            int typeId = -1;
            var storeObject = _magazaManager.Get(Convert.ToInt32(drpKimden.SelectedValue));
            if (storeObject != null)
            {
                int storeTypeId = (int) _magazaManager.Get(Convert.ToInt32(drpKimden.SelectedValue)).magazaTurId;
                typeId = (int) _magazaTurManager.Get(storeTypeId).turId;
            }

            int outuserid;
            bool outprivacy;
            if (drpKimden.SelectedValue == "-1" || typeId == 7 || typeId == 8 )
            {
                outuserid = iln.kullaniciId;
                outprivacy = iln.numaraYayinlansinMi;
            }
            else
            {
                outuserid = iln.kullaniciId;
                outprivacy = iln.numaraYayinlansinMi;
            }


            if (starterDate < DateTime.Today)
            {
                starterDate = iln.baslangicTarihi;
            }
            else
            {
                starterDate = DateTime.Now;
                //kullanici _authority = (kullanici)Session["unique-user"];
                //outuserid = _authority.kullaniciId;
            }


            DAL.ilan _ilan = new DAL.ilan
            {
                ilanId = ilanId,
                fiyat = Convert.ToDouble(txtFiyat.Text),
                fiyatTurId = 1,
                kullaniciId = outuserid,
                ilId = Convert.ToInt32(drpIl.SelectedValue),
                ilceId = Convert.ToInt32(drpIlce.SelectedValue),
                mahalleId = Convert.ToInt32(drpMahalle.SelectedValue),
                baslik = txtBaslik.Text,
                aciklama = txtCKeditorAdi.Text,
                magazaId = Convert.ToInt32(drpKimden.SelectedValue),
                onay = onay,
                satildiMi = satildiMi,
                numaraYayinlansinMi = outprivacy,
                koordinat = coordinates,
                girilenOzellik = txtstr,
                secilenOzellik = slctstr,
                resim = picstr,
                ilat = lat,
                ilng = lng,
                baslangicTarihi = starterDate,
                bitisTarihi = starterDate.AddYears(1),
                silindiMi = silindi
            };

            _ilanManager.Update(_ilan);


            //ilnBll.update1(
            //            ilanId,
            //            Convert.ToDouble(txtFiyat.Text), // fiyat
            //            1, // fiyat türü (TL)
            //            outuserid, // buraya oturum açan kullanıcının id değeri gelecek 
            //            Convert.ToInt32(drpIl.SelectedValue),
            //            Convert.ToInt32(drpIlce.SelectedValue),
            //            Convert.ToInt32(drpMahalle.SelectedValue),
            //            txtBaslik.Text,
            //            txtCKeditorAdi.Text,
            //            Convert.ToInt32(drpKimden.SelectedValue), // mağazanın id değeri gelecek
            //            onay, // onay durumu
            //            false,
            //            outprivacy, //numaraYayinlansin.Checked // numara yayınlansın mı
            //            coordinates,
            //            txtstr,
            //            slctstr,
            //            picstr,
            //            lat,
            //            lng,
            //            starterDate,
            //            silindi
            //        );

            if (_seciliDopingManager.GetByAdsId(ilanId) != null)
            {
                _seciliDopingManager.UpdateByAdsId(ilanId);
            }

        }

        protected void Vazgeç_Click(object sender, EventArgs e)
        {

        }

        protected void sendEmail_ServerClick(object sender, EventArgs e)
        {
            string mail = Request.Form["emailto"];
            string konu = Request.Form["subject"];
            string mesaj = Request.Form["message"];

            try
            {
                DAL.toolkit.HtmlMailSender(mail, "~/email-temp/single-column/build.html", konu, konu, "Merhaba Kullanıcı", konu, mesaj);
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup1();", true);

                throw;
            }
        }

    }
}

