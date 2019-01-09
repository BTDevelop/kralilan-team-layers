using BLL;
using BLL.PublicHelper;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using KralilanProject.Interfaces;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Entities;

namespace PL.management.anaYonetim.projeYonetimi
{
    public partial class duzenle : System.Web.UI.UserControl
    {

        projelerBll projeb = new projelerBll();
        ilBll ilb = new ilBll();
        ilceBll ilceb = new ilceBll();
        ozelliklerBll property = new ozelliklerBll();
        ziyaretciprojeBll ziyaretb = new ziyaretciprojeBll();
        odemeBll odemeb = new odemeBll();
        public string tempcer = "";

        public string _inproname;
        public string _incompost;
        public string _inphone;
        public string _infaks;
        public string _inaddress;
        public string _inwebsite;
        public string _inabout;
        public string _inbilgiler;
        public string _ingalery;
        public int _inprovi;
        public int _indist;
        public int _inprojeid;
        public string _inplan;
        public string _incoor;
        public string _inprop;
        public string _instplan;
        public string _inprojealan;
        public string _inkonutsayisi;
        public string _inteslim;
        public string _inada;
        public string _inparsel;
        public string _inshowcaseimg;

        public string _infirmaadi;
        public string _infirlogo;
        public string _infirtelefon;
        public string _infirfaks;
        public string _infirposta;
        public int _inproviews=0;
        public int _inproclick=0;

        List<BLL.ExternalClass.resimDataType> galery = new List<BLL.ExternalClass.resimDataType>();
        List<BLL.ExternalClass.pplanDT> plnlist = new List<BLL.ExternalClass.pplanDT>();
        List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();

        private IProjeService _projeManager;
        private IOzellikService _ozellikManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        public duzenle()
        {
            _projeManager = new ProjeManager(new LTSProjelerDal());
            _ozellikManager =new OzellikManager(new LTSOzelliklerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
        }
        protected override void OnInit(EventArgs e)
        {

            string category_name = "1001";
            string type_name = "2";

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

                    if (!String.IsNullOrEmpty(Request.QueryString["proje"]))
                    {
                        int proid = Convert.ToInt32(Request.QueryString["proje"]);
                        DAL.projeler projed = _projeManager.Get(proid);

                        slctlist = (List<BLL.ExternalClass.secilenDataType>)DAL.toolkit.GetObjectInXml(projed.pozellik, typeof(List<BLL.ExternalClass.secilenDataType>));
                    }

                    if (FieldType.ToLower().Trim() == "check")
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


                            if (!String.IsNullOrEmpty(Request.QueryString["proje"]))
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
                    //else if (FieldType.ToLower().Trim() == "radiobutton")
                    //{
                    //    RadioButtonList rbnlst = new RadioButtonList();
                    //    rbnlst.ID = "rbnlst" + FieldName;
                    //    rbnlst.Items.Add(new ListItem("Male", "1"));
                    //    rbnlst.Items.Add(new ListItem("Female", "2"));


                    //    rbnlst.RepeatDirection = RepeatDirection.Horizontal;
                    //    td1.Controls.Add(rbnlst);
                    //}
                    //else if (FieldType.ToLower().Trim() == "select")
                    //{
                    //    var label = new HtmlGenericControl("label");
                    //    label.InnerHtml = FieldName;
                    //    td1.Controls.Add(label);

                    //    DropDownList ddllst = new DropDownList();
                    //    ddllst.ID = "ddl" + FieldName;
                    //    ddllst.Items.Add(new ListItem("Seçiniz", ""));
                    //    ddllst.CssClass = "form-control slct-values";
                    //    ddllst.Attributes.Add("name", FieldNum);
                    //    ddllst.Attributes.Add("data-wid", FieldNum);


                    //    string[] array = item.propertvalue.Split('|');

                    //    foreach (var item1 in array)
                    //    {
                    //        ddllst.Items.Add(new ListItem(item1.Split('#')[1], item1.Split('#')[0]));
                    //    }

                    //    if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                    //    {
                    //        foreach (var value in slctlist)
                    //        {
                    //            if (Convert.ToInt32(FieldNum) == value.ozellikId)
                    //            {
                    //                ddllst.SelectedValue = value.deger.ToString();
                    //            }
                    //        }
                    //    }

                    //    td1.Controls.Add(ddllst);
                    //    PlaceHolder1.Controls.Add(td1);

                    //}

                }

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["proje"].ToString()))
            {
                _inprojeid = Convert.ToInt32(Request.QueryString["proje"]);
                DAL.projeler projed = _projeManager.Get(_inprojeid);
                _inprojeid = projed.projeid;
                _inproname = projed.padi;
                _incompost = projed.peposta;
                _inphone = projed.ptelefon;
                _infaks = projed.pfaks;
                _inaddress = projed.padres;
                _inwebsite = projed.pwebsite;
                _inabout = projed.phakkinda;
                _inbilgiler = projed.pbilgiler;
                _ingalery = projed.pgaleri;
                _inprovi = projed.iller.ilId;
                _indist = projed.ilceler.ilceId;
                _inplan = projed.pkatplan;
                _incoor = projed.pkoordinat;
                _inprop = projed.pozellik;
                _instplan = projed.pvaziyetplan;
                _infirlogo = projed.firmalar.flogo;
                _infirmaadi = projed.firmalar.fadi;
                _infirtelefon = projed.firmalar.ftelefon;
                _infirposta = projed.firmalar.feposta;

                tempcer = "temp" + projed.projeid;

                _inproviews = ziyaretb.getVisitorByProjectId(_inprojeid, false);
                _inproclick = ziyaretb.getVisitorByProjectId(_inprojeid, true);

                List<BLL.ExternalClass.ilanDataType> payment = new List<BLL.ExternalClass.ilanDataType>();
                payment = (List<BLL.ExternalClass.ilanDataType>)DAL.toolkit.GetObjectInXml(odemeb.getProjectPaymentStatus(_inprojeid), typeof(List<BLL.ExternalClass.ilanDataType>));

                rppayment.DataSource = payment;
                rppayment.DataBind();

                if (!Page.IsPostBack)
                {
                    drpIl.DataSource = _ilManager.GetAll();
                    drpIl.DataTextField = "ilAdi";
                    drpIl.DataValueField = "ilId";
                    drpIl.DataBind();

                    drpIl.SelectedValue = _inprovi.ToString();

                    drpIlce.DataSource = _ilceManager.GetByRegionId(Convert.ToInt32(drpIl.SelectedValue));
                    drpIlce.DataTextField = "ilceAdi";
                    drpIlce.DataValueField = "ilceId";
                    drpIlce.DataBind();

                    drpIlce.SelectedValue = _indist.ToString();

                    tempcer = "temp" + projed.projeid;
                }

                txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(_inbilgiler, typeof(List<BLL.ExternalClass.girilenDataType>));

                foreach (var item in txtlist)
                {
                    if (item.ozellikId == 8756)
                        _inprojealan = item.deger;

                    if (item.ozellikId == 8757)
                        _inkonutsayisi = item.deger;

                    if (item.ozellikId == 8758)
                        _inteslim = item.deger;

                    if (item.ozellikId == 3)
                        _inada = item.deger;

                    if (item.ozellikId == 4)
                        _inparsel = item.deger;
                }

                proada.Text = _inada;
                proparsel.Text = _inparsel;

                txtproname.Text = _inproname;
                txtabout.Text = _inabout;

                propost.Text = _incompost;
                prophone.Text = _inphone;
                profaks.Text = _infaks;
                proaddr.Text = _inaddress;
                proweb.Text = _inwebsite;
                prokoordinat.Text = _incoor;

                proplace.Text = _inprojealan;
                procount.Text = _inkonutsayisi;
                prodate.Text = _inteslim;

                plnlist = (List<BLL.ExternalClass.pplanDT>)DAL.toolkit.GetObjectInXml(_inplan, typeof(List<BLL.ExternalClass.pplanDT>));

                int ctrl = 0;

                foreach (Control item in PlaceHolder1.Controls)
                {
                    if (item is DropDownList)
                    {
                        if (Convert.ToInt32(((DropDownList)item).Attributes["name"]) == 1)
                        {
                            ((DropDownList)item).SelectedValue = plnlist[ctrl].nofroom;
                        }

                        if (Convert.ToInt32(((DropDownList)item).Attributes["name"]) == 2)
                        {
                            ((DropDownList)item).SelectedValue = plnlist[ctrl].housing;

                        }
                    }
                    else if (item is TextBox)
                    {
                        ((TextBox)item).Text = plnlist[ctrl].sqmeter;
                    }
                    else if (item is FileUpload)
                    {
                        HttpFileCollection updateFiles1 = Request.Files;
                        ctrl++;
                    }

                    if (ctrl == plnlist.Count)
                    {
                        break;
                    }
                }
            }
        }

        protected void drpIl_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            List<BLL.ExternalClass.girilenDataType> girilenler = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> secilenler = new List<BLL.ExternalClass.secilenDataType>();
            List<BLL.ExternalClass.pplanDT> planlar = new List<BLL.ExternalClass.pplanDT>();
            List<BLL.ExternalClass.resimDataType> resimler = new List<BLL.ExternalClass.resimDataType>();

            DAL.projeler projed = _projeManager.Get(_inprojeid);

            string projeadi = txtproname.Text;
            string projepost = propost.Text;
            string projetelefon = Tools.PhoneNumberOrganizer(prophone.Text);
            string projefaks = Tools.PhoneNumberOrganizer(profaks.Text);
            string projeweb = proweb.Text;
            string projehakkinda = txtabout.Text;
            string projeeadres = proaddr.Text;

            //string tempstr = DAL.toolkit.GetXmlDataInObject(projed.pkatplan);
            //tempstr = tempstr.Replace("\r\n", "").Trim();
            //tempstr = tempstr.Replace("  ", "");
            List<BLL.ExternalClass.pplanDT> temppln = new List<BLL.ExternalClass.pplanDT>();
            temppln = (List<BLL.ExternalClass.pplanDT>)DAL.toolkit.GetObjectInXml(projed.pkatplan, typeof(List<BLL.ExternalClass.pplanDT>));

            var txtdata = new BLL.ExternalClass.girilenDataType
            {
                ozellikId = 8756, //proje alanı
                deger = proplace.Text
            };

            var txtdata1 = new BLL.ExternalClass.girilenDataType
            {
                ozellikId = 8757, //konut sayısı
                deger = procount.Text
            };


            var txtdata2 = new BLL.ExternalClass.girilenDataType
            {
                ozellikId = 8758, //teslim tarihi
                deger = prodate.Text
            };

            if (!String.IsNullOrEmpty(Request.Form["optionsRadiosDelivery0"]))
            {
                if (Request.Form["optionsRadiosDelivery0"] == "1")
                {
                    txtdata2 = new BLL.ExternalClass.girilenDataType
                    {
                        ozellikId = 8758, //teslim tarihi
                        deger = "check"
                    };
                }

            }

            var txtdata3 = new BLL.ExternalClass.girilenDataType
            {
                ozellikId = 3, //ada
                deger = proada.Text
            };

            var txtdata4 = new BLL.ExternalClass.girilenDataType
            {
                ozellikId = 4, //parsel
                deger = proparsel.Text
            };

            girilenler.Add(txtdata);
            girilenler.Add(txtdata1);
            girilenler.Add(txtdata2);
            girilenler.Add(txtdata3);
            girilenler.Add(txtdata4);

            string txtstr = DAL.toolkit.GetXmlDataInObject(girilenler);
            txtstr = txtstr.Replace("\r\n", "").Trim();
            txtstr = txtstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
            txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(txtstr, typeof(List<BLL.ExternalClass.girilenDataType>));

            int projeil = Convert.ToInt32(drpIl.SelectedValue);
            int projeilce = Convert.ToInt32(drpIlce.SelectedValue);

            string coordinates = "";
            Single lat = 0;
            Single lng = 0;

            if (prokoordinat.Text != "")
            {
                JObject obj = JObject.Parse(prokoordinat.Text);

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
                    coordinates = prokoordinat.Text;
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
            }

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

            string slctstr = DAL.toolkit.GetXmlDataInObject(secilenler);
            slctstr = slctstr.Replace("\r\n", "").Trim();
            slctstr = slctstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> slctlist = new List<BLL.ExternalClass.girilenDataType>();
            slctlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(slctstr, typeof(List<BLL.ExternalClass.girilenDataType>));

            string odasayisi = "";
            string dairetipi = "";
            string metrekare = "";
            string resim = "";
            string image = "";
            int ctrl = 0;
            int rad = 0;

            foreach (Control item in PlaceHolder1.Controls)
            {
                ctrl = 0;
                if (item is DropDownList)
                {
                    if (((DropDownList)item).SelectedValue != "")
                    {
                        if (((DropDownList)item).SelectedValue != "-1")
                        {

                            if (Convert.ToInt32(((DropDownList)item).Attributes["name"]) == 1)
                            {
                                odasayisi = ((DropDownList)item).SelectedValue;
                            }

                            if (Convert.ToInt32(((DropDownList)item).Attributes["name"]) == 2)
                            {
                                dairetipi = ((DropDownList)item).SelectedValue;

                            }
                        }

                    }

                }
                else if (item is TextBox)
                {
                    if (((TextBox)item).Text != "")
                    {
                        metrekare = ((TextBox)item).Text;

                    }
                }
                else if (item is FileUpload)
                {
                    if (((FileUpload)item).HasFile)
                    {
                        HttpPostedFile file = ((FileUpload)item).PostedFile;
                        string fileName = file.FileName;
                        string fileExtension = Path.GetExtension(fileName);
                        image = "floorplan" + projed.projeid + DateTime.Now.Ticks.ToString() + fileExtension;
                        System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);

                        DAL.toolkit.FixedSize(imgOrijinalResim, 1200, 800, null, "estate-projects/" + projed.projeid.ToString(), image);
                        resim = image;
                    }
                    else
                    {
                        if (rad < temppln.Count)
                        {
                            if (!String.IsNullOrEmpty(temppln[rad].image))
                            {
                                resim = "-1";
                            }
                        }
                    }

                    ctrl++;
                }

                if (ctrl != 0)
                {

                    if (odasayisi != "" || dairetipi != "" || metrekare != "" || resim != "")
                    {
                        if (resim == "-1")
                        {
                            var datam = new BLL.ExternalClass.pplanDT
                            {
                                nofroom = odasayisi,
                                housing = dairetipi,
                                sqmeter = metrekare,
                                image = temppln[rad].image
                            };

                            planlar.Add(datam);
                        }
                        else
                        {
                            var datam = new BLL.ExternalClass.pplanDT
                            {
                                nofroom = odasayisi,
                                housing = dairetipi,
                                sqmeter = metrekare,
                                image = resim
                            };

                            planlar.Add(datam);
                        }

                        rad++;


                    }

                    odasayisi = "";
                    dairetipi = "";
                    metrekare = "";
                    resim = "";
                    image = "";
                }
            }

            string stimage = "";

            string plnstr = DAL.toolkit.GetXmlDataInObject(planlar);
            plnstr = plnstr.Replace("\r\n", "").Trim();
            plnstr = plnstr.Replace("  ", "");
            List<BLL.ExternalClass.pplanDT> plnlist = new List<BLL.ExternalClass.pplanDT>();
            plnlist = (List<BLL.ExternalClass.pplanDT>)DAL.toolkit.GetObjectInXml(slctstr, typeof(List<BLL.ExternalClass.pplanDT>));

            string pather = @"\upload\estate-projects\";

            var originalDirectorys = new DirectoryInfo(HttpContext.Current.Server.MapPath(pather));
            string pathStrings = System.IO.Path.Combine(originalDirectorys.ToString(), projed.projeid.ToString());
            bool isExists = System.IO.Directory.Exists(pathStrings);

            if (!isExists)
                System.IO.Directory.CreateDirectory(pathStrings);

            string str_image = "";

            var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(@"\upload\estate-projects\"));
            string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "temp" + projed.projeid);
            bool isExistsone = System.IO.Directory.Exists(pathString);

            if (!isExistsone)
                System.IO.Directory.CreateDirectory(pathString);


            List<BLL.ExternalClass.resimDataType> ctrlpic = new List<BLL.ExternalClass.resimDataType>();
            ctrlpic = (List<BLL.ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(projed.pgaleri, typeof(List<BLL.ExternalClass.resimDataType>));

            foreach (var item in ctrlpic)
            {
                var directory = new DirectoryInfo(HttpContext.Current.Server.MapPath(@"\upload\estate-projects\" + projed.projeid + @"\"));
                string strpath = System.IO.Path.Combine(directory.ToString(), item.resim.ToString());
                bool isExistItem = System.IO.File.Exists(strpath);
                if (isExistItem)
                {
                    var picdata = new BLL.ExternalClass.resimDataType
                    {
                        resim = item.resim,
                        seciliMi = item.seciliMi
                    };
                    resimler.Add(picdata);
                }
            }


            if (isExistsone)
            {
                string[] strlist = System.IO.Directory.GetFiles(pathString, "*.*");
                for (int i = 0; i < strlist.Length; i++)
                {
                    bool selected = false;

                    if (i == 0)
                    {
                        selected = true;
                    }

                    FileInfo file = new System.IO.FileInfo(strlist[i]);

                    string fileName = file.Name;
                    string fileExtension = Path.GetExtension(fileName);
                    str_image = projed.projeid.ToString() + DateTime.Now.Ticks.ToString() + fileExtension;
                    System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromFile(strlist[i]);

                    DAL.StrategyPhoto.GeneralFixedSize(imgOrijinalResim, 1500, 1000, "kralilan.com", projed.projeid.ToString(), null, str_image, "~/upload/estate-projects/" + projed.projeid.ToString() + "/");
                    DAL.StrategyPhoto.GeneralFixedSize(imgOrijinalResim, 225, 150, null, null, "yes", str_image, "~/upload/estate-projects/" + projed.projeid.ToString() + "/");

                    var picdata = new BLL.ExternalClass.resimDataType
                    {
                        resim = str_image,
                        seciliMi = selected
                    };

                    imgOrijinalResim.Dispose();
                    resimler.Add(picdata);

                }

                System.IO.Directory.Delete(pathString, true);

            }

            if (FileUploadStatus.HasFile)
            {
                HttpPostedFile file = FileUploadStatus.PostedFile;
                string fileName = file.FileName;
                string fileExtension = Path.GetExtension(fileName);
                stimage = "situationplan" + projed.projeid + DateTime.Now.Ticks.ToString() + fileExtension;
                System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                //DAL.toolkit.FixedSize(imgOrijinalResim, 1200, 800, null, "estate-company/" + _inprojeid + "/", stimage);
                //DAL.fotograf.GeneralFixedSize(imgOrijinalResim, 1200, 800, "kralilan.com", projed.projeid.ToString(), null, stimage, "~upload/estate-company/" + projed.projeid.ToString() + "/");
                DAL.toolkit.FixedSize(imgOrijinalResim, 1200, 800, null, "estate-projects/" + projed.projeid.ToString(), stimage);
            }
            else
            {
                stimage = projed.pvaziyetplan;
            }

            string picstr = DAL.toolkit.GetXmlDataInObject(resimler);
            picstr = picstr.Replace("\r\n", "").Trim();
            picstr = picstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> piclist = new List<BLL.ExternalClass.girilenDataType>();
            piclist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(picstr, typeof(List<BLL.ExternalClass.girilenDataType>));

            DAL.projeler _proje = new DAL.projeler
            {
                projeid = _inprojeid,
                padi = projeadi,
                peposta = projepost,
                ptelefon = projetelefon,
                pfaks = projefaks,
                padres = projeeadres,
                pwebsite = projeweb,
                phakkinda = projehakkinda,
                pbilgiler = txtstr,
                pgaleri = picstr,
                pil = projeil,
                pilce = projeilce,
                pkatplan = plnstr,
                pkoordinat = coordinates,
                pozellik = slctstr,
                pvaziyetplan = stimage,
                plat = lat,
                plng = lng
            };

            _projeManager.Update(_proje);

            //projeb.update(_inprojeid, projeadi, projepost, projetelefon, projefaks, projeeadres, projeweb, projehakkinda, txtstr, picstr, projeil, projeilce, plnstr, coordinates, slctstr, stimage, lat, lng);

            string slct = Request.Form["ctrlselect"];

            if (!String.IsNullOrEmpty(slct))
            {
                slct = Request.Form["ctrlselect"];
            }
            else
            {
                slct = "-1";
            }

            if (slct != "-1")
            {
                if (slct == "1")
                {
                    DAL.projeler _projeStatus = new DAL.projeler
                    {
                        projeid = _inprojeid,
                        ponay = true,
                        psilindmi = false,
                        psatistami = false
                    };

                    _projeManager.UpdateStatus(_projeStatus);
                }
                else if (slct == "3")
                {
                    DAL.projeler _projeStatus = new DAL.projeler
                    {
                        projeid = _inprojeid,
                        ponay = true,
                        psilindmi = false,
                        psatistami = false
                    };

                    _projeManager.UpdateStatus(_projeStatus);
                }
                else if (slct == "4")
                {
                    DAL.projeler _projeStatus = new DAL.projeler
                    {
                        projeid = _inprojeid,
                        ponay = true,
                        psilindmi = false,
                        psatistami = true
                    };

                    _projeManager.UpdateStatus(_projeStatus);
                }
                else if (slct == "5")
                {
                    DAL.projeler _projeStatus = new DAL.projeler
                    {
                        projeid = _inprojeid,
                        ponay = false,
                        psilindmi = true,
                        psatistami = false
                    };

                    _projeManager.UpdateStatus(_projeStatus);
                }
            }
            else
            {

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