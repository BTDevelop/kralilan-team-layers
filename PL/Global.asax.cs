using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace PL
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(System.Web.Routing.RouteTable.Routes);
            Application.Add("totalvisitor", 0);
            Application["onlinevisitor"] = 0;

            RouteTable.Routes.Add("iletisim", new Route("kurumsal/iletisim/", new PageRouteHandler("~/iletisim.aspx")));
            RouteTable.Routes.Add("hakkimizda", new Route("kurumsal/hakkimizda/", new PageRouteHandler("~/hakkimizda.aspx")));
            RouteTable.Routes.Add("uyelik", new Route("uyelik-sozlesmesi/", new PageRouteHandler("~/uyelik-sozlesmesi.aspx")));
            RouteTable.Routes.Add("sss", new Route("sss/", new PageRouteHandler("~/sikca-sorulan-sorular.aspx")));
            RouteTable.Routes.Add("sartlar", new Route("sartlar-ve-kosullar/", new PageRouteHandler("~/sartlar-ve-kosullar.aspx")));
            RouteTable.Routes.Add("kategoriler", new Route("kategori/emlak-{Kategori}", new PageRouteHandler("~/kategoriler.aspx")));
            RouteTable.Routes.Add("kategori", new Route("kategori/emlak-{Kategori}/{KategoriNo}", new PageRouteHandler("~/kategoriler.aspx")));
            RouteTable.Routes.Add("vitrin", new Route("vitrin/{Vitrin}/{VitrinNo}", new PageRouteHandler("~/vitrin-listele.aspx")));
            RouteTable.Routes.Add("detay", new Route("ilan/{Baslik}/{IlanNo}/detay", new PageRouteHandler("~/ilan-detay.aspx")));
            RouteTable.Routes.Add("detaybilgi", new Route("ilan/{Baslik}-{IlanNo}/detay", new PageRouteHandler("~/ilan-bilgi-detay.aspx")));
            RouteTable.Routes.Add("uyeol", new Route("kayit/", new PageRouteHandler("~/uye-ol.aspx")));
            RouteTable.Routes.Add("giris", new Route("giris-yap/", new PageRouteHandler("~/giris-yap.aspx")));
            RouteTable.Routes.Add("satici", new Route("satici/{SaticiNo}/{Satici}", new PageRouteHandler("~/satici-profil.aspx")));
            RouteTable.Routes.Add("magaza", new Route("magaza/{MagazaNo}/{Magaza}", new PageRouteHandler("~/magaza-profil.aspx")));
            RouteTable.Routes.Add("arama", new Route("kelime-ile-arama/{Il}/{Kelime}", new PageRouteHandler("~/arama-sonuclari.aspx")));
            RouteTable.Routes.Add("unuttum", new Route("sifremi-unuttum/", new PageRouteHandler("~/sifremi-unuttum.aspx")));
            RouteTable.Routes.Add("kategorisec", new Route("kategori-secimini-yap/", new PageRouteHandler("~/kategori-sec.aspx")));
            RouteTable.Routes.Add("bilgidoldur", new Route("ilan-bilgilerini-doldur/", new PageRouteHandler("~/ilan-form.aspx")));
            RouteTable.Routes.Add("hizlisatis", new Route("hizli-satisi-gor/", new PageRouteHandler("~/ilan-doping.aspx")));
            RouteTable.Routes.Add("odeme", new Route("hizli-satis-odeme/", new PageRouteHandler("~/odeme.aspx")));
            RouteTable.Routes.Add("basarili", new Route("ilanin-basarili/", new PageRouteHandler("~/ilan-tamam.aspx")));
            RouteTable.Routes.Add("bilgiduzenle", new Route("ilanini-duzenle/{IlanNo}/", new PageRouteHandler("~/ilan-duzenle.aspx")));
            RouteTable.Routes.Add("cepact", new Route("uyelik-onayla/", new PageRouteHandler("~/cep-aktivasyon.aspx")));
            RouteTable.Routes.Add("benimsayfam", new Route("secure/{Sayfa}/", new PageRouteHandler("~/profil/profil.aspx?control=anasayfa")));
            RouteTable.Routes.Add("yazdir", new Route("ilan/{IlanNo}/yazdir", new PageRouteHandler("~/yazdir.aspx")));
            RouteTable.Routes.Add("kurumsal-yazdir", new Route("ilan/{IlanNo}/vitrin-yazdir", new PageRouteHandler("~/kurumsal-yazdir.aspx")));
            RouteTable.Routes.Add("haritam", new Route("haritada-ara/", new PageRouteHandler("~/harita/kral-harita.aspx")));
            RouteTable.Routes.Add("firma", new Route("projeler/firma/{ComNo}/{Com}", new PageRouteHandler("~/proje-firma.aspx")));
            RouteTable.Routes.Add("projedetay", new Route("proje/{ProName}/{ProNo}/detay", new PageRouteHandler("~/proje-detay.aspx")));
            RouteTable.Routes.Add("projeodeme", new Route("projeler/odeme/", new PageRouteHandler("~/proje-sepet.aspx")));
            RouteTable.Routes.Add("projeekle", new Route("projeler/ekle/", new PageRouteHandler("~/proje-ekle.aspx")));
            RouteTable.Routes.Add("projebasarili", new Route("projeler/basarili/", new PageRouteHandler("~/proje-basarili.aspx")));
            RouteTable.Routes.Add("projeler", new Route("projeler/", new PageRouteHandler("~/projeler.aspx")));
            RouteTable.Routes.Add("yenimagaza", new Route("yeni-magaza/", new PageRouteHandler("~/magaza-ac.aspx")));
            RouteTable.Routes.Add("yenimagazaodeme", new Route("yeni-magaza-odeme/", new PageRouteHandler("~/magaza-odeme.aspx")));
            RouteTable.Routes.Add("yenimagazabasarili", new Route("magaza-odeme-basarili/", new PageRouteHandler("~/magaza-basarili.aspx")));
            RouteTable.Routes.Add("kurumsalsozlesme", new Route("kurumsal-uyelik-sozlesme/", new PageRouteHandler("~/kurumsal-sozlesme.aspx")));
            RouteTable.Routes.Add("iyziodeme", new Route("odeme-formu/", new PageRouteHandler("~/iyzi-odeme.aspx")));
            RouteTable.Routes.Add("mobile", new Route("mobile/", new PageRouteHandler("~/mobile-site.aspx")));
        }

        public void RegisterRoutes(System.Web.Routing.RouteCollection routes)
        {
            routes.MapPageRoute(
               "listeCat",
               "liste/{Tur}-{Kategori}",
               "~/ilan-liste.aspx",
               true,
               new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty } }
            );

            routes.MapPageRoute(
               "listeProvince",
               "liste/{Tur}-{Kategori}/{Il}",
               "~/ilan-liste.aspx",
               false,
               new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Il", string.Empty } }

           );

            routes.MapPageRoute(
               "listeLokasyonKimden",
               "liste/{Tur}-{Kategori}/{Il}/{Kimden}",
               "~/ilan-liste.aspx",
               false,
               new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Il", string.Empty }, { "Kimden", string.Empty } }
             );

            routes.MapPageRoute(
                "listeDistrict",
                "liste/{Tur}-{Kategori}/{Il}-{Ilce}-{Mahalle}",
                "~/ilan-liste.aspx",
                false,
                new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Il", string.Empty }, { "Ilce", string.Empty }, { "Mahalle", string.Empty } }
            );

            routes.MapPageRoute(
                "liste",
                "liste/{Tur}/{TurNo}/{Kategori}/{KategoriNo}",
                "~/ilan-liste-test.aspx",
                false,
                new RouteValueDictionary { { "Tur", string.Empty }, { "TurNo", string.Empty }, { "Kategori", string.Empty }, { "KategoriNo", string.Empty } }
            );

            routes.MapPageRoute(
                "listeWhoFrom",
                "liste/{Tur}-{Kategori}/{Kimden}",
                "~/ilan-liste.aspx",
                false,
                new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Kimden", string.Empty } }
            );

            routes.MapPageRoute(
                "harita",
                "haritada-ara/{Tur}/{TurNo}/{Kategori}/{KategoriNo}",
                "~/harita/kral-harita.aspx",
                false,
                new RouteValueDictionary { { "Tur", string.Empty }, { "TurNo", string.Empty }, { "Kategori", string.Empty }, { "KategoriNo", string.Empty } }

            );

            routes.MapPageRoute(
                "harita-vs",
                "haritada-ara/{Kategori}/{KategoriNo}",
                "~/harita/kral-harita.aspx",
                false,
                new RouteValueDictionary { { "Kategori", string.Empty }, { "KategoriNo", string.Empty } }

            );
            
            ///////////

            routes.MapPageRoute(
                 "listeCat1",
                 "ado/{Tur}-{Kategori}",
                 "~/liste-test.aspx",
                 true,
                 new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty } }
            );

            routes.MapPageRoute(
               "listeProvince1",
               "ado/{Tur}-{Kategori}/{Il}",
               "~/liste-test.aspx",
               false,
               new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Il", string.Empty } }

           );

            routes.MapPageRoute(
               "listeLokasyonKimden1",
               "ado/{Tur}-{Kategori}/{Il}/{Kimden}",
               "~/liste-test.aspx",
               false,
               new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Il", string.Empty }, { "Kimden", string.Empty } }
             );

            routes.MapPageRoute(
                "listeDistrict1",
                "ado/{Tur}-{Kategori}/{Il}-{Ilce}-{Mahalle}",
                "~/liste-test.aspx",
                false,
                new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Il", string.Empty }, { "Ilce", string.Empty }, { "Mahalle", string.Empty } }
            );

            routes.MapPageRoute(
                "listeWhoFrom1",
                "ado/{Tur}-{Kategori}/{Kimden}",
                "~/liste-test.aspx",
                false,
                new RouteValueDictionary { { "Tur", string.Empty }, { "Kategori", string.Empty }, { "Kimden", string.Empty } }
            );

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application["totalvisitor"] = ((int)Application["totalvisitor"]) + 1;
            Application["onlinevisitor"] = ((int)Application["onlinevisitor"]) + 1;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception exc = Server.GetLastError();
            //Response.Write(exc.Message);
            Context.ClearError();
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application["onlinevisitor"] = ((int)Application["onlinevisitor"]) - 1;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}