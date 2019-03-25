using BLL;
using BLL.Formatter;
using BLL.PublicHelper;
using DAL;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
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

namespace PL
{
    public partial class proje_ekle : System.Web.UI.Page
    {


        ilanBll ilnBll = new ilanBll();
        
        public string tempcer = "";
        kullanici _kullanici;

        private IProjeService _projeManager;
        private IOzellikService _ozellikManager;
        private IIlceService _ilceManager;
        private IIlService _ilManager;
        private IFirmaService _firmaManager;
        private IIlanService _ilanManager;
        public proje_ekle()
        {
            _projeManager = new ProjeManager(new LTSProjelerDal());
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _ilceManager = new IlceManager(new LTSIlcelerDal());
            _ilManager = new IlManager(new LTSIllerDal());
            _firmaManager = new FirmaManager(new LTSFirmalarDal());
            _ilanManager = new IlanManager(new LTSIlanlarDal());
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

                    if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                    {
                        int ilanId = Convert.ToInt32(Request.QueryString["ilan"]);
                        DAL.ilan iln = _ilanManager.Get(ilanId);

                        txtlist = (List<BLL.ExternalClass.girilenDataType>)toolkit.GetObjectInXml(iln.girilenOzellik, typeof(List<BLL.ExternalClass.girilenDataType>));
                        slctlist = (List<BLL.ExternalClass.secilenDataType>)toolkit.GetObjectInXml(iln.secilenOzellik, typeof(List<BLL.ExternalClass.secilenDataType>));
                    }


                    //if (FieldType.ToLower().Trim() == "text")
                    //{
                    //    if (!String.IsNullOrEmpty(item.propertcate))
                    //    {
                    //        var label = new HtmlGenericControl("label");
                    //        label.InnerHtml = FieldName;
                    //        td1.Controls.Add(label);

                    //        TextBox txtcustombox = new TextBox();
                    //        txtcustombox.ID = "txt" + FieldName;

                    //        if (item.propnum)
                    //        {
                    //            txtcustombox.CssClass = "form-control double " + PublicHelper.Tools.URLConverter(FieldName);
                    //        }
                    //        else
                    //        {
                    //            txtcustombox.CssClass = "form-control " + PublicHelper.Tools.URLConverter(FieldName);
                    //        }

                    //        txtcustombox.Attributes.Add("name", FieldNum);
                    //        txtcustombox.Attributes.Add("data-wid", FieldNum);

                    //        if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                    //        {
                    //            foreach (var value in txtlist)
                    //            {
                    //                if (Convert.ToInt32(FieldNum) == value.ozellikId)
                    //                {
                    //                    txtcustombox.Text = value.deger;
                    //                }
                    //            }
                    //        }

                    //        td1.Controls.Add(txtcustombox);
                    //        PlaceHolder1.Controls.Add(td1);
                    //    }
                    //    else
                    //    {

                    //        if (item.propertid == 3 || item.propertid == 4)
                    //        {
                    //            var label = new HtmlGenericControl("label");
                    //            label.InnerHtml = FieldName;
                    //            td1.Controls.Add(label);

                    //            TextBox txtcustombox = new TextBox();
                    //            txtcustombox.ID = "txt" + FieldName;

                    //            if (item.propnum)
                    //            {
                    //                txtcustombox.CssClass = "form-control double";
                    //            }
                    //            else
                    //            {
                    //                txtcustombox.CssClass = "form-control";
                    //            }

                    //            txtcustombox.Attributes.Add("name", FieldNum);
                    //            txtcustombox.Attributes.Add("data-wid", FieldNum);

                    //            if (!String.IsNullOrEmpty(Request.QueryString["ilan"]))
                    //            {
                    //                foreach (var value in txtlist)
                    //                {
                    //                    if (Convert.ToInt32(FieldNum) == value.ozellikId)
                    //                    {
                    //                        txtcustombox.Text = value.deger;
                    //                    }
                    //                }
                    //            }

                    //            td1.Controls.Add(txtcustombox);
                    //            PlaceHolder3.Controls.Add(td1);
                    //        }

                    //    }
                    //}
                    if (FieldType.ToLower().Trim() == "check")
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
                }

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            if(_kullanici!=null)
            { 
                if (!IsPostBack)
                {

                    drpIl.DataSource = _ilManager.GetAll();
                    drpIl.DataTextField = "ilAdi";
                    drpIl.DataValueField = "ilId";
                    drpIl.DataBind();

                    tempcer = DateTime.Now.Ticks.ToString();
                    txtgecici.Value = tempcer;

                    int kullaniciId = Convert.ToInt32(_kullanici.kullaniciId);

                    List<Firma> companies = new List<Firma>();

                    try
                    {
                        companies = _firmaManager.GetAllByUserId(kullaniciId);

                    }
                    catch (Exception exception)
                    {
                        Console.WriteLine(exception);
                        throw;
                    }
                    rpcompany.DataSource = companies;
                    rpcompany.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/giris-yap/");
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

        protected void devam_Click1(object sender, EventArgs e)
        {
            List<BLL.ExternalClass.girilenDataType> girilenler = new List<BLL.ExternalClass.girilenDataType>();
            List<BLL.ExternalClass.secilenDataType> secilenler = new List<BLL.ExternalClass.secilenDataType>();
            List<BLL.ExternalClass.pplanDT> planlar = new List<BLL.ExternalClass.pplanDT>();
            List<BLL.ExternalClass.resimDataType> resimler = new List<BLL.ExternalClass.resimDataType>();

            string firmaadi = comname.Text;
            string firmaposta = compost.Text;
            string firmatelefon = Tools.PhoneNumberOrganizer(comphone.Text);
            string firmafaks = Tools.PhoneNumberOrganizer(comfaks.Text);
            string firmaweb = comweb.Text;
            string firmahakkinda = comabout.Text;
            string firmaadres = comaddr.Text;
            string firmalogo = "";

            if (comlogo.HasFile)
            {
                HttpPostedFile file = comlogo.PostedFile;
                string fileName = file.FileName;
                string fileExtension = Path.GetExtension(fileName);
                firmalogo = "company_" + Tools.URLConverter(comname.Text) + DateTime.Now.Ticks.ToString() + fileExtension;
                System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                DAL.toolkit.FixedSize(imgOrijinalResim, 99, 66, null, "estate-company", firmalogo);
            }

            int firmaid;
            if (!String.IsNullOrEmpty(Request.Form["optionsRadios"]))
            {
                if (Request.Form["optionsRadios"] == "-1")
                {
                    DAL.firmalar _firma = new DAL.firmalar
                    {
                        fadi = firmaadi,
                        feposta = firmaposta,
                        ftelefon = firmatelefon,
                        ffaks = firmafaks,
                        fadres = firmaadres,
                        fwebsite = firmaweb,
                        fhakkinda = firmahakkinda,
                        flogo = firmalogo
                    };

                    _firmaManager.Add(_firma);

                    //firmab.insert(firmaadi, firmaposta, firmatelefon, firmafaks, firmaadres, firmaweb, firmahakkinda, firmalogo);
                    firmalar firmad = _firmaManager.GetLast();

                    firmaid = firmad.firmaid;
                }
                else
                {
                    firmaid = Convert.ToInt32(Request.Form["optionsRadios"]);
                }
            }
            else
            {
                DAL.firmalar _firma = new DAL.firmalar
                {
                    fadi = firmaadi,
                    feposta = firmaposta,
                    ftelefon = firmatelefon,
                    ffaks = firmafaks,
                    fadres = firmaadres,
                    fwebsite = firmaweb,
                    fhakkinda = firmahakkinda,
                    flogo = firmalogo
                };

                _firmaManager.Add(_firma);

                //firmab.insert(firmaadi, firmaposta, firmatelefon, firmafaks, firmaadres, firmaweb, firmahakkinda, firmalogo);
                firmalar firmad = _firmaManager.GetLast();

                 firmaid = firmad.firmaid;
            }


            string projeadi = proname.Text;
            string projepost = propost.Text;
            string projetelefon = Tools.PhoneNumberOrganizer(prophone.Text);
            string projefaks = Tools.PhoneNumberOrganizer(profaks.Text);
            string projeweb = proweb.Text;
            string projehakkinda = proabout.Text;
            string projeeadres = proaddr.Text;

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
            //int kullaniciId = Convert.ToInt32(((kullanici)Session["unique-site-user"]).kullaniciId);
            int kullaniciId = Convert.ToInt32(_kullanici.kullaniciId);

            DAL.projeler _proje = new DAL.projeler
            {
                padi = projeadi,
                peposta = projepost,
                ptelefon = projetelefon,
                pfaks = projefaks,
                padres = projeeadres,
                pwebsite = projeweb,
                phakkinda = projehakkinda,
                pbilgiler = txtstr,
                pgaleri = null,
                pil = projeil,
                pilce = projeilce,
                pkatplan = null,
                pkoordinat = null,
                pozellik = slctstr,
                pvaziyetplan = null,
                pkullanicid = kullaniciId,
                pfirmaid = firmaid,
                ponay = false,
                psilindmi = false,
                psatistami = true
            };
            _projeManager.Add((_proje));
            

            //projeb.insert(projeadi, projepost, projetelefon, projefaks, projeeadres, projeweb, projehakkinda, txtstr, null, projeil, projeilce, null, null, slctstr, null, kullaniciId, firmaid);
            DAL.projeler projed = _projeManager.GetLast();

            string pather = @"\upload\estate-projects\";

            var originalDirectorys = new DirectoryInfo(HttpContext.Current.Server.MapPath(pather));
            string pathStrings = System.IO.Path.Combine(originalDirectorys.ToString(), projed.projeid.ToString());
            bool isExists = System.IO.Directory.Exists(pathStrings);

            if (!isExists)
                System.IO.Directory.CreateDirectory(pathStrings);


            string odasayisi = "";
            string dairetipi = "";
            string metrekare = "";
            string resim = "";
            string image = "";
            int ctrl = 0;

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
                        //DAL.fotograf.GeneralFixedSize(imgOrijinalResim, 1200, 800, "kralilan.com", projed.projeid.ToString(), null, image, "~upload/estate-projects/" + projed.projeid.ToString() + "/");
                        //DAL.toolkit.FixedSize(imgOrijinalResim, 1200, 800, null, "estate-companys/" + _inprojeid + "/", image);
                        DAL.toolkit.FixedSize(imgOrijinalResim, 1200, 800, null, "estate-projects/" + projed.projeid.ToString(), image);
                        resim = image;
                    }

                    ctrl++;
                }
                if (ctrl != 0)
                {

                    if (odasayisi != "" || dairetipi != "" || metrekare != "" || resim != "")
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

                    odasayisi = "";
                    dairetipi = "";
                    metrekare = "";
                    resim = "";
                    image = "";
                }
            }

            string plnstr = DAL.toolkit.GetXmlDataInObject(planlar);
            plnstr = plnstr.Replace("\r\n", "").Trim();
            plnstr = plnstr.Replace("  ", "");
            List<BLL.ExternalClass.pplanDT> plnlist = new List<BLL.ExternalClass.pplanDT>();
            plnlist = (List<BLL.ExternalClass.pplanDT>)DAL.toolkit.GetObjectInXml(slctstr, typeof(List<BLL.ExternalClass.pplanDT>));



            string str_image = "";

            var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(@"\upload\estate-projects\"));
            string pathString = System.IO.Path.Combine(originalDirectory.ToString(), txtgecici.Value);
            bool isExistsone = System.IO.Directory.Exists(pathString);

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

                    StrategyPhoto.GeneralFixedSize(imgOrijinalResim, 1500, 1000, "kralilan.com", projed.projeid.ToString(), null, str_image, "~/upload/estate-projects/" + projed.projeid.ToString() + "/");
                    StrategyPhoto.GeneralFixedSize(imgOrijinalResim, 225, 150, null, null, "yes", str_image, "~/upload/estate-projects/" + projed.projeid.ToString() + "/");

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

            string picstr = DAL.toolkit.GetXmlDataInObject(resimler);
            picstr = picstr.Replace("\r\n", "").Trim();
            picstr = picstr.Replace("  ", "");
            List<BLL.ExternalClass.girilenDataType> piclist = new List<BLL.ExternalClass.girilenDataType>();
            piclist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(picstr, typeof(List<BLL.ExternalClass.girilenDataType>));

            string stimage = null;
            if (FileUpload11.HasFile)
            {
                HttpPostedFile file = FileUpload11.PostedFile;
                string fileName = file.FileName;
                string fileExtension = Path.GetExtension(fileName);
                stimage = "situationplan" + projed.projeid + DateTime.Now.Ticks.ToString() + fileExtension;
                System.Drawing.Image imgOrijinalResim = System.Drawing.Image.FromStream(file.InputStream);
                //DAL.toolkit.FixedSize(imgOrijinalResim, 1200, 800, null, "estate-company/" + _inprojeid + "/", stimage);
                //DAL.fotograf.GeneralFixedSize(imgOrijinalResim, 1200, 800, "kralilan.com", projed.projeid.ToString(), null, stimage, "~upload/estate-company/" + projed.projeid.ToString() + "/");
                DAL.toolkit.FixedSize(imgOrijinalResim, 1200, 800, null, "estate-projects/" + projed.projeid.ToString(), stimage);
            }

            DAL.projeler _projeLast = new DAL.projeler
            {
                projeid = projed.projeid,
                pgaleri = picstr,
                pkatplan = plnstr,
                pvaziyetplan = stimage
            };

            _projeManager.UpdateLast(_projeLast);

            //projeb.lastedupdate(projed.projeid, picstr, plnstr, stimage);

            Session["ki-projectregnumeramble"] = projed.projeid;

            ArrayList project = new ArrayList();
            JArray objDizi = new JArray();
            List<BLL.ExternalClass.siparisDT> siparis = new List<BLL.ExternalClass.siparisDT>();

            JObject obj = new JObject();
            obj.Add("islemId", 20);
            obj.Add("siparis", "Proje Sayfası");
            obj.Add("tutar", 5900);
            obj.Add("vitrinKategori", null);
            obj.Add("primarykey", DateTime.Now.ToString());

            objDizi.Add(obj);

            var siparisdata = new BLL.ExternalClass.siparisDT
            {
                adsid = projed.projeid,
                optid = 20,
                price = 5900
            };

            siparis.Add(siparisdata);
            Session["showcasebasket"] = objDizi;
            Response.Redirect("~/projeler/sepet/");
        }
    }
}