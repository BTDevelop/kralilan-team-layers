using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class kategori_sec : System.Web.UI.Page
    {
        ilanBll ilnBll = new ilanBll();

        kategoriBll ktg = new kategoriBll();
        kategoriTurBll ktgT = new kategoriTurBll();
        magazaKullaniciBll magazaKllb = new magazaKullaniciBll();
        magazaKategoriBll mkat = new magazaKategoriBll();
        magazaBll mgzB = new magazaBll();
        kullanici _kullanici;

        public string mesaj = "";

        private IKategoriTurService _kategoriTurManager;
        private IKategoriService _kategoriManager;
        public kategori_sec()
        {
            _kategoriTurManager = new KategoriTurManager(new LTSKategoriTurlerDal());
            _kategoriManager = new KategoriManager(new LTSKategorilerDal());
        }

        protected override void OnInit(EventArgs e)
        {
            ListBox1.SelectedIndexChanged += Lst_SelectedIndexChanged;
            ListBox2.SelectedIndexChanged += Lst_SelectedIndexChanged;
            ListBox3.SelectedIndexChanged += Lst_SelectedIndexChanged;
            ListBox4.SelectedIndexChanged += Lst_SelectedIndexChanged;
            ListBox5.SelectedIndexChanged += Lst_SelectedIndexChanged;

            cat_2.Visible = false;
            cat_3.Visible = false;
            cat_4.Visible = false;
            cat_5.Visible = false;

            devam.Enabled = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();
            if (_kullanici == null)
            {
                Response.Redirect("~/giris-yap/");
            }
            else
            {
                if (!IsPostBack)
                {
                    ListBox1.DataSource = _kategoriManager.GetAllByCategoriId(Convert.ToInt32(0));
                    ListBox1.DataTextField = "kategoriAdi";
                    ListBox1.DataValueField = "kategoriId";
                    ListBox1.DataBind();
                }

            }
        }

        private void Lst_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox listBox = (ListBox)sender;
            ListBox list = new ListBox();

            if (listBox == ListBox1)
            {
                ListBox2.Items.Clear();
                ListBox3.Items.Clear();
                ListBox4.Items.Clear();
                ListBox5.Items.Clear();

                cat_2.Visible = false;
                cat_3.Visible = false;
                cat_4.Visible = false;
                cat_5.Visible = false;

                list = ListBox2;

                IEnumerable<kategori> sonuc = _kategoriManager.GetAllByCategoriId(Convert.ToInt32(listBox.SelectedValue));
                if (sonuc.Any())
                {
                    cat_2.Visible = true;

                    list.DataSource = sonuc;
                    list.DataTextField = "kategoriAdi";
                    list.DataValueField = "kategoriId";
                    list.DataBind();
                    devam.Enabled = false;

                }
                else
                {
                    Label lbl = new Label();
                    lbl.Text = "<i style='margin-top:-52px;' class='fa fa-check-circle fa-4x'> </i> <br/> Kategori Seçimi <br/> Tamamlandı.";
                    lbl.Attributes["class"] = "tamam";

                    Panel pnl = new Panel();
                    pnl.Attributes["class"] = "categories";
                    pnl.Controls.Add(lbl);

                    cats.Controls.Add(pnl);
                    ViewState["id"] = Convert.ToInt32(ListBox1.SelectedValue);
                    devam.Enabled = true;
                }
            }
            else if (listBox == ListBox2)
            {
                ListBox3.Items.Clear();
                ListBox4.Items.Clear();
                ListBox5.Items.Clear();

                cat_3.Visible = false;
                cat_4.Visible = false;
                cat_5.Visible = false;

                list = ListBox3;

                // Her ik tablodan da bilgi çekiyoruz ilk önce kategoriTur tablosundaki verileri karşılaştırıyoruz.
                IEnumerable<object> sonuclar = (IEnumerable<object>)_kategoriTurManager.GetByCategoriId(Convert.ToInt32(ListBox2.SelectedValue));
                IEnumerable<kategori> sonuc = _kategoriManager.GetAllByCategoriId(Convert.ToInt32(ListBox2.SelectedValue));

                if (sonuclar.Any()) // kategoriTur tablosunda satılık kiralık vb. değeri var mı
                {
                    cat_3.Visible = true;
                    foreach (object key in sonuclar.ToList())
                    {
                        if (key.ToString() == "{ turId = 1 }")
                        {
                            ListItem li = new ListItem();
                            li.Text = "Satılık";
                            li.Value = "1";
                            ListBox3.Items.Add(li);
                        }
                        if (key.ToString() == "{ turId = 2 }")
                        {
                            ListItem li = new ListItem();
                            li.Text = "Kiralık";
                            li.Value = "2";
                            ListBox3.Items.Add(li);
                        }
                        if (key.ToString() == "{ turId = 3 }")
                        {
                            ListItem li = new ListItem();
                            li.Text = "Günlük Kiralık";
                            li.Value = "3";
                            ListBox3.Items.Add(li);
                        }
                        if (key.ToString() == "{ turId = 4 }")
                        {
                            ListItem li = new ListItem();
                            li.Text = "Devren";
                            li.Value = "4";
                            ListBox3.Items.Add(li);
                        }
                        if (key.ToString() == "{ turId = 5 }")
                        {
                            ListItem li = new ListItem();
                            li.Text = "Devren Kiralık";
                            li.Value = "5";
                            ListBox3.Items.Add(li);
                        }
                        if (key.ToString() == "{ turId = 6 }")
                        {
                            ListItem li = new ListItem();
                            li.Text = "Devren Satılık";
                            li.Value = "6";
                            ListBox3.Items.Add(li);
                        }
                    }
                    devam.Enabled = false;
                }
                else if (sonuc.Any()) // kategori tablosunda alt kategoriler var mı
                {
                    cat_3.Visible = true;
                    ListBox3.DataSource = sonuc;
                    ListBox3.DataTextField = "kategoriAdi";
                    ListBox3.DataValueField = "kategoriId";
                    ListBox3.DataBind();
                    devam.Enabled = false;
                }
                else
                {
                    Label lbl = new Label();
                    lbl.Text = "<i style='margin-top:-52px;' class='fa fa-check-circle fa-4x'> </i><br/> Kategori Seçimi <br/> Tamamlandı.";
                    lbl.Attributes["class"] = "tamam";

                    Panel pnl = new Panel();
                    pnl.Attributes["class"] = "categories";
                    pnl.Controls.Add(lbl);

                    cats.Controls.Add(pnl);
                    ViewState["id"] = Convert.ToInt32(ListBox2.SelectedValue);
                    devam.Enabled = true;
                }
            }
            else if (listBox == ListBox3)
            {
                ListBox4.Items.Clear();
                ListBox5.Items.Clear();

                cat_4.Visible = false;
                cat_5.Visible = false;

                list = ListBox4;


                IEnumerable<object> sonuclar = (IEnumerable<object>)_kategoriTurManager.GetByCategoriTypeId(Convert.ToInt32(ListBox2.SelectedValue), Convert.ToInt32(ListBox3.SelectedValue));
                IEnumerable<kategori> sonuc = _kategoriManager.GetAllByCategoriId(Convert.ToInt32(ListBox3.SelectedValue));
                if (sonuclar.Any())
                {
                    cat_4.Visible = true;
                    ListBox4.DataSource = sonuclar;
                    ListBox4.DataTextField = "kategoriAdi";
                    ListBox4.DataValueField = "kategoriId";
                    ListBox4.DataBind();
                    devam.Enabled = false;
                    ViewState["ilanTur"] = Convert.ToInt32(ListBox3.SelectedValue);
                }
                else if (ListBox1.SelectedValue != "1" || (ListBox2.SelectedValue != "4" && ListBox2.SelectedValue != "5")) // emlak kategorisi değiise veya (arsa ve bina değilse)
                {
                    if (sonuc.Any())
                    {
                        cat_4.Visible = true;
                        ListBox4.DataSource = sonuc;
                        ListBox4.DataTextField = "kategoriAdi";
                        ListBox4.DataValueField = "kategoriId";
                        ListBox4.DataBind();
                        devam.Enabled = false;
                    }
                    else
                    {
                        Label lbl = new Label();
                        lbl.Text = "<i style='margin-top:-52px;' class='fa fa-check-circle fa-4x'> </i><br/> Kategori Seçimi <br/> Tamamlandı.";
                        lbl.Attributes["class"] = "tamam";

                        Panel pnl = new Panel();
                        pnl.Attributes["class"] = "categories";
                        pnl.Controls.Add(lbl);

                        cats.Controls.Add(pnl);
                        devam.Enabled = true;
                        ViewState["id"] = Convert.ToInt32(ListBox3.SelectedValue);
                    }
                }
                else
                {
                    Label lbl = new Label();
                    lbl.Text = "<i style='margin-top:-52px;' class='fa fa-check-circle fa-4x'> </i><br/> Kategori Seçimi <br/> Tamamlandı.";
                    lbl.Attributes["class"] = "tamam";

                    Panel pnl = new Panel();
                    pnl.Attributes["class"] = "categories";
                    pnl.Controls.Add(lbl);

                    cats.Controls.Add(pnl);
                    devam.Enabled = true;
                    ViewState["ilanTur"] = Convert.ToInt32(ListBox3.SelectedValue);
                    ViewState["id"] = Convert.ToInt32(ListBox2.SelectedValue);
                }
            }
            else if (listBox == ListBox4)
            {
                ListBox5.Items.Clear();

                cat_5.Visible = false;
                list = ListBox5;

                IEnumerable<kategori> sonuc = _kategoriManager.GetAllByCategoriId(Convert.ToInt32(ListBox4.SelectedValue));
                if (sonuc.Any())
                {
                    cat_5.Visible = true;
                    ListBox5.DataSource = sonuc;
                    ListBox5.DataTextField = "kategoriAdi";
                    ListBox5.DataValueField = "kategoriId";
                    ListBox5.DataBind();
                    devam.Enabled = false;
                }
                else
                {
                    Label lbl = new Label();
                    lbl.Text = "<i style='margin-top:-52px;' class='fa fa-check-circle fa-4x'> </i><br/> Kategori Seçimi <br/> Tamamlandı.";
                    lbl.Attributes["class"] = "tamam";

                    Panel pnl = new Panel();
                    pnl.Attributes["class"] = "categories";
                    pnl.Controls.Add(lbl);

                    cats.Controls.Add(pnl);
                    devam.Enabled = true;
                    ViewState["id"] = Convert.ToInt32(ListBox4.SelectedValue);
                }
            }
        }

        protected void devam_Click1(object sender, EventArgs e)
        {
            Session["cat"] = null;
            Session["tur"] = null;
            Session["mgz"] = null;


            if (ListBox2.SelectedValue == "14" || ListBox2.SelectedValue == "18")
            {
                Session["cat"] = ViewState["id"];
                Response.Redirect("~/ilan-bilgilerini-doldur/");
            }
            else if (ListBox2.SelectedValue == "12")
            {
                Session["cat"] = ViewState["id"];
                Session["tur"] = ViewState["ilanTur"];
                Response.Redirect("~/ilan-bilgilerini-doldur/");
            }
            else
            {
                Session["cat"] = ViewState["id"];
                Session["tur"] = ViewState["ilanTur"];
                Response.Redirect("~/ilan-bilgilerini-doldur/");
            }

        }
    }
}