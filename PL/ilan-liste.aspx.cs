using BLL;
using BLL.EnumHelper;
using BLL.ExternalClass;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;
using static BLL.kategoriTurBll;
using KralilanProject.Entities;

namespace PL
{
    public partial class ilan_liste : System.Web.UI.Page
    {
        kategoriTurBll kategoriTurBLL = new kategoriTurBll();
        kategoriBll kategorib = new kategoriBll();
        magazaTurBll magazaTurBLL = new magazaTurBll();
        ilceBll ilceBLL = new ilceBll();
        mahalleBll mahalleBLL = new mahalleBll();

        public string mesaj = "";
        public int topCatId = 0, catId = 0, typeId = 0;
        public string catname = null;
        public string typename = null;
        public int categoryId;
        List<CategoriCS> lstCategory = new List<CategoriCS>();
        List<TypeAds> lstType = new List<TypeAds>();
		public string pageTitle = "";
        private string pageMetaDesc = " ilanları ile bankadan, belediyeden, icradan, hazineden kısacası tüm kamu kurumlarından emlak ilanları kral ilan da";

        private IOzellikService _ozellikManager;
        private IKategoriTurService _kategoriTurManager;
        private IKategoriService _kategoriManager;
        private IIlanSayiService _ilanSayiManager;
        private IIlService _ilManager;
        public ilan_liste()
        {
            _ozellikManager = new OzellikManager(new LTSOzelliklerDal());
            _kategoriTurManager = new KategoriTurManager(new LTSKategoriTurlerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
            _ilanSayiManager = new IlanSayiManager(new LTSIlanSayilarDal());
            _ilManager = new IlManager(new LTSIllerDal());
        }

        protected override void OnInit(EventArgs e)
        {




            if (RouteData.Values["Kategori"].ToString() != null)
            {
                string urlParamCategory = RouteData.Values["Kategori"].ToString();

                lstCategory = kategorib.getCategoriesFormat();
                var categoryControl = lstCategory.Where(x => x.kateogoriTip == urlParamCategory).FirstOrDefault();
                if (categoryControl != null)
                {
                    catname = categoryControl.kategoriAdi;
                    categoryId = categoryControl.kategoriId;
                }
				else{
					urlParamCategory = RouteData.Values["Tur"].ToString().Split('-').Last() + "-" + urlParamCategory;
					categoryControl = lstCategory.Where(x => x.kateogoriTip == urlParamCategory).FirstOrDefault();
					if (categoryControl != null)
					{
						catname = categoryControl.kategoriAdi;
						categoryId = categoryControl.kategoriId;
					}
				}
            }

            if (RouteData.Values["Tur"].ToString() != null)
            {
                string urlParamType = RouteData.Values["Tur"].ToString();
                lstType = kategoriTurBLL.getTypesFormat();
                var typeControl = lstType.Where(x => x.typeUTF == urlParamType).FirstOrDefault();
                if (typeControl == null)
                {
                    string[] turArr = RouteData.Values["Tur"].ToString().Split('-');
                    if (turArr.Count() <= 2)
                    {
                        catname = turArr[1] + "-" + RouteData.Values["Kategori"].ToString();
                        var categoryControl = lstCategory.Where(x => x.kateogoriTip == catname).FirstOrDefault();
                        if (categoryControl != null)
                        {
                            catname = categoryControl.kategoriAdi;
                            categoryId = categoryControl.kategoriId;
                        }

                        typename = turArr[0];
                        var typeSubControl = lstType.Where(x => x.typeUTF == typename).FirstOrDefault();
                        if (typeSubControl != null)
                        {
                            typename = typeSubControl.typeName;
                            typeId = typeSubControl.typeId;
                        }
                    }
                    else
                    {
                        typename = turArr[0];
                        var typeSubControl = lstType.Where(x => x.typeUTF == typename).FirstOrDefault();
                        if (typeSubControl != null)
                        {
                            typename = typeSubControl.typeName;
                            typeId = typeSubControl.typeId;
                        }

                        catname = turArr[1] + "-" + RouteData.Values["Kategori"].ToString();
                        var categoryControl = lstCategory.Where(x => x.kateogoriTip.Contains(turArr[1])).FirstOrDefault();
                        if (categoryControl != null)
                        {
                            catname = categoryControl.kategoriAdi;
                            categoryId = categoryControl.kategoriId;
                        }
                    }
                }
                else
                {
                    typename = typeControl.typeName;
                    typeId = typeControl.typeId;
                }
            }



            if (!string.IsNullOrEmpty(catname))
            {
                pageTitle = catname + " " + pageTitle;
            }

            if (!string.IsNullOrEmpty(typename))
            {
                pageTitle = typename + " " + pageTitle;
            }

            if (RouteData.Values["Kimden"] != null)
            {
                if (RouteData.Values["Kimden"].ToString() == "sahibinden")
                {
                    pageTitle = "Sahibinden" + " " + pageTitle;

                }
                else
                {
                    var value = magazaTurBLL.getUTFList().Where(x => x.TypeNameUTF == RouteData.Values["Kimden"].ToString())
                        .FirstOrDefault();
                    if (value != null)
                    {
                        pageTitle = value.TypeName + " " + pageTitle;
                    }
                }
            }

            if (RouteData.Values["Il"] != null)
            {

                if (RouteData.Values["Il"].ToString() == "sahibinden")
                {
                    pageTitle = "Sahibinden" + " " + pageTitle;

                }
                else
                {
                    var value = magazaTurBLL.getUTFList().Where(x => x.TypeNameUTF == RouteData.Values["Il"].ToString())
                        .FirstOrDefault();

                    if (value != null)
                    {
                        pageTitle = pageTitle + " " + value.TypeName;
                    }
                    else
                    {
                        string region;
                        string location = RouteData.Values["Il"].ToString();
                        if (RouteData.Values["Il"].ToString().Contains('-'))
                        {
                            if (location.Split('-').Length > 2)
                            {

                                if (location.Split('-').Length > 3)
                                {
                                    string cityArea = "";
                                    for (int i = 2; i < location.Split('-').Length; i++)
                                    {
                                        cityArea += location.Split('-')[i] + "-";
                                    }

                                    cityArea = cityArea.Remove(cityArea.Length - 1);

                                    var valueCityArea = mahalleBLL.getUTFList().Where(x => x.CityAreaUTF == cityArea)
                                        .FirstOrDefault();


                                    pageTitle = pageTitle + " " + valueCityArea.CityArea;
                                }
                                else
                                {
                                    string cityArea = location.Split('-')[2];

                                    var valueCityArea = mahalleBLL.getUTFList().Where(x => x.CityAreaUTF == cityArea)
                                        .FirstOrDefault();


                                    pageTitle = pageTitle + " " + valueCityArea.CityArea;
                                }
                            }
                            else
                            {
                                string city = location.Split('-')[1];
								//string city = location.Replace("-"," ");

								var valueCity = ilceBLL.getUTFList().Where(x => x.CityUTF == city)
                                    .FirstOrDefault();


								pageTitle = pageTitle + " " + valueCity.City;
							}
                        }
                        else
                        {
                            region = RouteData.Values["Il"].ToString();
                            var valueRegion = _ilManager.GetRegions().Where(x => x.Url == region)
                                .FirstOrDefault();


							pageTitle = pageTitle + " " + valueRegion.IlAdi;

						}
                    }
                }
            }


            Page.Title = pageTitle + " İlanları ve Fiyatları kralilan.com'da";
            Page.MetaDescription = pageTitle + pageMetaDesc;

            CreateDynamicFilterControls(categoryId.ToString());

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

                    PlaceHolder1.Controls.Add(td1);
                }

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (catname != null) topCatId = categoryId;

            if (catname != null && typename != null)
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

            int cat;
            int type;
            cat = topCatId;
            type = typeId;

            typename = EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), type.ToString()));
            catname = _kategoriManager.Get(cat).kategoriAdi;
        }

        public string count(object catid, string typeId)
        {
            int cat = Convert.ToInt32(catid);
            int type = Convert.ToInt32(typeId);

            return " " + String.Format("{0:N0}", _ilanSayiManager.CountByCategoriTypeId(cat, type).ToString());
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
    }
}