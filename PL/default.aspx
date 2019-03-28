<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PL._default" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="metalog" runat="server">
    <meta name="apple-mobile-web-app-status-bar-style" content="#16A085" />
    <meta name="revisit-after" content="1 Days" />
    <meta property="og:title" content="Mevzu İlansa kralilan.com" />
    <meta property="og:description" content="Belediyeden, bankadan, icradan, hazineden yani tüm kamu kurumlarından ve sahibinden satılık daire, işyeri, arsa, tarla, müstakil ev ile kiralık en uygun emlak ilanlarını, gerçek konum ve şekilleriyle uydu haritasından görme imkanı sadece kral ilan'da" />
    <meta property="og:url" content="https://www.kralilan.com/" />
    <meta property="og:image" content="https://www.kralilan.com/upload/default-images/apple-touch-icon-57-precomposed.png" />
    <meta property="og:type" content="advert" />
    <meta property="og:site_name" content="Kral İlan" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Mevzu İlansa kralilan.com" />
    <meta name="twitter:description" content="Belediyeden, bankadan, icradan, hazineden yani tüm kamu kurumlarından ve sahibinden satılık daire, işyeri, arsa, tarla, müstakil ev ile kiralık en uygun emlak ilanlarını, gerçek konum ve şekilleriyle uydu haritasından görme imkanı sadece kral ilan'da" />
    <meta name="twitter:url" content="https://www.kralilan.com/; katg=Yaşam" />
    <meta name="twitter:image" content="https://www.kralilan.com/upload/default-images/apple-touch-icon-57-precomposed.png" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="intro" style="background: url('../libraries/images/bg_king.png') repeat left top; height: 400px;">
        <div class="dtable hw100">
            <div class="dtable-cell hw100">
                <div class="container text-center">
                    <h1 class="header-text">Sahibinden satılık daire arsa kiralık ev ve emlak ilanlarıyla yetinme</h1>
                    <span class="intro-title animated fadeInDown">Mevzu&nbsp</span>
                    <span class="intro-title animated fadeInDown" data-typer-targets="Sahibinden,Emlakçıdan,İnşaat Firmasından,İcradan,İzale Şuyudan,Belediyeden,Hazineden,Özelleştirmeden,Bankadan,Kamu Kurumlarından"></span>
                    <span class="intro-title animated fadeInDown">&nbspİlansa</span>
                    <!--<div class="row search-row animated fadeInUp" style="display: none;">
                        <div class="col-lg-4 col-sm-4 search-col relative locationicon">
                            <i class="icon-location-2 icon-append"></i>
                            <input type="text" name="country" id="autocomplete-ajax"
                                class="form-control locinput input-rel searchtag-input has-icon"
                                placeholder="Şehir" value="" />
                        </div>
                        <div class="col-lg-4 col-sm-4 search-col relative">
                            <i class="icon-docs icon-append"></i>
                            <input type="text" name="ads" class="form-control has-icon"
                                placeholder="Ne arıyorsun?" value="" />
                        </div>
                        <div class="col-lg-4 col-sm-4 search-col">
                            <button class="btn btn-default btn-search btn-block" onserverclick="">
                                <i
                                    class="icon-search"></i><strong>ARA</strong></button>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
    </div>
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="inner-box category-content">
                        <p class="title-2 headline">KATEGORİLER</p>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 ">
                                <div class="cat-list">
                                    <h3 class="cat-title"><a title="Emlak" href="#"><i class="icon-home ln-shadow"></i>
                                        Emlak<span class="count"></span></a><span data-target=".cat-id-1"
                                            data-toggle="collapse"
                                            class="btn-cat-collapsed collapsed"><span
                                                class=" icon-down-open-big"></span></span></h3>
                                    <ul class="cat-collapse collapse in cat-id-1">
                                        <asp:Repeater ID="rpcategories" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a title="<%# Eval("Adi") %>" href='<%# String.Format("/kategori/emlak-{0}", BLL.PublicHelper.Tools.URLConverter(Eval("Adi"))) %>'>
                                                        <%# Eval("Adi") %> (<%# String.Format("{0:N0}", Eval("Sayi")) %>)</a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <li>
                                            <a title="Projeler" href='/projeler/'>Projeler (<%= ProjeSayi %>)</a>
                                        </li>
                                        <li>
                                            <a title="Haritada Ara" href='/haritada-ara/'>Haritada Ara (Tüm İlanlar)</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 ">
                                <div class="cat-list">
                                    <h3 class="cat-title"><a title="Vitrinler" href="#"><i
                                        class="icon-star-2 ln-shadow"></i>VİTRİN<span
                                            class="count"></span></a>
                                        <span data-target=".cat-id-2" data-toggle="collapse"
                                            class="btn-cat-collapsed collapsed"><span
                                                class=" icon-down-open-big"></span></span>
                                    </h3>
                                    <ul class="cat-collapse collapse in cat-id-2">
                                        <li>
                                            <a title="Anasayfa Vitrini" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Anasayfa"), "1") %>'>Anasayfa Vitrini <%= SayilarDic["Anasayfa Vitrini"] %></a></li>
                                        <li>
                                            <a title="Arama Sonuç Vitrini" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Arama Sonuç"), "2") %>'>Arama Sonuç Vitrini <%= SayilarDic["Arama Sonuç Vitrini"] %></a></li>
                                        <li>
                                            <a title="Acil Acil" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Acil Acil"), "5") %>'>Acil Acil <%= SayilarDic["Acil Acil"] %></a></li>
                                        <li>
                                            <a title="Fiyatı Düşenler" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Fiyatı Düşen"), "8") %>'>Fiyatı Düşen <%= SayilarDic["Fiyatı Düşen"] %></a></li>
                                        <li>
                                            <a title="Son 48 Saat" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Son 48 Saat"), "48") %>'>Son 48 Saat <%= SayilarDic["Son 48 Saat"] %></a></li>
                                        <li>
                                            <a title="Satılanlar" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Satılanlar"), "50") %>'>Satılanlar <%= SayilarDic["Satılanlar"] %></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 fadeshow1">
                    <iframe width="485" height="325" src="https://www.youtube.com/embed/cdJIIP_rAk4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="col-lg-12 page-content col-thin-right">
                    <div class="col-lg-12 content-box ">
                        <div class="row row-featured row-featured-category">
                            <div class="col-lg-12  box-title no-border">
                                <div class="inner">
                                    <p>
                                        <span>ANASAYFA</span>
                                        VİTRİNİ <a title="Anasayfa Vitrini" href='<%= String.Format("/vitrin/{0}/{1}","anasayfa", "1") %>' class="sell-your-item">TÜMÜNÜ GÖSTER <i
                                            class="  icon-th-list"></i></a>
                                    </p>
                                </div>
                            </div>
                            <asp:Repeater ID="rphomeshowcase" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 f-category">
                                        <a href='<%# String.Format("/ilan/{0}-{1}/detay", BLL.PublicHelper.Tools.URLConverter(Eval(("Baslik"))),Eval(("IlanId"))) %>' title='<%# Eval(("Baslik")) %>'>
                                            <img src="/libraries/images/loadingv.gif" data-src="upload/ilan/thmb_<%# ParsePictures(Eval("Resimler").ToString()) %>" class="img-responsive lazy" width="120" height="80" alt="<%# Eval(("Baslik")) %>" />
                                            <h6><%# Eval(("Baslik")) %> </h6>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="text-center" runat="server">
                        <div class="adds-wrapper property-list">
                            <div class="item-list">
                                <div class="col-sm-3 no-padding photobox">
                                    <div class="add-image">
                                        <a title="<%= ProjeView.ProjeAdi %>" href="/proje/<%= BLL.PublicHelper.Tools.URLConverter(ProjeView.ProjeAdi) %>/<%= ProjeView.ProjeId %>/detay">
                                            <img class="thumbnail no-margin" src="/upload/estate-projects/<%= ProjeView.ProjeId %>/<%= ParsePictures(ProjeView.Galeri) %>" alt="<%= ProjeView.ProjeAdi %>" /></a>
                                    </div>
                                </div>
                                <div class="col-sm-6 add-desc-box">
                                    <div class="add-details">
                                        <h5 class="add-title"><a title="<%= ProjeView.ProjeAdi %>" href="/proje/<%= BLL.PublicHelper.Tools.URLConverter(ProjeView.ProjeAdi) %>/<%= ProjeView.ProjeId %>/detay"><%= ProjeView.ProjeAdi %></a></h5>
                                        <span class='info-row'><span class='item-location'><%= ProjeView.IlAdi %> - <%= ProjeView.IlceAdi %> | <a><i class='icon-location-2'></i>Konum</a></span></span>
                                        <div class="prop-info-box">
                                            <div class="prop-info">
                                                <div class="clearfix prop-info-block">
                                                    <span class="title"><%= ProjectPlace %>  m2</span>
                                                    <span class='text'>Proje Alanı</span>
                                                </div>
                                                <div class='clearfix prop-info-block middle'>
                                                    <span class='title prop-area'><%= ProjectEstateCount %></span>
                                                    <span class='text'>Konut Sayısı</span>
                                                </div>
                                                <div class='clearfix prop-info-block'>
                                                    <span class='title prop-room'>Teslim Tarihi</span>
                                                    <span class='text'><%= ProjectDate %></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class='col-sm-3 text-right  price-box'>
                                    <a title="<%= ProjeView.ProjeAdi %>" class='btn btn-warning btn-sm bold' href="/proje/<%= BLL.PublicHelper.Tools.URLConverter(ProjeView.ProjeAdi) %>/<%= ProjeView.ProjeId %>/detay">Önerilen Proje</a>
                                    <img class="fadeshow1 thumbnail no-margin" src="/upload/estate-company/<%= ProjeView.FirmaLogo %>" alt="<%= ProjeView.ProjeAdi %>" />
                                    <div style='clear: both'></div>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="container">
                        <div class="categories" style="margin-left: -15px;">
                            <div class="row">
                                <div class="col-lg-2 colty">
                                    <div class="category category-vertical" style="background-image: url('../libraries/images/sahibinden kiralık satılık daire arsa emlak.jpg');">
                                        <a title="Sahibinden Satılık Daireler" href="/liste/satilik-daire/sahibinden" class="category-link">
                                            <div class="category-content-1">
                                                <h2 class="category-title">Sahibinden Satılık Daireler</h2>
                                                <p class="category-subtitle">1.000'den fazla ilan</p>
                                                <span class="btn btn-primary">Daireleri Gör</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/icradan kiralık satılık daire arsa emlak.jpg');">
                                                <a title="İcradan Satılık Daireler" href="/liste/satilik-daire/icradan" class="category-link">
                                                    <div class="category-content-1">
                                                        <h2 class="category-title">İcradan Satılık Daire</h2>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/belediyeden kiralık satılık daire arsa emlak.jpg');">
                                                <a title="Belediyeden Satılık Daireler" href="/liste/satilik-daire/belediyeden" class="category-link">
                                                    <div class="category-content-1">
                                                        <h2 class="category-title">Belediyeden Satılık Daire</h2>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/hazineden kiralık satılık daire arsa emlak.jpg');">
                                                <a title="Hazineden Satılık Daireler" href="/liste/satilik-daire/milli-hazineden-guncel" class="category-link">
                                                    <div class="category-content-1">
                                                        <h2 class="category-title">Hazineden Satılık Daire</h2>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/kamudan kiralık satılık daire arsa emlak.jpg');">
                                                <a href="/liste/satilik-daire/kamu-kurumlarindan" class="category-link">
                                                    <div class="category-content-1">
                                                        <h2 class="category-title" style="margin-top: -24px;">Kamu Kurumlarından Satılık Daire</h2>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 colty">
                                    <div class="category category-vertical" style="background-image: url('../libraries/images/bankadan kiralık satılık daire arsa emlak.jpg');">
                                        <a title="Bankadan Satılık Daireler" href="/liste/satilik-daire/bankadan" class="category-link">
                                            <div class="category-content-1">
                                                <h2 class="category-title">Bankadan Satılık Daireler</h2>
                                                <p class="category-subtitle">7.000'den fazla ilan</p>
                                                <span class="btn btn-primary">Daireleri Gör</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                    <div class="text-center fadeshow1">
                        <a href="/haritada-ara/">
                            <img src="/libraries/images/loadingv.gif" data-src='libraries/images/showcase-picture.jpg' class="img-responsive lazy" alt="mevzu ilansa" />
                        </a>
                        <br />
                    </div>
                    <div class="text-center fadeshow-mobile">
                        <a href="/haritada-ara/">
                            <img src="/libraries/images/loadingv.gif" data-src='libraries/images/showcase-mobile.jpg' class="img-responsive lazy" alt="mevzu ilansa" />
                        </a>
                        <br />
                    </div>
                    <div class="col-lg-12 content-box ">
                        <div class="row row-featured">
                            <div class="col-lg-12  box-title ">
                                <div class="inner">
                                    <p>
                                        <span>ACİL </span>
                                        ACİL VİTRİNİ<a title="Acil Acil" href='<%= String.Format("/vitrin/{0}/{1}", "acil-acil", "5") %>' class="sell-your-item">TÜMÜNÜ GÖSTER <i
                                            class="  icon-th-list"></i></a>
                                    </p>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                            <div class=" relative  content featured-list-row clearfix">
                                <nav class="slider-nav has-white-bg nav-narrow-svg">
                                    <a class="prev">
                                        <span class="nav-icon-wrap"></span>
                                    </a>
                                    <a class="next">
                                        <span class="nav-icon-wrap"></span>
                                    </a>
                                </nav>
                                <div class="no-margin featured-list-slider ">
                                    <asp:Repeater ID="rpemergencyshowcase" runat="server">
                                        <ItemTemplate>
                                            <div class="item emergency">
                                                <a href='<%# String.Format("/ilan/{0}-{1}/detay", BLL.PublicHelper.Tools.URLConverter(Eval(("Baslik"))),Eval(("IlanId"))) %>' title='<%# Eval("Baslik") %>'>
                                                    <span class="item-carousel-thumb">
                                                        <img src="/libraries/images/loadingv.gif" data-src="upload/ilan/thmb_<%# ParsePictures(Eval("Resimler").ToString()) %>" class="img-responsive lazy" width="120" height="80" alt="<%# Eval("Baslik") %>" />
                                                    </span>
                                                    <span class="item-name"><%# Eval("Baslik") %>  </span>
                                                </a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: center">
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- Kralilan Özel Yatay Banner -->
                        <ins class="adsbygoogle"
                            style="display: inline-block; width: 970px; height: 90px"
                            data-ad-client="ca-pub-9803073452171785"
                            data-ad-slot="8245524981"></ins>
                        <script>
                            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                        <br />
                        <br />
                    </div>
                    <div class="col-lg-12 content-box ">
                        <div class="row row-featured">
                            <div class="col-lg-12 col-md-12 box-title ">
                                <div class="inner">
                                    <p>
                                        <span>SON </span>
                                        48 SAAT VİTRİNİ<a title="Son 48 Saat" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Son 48 Saat"), "48") %>' class="sell-your-item">TÜMÜNÜ GÖSTER <i
                                            class="  icon-th-list"></i></a>
                                    </p>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                            <div class=" relative  content featured-list-row clearfix">
                                <nav class="slider-nav has-white-bg nav-narrow-svg">
                                    <a class="prev">
                                        <span class="nav-icon-wrap"></span>
                                    </a>
                                    <a class="next">
                                        <span class="nav-icon-wrap"></span>
                                    </a>
                                </nav>
                                <div class="no-margin featured-list-slider">
                                    <asp:Repeater ID="rplast48showcase" runat="server">
                                        <ItemTemplate>
                                            <div class="item">
                                                <a href='<%# String.Format("/ilan/{0}-{1}/detay", BLL.PublicHelper.Tools.URLConverter(Eval("Baslik")), Eval("IlanId")) %>'
                                                    title='<%# Eval("Baslik") %>'>
                                                    <span class="item-carousel-thumb">
                                                        <img src="/libraries/images/loadingv.gif" data-src="upload/ilan/thmb_<%# ParsePictures(Eval("Resimler").ToString()) %>" class="img-responsive lazy" width="120" height="80" alt="<%# Eval("Baslik") %>" />
                                                    </span>
                                                    <span class="item-name"><%# Eval("Baslik") %> </span>
                                                </a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container fadeshow1">
                        <div class="categories" style="margin-left: -15px;">
                            <div class="row">
                                <div class="col-lg-2 colty">
                                    <div class="category category-vertical" style="background-image: url('../libraries/images/istanbul kiralık satılık daire arsa emlak.jpg');">
                                        <a title="İstanbul Satılık Daireler" href="/liste/satilik-daire/istanbul" class="category-link">
                                            <div class="category-content-1">
                                                <h3 class="category-title">İstanbul Satılık Daireler</h3>
                                                <p class="category-subtitle">40.000'den fazla ilan</p>
                                                <span class="btn btn-primary">Daireleri Gör</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/izmir kiralık satılık daire arsa emlak.jpg');">
                                                <a title="İzmir Satılık Daireler" href="/liste/satilik-daire/izmir" class="category-link">
                                                    <div class="category-content-1">
                                                        <h3 class="category-title">İzmir Satılık Daire</h3>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/adana kiralık satılık daire arsa emlak.jpg');">
                                                <a title="Adana Satılık Daireler" href="/liste/satilik-daire/adana" class="category-link">
                                                    <div class="category-content-1">
                                                        <h3 class="category-title">Adana Satılık Daire</h3>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/bursa kiralık satılık daire arsa emlak.jpg');">
                                                <a title="Bursa Satılık Daireler" href="/liste/satilik-daire/bursa" class="category-link">
                                                    <div class="category-content-1">
                                                        <h3 class="category-title">Bursa Satılık Daire</h3>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="category" style="background-image: url('../libraries/images/antalya kiralık satılık daire arsa emlak.jpg');">
                                                <a title="Antalya Satılık Daireler" href="/liste/satilik-daire/antalya" class="category-link">
                                                    <div class="category-content-1">
                                                        <h3 class="category-title">Antalya Satılık Daire</h3>
                                                        <span class="btn btn-primary">Daireleri Gör</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 colty">
                                    <div class="category category-vertical" style="background-image: url('../libraries/images/ankara kiralık satılık daire arsa emlak.jpg');">
                                        <a title="Ankara Satılık Daireler" href="/liste/satilik-daire/ankara" class="category-link">
                                            <div class="category-content-1">
                                                <h3 class="category-title">Ankara Satılık Daireler</h3>
                                                <p class="category-subtitle">4.000'den fazla ilan</p>
                                                <span class="btn btn-primary">Daireleri Gör</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                    <div style="text-align: center">
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- Kralilan Özel Yatay Banner -->
                        <ins class="adsbygoogle"
                            style="display: inline-block; width: 970px; height: 90px"
                            data-ad-client="ca-pub-9803073452171785"
                            data-ad-slot="8245524981"></ins>
                        <script>
                            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                        <br />
                        <br />
                    </div>
                    <div class="inner-box relative">
                        <p class="title-2 headline" style="text-transform: uppercase">
                            SATILANLAR  
                            <a title="Satılanlar" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Satılanlar"), "50") %>' class="sell-your-item">TÜMÜNÜ GÖSTER <i
                                class="icon-th-list"></i></a>
                        </p>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="no-margin item-carousel owl-carousel owl-theme" style="padding-top: 25px;">
                                    <asp:Repeater ID="rpsales" runat="server">
                                        <ItemTemplate>
                                            <div class="item">

                                                <a href='<%# String.Format("/ilan/{0}-{1}/detay",  BLL.PublicHelper.Tools.URLConverter(Eval("Baslik")),Eval("IlanId")) %>'>
                                                    <span class="item-carousel-thumb">
                                                        <img class="item-img lazy"
                                                            src="/libraries/images/loadingv.gif"
                                                            data-src="/upload/ilan/thmb_<%# ParsePictures(Eval("Resimler").ToString()) %>"
                                                            alt="<%# Eval("Baslik") %>" />
                                                    </span>
                                                    <span
                                                        class="item-name"><%# Eval("Baslik") %> </span><span class="price">&#x20BA; <%# Eval("Fiyat") %> </span></a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container fadeshow1">
                        <!-- tab content -->
                        <div class="row">
                            <ul class="nav nav-pills nav-stacked col-md-2">
                                <li class="active"><a href="#tab_a" data-toggle="pill">Satılık</a></li>
                                <li class=""><a href="#tab_b" data-toggle="pill">Kiralık</a></li>
                                <li class=""><a href="#tab_c" data-toggle="pill">Sahibinden</a></li>
                                <li class=""><a href="#tab_d" data-toggle="pill">İcradan</a></li>
                                <li class=""><a href="#tab_e" data-toggle="pill">Bankadan</a></li>
                                <li class=""><a href="#tab_f" data-toggle="pill">Belediyeden</a></li>
                                <li class=""><a href="#tab_g" data-toggle="pill">Hazineden</a></li>
                                <li class=""><a href="#tab_h" data-toggle="pill">Haritada Ara</a></li>
                            </ul>
                            <div class="tab-content col-md-10">
                                <div id="tab_a" class="tab-pane active">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Satılık Daire" href="/liste/satilik-konut/istanbul">İstanbul Satılık Daire</a></li>
                                                <li><a title="Ankara Satılık Daire" href="/liste/satilik-konut/ankara">Ankara Satılık Daire</a></li>
                                                <li><a title="İzmir Satılık Daire" href="/liste/satilik-konut/izmir">İzmir Satılık Daire</a></li>
                                                <li><a title="Bursa Satılık Daire" href="/liste/satilik-konut/bursa">Bursa Satılık Daire</a></li>
                                                <li><a title="Antalya Satılık Daire" href="/liste/satilik-konut/antalya">Antalya Satılık Daire</a></li>
                                                <li><a title="Adana Satılık Daire" href="/liste/satilik-konut/adana">Adana Satılık Daire</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Satılık İşyeri" href="/liste/satilik-isyeri/istanbul">İstanbul Satılık İşyeri</a></li>
                                                <li><a title="Ankara Satılık İşyeri" href="/liste/satilik-isyeri/ankara">Ankara Satılık İşyeri</a></li>
                                                <li><a title="İzmir Satılık İşyeri" href="/liste/satilik-isyeri/izmir">İzmir Satılık İşyeri</a></li>
                                                <li><a title="Bursa Satılık İşyeri" href="/liste/satilik-isyeri/bursa">Bursa Satılık İşyeri</a></li>
                                                <li><a title="Antalya Satılık İşyeri" href="/liste/satilik-isyeri/antalya">Antalya Satılık İşyeri</a></li>
                                                <li><a title="Adana Satılık İşyeri" href="/liste/satilik-isyeri/adana">Adana Satılık İşyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Satılık Arsa" href="/liste/satilik-arsa/istanbul">İstanbul Satılık Arsa</a></li>
                                                <li><a title="Ankara Satılık Arsa" href="/liste/satilik-arsa/ankara">Ankara Satılık Arsa</a></li>
                                                <li><a title="İzmir Satılık Arsa" href="/liste/satilik-arsa/izmir">İzmir Satılık Arsa</a></li>
                                                <li><a title="Bursa Satılık Arsa" href="/liste/satilik-arsa/bursa">Bursa Satılık Arsa</a></li>
                                                <li><a title="Antalya Satılık Arsa" href="/liste/satilik-arsa/antalya">Antalya Satılık Arsa</a></li>
                                                <li><a title="Adana Satılık Arsa" href="/liste/satilik-arsa/adana">Adana Satılık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Satılık Bina" href="/liste/satilik-bina/istanbul">İstanbul Satılık Bina</a></li>
                                                <li><a title="Ankara Satılık Bina" href="/liste/satilik-bina/ankara">Ankara Satılık Bina</a></li>
                                                <li><a title="İzmir Satılık Bina" href="/liste/satilik-bina/izmir">İzmir Satılık Bina</a></li>
                                                <li><a title="Bursa Satılık Bina" href="/liste/satilik-bina/bursa">Bursa Satılık Bina</a></li>
                                                <li><a title="Antalya Satılık Bina" href="/liste/satilik-bina/antalya">Antalya Satılık Bina</a></li>
                                                <li><a title="Adana Satılık Bina" href="/liste/satilik-bina/adana">Adana Satılık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_b">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Kiralık Daire" href="/liste/kiralik-daire/istanbul">İstanbul Kiralık Daire</a></li>
                                                <li><a title="Ankara Kiralık Daire" href="/liste/kiralik-daire/ankara">Ankara Kiralık Daire</a></li>
                                                <li><a title="İzmir Kiralık Daire" href="/liste/kiralik-daire/izmir">İzmir Kiralık Daire</a></li>
                                                <li><a title="Bursa Kiralık Daire" href="/liste/kiralik-daire/bursa">Bursa Kiralık Daire</a></li>
                                                <li><a title="Antalya Kiralık Daire" href="/liste/kiralik-daire/antalya">Antalya Kiralık Daire</a></li>
                                                <li><a title="Adana Kiralık Daire" href="/liste/kiralik-daire/adana">Adana Kiralık Daire</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Kiralık İşyeri" href="/liste/kiralik-isyeri/istanbul">İstanbul Kiralık İşyeri</a></li>
                                                <li><a title="Ankara Kiralık İşyeri" href="/liste/kiralik-isyeri/ankara">Ankara Kiralık İşyeri</a></li>
                                                <li><a title="İzmir Kiralık İşyeri" href="/liste/kiralik-isyeri/izmir">İzmir Kiralık İşyeri</a></li>
                                                <li><a title="Bursa Kiralık İşyeri" href="/liste/kiralik-isyeri/bursa">Bursa Kiralık İşyeri</a></li>
                                                <li><a title="Antalya Kiralık İşyeri" href="/liste/kiralik-isyeri/antalya">Antalya Kiralık İşyeri</a></li>
                                                <li><a title="Adana Kiralık İşyeri" href="/liste/kiralik-isyeri/adana">Adana Kiralık İşyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Kiralık Arsa" href="/liste/kiralik-arsa/istanbul">İstanbul Kiralık Arsa</a></li>
                                                <li><a title="Ankara Kiralık Arsa" href="/liste/kiralik-arsa/ankara">Ankara Kiralık Arsa</a></li>
                                                <li><a title="İzmir Kiralık Arsa" href="/liste/kiralik-arsa/izmir">İzmir Kiralık Arsa</a></li>
                                                <li><a title="Bursa Kiralık Arsa" href="/liste/kiralik-arsa/bursa">Bursa Kiralık Arsa</a></li>
                                                <li><a title="Antalya Kiralık Arsa" href="/liste/kiralik-arsa/antalya">Antalya Kiralık Arsa</a></li>
                                                <li><a title="Adana Kiralık Arsa" href="/liste/kiralik-arsa/adana">Adana Kiralık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İstanbul Kiralık Bina" href="/liste/kiralik-bina/istanbul">İstanbul Kiralık Bina</a></li>
                                                <li><a title="Ankara Kiralık Bina" href="/liste/kiralik-bina/ankara">Ankara Kiralık Bina</a></li>
                                                <li><a title="İzmir Kiralık Bina" href="/liste/kiralik-bina/izmir">İzmir Kiralık Bina</a></li>
                                                <li><a title="Bursa Kiralık Bina" href="/liste/kiralik-bina/bursa">Bursa Kiralık Bina</a></li>
                                                <li><a title="Antalya Kiralık Bina" href="/liste/kiralik-bina/antalya">Antalya Kiralık Bina</a></li>
                                                <li><a title="Adana Kiralık Bina" href="/liste/kiralik-bina/adana">Adana Kiralık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_c">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Sahibinden İstanbul Satılık Daire" href="/liste/satilik-daire/istanbul/sahibinden">İstanbul Satılık Daire</a></li>
                                                <li><a title="Sahibinden Ankara Satılık Daire" href="/liste/satilik-daire/ankara/sahibinden">Ankara Satılık Daire</a></li>
                                                <li><a title="Sahibinden İzmir Satılık Daire" href="/liste/satilik-daire/izmir/sahibinden">İzmir Satılık Daire</a></li>
                                                <li><a title="Sahibinden Bursa Satılık Daire" href="/liste/satilik-daire/bursa/sahibinden">Bursa Satılık Daire</a></li>
                                                <li><a title="Sahibinden Antalya Satılık Daire" href="/liste/satilik-daire/antalya/sahibinden">Antalya Satılık Daire</a></li>
                                                <li><a title="Sahibinden Adana Satılık Daire" href="/liste/satilik-daire/adana/sahibinden">Adana Satılık Daire</a></li>
                                                <li><a title="Sahibinden İstanbul Kiralık Daire" href="/liste/kiralik-daire/istanbul/sahibinden">İstanbul Kiralık Daire</a></li>
                                                <li><a title="Sahibinden Ankara Kiralık Daire" href="/liste/kiralik-daire/ankara/sahibinden">Ankara Kiralık Daire</a></li>
                                                <li><a title="Sahibinden İzmir Kiralık Daire" href="/liste/kiralik-daire/izmir/sahibinden">İzmir Kiralık Daire</a></li>
                                                <li><a title="Sahibinden Bursa Kiralık Daire" href="/liste/kiralik-daire/bursa/sahibinden">Bursa Kiralık Daire</a></li>
                                                <li><a title="Sahibinden Antalya Kiralık Daire" href="/liste/kiralik-daire/antalya/sahibinden">Antalya Kiralık Daire</a></li>
                                                <li><a title="Sahibinden Adana Kiralık Daire" href="/liste/kiralik-daire/adana/sahibinden">Adana Kiralık Daire</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Sahibinden İstanbul Satılık İsyeri" href="/liste/satilik-isyeri/istanbul/sahibinden">İstanbul Satılık isyeri</a></li>
                                                <li><a title="Sahibinden Ankara Satılık İsyeri" href="/liste/satilik-isyeri/ankara/sahibinden">Ankara Satılık İsyeri</a></li>
                                                <li><a title="Sahibinden İzmir Satılık İsyeri" href="/liste/satilik-isyeri/izmir/sahibinden">İzmir Satılık İsyeri</a></li>
                                                <li><a title="Sahibinden Bursa Satılık İsyeri" href="/liste/satilik-isyeri/bursa/sahibinden">Bursa Satılık İsyeri</a></li>
                                                <li><a title="Sahibinden Antalya Satılık İsyeri" href="/liste/satilik-isyeri/antalya/sahibinden">Antalya Satılık İsyeri</a></li>
                                                <li><a title="Sahibinden Adana Satılık İsyeri" href="/liste/satilik-isyeri/adana/sahibinden">Adana Satılık İsyeri</a></li>
                                                <li><a title="Sahibinden İstanbul Kiralık İsyeri" href="/liste/kiralik-isyeri/istanbul/sahibinden">İstanbul Kiralık İsyeri</a></li>
                                                <li><a title="Sahibinden Ankara Kiralık İsyeri" href="/liste/kiralik-isyeri/ankara/sahibinden">Ankara Kiralık İsyeri</a></li>
                                                <li><a title="Sahibinden İzmir Kiralık İsyeri" href="/liste/kiralik-isyeri/izmir/sahibinden">İzmir Kiralık İsyeri</a></li>
                                                <li><a title="Sahibinden Bursa Kiralık İsyeri" href="/liste/kiralik-isyeri/bursa/sahibinden">Bursa Kiralık İsyeri</a></li>
                                                <li><a title="Sahibinden Antalya Kiralık İsyeri" href="/liste/kiralik-isyeri/antalya/sahibinden">Antalya Kiralık İsyeri</a></li>
                                                <li><a title="Sahibinden Adana Kiralık İsyeri" href="/liste/kiralik-isyeri/adana/sahibinden">Adana Kiralık İsyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Sahibinden İstanbul Satılık Arsa" href="/liste/satilik-arsa/istanbul/sahibinden">İstanbul Satılık arsa</a></li>
                                                <li><a title="Sahibinden Ankara Satılık Arsa" href="/liste/satilik-arsa/ankara/sahibinden">Ankara Satılık Arsa</a></li>
                                                <li><a title="Sahibinden İzmir Satılık Arsa" href="/liste/satilik-arsa/izmir/sahibinden">İzmir Satılık Arsa</a></li>
                                                <li><a title="Sahibinden Bursa Satılık Arsa" href="/liste/satilik-arsa/bursa/sahibinden">Bursa Satılık Arsa</a></li>
                                                <li><a title="Sahibinden Antalya Satılık Arsa" href="/liste/satilik-arsa/antalya/sahibinden">Antalya Satılık Arsa</a></li>
                                                <li><a title="Sahibinden Adana Satılık Arsa" href="/liste/satilik-arsa/adana/sahibinden">Adana Satılık Arsa</a></li>
                                                <li><a title="Sahibinden İstanbul Kiralık Arsa" href="/liste/kiralik-arsa/istanbul/sahibinden">İstanbul Kiralık Arsa</a></li>
                                                <li><a title="Sahibinden Ankara Kiralık Arsa" href="/liste/kiralik-arsa/ankara/sahibinden">Ankara Kiralık Arsa</a></li>
                                                <li><a title="Sahibinden İzmir Kiralık Arsa" href="/liste/kiralik-arsa/izmir/sahibinden">İzmir Kiralık Arsa</a></li>
                                                <li><a title="Sahibinden Bursa Kiralık Arsa" href="/liste/kiralik-arsa/bursa/sahibinden">Bursa Kiralık Arsa</a></li>
                                                <li><a title="Sahibinden Antalya Kiralık Arsa" href="/liste/kiralik-arsa/antalya/sahibinden">Antalya Kiralık Arsa</a></li>
                                                <li><a title="Sahibinden Adana Kiralık Arsa" href="/liste/kiralik-arsa/adana/sahibinden">Adana Kiralık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Sahibinden İstanbul Satılık Bina" href="/liste/satilik-bina/istanbul/sahibinden">İstanbul Satılık bina</a></li>
                                                <li><a title="Sahibinden Ankara Satılık Bina" href="/liste/satilik-bina/ankara/sahibinden">Ankara Satılık Bina</a></li>
                                                <li><a title="Sahibinden İzmir Satılık Bina" href="/liste/satilik-bina/izmir/sahibinden">İzmir Satılık Bina</a></li>
                                                <li><a title="Sahibinden Bursa Satılık Bina" href="/liste/satilik-bina/bursa/sahibinden">Bursa Satılık Bina</a></li>
                                                <li><a title="Sahibinden Antalya Satılık Bina" href="/liste/satilik-bina/antalya/sahibinden">Antalya Satılık Bina</a></li>
                                                <li><a title="Sahibinden Adana Satılık Bina" href="/liste/satilik-bina/adana/sahibinden">Adana Satılık Bina</a></li>
                                                <li><a title="Sahibinden İstanbul Kiralık Bina" href="/liste/kiralik-bina/istanbul/sahibinden">İstanbul Kiralık Bina</a></li>
                                                <li><a title="Sahibinden Ankara Kiralık Bina" href="/liste/kiralik-bina/ankara/sahibinden">Ankara Kiralık Bina</a></li>
                                                <li><a title="Sahibinden İzmir Kiralık Bina" href="/liste/kiralik-bina/izmir/sahibinden">İzmir Kiralık Bina</a></li>
                                                <li><a title="Sahibinden Bursa Kiralık Bina" href="/liste/kiralik-bina/bursa/sahibinden">Bursa Kiralık Bina</a></li>
                                                <li><a title="Sahibinden Antalya Kiralık Bina" href="/liste/kiralik-bina/antalya/sahibinden">Antalya Kiralık Bina</a></li>
                                                <li><a title="Sahibinden Adana Kiralık Bina" href="/liste/kiralik-bina/adana/sahibinden">Adana Kiralık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_d">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İcradan İstanbul Satılık Daire" href="/liste/satilik/1/daire/8/#/istanbul/icradan/_objectdata_U2FsdGVkX1+xT75jUG/v8AT0ENOZn2xl00sRTbfNGtjoJvVznOnNv9IiHTVPrCaiSBsUpBsagQcaURLhxV7k24/OkqpSPHvKR1GbHENWG7R+HJDrYRif3F+QQQ41xk6E+d+pmxOUvDQ4V01sBbKeLgqrdQwkXD1V/tKVblbDSC2lRVMvccb4U8b+o5eXwsWLm5HZ+kbY0ARcdC1ah+4FiyBmjQSPKCagbHXaD6Z6xQg=">İstanbul Satılık Daire</a></li>
                                                <li><a title="İcradan Ankara Satılık Daire" href="/liste/satilik/1/daire/8/#/ankara/icradan/_objectdata_U2FsdGVkX19gnx6HYznah0L5rVgsR9nAbYWoqfKMnI1lGp9Ibtra96C+2K0RHyr49f/6AwTgvfyTpyz25jAUAaIsiXO1phr/h0Q7hkP0JmYHziz9vVZ9icj6MCuxgVIF7hFkzo8qxEoJg1d8uKBhK7jDQ1Eomp3Wp0itsrh6PlFPYwlybR9LB2mFqQV6g1X0whDaU2YmzHX7Ifjoh/iK7vL6AcMvutqVZG/yH4b4Ank=">Ankara Satılık Daire</a></li>
                                                <li><a title="İcradan İzmir Satılık Daire" href="/liste/satilik/1/daire/8/#/izmir/icradan/_objectdata_U2FsdGVkX1+TccHruCvCpBZqm+rqtxxFNtailxy7bFHYaUXqJve3FO42ztj2yHANLn9dPSXr9/MweiCZdwzHbIVnw1JsPYtBT/7YWaBwRUfvxuTowGAeNUaiTak1O+Z06D/EBiymzqoUFfN9ns9TAwJ6DkKtL74MEclLXgw3bklQ2orhOKwbGslFgj0UI5aPp1CQyw5EtDK0Rza87rSlCQpbwSPLgk4Q+ZaeJyMDpJg=">İzmir Satılık Daire</a></li>
                                                <li><a title="İcradan Bursa Satılık Daire" href="/liste/satilik/1/daire/8/#/bursa/icradan/_objectdata_U2FsdGVkX1+q3MF+OkV7+9Df69c+60RcFHU7bFS/ltiBEJVdw5NZNa0BwARs+WbMVV6DZC5eD5PWUSCiP6uEMJNR+z3WibvhZYYN9P8Lqba5STPTmHKI65/HXql0Lal3HMoOVFt+B00F+q+cdFVEEkxaLEPj03khNcUF4aWHPN0N4dkzxB7GhlCvwSGL1fSKMTUS62asJ1W1jQcZvsyfxdWyLltxau/MAYUH3HwGnEc=">Bursa Satılık Daire</a></li>
                                                <li><a title="İcradan Antalya Satılık Daire" href="/liste/satilik/1/daire/8/#/antalya/icradan/_objectdata_U2FsdGVkX19GnOD4ztZ52Z4mimbW6zUkvGwgLi2YySGJpzJxdf+VUOnKhHE5C0iPoZ8DegZVY3e873CABD/KgYfPLMo7B0m/DaUc3Du4QRiWX7aUJuGQ6M+MD36uwOxNhBraNq0uDeTqszKvY2fBJSr+MdfAevjWa/zbTck8TyoFI5eKGFu8f4/yRG6xcDwHeTgpKeA2dxCJ5UZOQbhoB97zAPLq4QYSn2mrGDh7ysU=">Antalya Satılık Daire</a></li>
                                                <li><a title="İcradan Adana Satılık Daire" href="/liste/satilik/1/daire/8/#/adana/icradan/_objectdata_U2FsdGVkX19mYmMzO68D9yGoX0AypIYom5sYYtciKX5C60B/a1agDbg/aKVJYvkjZQdWHKaBC7/uINl8lF3cElGL9la4Y4t6Hzcl2fD0XqORDjh4XcC1+Ayq0I4ipnf48Gyk4J1AyfUh/uzF3U/vdKbwvSsevIAzdlPM7366FNOcLD15+2cSAh+8+Vd+wPJb/tixetV2owfRHFgQWRtchEwh6uK16HBThpV6vgroKG0=">Adana Satılık Daire</a></li>
                                                <li><a title="İcradan İstanbul Kiralık Daire" href="/liste/kiralik/2/daire/8/#/istanbul/icradan/_objectdata_U2FsdGVkX19I0L45rfOLXHadLeegDcknv27GmQNU8v5i7JPVqcbyLQ7B3nY/nA6XHxwis+UZm8ZMfm8ncq82m08jePmVhs02rf2YGLVjd90ajavaTQ68VnrUmLPZulmm0FMMI76P1FNRiCXVPtlKBfnqj+aYSRZBnfPRBmUETySx2Q7NxJyDeiERiQFbTwFUsX6OjhgTromisDtrBqMXe6rVuVBQbczg9REnimSG6bs=">İstanbul Kiralık Daire</a></li>
                                                <li><a title="İcradan Ankara Kiralık Daire" href="/liste/kiralik/2/daire/8/#/ankara/icradan/_objectdata_U2FsdGVkX18q6rEGwRCZfZndSF5MkN9vfkUQHJbLNnWftM9ffJkLwEeBuOUrCGfmDIjEdAKi+goTAiI2GnImawGm0l13qkd5NNCGTClCRZ9ngsdv6GntmQ/Rha8ECLbMOLzveRDZLyMA/G2ZK5zJwJ0pK76poVgyWjuVinzGzsOk/UHHZj9Eug6/iu3Fqf8+TdWFaY+5NxRfOyh7ofWlFCZSp2KWLtD6tc0fevsZlsc=">Ankara Kiralık Daire</a></li>
                                                <li><a title="İcradan İzmir Kiralık Daire" href="/liste/kiralik/2/daire/8/#/izmir/icradan/_objectdata_U2FsdGVkX19Fq193lBMz4RJ58jXa4vaROt59JXXIOdG0pWtakd97BaFOOPaFgR1K5jzlD/ZBCxng6NjkucKWty99y9m8ZKlotZjh5Iw0rs9//Okp+jZSmS0WaJY/v2ccwlv8UeXan0aZu0UMIyU6aqZ/E0BOdUf2XdnLP8JJHhZoVlrgeJPbP0lJ2t+HjJ0rylg5dKzdKFRZcuASpDMfKHsAhYRh2s7DVMHdsW9QCcs=">İzmir Kiralık Daire</a></li>
                                                <li><a title="İcradan Bursa Kiralık Daire" href="/liste/kiralik/2/daire/8/#/bursa/icradan/_objectdata_U2FsdGVkX19rP8s5sZ8bb0luvJSzFd5j2kwU2kBSbqesZsF9qJOuRVXfU9aae23iNiVyWjeWdhgMhuUuoRXAiWjLtgSS/cN9F2/C9ef6Pn8soD0+vXv73rzcRpdZ833yr5kdkdtMHrfMPFDTm64iXeFogvELYS9xhg/6Z6alNti7pkFScAce7eDzuFlh99exzWjYQORQmWlgrsXsHxlLR+K2PbDhnLEdn3Myylx/fIs=">Bursa Kiralık Daire</a></li>
                                                <li><a title="İcradan Antalya Kiralık Daire" href="/liste/kiralik/2/daire/8/#/antalya/icradan/_objectdata_U2FsdGVkX1+21rqIZczzpyCmy0YbVoadV+SHNwgd1Ut7WmrbzWyc63R1qYVGfUHjDIGuS2gSDAM3G4J6e00SNLO31uun1OVf8OTDEu2YR4MF9Ehklc8Sr/bBDt0yjZmEEs5UPYoaOkaluId4ixMGsKMjDiCP7XCf6j9nxRtaqxry93YzOOu8/INylKubF6NW8FkTyPlnSU9KyEChwil3e9EBKrr39nh6yL5sC2jJDns=">Antalya Kiralık Daire</a></li>
                                                <li><a title="İcradan Adana Kiralık Daire" href="/liste/kiralik/2/daire/8/#/adana/icradan/_objectdata_U2FsdGVkX1+vb5kbLq6KhSoeeW8Q5RvXhwn1uOKOUyHHWjjFI4hGqzympOIX9jLBktvXMBainTJkFu+tL6zbl6rgVSpQTE9lZdWS2e6WBf0dwScJwT1n5UdKNLKxiFMkGZu4H4oSj9Ox/bCuRPSglA6Mh2Mdzcjb8I4J3EspCnGLlORtgQtvy8YVEVI4trTjkmi6pVnLza251K7IOFHb1V0g3RSIVztLJNZCWmwHy9c=">Adana Kiralık Daire</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İcradan İstanbul Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/istanbul/icradan/_objectdata_U2FsdGVkX1+rOuUFnrjUzeOETBkRWfujAMqkQZtCHb6ZErjSVqA/gFf7D6DbwxoURnF9oH59J8w5H3pyF7XLWAS2TH4D361AbYsuIHmTnXoYdaMrq1zjOxYC2Nl7VvFKVFNhUX7Lvs9tZ4gE/4cWczybtBwoQl+QnI1VHuW1grBVGBTY61CX0GGQ6LWG/JZC">İstanbul Satılık İşyeri</a></li>
                                                <li><a title="İcradan Ankara Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/ankara/icradan/_objectdata_U2FsdGVkX19LO/bZnx2Wx4WFfEQvSD+kX3/PKQi9dNQ9yG3ym4MdtSacg1ljFpGzGheYPBMVd2GpNYItZC7GiQYPHZUzMF9CD4GsYoUSIaNfQy+okzM8s+RRTPDT4QE0aFnXvHBtY5ERTEv2l1dL7NRKQbRzfV+dMo1g+hQBslGWo06YegsQGL2i3hbaRnYq">Ankara Satılık İşyeri</a></li>
                                                <li><a title="İcradan İzmir Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/izmir/icradan/_objectdata_U2FsdGVkX19dakIHWe54Zr0KrMQIkQYeyQeXnOhXvgNX6RBc7EvlhDRrHV6wnAnJC2jx9Y3/gsb8xpear3LrQl69N7qN62ElO00ynkBXznlGGQF/os0FFtLaJNvvcTD1zoAQsIYMwo/scBzV7m4z8JocE0nFgmJYf6xK2MY8zONYHasm0ko0NOBbq5PkN4Bn">İzmir Satılık İşyeri</a></li>
                                                <li><a title="İcradan Bursa Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/bursa/icradan/_objectdata_U2FsdGVkX19ImiQeT6EpVqRT5efV+4FmTtfidrAh03rgACI6qe+sPsIpCT4Gi24Sf6V7FbwqWIvcgk7tYTYB8/xuw/5hsWEchxgEszUi5Tz3cWIe69+OLGi2IMIID1B6tjz4T9V+4bxdswFNPBUSUiJJnZeL6cIuQ6LOLtM5Jt7Wkd3i9k1fH5UiQ7zecXlV">Bursa Satılık İşyeri</a></li>
                                                <li><a title="İcradan Antalya Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/antalya/icradan/_objectdata_U2FsdGVkX1+gSJeioCi0+27ve/ALQDs9/2gEE9C3Sxxu9JsH5YYhbZyAgjwCbeLhhAFhJ+pInwcRjuFpsfcyBiSB5mQrGGEobvLxiIY4a/1yp75VCOIl3Mt16EDcbNHdFjpEW+5nPODprmguWE0IC+xslnbVxXXjqdCQBvX99Ti8mwIs9GGlWoeOuqx+T1N6">Antalya Satılık İşyeri</a></li>
                                                <li><a title="İcradan Adana Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/adana/icradan/_objectdata_U2FsdGVkX1/KjJoVSYjZy0egSqzLMPR1zeJrJoUMzEpk9d+IySGpfuiPUfDHwNdNss6PisDbMCWHACfJ/c8zW0l6mfFLrHASQfQ7saMvBEcYIAz6sFapB8EIEIv2TJW10MjWD943Pnb5AoTRtlbDyFyPJ2zZcYO8Moc31giK4YfIM5ouHwIYH+VPdLYL/KBB">Adana Satılık İşyeri</a></li>
                                                <li><a title="İcradan İstanbul Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/istanbul/icradan/_objectdata_U2FsdGVkX1+l6l8Za9ZlQiuuIHYzPfc3V5MqKm4QkrXEW18UbajQ4z832B5ioAKUvH9EIT4hSnwOI01TtHXFOJQ8YzP5uUGdbWNr++Xgb3GEIKos8dPKjl0Tz2KAwSxZ8MuZMwrS2x5maSIB03vf1uEY8DhAHTjHOiahSET7JkNgV3XvYJi9kf0Q5Ma5dgxr">İstanbul Kiralık İşyeri</a></li>
                                                <li><a title="İcradan Ankara Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/ankara/icradan/_objectdata_U2FsdGVkX18vHfQbuA053nHrVN4eSxab35WwF1NVqkOhpy5+cX0aBEJfZhEWO82QD6vkL9fBtZOX9b9AO9Ry87eCln927glHXqdVRjMYnhRPt+Eh51HVkpF21DUo2MZXCTH1+Qkqquuu1NZOL83wYvBo8hRSPL1sM3Jy/YlfAT6UShOiGJdL/rlMU+r4OTdH">Ankara Kiralık İşyeri</a></li>
                                                <li><a title="İcradan İzmir Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/izmir/icradan/_objectdata_U2FsdGVkX188SQFHStx0ujl2lEZ8Bmqr3WYy5y4SgiuHoMHvTzXCT2eKJE3h2AGDNsT2e0dbsZFiuVv/uholGJIA2VfL+lXlh6kc9iVWrelqQg5z5urv5aFxFK1Eif1/IXqCAQzpjXHQqWn+khV+8nKl5KTreH8EQH221SG+XXQElsm9jjrOtNr4/fMjugyX">İzmir Kiralık İşyeri</a></li>
                                                <li><a title="İcradan Bursa Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/bursa/icradan/_objectdata_U2FsdGVkX19s8reRZmZQ8uaTiJyCvfPu+2rBeytELebAQMd6uC3Pilwlactn4ank2iEwAF1mJkz7W+cd0E8BNEu1cxoL9adfjeEWItVD7XU+AR/9W7HDlpUaEIU6mIeX6EP+EiL4NtKfkUwyVT2BaV0k25+pKOGZfGgbwYg4clNak7lxgRX5cI6yyDfPHWDZ">Bursa Kiralık İşyeri</a></li>
                                                <li><a title="İcradan Antalya Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/antalya/icradan/_objectdata_U2FsdGVkX19Yu4DQwqZDrd8mzRArFYRjMhWIzT5nVEp/Su593fvoW4nirbiucCcel/eMAtD8I/gN7HDhgeIhZ2CcMe8r4GhII6R7eE1y6WDeZ2hl/fBkF0q2ArZ/o8duDtXwyeTqrTu3OOjyky4rBdWlMTKWALAp0AF+snXILf82L35uGguF7gCuEJaMcnh8">Antalya Kiralık İşyeri</a></li>
                                                <li><a title="İcradan Adana Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/adana/icradan/_objectdata_U2FsdGVkX19w6KzgwHmAAK0kFFySMRtw5+4uA6RTEF9Vl3uvSvzjKg0O0iOK7BZnyiZWciXajLIA3K7fJx4XfXd1TUP0Edm7XWqP2n5pRovl4aJmfoPeLL1AiDCf/qrXerUBWY+6+e1ymiE66exFcfvWbJ+mToJEU+ydJwk4ThpRvgGeiVd9r5GB4Yi2bEuU">Adana Kiralık İşyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İcradan İstanbul Satılık Arsa" href="/liste/satilik/1/arsa/4/#/istanbul/icradan/_objectdata_U2FsdGVkX1+seXBRPJVSGac3nli5zO3FqchLDbV9/XH5/Nv7elVvdnnl1FTCXJVTCiiiAAOlee+lc0wRrOFBEwlgVPZIWLt5ZtMMy9UTfH9e54H6g8C3MxiO0i7V7hbgSimKOiL4ktByApHl0WJoZMHtfMw5VGyBy4ZxE/4uvG9z25iu5e8bZD3v5JRfZ1xLU7pRlEhxV5hMAgeYd8j1hbtR81SmFiCAShdGuQXZrJ+eGLlc8Kdq1R6oo/G2C04L+4JQqS27y8SVgZEuNd0smn1VzB8IsHtrWUFdgunl8NSrrbcMCx7JTBlVpyT8IcTw">İstanbul Satılık Arsa</a></li>
                                                <li><a title="İcradan Ankara Satılık Arsa" href="/liste/satilik/1/arsa/4/#/ankara/icradan/_objectdata_U2FsdGVkX19kR7U/bpRrdhLmGbPUD/BTiEpSacWLjExjguI5Kc8fPftTgji5qFq4g+3KG5D9Uy3DzF1BySEg/tV95Ok3SrRNZrG1HA69zgup54s+q5mOpKsN6ZNvn9GXf11/rouukc0BuWxL0runapY/cJIYdk6HZMj4RC1cNXsYOjN+U9WT9EFSHCUUehukvcgxLT3+9WFW9Ll4VMYf6PWjuPcwSYCFUnn1a9OMlljCT4/44f7kcW9r/m3Tz6Jz0VnNPlgn58ppo4XvDxsta9vH+7VFz7EuNU138OCT6SNWDxk+ZqtjipJTUuI1UJGb">Ankara Satılık Arsa</a></li>
                                                <li><a title="İcradan İzmir Satılık Arsa" href="/liste/satilik/1/arsa/4/#/izmir/icradan/_objectdata_U2FsdGVkX1/AWRMiXx8wXJm1fwuku/ZSFBHaVGOKqzHgEzXHRcmSgd+aii85byvVn6kvv1iZDeIfj8ewZWwz14k6kaZ+eEicKDwDuBSMsq1HsvKb8sm73v5EmTXV4yYVZGq8UU5F7/DdwoYqbvWPdbboQrZFVfioH/VnuPMSeDsBScow3AqObvEYY4d0L72bnrf5Heofqd3ucN6MmBFGV/2ZDWKnW/WHB1pM2HRYP93FafEfLXuEMWxtA8iyj4sbm0Yqh2YiYVbxD6Yhj1zUcghwDu4pSrIQiPYA3wuq8qbW92SSiiV9YU9KnMaDaEpe">İzmir Satılık Arsa</a></li>
                                                <li><a title="İcradan Bursa Satılık Arsa" href="/liste/satilik/1/arsa/4/#/bursa/icradan/_objectdata_U2FsdGVkX1+WZyTAw267kLlh/BTUzzYf0slB9GqDKWfY/pKWnvtrYM/WcwpM41VVwnV74VZWOFr/T887+QCsqkth9xdj+9VhU5kgwvMdEiP4tj8LOl3K0Fi8miacjjsecosgacQ3kmNVT/JV3tWxGSRFSUwnDM18XTH41dORZHTkwcoSSR3hjs+VakBXFn7wLXSfEIPMGoe+4F9QNfuaowNxEzzGei7tSCzIhqibxpoTqHBBzynx1VD3mBfrpQ3NqyqMFVG3dRs5dLPq6MX65z7K3z4B6+ozwa5ZwgJFYSW26u7MtSYkBaXvkV7dfoGI">Bursa Satılık Arsa</a></li>
                                                <li><a title="İcradan Antalya Satılık Arsa" href="/liste/satilik/1/arsa/4/#/antalya/icradan/_objectdata_U2FsdGVkX1+mHovyRaq/ZLwVsOHHMetznaaWETuq3+cJ6deRKuEm2bNYQPf8pXB0Lc/ESH+fa13/raaN/BKeLGhXVK+SWV8+ZbHCh7R0UhvTgUZsN7aRTRdoFLEag5JmPkzvVpJQwsThaTcx4ZnV0ehfjRCfNLxd58d8h9mu13CQ7UkFuwYZ2m21CXFYCo++pO4xXD2aAYxd4bOZiWtvy5aMPvQ95ev2YRP7dMezYCjY1wv1N7IWf6I7RuMaMGCM4U/MSGhbT/9XdVYPeYZKH2M9LLJokSNmfTpZ0bqDPydezG+4NV/1x3ekjE1hBVNh">Antalya Satılık Arsa</a></li>
                                                <li><a title="İcradan Adana Satılık Arsa" href="/liste/satilik/1/arsa/4/#/adana/icradan/_objectdata_U2FsdGVkX1/QtCbprMRG0wCZ3DjSpKSYyvD8llcfi3KQY7iK77gBpYsuwUK8oQdz4SSFKXolp6kZys+EIiQcqpopOPNmg5pMVOchOnvOHjabUhplkvKWO4YCW0quCPep52RqRHxlGGcURFNLOUqM7rOYZ+huqgtuCaN94ps0nt7QTFSI9PPvqjCQx82/W95fthqFDpg5KZi7I/vFkar3zzpaRwviMB85u6mNAvP06M40bDqCkYIZEnjWCxTm4bMIJBtVI0e/+R8RSNJzmGRp9s2+ScWoEY9JF65x1eVokSz+ra5ZkcLG6s6DhH4iIni9">Adana Satılık Arsa</a></li>
                                                <li><a title="İcradan İstanbul Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/istanbul/icradan/_objectdata_U2FsdGVkX18snj2wTjL5MqclusuJtvGogS78m/urpx9nIF5tZV3ePdIKzDE51rQ7mOFxL0n4p+NUKisztzSQe5gShFm4+jcNG2Go+m2bFvL3Vj0qFEgbetuSUz6gtqHxmVn1OcP/yUBXJCiszeP/vFtpMJViPSHs2DaZJUgZppo2WGLyo+swQvzrYKER95C6qRcHFBFs7TS0lzevRvvvVae6xmcsNFEsBO7E7g7WMB7ecbM0nXBTnTZ7IyqRtJCEtQbEBpL/idj9VDttHsgDX+9U6rl42i3Wq8zQyrpdEo4ZoaAALJVA5R/hduntr+lE">İstanbul Kiralık Arsa</a></li>
                                                <li><a title="İcradan Ankara Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/ankara/icradan/_objectdata_U2FsdGVkX19WUY1CqBulvqYOHjw22TWateDzkGvnIHcByGXm2Ra8eHQcC3b8wPmo67Brb6gsSXpLB+GZ6SerFirI7nTyzXABOyuvsUBsrQisT3PYrd20nAJ9QLzGh79i0htx2OC/22Xta+ALJ/xEM6rCFHamk5wNzQz7Mffl/oDxhWUak+mZGQAGs2pYdIBocxJJgvGMQxCl2eGh8Pu+qDhaYXRU3WVFxexx5cpelRgH98g87JfVtKHOF2iqoSEcfUfCTQmNzD6wxvD0xDdoms8aIZp5dT3lA37k4vJ6e8Ux84AVX6vlIEeKwbHaaA2I">Ankara Kiralık Arsa</a></li>
                                                <li><a title="İcradan İzmir Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/izmir/icradan/_objectdata_U2FsdGVkX18rW4DlSObdfHqn4x4ZKrWlHXCjjDDLEVFXGPsU9FgEuceqney91qnEsWe8hJuWOpoFOqgJCWozlTGVrBfYXzLBbxE3tyF2ZDcsY37YHHukpKJCJDDeuqx3sE+rShBX4l2rao1ouGgrR5rJq+QkZEKD+MQHYpQ1+dHn+X8rs2UCUPFx45ldT+DEPdRlrN39SpsfC3UlOlWqSCrrud+T0b7qsfZKRKKPF5vDLNTZdMq4iYB2103vJoEhYY7hPtGywMeVdf+R/bm/A9XUePCm3mfzwcqGP5qBKOiQaErR5DQ/p4G+axuNi//P">İzmir Kiralık Arsa</a></li>
                                                <li><a title="İcradan Bursa Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/bursa/icradan/_objectdata_U2FsdGVkX19nzAcavc/2rJ5ODO2lBOLG3IfJihTNfErUnkhZm12itgpdAaijse0uilZH+cvGa9Gd/dWc3ZOwBeVSQtTjgXUIHwnziROkdjKKMOVHZa3ZIG3v60Tit4/ZdvgLsDJXsFT+Y14x1RuONiDj1GyPJeXFgh7yPrTy46swZUTW1HPbUBOKzIzNVzMWPjg8M1NMaailYPfBjJ1RJQpDEylXGz+5WHl9IvuYZmTf3WM74Og/8yHvcgUCh0VMTAyq2olcfVK9ieMIEDLT7WiT+KNRcA1gI/w0zYcN6DnIQRQNLHmnXJgn65h/of7S">Bursa Kiralık Arsa</a></li>
                                                <li><a title="İcradan Antalya Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/antalya/icradan/_objectdata_U2FsdGVkX1+xydm5UdR4tDbLmVkcdxom4r/eNlLIVePU+Ez3eaYDiSkx0KViIQFCK5JT/UkU+1x3N9UA2TBleFdOygNfmkLD8qh91FYv12UPdfar7c4/d1CrU+yKubpSPjC+y6KIc2LxPCaYUkwjvGxXXwVrVLr7v7Hl3cmXSxFLjQ6RmFosGkNEWJp6bv5bDddfBRLHTpK8DkG3MLYEfAPZpUXtNE0jHQrXaga24YGipLmOt7QJyRuxarJXUKDFcBFVrNIpdLgdU7tn1wibO7xLfblZ/ZNh/jXgmXYu906CpKNOlnNH6yxlzK0ayDnl">Antalya Kiralık Arsa</a></li>
                                                <li><a title="İcradan Adana Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/adana/icradan/_objectdata_U2FsdGVkX19jyV8qnAXtb/BAyxQhqtKVW4RAPyzjkQzHmWYqWZV5Jcoif98ZLtuyPw6wuJy6aNyl60DcBFefqlfjjROSZtmL6iB986j5JVad1ks+4muDbpGUHmhcwY9w2tNWJ8qMnx4y+wcUYkzF3Lf0amnNibOXovPpVOa9yheS7g6lJBD9pSMe9fnzPyN4RC09Q+fPAm0yej7cRGplv9qCwodZw0Xtaz9wQJ91T3/zz1Z5EGPMuFqF9/LsE4bCZNPuDnyvCf8ULAR1s6fPuQ121jjvB6LMgMpSEHMeSP9M1juhc16rn3RO02ZY711v">Adana Kiralık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="İcradan İstanbul Satılık Bina" href="/liste/satilik/1/bina/5/#/istanbul/icradan/_objectdata_U2FsdGVkX1+QQSjeyFpFJ2xSCOnyjRY+OqdxHL4feamv88Rq5w0lYllVXQ7KZVZ3RZu+IgkHhEpyTbQFHLtIqBLvqSmlIGZodcuMQhudUq/uGbu/gzSDt05N7Hxp/3JiBKR6ztTi8+OWmKVltSc5PEyxy50kL8M+6L+W5ADwvQ4soPaDwhi3xkhyMkYIby9IYP0t+f08+E4vtxS4Wr/ksN17we5yQrnTWHVT765rqACkJWRQb15crFLVDY7lgQAxx0WFVpEesKI3A9O1H3GKCA==">İstanbul Satılık Bina</a></li>
                                                <li><a title="İcradan Ankara Satılık Bina" href="/liste/satilik/1/bina/5/#/ankara/icradan/_objectdata_U2FsdGVkX19s6TDemPedMIdBiTiUI8rcZVrU4mgvG0FMjV3qLEa+Wimnw6uiA6+d89h3qGzmt8TkcRpHWZhkBibih/ooKJ+cEhms5NARgXtZu9bolTU3FayVMTbzQZUSxdrjG/YKdRWvD+qhYXerUDc8ba7RjRbkHRWzV2yYC68DWJe3ehk1NYzSfE5r9GTMH+QUoWcy2a2m0kVgcF27fXLiCqOHAkrgBYnaI4MymsCZXc1AC4VtvLap2USAtN+9ngAysOBRkiq8ZfAXJeaJQA==">Ankara Satılık Bina</a></li>
                                                <li><a title="İcradan İzmir Satılık Bina" href="/liste/satilik/1/bina/5/#/izmir/icradan/_objectdata_U2FsdGVkX18sTAIINxh4zYDP4R6I3s9N1I7f37npDRS0h777DaVxG7nsFGKcR8pTpL4YfKFLKtJAZ1Tks8TPwZ+KSg609xaBbZiJShMRobExBiI25UWHY93ngPBQ05rO8LTmimgydvC4fIHGMDadUlj0ESlN982QGmRESMoQJO2Pnr/1lXakJ/Q3ZGtTVD7rD9DPn6+VjEudksmucmQS9nZScjvuLYjGUHjHvAK3b4sEsrNGlUjIJNw9kApUYoRSsv2/bfOvYCMRBvXjJ9TiSQ==">İzmir Satılık Bina</a></li>
                                                <li><a title="İcradan Bursa Satılık Bina" href="/liste/satilik/1/bina/5/#/bursa/icradan/_objectdata_U2FsdGVkX19P24g3b+6xZYHOcDQcSvBm/eDK/w7bUqSlpHiHbsv+WzH/YHit+xPTv6wJFhxHwrFXAnfOC2GlLOv1NUHu/fDtYUUN0mGYQem3HLRfrJ69rv45bNAj55K1yu6p2CF/Y4t8yZzyabTy1DWtGbavvjHWRWZtnoyQQSXsgxfYh2jiQY37+fbO0PGliKUmmWMAVQj3GjQuIq/jj1GCgEvm04216WXwgLoWOaDZ4cV8QX0Ku3tW1abBOshZKlPNoWUp2fgMcySPAQREZw==">Bursa Satılık Bina</a></li>
                                                <li><a title="İcradan Antalya Satılık Bina" href="/liste/satilik/1/bina/5/#/antalya/icradan/_objectdata_U2FsdGVkX19KpCJpL3/h1OsAGy5SJF3gQP+w18hPtadKRWkhw2QJ9Dvj1HLTFGIFsSCfjDodSCo+98Wg7ahzmJcK59V+4LH1ayntL2OTsYXh8EcOX71SouWNtei1QB/+YsOKA6ODTH2epuEDuS3qCXOr1IGMoT579/YSWPlSVdBsUTt1xGpKdwKQPhhVgTwefzArzcL6k2oW90bra+PiHrumGFDlgyaBWvx4eKbWYD9q7NIwEHnqMhNFs3nyC6won/oIU+JUdOvKNRhmnanKCA==">Antalya Satılık Bina</a></li>
                                                <li><a title="İcradan Adana Satılık Bina" href="/liste/satilik/1/bina/5/#/adana/icradan/_objectdata_U2FsdGVkX19Up4bepaxGMJTqP15qvayXTlrsgHJdohVu+Bfqgkg0gH59rfKJtgBS5mwry5kRdtuJvqDceXasDK+NC38A+MWg8DMBjBhw7u95CkDH/n/9AwzbAR4JAKculA9pmTQsQvoxEv7GDLsPuhMzOcXZPdKk+kxNrrYYu1HY6l+Z2N4+MTAMV1Zz9jgWP/HdaRPoIy+psJAM95puJuU+kxhFqdgKIJ1VdazOQ1jY3Mk9OR5rL/MIgk00/Pexgf9uukgeP9v0JW83kLDM+w==">Adana Satılık Bina</a></li>
                                                <li><a title="İcradan İstanbul Kiralık Bina" href="/liste/kiralik/2/bina/5/#/istanbul/icradan/_objectdata_U2FsdGVkX19fCQJf1N0WoWIpZLgBWfSZze2ULxdQn1GJgFRN4R3QOl42aSpDCF4eky4M4j30hbjw4S5uyOhFsSXLxJ8olVFILTSi9oj3nPwaJrGQLr2k1TIa8EIqsdBZ4lDF3TjNHEk3yJSBx+RfiPaTcBi1bfQ+b7aReKWGL2Q8WqdlB+ABJilsNMYAtr5tjlc/VrF7Xzh3XZPDDOzEN+wIfEaORSuVloVtaAq9/qCREDXuU9z1ibLWBSIuT57Ls8xPNzsSJL5INWY9y2635Q==">İstanbul Kiralık Bina</a></li>
                                                <li><a title="İcradan Ankara Kiralık Bina" href="/liste/kiralik/2/bina/5/#/ankara/icradan/_objectdata_U2FsdGVkX19rpysnu/NqXmrBe5egVQTSwsD6QnIbv1lXCUhgAjSxlTijqO3hmr5NMebOE/6xnKerfL2czBl5+emRkTthnLYGuEp3IAW7UO3MiJFNtTiSMbhcwEmsX1mFpF7sHTU8aBvAvqK2Hu9E2G4LsLvL8KV9FyMAjdScQrclS6AtDaSY0TmQb4h5TuvFniSra31RlH26Bj9tiNdAJAIe2bRq350Lk+tmn7xoAt1lfWoPaCvbyKKj4Rvgh7uWZKuTcrj10VxOuCyZ/BaoLA==">Ankara Kiralık Bina</a></li>
                                                <li><a title="İcradan İzmir Kiralık Bina" href="/liste/kiralik/2/bina/5/#/izmir/icradan/_objectdata_U2FsdGVkX18+Lfo/xyfAIcMXK/a8z8s3rGKOyM7G5EBFD/d2mKuEK2dR6Sm4SnEncZRh+HLhAbaXG0o37d6Y2VauBTe+sbVTB/Q7QDfwwV3ztg5kKWw8zHVO7q9ASvi5EUxC1NBZOFweHj31uo3kG02ZSk9HG7F5qSg+yFeUyTx4RU1x6wSpp3wY3qZqT87a42pbGV+bs2hthW+F4H8CLPsPrd4vNul3gYH0GOH7rtv6EF2+/Zxeg4C/bY+wZWVZP46gv7b7X20vBBawObGoGQ==">İzmir Kiralık Bina</a></li>
                                                <li><a title="İcradan Bursa Kiralık Bina" href="/liste/kiralik/2/bina/5/#/bursa/icradan/_objectdata_U2FsdGVkX1+UEvd0NgU9XINTsfOFsKtDVBeJdySSToFd/NYbSzJRfBDRRbQ6wWHDB0c8z4/O6K8VpzpVkTKrBk3Fh6Z+ewQHPqTjz+IceT0I2dHfDf6sDxCjfDKKWHniiQO7xAecneuXdODaGRpfzs2GFq5QGlWDLtfbqMPRXqdXaPpFjKL98crhsfQajSCwJv/8JDZlJs50PUCHwD3BllJHMfAJtSEhVll4tB1XZb2mv9aMJgvYPYJZD5Xkr9KJd1ZiJij+kJCAqNx9DJZyCw==">Bursa Kiralık Bina</a></li>
                                                <li><a title="İcradan Antalya Kiralık Bina" href="/liste/kiralik/2/bina/5/#/antalya/icradan/_objectdata_U2FsdGVkX19iG5FfXc3kxEyYj+8HGS5FQLza1a+Z2Q5lZT+Id53/gXHHZcGWdU8WqH4s0oa+yuWZ8qk+WPAOQNgPtLlPH1dacwf4N1U+5/bvrQQ4LjV72DLx4Sz0M+cpqJ1haF33H3ZFLrazvyMcKoxNJYXxdXECqPYFZyNIY/kSQ8ZiO43bfMEMhtTMAVsv6+jED0YS1gFT8C6ryQG1FMDtSJNlTAeqJFo2gFHcfQtZuYpc7iarRCNSrTzi0TIXAqoBR1F/uMu7TAj7pkgMkw==">Antalya Kiralık Bina</a></li>
                                                <li><a title="İcradan Adana Kiralık Bina" href="/liste/kiralik/2/bina/5/#/adana/icradan/_objectdata_U2FsdGVkX1+gdl0HLzQA54KJodWhvhklUxvPifYq84KLvtYFMJKZKmo/0YUWHmHY5zUE/lyS9lZgYVjtHumv1ntemmG8TSsgijpQKOLVY8Lc2APuj7qZP0VlydRrjxd8Cp52/j/L4/nA9KVEMe5vjPr1gzcdDRUq6zTKZX5q+FVaF3SA0xEf1Pt06NRtnLMnQ48v1HTQWRJ1vdQ2A4sNZyxBesCino4IgieGnOwJibnnxMKdR73iExF34hEqDkrIimyOCDtxBh5IxBVpENv2+g==">Adana Kiralık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_e">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Bankadan İstanbul Satılık Daire" href="/liste/satilik/1/daire/8/#/istanbul/bankadan/_objectdata_U2FsdGVkX19wDH7nvRNnxbGI95WF1tHAoxdoKSQxdkM8QQUCVYTz/ieapjZNkbq15/EA1JxmI74j19OvxNcojHJCpxZQzGAs2Vr//YD8/l+R1jV5l7F59ussZO6ST+3g9plPBCfb558wawqHAMtgGeeEw9CaTkyVtgr8nSMc9S7KedJhcUffSJUN5nAjU7X9VQjCb2cWqeyjDhJmzk+Lg0GJKUMCggnQTPp/G6K6Bug=">İstanbul Satılık Daire</a></li>
                                                <li><a title="Bankadan Ankara Satılık Daire" href="/liste/satilik/1/daire/8/#/ankara/bankadan/_objectdata_U2FsdGVkX1/GC+k5qU0Qa6Kzh7Vgr+g4tUOBTwqU0eAN8VQj//gzhq8UBTSinfw8Y8Luo64d+ViFgPik28H5fx6N1KThM9XxS0cEwo8C/PcAz5EAGC197jfTz3RZihChxYHL/c3uQ9/X9ETDvOs4v9OLTuLwwWYqntnqXpPa7zcNN4BYTaU0m6Bl7a0XNYTeJhHYuFjmKsvpzeshDwdWzlR7+/smCAtz8WJ6syYgaCQ=">Ankara Satılık Daire</a></li>
                                                <li><a title="Bankadan İzmir Satılık Daire" href="/liste/satilik/1/daire/8/#/izmir/bankadan/_objectdata_U2FsdGVkX19F9Tzpp4WND9ZyxVWJUmFw0lgTV66EK/Pfl8634TDVJ99P/DOxh93tINjoo6OPfmpvtuSRSd/VrHsR1f8RunPqoz5DH9Ca+h1UwzNmoMNnd0oIrI9/R6h47QCZcV+PR6tNI6jcnrJ3hysFGCib/419eNth+v0lpeqUM6OetSwWOBXQ9uBcb6rzPDvMzULR/kzrkZbY48Augc3h160vbXNuzBzdsNsX03Y=">İzmir Satılık Daire</a></li>
                                                <li><a title="Bankadan Bursa Satılık Daire" href="/liste/satilik/1/daire/8/#/bursa/bankadan/_objectdata_U2FsdGVkX19c+GW5OaXvbCKey40ebyKWead/Zt4FQwpwouBgrFojCbyrxRcLe+62mAwtuEOgT9bQRj1b+1VNWoa5Hyi9UoTU4D5cfNgiJaJktKdAF3GgnydmCLF2aTon0FgtfFLmETH3ZYvFOBpj0zbvRU1Bpwzr3Jc5Qg3MWTw99UTJ5/YPQh3k3IfaXU0pVhzlRklxtCRJ7A0L0PuS0Z47dabzAgGllprOhL7VzzI=">Bursa Satılık Daire</a></li>
                                                <li><a title="Bankadan Antalya Satılık Daire" href="/liste/satilik/1/daire/8/#/antalya/bankadan/_objectdata_U2FsdGVkX1+vPbP/t7XXgXPqN3x+zxxBiEasRU2QYglfC3fhjMRBil+Q9FJemVKrPFazUB2FMaDXFoMSyngS6WuBkYtsM3GRH6eM/61zEALFQHqZ1JgaCFmNMznFddBMEpfqtsCNE7MkiWUOclZ+ZSOcWHZYPb3U/S9XCYwZLAf4FCMsXUFCqpvFY2P6od/kMnDJ/FRE1rcWflTN5n3SsfW6zF4kit8xwFVL1PgkktU=">Antalya Satılık Daire</a></li>
                                                <li><a title="Bankadan Adana Satılık Daire" href="/liste/satilik/1/daire/8/#/adana/bankadan/_objectdata_U2FsdGVkX1+fLjFuLBKeDrBYkIqsw1buSlD6qKwbrkziFjxricyGMcBh/ROhcQqvQnsm8sFQ9SB4n2VckvOpT86q+gNnexXtb24PjqMR1r+dWp5mycs2QjyoV4nsiutELqZp7S6OJ+GJkmaBXi1hGczjYEIVB2zswZ5FVIEZxVppjb9GfLxlriVa/uY9sywL/7vrfxgck3cSokbL1Gg2zT5yX6DIdKUVwgjwN2PZQDo=">Adana Satılık Daire</a></li>
                                                <li><a title="Bankadan İstanbul Kiralık Daire" href="/liste/kiralik/2/daire/8/#/istanbul/bankadan/_objectdata_U2FsdGVkX1+fufbFoWDrnk98wb146akJi8UXyBJTzMOVOMAMH8CftgJrQBMd5PVl6aUtKA5e0Vdc0oceBLSoPCQc2Xu7wi+ihWoABs0Iaf7VV1WSmVMaA2IZSj//vwXAVCy8eeyTTr7zG3jRsmXe9yQRVutgc1P/3VHcTS0uKeaRke01oqtTbecmMbZgZ4a0Zs64UL6koxMx0KtE5Og3KZriwNtwLctuc0BwRz/BMbY=">İstanbul Kiralık Daire</a></li>
                                                <li><a title="Bankadan Ankara Kiralık Daire" href="/liste/kiralik/2/daire/8/#/ankara/bankadan/_objectdata_U2FsdGVkX1+UPjNYtqaFeI5vxVl6HGsW/hdr2OXTLsGjv7Mp8aR61aNlyuLZ4N8RblcLBQ4KJyb0gzkJrpnPgzlA8HA6G/DlBvCy8AFYhFbGiPIvc8X8fAwdC5a9X2qvNY68+xjjiD+saaXRZj/9s7n+TBHm/RmJ4+LYSyNgMjLHyX2adQrvi43bQg7LONXESxJlKlOJ23xdvs6vcUhS6tUW+MkVLnHqszyoYdlLHZU=">Ankara Kiralık Daire</a></li>
                                                <li><a title="Bankadan İzmir Kiralık Daire" href="/liste/kiralik/2/daire/8/#/izmir/bankadan/_objectdata_U2FsdGVkX18yr035aw+6zVvE9lvcHhgCYB31cbfteR+BQQPQAA6aZ8oUxPeTANUnibSw3Og5ilRd/R4zxGnvLiBYxGaXgJDqO0phif/6J74T2UAXgDR96hcYX8p/m8pLT8HPqQLIWpkFTOCu+qS2/nWFcdCtZ8mpK/ahMPKnemYruS6ZsD/cERJk+/j2ttzq1Gt1u3g0Y1y8oWAUozB1yvMZb1c8iE1jOQkEYSkwHg0=">İzmir Kiralık Daire</a></li>
                                                <li><a title="Bankadan Bursa Kiralık Daire" href="/liste/kiralik/2/daire/8/#/bursa/bankadan/_objectdata_U2FsdGVkX1+V+z9MTxAKPrPVtUnZ8tbfUYLBZa9+PYgvxpH+4sJRiCmCCMparPeOqJQa2dgZWbz75vUjBhufYfJ4eUT+nW8aCieLoSleB4CT2onvVeBENToUSu4MOJwdpNKCxCLUvNti1Ku23vShLuGS/7BhahPM3BqWX1gH+3hnITGXfNy5nGIeXSiQ28ZxT49fn4j3cXN6ZTO7rfmjUkE3N+MvukoXGhNi87dtF0Y=">Bursa Kiralık Daire</a></li>
                                                <li><a title="Bankadan Antalya Kiralık Daire" href="/liste/kiralik/2/daire/8/#/antalya/bankadan/_objectdata_U2FsdGVkX1/R1O4Kj8zURXZnoS/mryYEqEYuMYa/fdCYMORjS0Wu+psqNR9Qv9oAsOIbFjtKL3iUdjqSeidztq70n8og2qLTjOXqhJfiptZlOGm85SEqjsk/daXitueEq9OS+e2JJr3oyPU34Vdu2LWOUusZulC3OX+6UELoUXr2DAvpVUgpHuxK7bApAiEaWbbLxh4zAbqxPZrMoeeBeHMy0a0gFujYEjzd0H3aULw=">Antalya Kiralık Daire</a></li>
                                                <li><a title="Bankadan Adana Kiralık Daire" href="/liste/kiralik/2/daire/8/#/adana/bankadan/_objectdata_U2FsdGVkX1/UM5dSqLcXDGfuMGIZpHrCSMuKu0NjlCm/7VX6PFXwvIjfRu9pC/wAIPlo3yAtDUrGPCRYu+gxcLrbhNBKdA5aWnmZqayMWjGeLdkFkcE6xSzjcq1/iX1layyXkUDE+EVAADdeBJZJokENZYRZkckM1L5nMaFYFakaKfYajdnsLSRFJfWlohgsaiaA776pvWRQOv5dqiagd8NdRp56mIznFbKyhydXRR4=">Adana Kiralık Daire</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Bankadan İstanbul Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/istanbul/bankadan/_objectdata_U2FsdGVkX1+tGQOuvwcHbdJchw+v3Bz+7yiYy6fRBiITozfBmOm9mxdtZeBndhVeXAQVJqCVJTzbT5wKepnPRIRPznNXNhjvYGL5npuHk7Nf/ddOQnLp3cT4fOWyJLm/51J3hxCW6io4ah15ZFIdCyfdpo5EncnMw0RzSmI6pUDTee0CYseRMXIoQAfplxEW">İstanbul Satılık İşyeri</a></li>
                                                <li><a title="Bankadan Ankara Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/ankara/bankadan/_objectdata_U2FsdGVkX1+QiP00x5+Sx+p0rCnq49yQE0nABkjWWqNWtkGggi3IFfWQeqxDUppJ59P/c7XsRFspJ0CImCOT3nJy5KfV94NFp6dH9HkzIQ40yUJSqDkWWBNfsYUKaTWE9TfQrUrs4ZwR8ioIJckSzBOh5CIGUV3Cy+hDvgEFd97uwOFbtdjh4IHzwUZmyXSP">Ankara Satılık İşyeri</a></li>
                                                <li><a title="Bankadan İzmir Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/izmir/bankadan/_objectdata_U2FsdGVkX1+jfSc/T2YBghGSgd1l8LTeIJyMKc9CV++/zWYvdqjp1QJ5uUwYP1IkvZCx3AhzWJAzJNEFujBebbC45y598ZrEOdbJ2PKc4zPSQyhD/MYtmkH9QhtFqWRmEo32QAto7pqg6u9Ji+nsWpw4Y9T5/9x9Sfk/jFz+4kGi+/XZNE2EikpjlNTdkpa9">İzmir Satılık İşyeri</a></li>
                                                <li><a title="Bankadan Bursa Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/bursa/bankadan/_objectdata_U2FsdGVkX1+v2Ll3qbUjo796kV+FBXw543wYIbIs0/l7EkrZS8/H1Y5wlPjUMRNY3krFPly7d+j//hZ+XFzjtqSgG6H3aoLW0xp010EfbvsrHEa9K4vY2LlXiulVXshcwtIQQKtPeBrhNX5uDd1+5r904WThx292h1vH+qLhbdCCUnpMKEwoDgpuWFk/uvpF">Bursa Satılık İşyeri</a></li>
                                                <li><a title="Bankadan Antalya Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/antalya/bankadan/_objectdata_U2FsdGVkX19IuQdU1AyzOMnjS49/YOWKqx0aORe6+Aw9U6NcKzbxOmyrNEX9ovI1mIXkOQ3lPz4UiZeawqpTtvSFXlSND72f193O32bmHu1ycFkEE5u34l+vCTL3XwvW8xi3AL7diKhW/lFzyurKZnmbgHzVf7KrReBgj5ddRfesrV9sSVBy8hyAjnP01lqG">Antalya Satılık İşyeri</a></li>
                                                <li><a title="Bankadan Adana Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/adana/bankadan/_objectdata_U2FsdGVkX19WrNoSnYUR/zwovk1HLZb98xG0uuI1fUavinByFJUFpX916CkSA/ij99HQa8xkntPO2wKHCc0oaiLCb8tww2JBS0m0QexsR38JE0LBxrm5dVYV7nTkVWdU3ozWkpoayOS6xFnHCUIRkrSHwqnl/tJPu6er7QarOqbiyIEi4jq6qmATuqbPl2cM">Adana Satılık İşyeri</a></li>
                                                <li><a title="Bankadan İstanbul Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/istanbul/bankadan/_objectdata_U2FsdGVkX19ueoVhbnQ5PrOq/g4GHMV/gAwaJyuPjf5ig+7XGq7USvsL9HDJIDviTVFd5O2eQM2ZJosKHtzGir17AW8JTQz4yIb/CwnIQMfqFajMV5l2WgUMJH8BUKf3/6JvvmL0++n+rLMvoWLo0X2WdMuEkQ+ZhNkyEMnR8uuzi/fRTBjCrnFdROnIbvXZ">İstanbul Kiralık İşyeri</a></li>
                                                <li><a title="Bankadan Ankara Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/ankara/bankadan/_objectdata_U2FsdGVkX19BvndyURa0zyLF4ZXqFGBPCE3yI0H79viPcl8tTc33aQWN6721gFqOFCmiUCPICc2akGVGa3DcYroyQkCPhBnfxLn7ggQXPypdjx0rw1pD3x0g6eqfSH7dDi027LbbMZPFZ6LopZDmEHt4iJgdSijh5M41LpRXfO2RvRRmdX6bmzISyqH2Wq3l">Ankara Kiralık İşyeri</a></li>
                                                <li><a title="Bankadan İzmir Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/izmir/bankadan/_objectdata_U2FsdGVkX19K3LUEneyahMSxPqkcWdSnU7cstQ0omWMRXH9ikrAZY17L7EsBU9Ie3RfZM+9SZIVdSoONgpfDnyJPqXQloosmCd+HTGvZI5y/+tVI0EXHlKQAGuCawu0B3a1++tdAWivprNfWg9W1O769N586Vt/t9wCQRfRVcBpaFgzL4cfXH70el5k77UdM">İzmir Kiralık İşyeri</a></li>
                                                <li><a title="Bankadan Bursa Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/bursa/bankadan/_objectdata_U2FsdGVkX18+/VmuXFSSFQZD6YxVdyLNOLgeX9qibk/E0HQax7L2LexQImlkS5LT1o/ShxMLwUlc5iE4TqRmufbsFT7W7YXMLMX8OYtzSxNJIa1Uslboeu8sFulD6Qzz66Evsa5M91WvF7WaljB+PuChFGol9VlPM57K27THc5EL9iVCI2XyqI0ZYTkL74rS">Bursa Kiralık İşyeri</a></li>
                                                <li><a title="Bankadan Antalya Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/antalya/bankadan/_objectdata_U2FsdGVkX1+pfNwPOLFh1flgj3JfV3xXiFdIL5wumBHU57UePWc2h/GIvQR0WQXbb8trxZ1+p5l/SqA9YhCJY7LRD9tWkmRO59MS1Yf+v+vqfiPW3PVHONky5F/ojn4NVhwLBbGYEsTcSluL2S1oHHXMBaeRnKhJ80XzH3xbPGiwMgXwf8+1tjnjd7yKHu2o">Antalya Kiralık İşyeri</a></li>
                                                <li><a title="Bankadan Adana Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/adana/bankadan/_objectdata_U2FsdGVkX1+aPvmYOpEVopqNBInX26fhC6S2djAPgLrtebJUryNFOg7fMDzzq4h7XbpZG5PCZCR5B8QwldI+g2Fl2r3RgDHWaNOTbTbT10/0kHgYODL90w2qnr4lQMi84OrOKsoDeZlQUuNNcWR6Z8Y71EVhAGrvnLw4tOT8/3Deu0B66uQ1WQigQ8CpwTrh">Adana Kiralık İşyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Bankadan İstanbul Satılık Arsa" href="/liste/satilik/1/arsa/4/#/istanbul/bankadan/_objectdata_U2FsdGVkX19FxP7/wPXkbDAhkRjj4ERMHEY2MwQGsPdlQ2UV1TjNTPDIT6pJA1Yt311tnz6hFkfBMBeFpGttRTCEfMEjdWAhh0uz9dxnqlGl2m/JFrSfKGJtqaRcWtWwJXiSHq26nrx7BVNqzPe1P3IYogLyePNwMSNpZyIkN4PyJgTsX3eKVW1euWwZggxkIQrFwsn0MAmkosHhAzYZI85TmgL/J1BArumiRs3aOaIUB+XyXmHrsRnyzs18mIO3vmwFE8Bjx1ltjoIZa3BQ1ypUn7ZrrACQhDZNDy1PUPis912JcLI+s4R1gWfwxHd7">İstanbul Satılık Arsa</a></li>
                                                <li><a title="Bankadan Ankara Satılık Arsa" href="/liste/satilik/1/arsa/4/#/ankara/bankadan/_objectdata_U2FsdGVkX19v3EWVpPMxuebkBmrajrENuWgGeEVLzkj5DO178KRZT1o7tx9cy/NTefSET81p/X00RvP4ve/ieXCdhzKSEQY4xr7mfLz7MZbto3fdgzyhbO5t5mlMzqjqmSdJt28sbGHHTqwb5cJ+UR1EXtycpu4dbeGUz2zBfRnXvkORLUMAw1YDhazlD5yVULaUj+sO3WiJ/j9Quns5hNedUbgz95a+QrXKbc8uZh8Hx2/WQ//5IzvcJy0a1LhZ+twq2eh3sXiqAJcstLFYn9KQ33+5tHwtKpv6ejBzsNQA3UpHnBRQk59/gbNERHC7">Ankara Satılık Arsa</a></li>
                                                <li><a title="Bankadan İzmir Satılık Arsa" href="/liste/satilik/1/arsa/4/#/izmir/bankadan/_objectdata_U2FsdGVkX19Ve26JTjgUS7v0Qdc9bYpvux64YcQ3Nopls1HEQr3kmeYnwUPATL0iyTFkPhAb3QVIVKGi0aHMg4CYFBUeojAcL34rYJJh3jT6JaqZKHqdv49CJM+53l8dyf6H+/nCol3Lw96E4xHP801ZRpvcjArV0pu6jPVaMuMsr56N5sLcK1bXU4VkfMhO6yshz6eixieXlgZ7ppMvjz4yCQYrbCZ5+suS12QIBsYGYEUUl5skLoHUlhT3eOI0wnUtUHdRH4MEE9ki+HRDxgwrOSAOYkRjb9myQgWrYKzJ5m10T3v8uvvc4fM0xcBu">İzmir Satılık Arsa</a></li>
                                                <li><a title="Bankadan Bursa Satılık Arsa" href="/liste/satilik/1/arsa/4/#/bursa/bankadan/_objectdata_U2FsdGVkX1+cRVEqY76Z/WHWKTkD51SIii6sbUdtKx03dC9lJyvy5mU+vWaT+gOT8dk2WWGP0QvqqQYLxcmRLdNQ9qG5jm67yn7L+17fKcAIu2FE7BQwh2Pm2jQMeLiYgDbU+3b/GQ8HSnp1S9/BKMOmprOTupNCBgrMscJIiUS/LmfeWc6oWx5gds1mekb/v0lOGeBkp+D8+xBmpuw9Q2McGsYIjxmhQlRPuwVfCKB11PujdwBxw+U+92OGhjIH44NQvl+YTo/rWQqpAT3HoOsy5GW9GcAd+bxEZVuPsQOZwJaPmALvHSujpgIs+gJ6">Bursa Satılık Arsa</a></li>
                                                <li><a title="Bankadan Antalya Satılık Arsa" href="/liste/satilik/1/arsa/4/#/antalya/bankadan/_objectdata_U2FsdGVkX19nQ1IPrIvScjggtCH8jbGoETyuAGFNObcdZOJQB1V4nlURgTLwbeAoCVuJpSD069WRyvBUdvfVXPSKjPGS9wwctRpgZS+mmOTdFOq2pTqJV6WPNoWmbsCWdqHgSK/h6ZFHcb42BTiK+xcJ9SzJCkMSSkbGUrohshjbxbR7oFx/GfzakOZj96gpdyR7pqUErgxzOLkU+TfQhLG70XB98G7nB05XMhQzmhzjG2R5sg4q5BmAZ35WlpkjbtaVulOYX1dHWSnCJC6y4yo1Z1lzV9617Lwnpl0hrA1VhWeDz0JldbelQz72MYaf">Antalya Satılık Arsa</a></li>
                                                <li><a title="Bankadan Adana Satılık Arsa" href="/liste/satilik/1/arsa/4/#/adana/bankadan/_objectdata_U2FsdGVkX1+UsKNrk5LHkUcnMVfnOF+e9I+FQMSl9pNSAEhqNbTpUE/2+OaaHFnK/x7ueg4hBfOYsMC8yMeW7lgf63ZxajcZTGSH3+GaznWUCu4ot7vbg/YdD7i+1b/omTwNnN9xPGA27T5FVPZXv14xk2zm1oh/XAYCwTk0z5RE3okhLLQT2KIdq8zRyAjTlE8rOSu4jn4cIwpyYGSgTGNZtppoDy/pTceUMY5F+ziYuMSwuhO04G7lfgkEfeRWKJQtMUIMGtlXauyiQAv5FbguHbTBJA5ceeVjLQaGb0ibq/TfZh/v/CFd4pARZa/N">Adana Satılık Arsa</a></li>
                                                <li><a title="Bankadan İstanbul Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/istanbul/bankadan/_objectdata_U2FsdGVkX19KyEdttHBoa5tuiyL9412z54iFB8tAlmppzlB9NSFmiQNqypL2jP8ylv9TPx35ia/Uiz20UZHIKuOyi30tfsviOnbhuyicLWv8NwITjViegHTERaSx14/lg7Qw7oP7SdyiYciFRcP4WfWmqyRHAaA9bbw2/pxp4TydfT1nLSeIGsfBklAWybTz+Yhvo079WdYkwCFq6e+ySJeYwrYZg+0s6DOR4IN/mOxTlehnzts/jVdlJ8aiRgAfwRPHp2ANkPZOKs7wHwMMlol+QK60ZDNV/X4phyXtNBx3nk4awBbQoCyOAArZMA4Z">İstanbul Kiralık Arsa</a></li>
                                                <li><a title="Bankadan Ankara Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/ankara/bankadan/_objectdata_U2FsdGVkX19IzEBnYYcwDkD9/zxWryDk4wISmREG+0XPXP1+l73rZAdSkSlUJGMJYdvbYZK+QeZoY7CBdmITLbogICUJAtfIhel0xyVPV/y5NEmOKCwWzGWvp/EjkdrOMy0zlHoqv9wlL/OewOETwHbP2mhwAKHu8KQHTqsm5hq9H4AA3hEcGOjS5CRFvmql1IO187wqtkRTqCurZ9y5qCaLwvHMIdx/GUZNXTN0lgg5H80+Pa5bHdOc2aKYvaLtRyc8MyKM3VTt+W4GRmmAUzk2F5dIhk3Q3o3bkF3zf98pdme78qqzO5D4qVb4nWA7">Ankara Kiralık Arsa</a></li>
                                                <li><a title="Bankadan İzmir Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/izmir/bankadan/_objectdata_U2FsdGVkX19klyO1qedkfjcjBX991pDU1npT0ueuXGSuFl0lDrDa7/4TBgjuYZaCAPhhRs189mWGyC3bt2FvEplQbZM89at9w9O2TaK78HhexSFs8y1UOtfn7GdqWJOSVnLUSfcuqeLJc8aJ91/k2Jjq+AHFDvNQe7QuYi1m/j8Pt2e6oVin05oqsB0M7Og/fVXcuPh6FFrzpozR8zqUZpFs9TzXA7K98mqPswdasu/Sf+qH3/LMFvwIpmcAJJ1HUHO40aOrKyGdPiWsnCrB6okYAJoYl8mt5JaSina3EMkeu+6nhLLowmZoThHUoeiI">İzmir Kiralık Arsa</a></li>
                                                <li><a title="Bankadan Bursa Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/bursa/bankadan/_objectdata_U2FsdGVkX1+itAFWkBMmeAOoHBo4a9+vfUe2K28YQnwIcre2q+LQrrgdJvRvS5b6rOB9hYdeM//plIdpbZFFGDr5xr7gvXHNHNoBn78WaJlwIW1jdG17w6/2dUr8EBAM1u+wlUuQi8AZhWzlz8FBpuZ1ejmYYupUWwzz975XcgQLYRCbN1uKUjghV0gHYDfjmN6/78WKKKvt8U+7nhxhA/6Zpu7aHGJpShta0zvia9XHGfzLp17AAIY8NmuWn2hPmkyqVib8Wom8uTppHCq0araDhUxZA71tXHmxSxMPpfhVcqGtXvL/fE+UFL5QfRj3">Bursa Kiralık Arsa</a></li>
                                                <li><a title="Bankadan Antalya Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/antalya/bankadan/_objectdata_U2FsdGVkX18ydfUAkgWG+cpfCzxGfk0V5Fshvy/CptSf8QWsfHlnHtd49067FlkEhGB9OJuMaD2AXHq3GfLxqgLs7x/RnR3hy03KHvHf4RWYeX5HYrsre2CzRmPvdsUjTexpHNvxxzsrOCIRfUKqVI58sIjwBbb1V46nQ0DRmg4MLoVVa1x4C8p2DFcFSApHa6HBNLmTXURCEnB1psrM0hz1/RNcZHeqgnKv2JZ/YdK6mDExAJnTgosPDLf6+gY8rUWg6HwnP+U/ahzF17zA2EHzTfy8C0DsC42JWtwoqyPkb2qiZIVqr6Tb4vpV7mHS">Antalya Kiralık Arsa</a></li>
                                                <li><a title="Bankadan Adana Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/adana/bankadan/_objectdata_U2FsdGVkX1+oLIhOViDo9K08qs1s3KWN4CuN41ZVULBurHscGj1i0Jn37TOkEEdefa31cOjSbpQiIztzMI7LtSVZrBaEaemxuxz4RJvAGZBi+wred1ycvoIA2mhAYNQFopTR+tZukWNl1V7QzjVt3PF/saLjhQI3Ak5SSChMx4+BAibW8vzSWt1rcmvCWFJgUZWpw8M8mJo2F28I+V+LDRvTnfKzgCTK2BrpgZFi8iT3IGbriMMjBfpDY9GOLYgIg4nNDwQmKqZEmqL9Qcz4E2hdai0mV7d2JRkLrjiln991eX5UiN0Ldw5JyvAgVLvV">Adana Kiralık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Bankadan İstanbul Satılık Bina" href="/liste/satilik/1/bina/5/#/istanbul/bankadan/_objectdata_U2FsdGVkX182MwirakfA/BLdHy77+gVtgRyc4GzH8K0Rd+m/hkbYPilfylbTk6sl92V2WbdBA4QPydCfc/lFZsMH62J0r/p2r4GwiUpkS7U29ENC5drjitK1vbGZ1g79sOFpIRf/N5/S5v67rB2vKM9ZKCdzCay84n7OYAWJFxjO3Emad5C7Ag4H3syJJA57FUli83Bk8WS5T9TAiLihlXbM3lOK2LOOpr0FJtlsb0PyWqMg3lmOTteLuJf7G1dEVAT1qhsPdO3+8TeevrxZ6g==">İstanbul Satılık Bina</a></li>
                                                <li><a title="Bankadan Ankara Satılık Bina" href="/liste/satilik/1/bina/5/#/ankara/bankadan/_objectdata_U2FsdGVkX19GvpKRlliJx67zRkfkRczYOfHt8UoEs2zANSbkY59E/5rFrURYOv0eFrNsBcUGq6xMEK3HYVBy8vA+kpDS+4/7Yu7gTjR52CW8JkOsVpWCxAu/aq45U1iQ/ehzqFpJOofkSkLEIz5NvEgtoC7AozDy0zt1A0TiAdQrqOViQlHkYQsMLLpfZ3ZuJSM/1hfb02xzQTgzVR4c6vkiWYu6rrl12/6io60wz1sfcOfHVIzFGthgexsP8lSvEA7lG9py7atEAKDCPPG76g==">Ankara Satılık Bina</a></li>
                                                <li><a title="Bankadan İzmir Satılık Bina" href="/liste/satilik/1/bina/5/#/izmir/bankadan/_objectdata_U2FsdGVkX1/Avc7bXJZMeD39ME8cCP+Tc2w5l+L+iphkX/mY+D4mYGpRS1kCtKFqiQFWNEk6OURGizDUvnRPjGJJYs6nWwe5RVUw3x//cHU+0ZZtxmaCnVzYlNIPvcfliQsAeF5sdE8givLlSGd6+NEewPvsDthG13kgO6OPQwQEONDIWJJIfcz/u51UItVAwuqDCX4/Vyz0BV7p5EipoT7x0wcp2pazv+G1YaItFVrXg8G/26drmPJE7j+Dhbi1FQ8hLNNhDYqONN3FDik/oQ==">İzmir Satılık Bina</a></li>
                                                <li><a title="Bankadan Bursa Satılık Bina" href="/liste/satilik/1/bina/5/#/bursa/bankadan/_objectdata_U2FsdGVkX1+tZvJhmz5/sQFDpA9Uq8LMGJqEE44tsI9YeH3IHhha18bNoUhgIPONE/0HICcPntzzCEdJGS8JmcPGqL/q3+XKUh6KObp5AQ4Cu/e/R55iZ2XjMBMoNnWrbsdeIHFkcy+tIsiDG5j9giJDbLcIS4WI3t1EyiYOe5Xwqga3msDBo/20Enql4HgZr/UEHzcj3gk30TdI3XEJUf04liBXfgl2Q2pPvC2FSAknLM8cRh3DyPu6LLJ5jRt0ELmHkj1uMWkgoAWTgJsLvg==">Bursa Satılık Bina</a></li>
                                                <li><a title="Bankadan Antalya Satılık Bina" href="/liste/satilik/1/bina/5/#/antalya/bankadan/_objectdata_U2FsdGVkX19bLmXvQm5/GwkiPw+d2ElEbzlRH76xl/hbUDAdAOaNABcHSmR4FyiDD8IjK2+zD8SwLFiEDg5vSsUEx1r+14AKCW9QVtSBgY6gCkLpL+ipkQv/W5LC5oswTTI0/udodeTgWdXGQ6vJCrzzCuWWTgo8VRCf+gSc8ogpCn+DHTlKbv/mRS/EgsP/evlgrxGScBu0M02LEy8pq5HBLldZOx76J00fsqAFGfARzXMFZ8KjDtdeT1lT10Kl3OCLpns7+Vq96aLuNFEYIg==">Antalya Satılık Bina</a></li>
                                                <li><a title="Bankadan Adana Satılık Bina" href="/liste/satilik/1/bina/5/#/adana/bankadan/_objectdata_U2FsdGVkX18v8SfPNR2MGP9yz/cT3x5xHWX/sCNgCO1bPo0ePyFEbTBllZX8mAWAJsPMTw+hnzpKo7Eph97rU31CRxVjDGdF2zOCO78xS0iVh3+uYbg8gl/algyCvZqaWU0F3j9LTDFLL+HetWRTgR5cOGU3F2MWLbvIuSfU3mAQTe8c2QIk2XJ6A/vYR0qd7lhnvT7ibGvNMymsed3BuGzWgw6JO6EnzMeQOjI2DuRF5OEgnxuYBDin9W45XkP97EDd9HUHqPPmjiZNUqk9BA==">Adana Satılık Bina</a></li>
                                                <li><a title="Bankadan İstanbul Kiralık Bina" href="/liste/kiralik/2/bina/5/#/istanbul/bankadan/_objectdata_U2FsdGVkX19Rgb4o1SysxvXKAJU2ZoG240I2yPiPpuxqCdG5OwVn08A3Yjku/7grYl1nMYt/1n4pJqseTO2Wn4vmVF5ymnxiCikWdfxSGye6m3KDB0HLHEqrnJ8lBYk5b3LPI3HUpFwWPxShF/KwEB8xJLpqaAvPi/Ub3h+fvZSo9EvfwMTnOc68Sn69+HofQJEIt5mcnvZctcjpJClI/m3uT26CYU0NkNsLjvVj4yJCmjYeTCrcGjZtmn5ZTAwuXQyHVLW7y8zocB0bTvo4Jw==">İstanbul Kiralık Bina</a></li>
                                                <li><a title="Bankadan Ankara Kiralık Bina" href="/liste/kiralik/2/bina/5/#/ankara/bankadan/_objectdata_U2FsdGVkX19Cf0oxkBdMkq4ODwkwUpnitKg8hhxgjBpv1o5wH89K5JiUYHoujqeyt0Qpg1zpMUIpXR36G4ygRqIkI3JCJEaQ2qk27z53K+Y1Pk7tGo5wgvShMfmC5apnCWvrZ4aUbu1NjPJKas3uOn/IqkJ6TG+JgU2S7BBi84ds7mh+cNkyY0H/55pncDy17YThNxmjXrAFSjATVYMzTTPwKw1ox/VV9fINGecDNZUpZTMKjbPbDn27qP8N43XQNbRNIPhszolac0YHl9DEwQ==">Ankara Kiralık Bina</a></li>
                                                <li><a title="Bankadan İzmir Kiralık Bina" href="/liste/kiralik/2/bina/5/#/izmir/bankadan/_objectdata_U2FsdGVkX1+2Tfu0kzt3D0HvN89r4z+qvw0RnQrX0NHePhWDt+ZM0F289dfbFA40EGu2QVTBKbmmwVNMQ6C7AATIlvKQJihstrkCxAsfO1fE0OhS+yS0GXl6JmM86v0t75+mcMmlX3LWhU4B5YMXhNczU5gAWk64xAV5lzYnMX58XH6HQ4ylm70TdeDbz/ODRmsCd6Yv2coDn+h5l8JsqcxAd2U2ckwoQAaIxYKMlhALxcSAyCIh2r5QwGolOdjoXSjJLC5LWpcIoKBCTbdo2g==">İzmir Kiralık Bina</a></li>
                                                <li><a title="Bankadan Bursa Kiralık Bina" href="/liste/kiralik/2/bina/5/#/bursa/bankadan/_objectdata_U2FsdGVkX1+STpLPOf6whUtKqFApYqY3FU/vOOOsRMlNuS2sxwCImWaphdmjoOuEZff2FWRKsxcoW+zFn6wtNwmY9tPYqy1kdiTP/MIC7iFls6QW1BkAQJ6aFCJsWzzRUEumLDsOQS23F4doMWEOE6PruTJu7sMDVjoJTw7LRwC7yN455ppGhkWD29rsoPzwbBsuJEpuWN5vLHQ1KOkgiB2WHivF8keR3DSYYNgiVj9X+QL1tFqmefXly9AkzZf4VeWPspF44DoZbOGtcQXeAA==">Bursa Kiralık Bina</a></li>
                                                <li><a title="Bankadan Antalya Kiralık Bina" href="/liste/kiralik/2/bina/5/#/antalya/bankadan/_objectdata_U2FsdGVkX1+7eaVGodBHN/88QQxhagSybibTGCaJxUJR6a/K5EGTt7W4j3lNJejM4JNi5UD9qQs6kSjZTnFz0p1pYQ34MFppKP3dzpCedkZRTixIiH9ZprjauKnb1HzdKFcNs9/VPTYZ1Ks1oYM9aku+laa9gLUN+iS1mfyFO5ETuzQZNe/bvnADII5EnX017Y1pdSotacG8csOlCN3tqQWhCaViImk2++NPgWeXbeTzMsiQ5B5JsvNzD3UuHNUJGlJr56UvMOaISkC4pzHo/A==">Antalya Kiralık Bina</a></li>
                                                <li><a title="Bankadan Adana Kiralık Bina" href="/liste/kiralik/2/bina/5/#/adana/bankadan/_objectdata_U2FsdGVkX1+uRb4mjwZf6/3hqbc8yV4fPF6kejeNS96j61r5yZG2SwbiJsRm/Ihpt0qByfQpizh+sTSYowrzbtdDVOobxo7YpJ4JM1IK+ebkUmpn+WSF2tidSyPqaudsu1Yrdp2RCArn+16Etn/mXs/CJz2h4Mp+esRsndhKmF41locZRAcCwtOh4KvqoDf8dqkjt0bCPsFvB9gwr+1FfcD9E+h+cErg2YDAoC757BP+VlgCeyE6MZFdwcKpeHtr3Z8fMgUuNNxINsFC2jVoSg==">Adana Kiralık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_f">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Belediyeden İstanbul Satılık Daire" href="/liste/satilik/1/daire/8/#/istanbul/belediyeden/_objectdata_U2FsdGVkX19Qf2d8Vgoigmr9RM9I9vAdbFiZktaNgdTnqeOxdmj3Mgp7/6P6hSCXdaoj3XK4F1nXVTcGERupI4bYjt+b6u0asIkeBB1TB4Zmc9hRwsfCnXQ5NnNUIgsoGg7t4hOyFyUdE5KlreSMzf3e84kaFjaCBVvS+H6g1mzzb3DooSyEaQQ4AKHw7TRCbxtgHBlbAgmBlBQg56sLdtDj7NJV5lenHPp5/LEJjLg=">İstanbul Satılık Daire</a></li>
                                                <li><a title="Belediyeden Ankara Satılık Daire" href="/liste/satilik/1/daire/8/#/ankara/belediyeden/_objectdata_U2FsdGVkX1+xplqXM5DXB9q3ZjKFUOh3PSvYVK1PIuPJFFHD1Xw247b3xNO/9ykM0RsDEevupTz60k54ZT5GeD/YQvDDl6ZaFQC91YsCHiGExNTJUfh+6kE8LHXIOIH8zkPSqNWjkOt47/S8qURA966C0AX7qCb1G6DPLQDPg9sMOBvqCHIKMno2S57jqvvfi2s+vKj+90hHGpO9/3Rcr/aSwNmBpNk30D1aA1tBRXQ=">Ankara Satılık Daire</a></li>
                                                <li><a title="Belediyeden İzmir Satılık Daire" href="/liste/satilik/1/daire/8/#/izmir/belediyeden/_objectdata_U2FsdGVkX19WumLJTaklgYOTnhsxTx7Hpg8OberQKw+aHPyr0TAA5lRFOyudEfDNgfWJEgelCeNI6a6/0SCbKLcF0XrPoF9bX12RQ6J+TzJxYcENc65BoSiUFM5lWrmQBP9/df0IjOGrH5Gq7m1srM7e85/woWPi0Whl5V0nf18AqCgw07hvlMk5X/0nedL8B1F8JsjkqIp/CdwViRva4p9ulGdnXhYSu2oCMpXa3R8=">İzmir Satılık Daire</a></li>
                                                <li><a title="Belediyeden Bursa Satılık Daire" href="/liste/satilik/1/daire/8/#/bursa/belediyeden/_objectdata_U2FsdGVkX19F4vtEsbU6VsC/2oWcBpY3LV7011+hC47DidEx5Oy8JnFhhOOKIYN23hazug3tTjO2zU1KHC8Zl1ZiaEmFYOow+pywL9veUXB74gb02RHZlnZb2TyxWy73rQSAjmLgBR5N7TM5fKOTXv1Ed+pgKa7QUKZq9shLhdtmilr9VxeBcpT5aa7lnKKH3SzO10scngqXd1ID+B97Okjb3uztENGcZSRbAJ69pCc=">Bursa Satılık Daire</a></li>
                                                <li><a title="Belediyeden Antalya Satılık Daire" href="/liste/satilik/1/daire/8/#/antalya/belediyeden/_objectdata_U2FsdGVkX19m/EbvsHMtXAA9T9a+YZ94WeI2xkI8bpE3vZLsdEScFVyCOpNPTx9lJYdqr4kyGgjjqJ9rCHPLiNEJjlNObjn5ZzR34CPSHa0mMTfm3ujTql+DY/lOU803cyBvuOX8h77fm0avbqL0ZGBZWjs84+Pc3idBbuDy6TWn5zTfMADm8NoFwaawZGCFJ3oY5vRjnQLCYIr5SUyxPklHJ9xRxdtb8cHP3+Qs3ys=">Antalya Satılık Daire</a></li>
                                                <li><a title="Belediyeden Adana Satılık Daire" href="/liste/satilik/1/daire/8/#/adana/belediyeden/_objectdata_U2FsdGVkX180GsSeR59CDZs5WhmLis9oGTIQffLNL4G3zxslMLc9Hsp5YC20B/pKHguLLKEzfGNe7VBTteDuCXE+E8QRHmNlwNgFSEL+zLU3ZpRnPysGAMKYp6UlM1BeF0Zhxd2xLJ1Um4tzYHDRK4iFKEw3ImLJURa8E+wvYbI+mfdXK5yueXyagMRwkGxBhFSMZeI+bYVDZhr/+khhF5POyHAuA7m15w0D/bXa3iI=">Adana Satılık Daire</a></li>
                                                <li><a title="Belediyeden İstanbul Kiralık Daire" href="/liste/kiralik/2/daire/8/#/istanbul/belediyeden/_objectdata_U2FsdGVkX1+dxK9pLak893X9G7uyZXmYc5bEOmoJ0F9nfW2Be+IA0A2FoqTXzv1zsjwOanjMWeIEXLquo/80EoUdqzmKGb5a9pGl8aeDTFUpRrYGsdbmuzkuN80VG+nxIikELetrFrMRbqgSM+beDZjmvC9otrccyLSJFrPTIjN6g0RuJeK80WorNMc0n9LtGVqDCDgFxliHDaz2HDm+HAxapK1Wfo0CP9flPoUflHY=">İstanbul Kiralık Daire</a></li>
                                                <li><a title="Belediyeden Ankara Kiralık Daire" href="/liste/kiralik/2/daire/8/#/ankara/belediyeden/_objectdata_U2FsdGVkX19a1+59K1XChj8lSUo0UWde88HqrqaOeQXrnGDeO0vWBo9Deb25RdepznjNPUILZWFxlTLKbDrEeJwMy7rYuGPahotLS7S5iFrBdkquWXVANjQ/47qCKO36VPnuwAp5UaPe7qSwLCS7DoNSyRrpINIGffwtIGds4R648H97o6rEEze0VFN+1hPlXSsCXLKfIeF4uWgB1BT3ieRZZLX0OW2A6m8YrBFbh1M=">Ankara Kiralık Daire</a></li>
                                                <li><a title="Belediyeden İzmir Kiralık Daire" href="/liste/kiralik/2/daire/8/#/izmir/belediyeden/_objectdata_U2FsdGVkX183YHGCYk2MySG00Usre9Zc9J3DMbs31g7WBC8o+vCVp2Sj7n/RqSFUX1Z9OEoJ8uzbuzlTyZL97KTpumB7Oje3PFDnpC6RIrUr/YQ+g6fZln3FrPwOrKTtfjaxIGupOpkdqrYI1Tj0VL49e8QitkjCYBaBDkI8lU5/v0lsq8eNgkPgeYpEmcoQZQNQL4C491KbJoJs4dxaOdJW1bGoc+MblwtpYWoiZwU=">İzmir Kiralık Daire</a></li>
                                                <li><a title="Belediyeden Bursa Kiralık Daire" href="/liste/kiralik/2/daire/8/#/bursa/belediyeden/_objectdata_U2FsdGVkX1+/VjjSm8M6whYzhxvZ1jCmEYFZmKwQLED9UDMvcTMVe2yZ9JLAaC3bacRh30VdkpaQKBUWiZhx8AFOGu2SmGbp5t5zA93EcBeLp8rDz9P2ksbcevVHXlXKUGPnTDqr7KDHxEJAyptvy3UAA7++154LgcoHH1CUPHGaaWTMrUsiweMKXzrMqJUm86owxMMJaHRmTA6o1ZF99BMKKbV14Y3xKVzlh9Rsdvo=">Bursa Kiralık Daire</a></li>
                                                <li><a title="Belediyeden Antalya Kiralık Daire" href="/liste/kiralik/2/daire/8/#/antalya/belediyeden/_objectdata_U2FsdGVkX19bLjv+zXy4BtnCxVIN47g8s89l3XpQwhsnZeiI81Ut/R/8+WpbqIcu0RRfk0VpNxd730dma1w+XBZW08s+kPgpXxX9dTMUm5jjFudzUz8qGrzg3MINx49RjzSs8YZ0vvC1nmyYWiZBdMlBvOxVQLm4Bq+aLowJjtDLaCvFyWwcUe2Bm2laiUMN5BAqkBr6Uj1fiBTr/ZswoaoFjYkenyaFc9lFdT6Uj84=">Antalya Kiralık Daire</a></li>
                                                <li><a title="Belediyeden Adana Kiralık Daire" href="/liste/kiralik/2/daire/8/#/adana/belediyeden/_objectdata_U2FsdGVkX19tqCtHaIgzl8yt+hBhCfV8Ft8NfxPXqvaup+BddKZHw1HEqzZi4Q6rufETzg0tMkpvHEvRusxidtMWoYqnvTsJsljQu3Kk+snljWvX2SkbZdKg/14Qg+Pb439AcID0RW7vMZIbZiyH+aTmp/u0h1zYHBGlAIaUIYGFAdobp4XSliOyBbGDwb5eObcRG4znosoGPD0ZXxKzizAG5H12iSYQCIA8z4oqALk=">Adana Kiralık Daire</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Belediyeden İstanbul Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/istanbul/belediyeden/_objectdata_U2FsdGVkX19oyOD0niXwhpVbS24IEMkrPt/AhHsQtGXUnqhI0mnvc5BkzIP5I/i4NGbv1ROZW8IFUiUoC/YhufpBWWBp3IQ9PvaXFvQgAsXECMCQBaI5p09xU7PuL0a+M9uKWTZNvzJIZghvOwB1r32qzmkmquydchUVl3+7h1VikKgNpEyZxWuYQyH+aZPn">İstanbul Satılık İşyeri</a></li>
                                                <li><a title="Belediyeden Ankara Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/ankara/belediyeden/_objectdata_U2FsdGVkX1/DDcv0Tn6E+skz9e3h+hVPk6akOprl96DKKDTmDbhESJWSOvATq0FykgqRQ2E93IAars02f/l/EhQcEK5n2hah3E+G1bbHrNG5csuxkvNt2/0cPjaiACkoTRlyf6qD2ArczIzYqBU3Y3dzvNzksWOfEZxYqSXmeFhJGHrDwPQpzsUPvcxnyowr">Ankara Satılık İşyeri</a></li>
                                                <li><a title="Belediyeden İzmir Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/izmir/belediyeden/_objectdata_U2FsdGVkX19Lu9SsaDJQGjVu+rmbeSKoHu0aPdP2xeD4WzYwnR8LtBuet9hwkJhtBEZTHOunJWXYVBHhK415lXQZkqDZvYFmw9LFV8H8z0V+hJu3ta6UYq3Mc7wxspro1zDBdJW6rFul6vhYokB5ZUbpN8plkcAcbY+VcGpJ27Tu15CJLeiaqyxDD58Zl6Js">İzmir Satılık İşyeri</a></li>
                                                <li><a title="Belediyeden Bursa Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/bursa/belediyeden/_objectdata_U2FsdGVkX1+Vk5FBZ5bMqxcIsMGBPyD9rbM9llm11sAF6vc6fvlEp2Z3+VsHBIBv5dxS/CUJixecml8rjSz0HAHhJoLLkCgm5t8IMCihhJir1tQfDsGSTwN7JTIexZor39qp8p4Heog2Oxwt9dpkpEJgmYcGngHYPc1cERYENM42D1U7zLllcPa0BMSW7Zv4">Bursa Satılık İşyeri</a></li>
                                                <li><a title="Belediyeden Antalya Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/antalya/belediyeden/_objectdata_U2FsdGVkX19swaYpvRZwOoHkXZ1yRpfvKuctwnkQMRUGKGSPGk8hb99V2V0xbbjDFFUf7FCSHZF9hBOeommiBVhQYVWMJRLbBSCySfHNhHaH78g6T6B299rRjLOLnrMqt9BpyouQlmvr0OpyCOaTCDLiiQYgLnW8KgpWGkcDp79WX3q7xfMBvQ4kqEK+63dh">Antalya Satılık İşyeri</a></li>
                                                <li><a title="Belediyeden Adana Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/adana/belediyeden/_objectdata_U2FsdGVkX1+cOVruqCWjolv8x/E1S42v3i3W8qvuMWEMyZITFW2YfpVC/Gg5zD8iv3pqAafs1HwcSdqd+xtB17QEyhA3DQeL/elGUEhHTZzDLnZucWH9YRETOG2vcvTEUsQsUtjMLoUwiDGfaLi68Sj+fbJigdfrej++7A/Djm1INgq/X8hMhnCH4O32P+ok">Adana Satılık İşyeri</a></li>
                                                <li><a title="Belediyeden İstanbul Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/istanbul/belediyeden/_objectdata_U2FsdGVkX18xbA6YXC0p40pQYjMoUbc9YGu0Pd2NJqxqUdgb4CbLEYX9nkfGhlVEEUgKbkbjhREKRAZnuYUUSJsu07DPeK/Ex4LBFlxGY151UY02xZGa7WszRi5nnRQzV+lQiQkfKfSXn4bqGiHn68I0LcNfBatje5cOEP9KQzhhMWHQ0x6Qsuqr26KPm8Dp">İstanbul Kiralık İşyeri</a></li>
                                                <li><a title="Belediyeden Ankara Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/ankara/belediyeden/_objectdata_U2FsdGVkX1+PCXBdyW3UXdv6QssR6JqeI6bl8tIQrxL7FPIm11Oo8LiWS71VhvayC0jJ/AxxKqda7JUlTmHgV5isJsjqFn/MRgKVFDaOiJMfzRoyxqbSbQPJ7l3oyz6oM03L+T/6jRc8Ny6aRla1MIsCLfsJNOa88tJisMJz0jze5o80jMWB0ceHH4U99Q1S">Ankara Kiralık İşyeri</a></li>
                                                <li><a title="Belediyeden İzmir Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/izmir/belediyeden/_objectdata_U2FsdGVkX1+m/sFGxo4lCi/lSvYMpzA8xPEXu8tLEk5bOWlj7YNRkr5XIt1GcOQDg9SXh8dDASLYhBnSLPkGBZT36I9Lwi+8UfUjuDwi9diX/qbuo7uPRSmg3W6ts88Q0PXejTs63N9vzJ7EA2MDLr9OQJrrcebhzQatyISHLDqSc6soVmjZxy8xbjDxYCw0">İzmir Kiralık İşyeri</a></li>
                                                <li><a title="Belediyeden Bursa Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/bursa/belediyeden/_objectdata_U2FsdGVkX1+vJcDpPOAcYsCbW5fs9r1tKAV1WRzfZ2UsFZY4fXsdqzFjGXGwxkJAbsKqNkOa2oLqzCzbodq5exXPEF8B85qI8MEs4ZmcruuhuHHGHXf9VzV+dKlerxTIqaS5YZ3qJWbqOr0TuWDgSGoUnGFQMrgNIwdnaB1QQWn80gJKr0uM+FA1Zv19mHqm">Bursa Kiralık İşyeri</a></li>
                                                <li><a title="Belediyeden Antalya Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/antalya/belediyeden/_objectdata_U2FsdGVkX1+qETXYbHz33lYHqe7SuLvbXwjouPjQKFbVqUn57ozoKnJ9HNOBmdyOGGYN+9jdHD7G7x7C/YeikKEdWN4BbVib6lIS0XblwSmHEakqN8hrMG45FszJvN35W33a7MTgnoU8XT62mlUkoG/lupi730/vONfya/cr1GPzvwHeWHzybipdBwOwRhmg">Antalya Kiralık İşyeri</a></li>
                                                <li><a title="Belediyeden Adana Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/adana/belediyeden/_objectdata_U2FsdGVkX19Kyp+pbYZho7I6w2gm5VKXoYEt3o4j6ccnbGZw+rSuIFA7Lbxe1cYH0YfHHjNXJP18X4uA3ZxMaz10LGwJPcBs5w6pm7P2aPQSjFjNqG8T/SqJQDbeYtKZMm7oO9WJfUdSpuKcd2eT19wUMUjIOWcy7ZmYeFjuSL/wK3EZbgbUv7k2Amc7bY8t">Adana Kiralık İşyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Belediyeden İstanbul Satılık Arsa" href="/liste/satilik/1/arsa/4/#/istanbul/belediyeden/_objectdata_U2FsdGVkX19aG1dSS8JAHk00J19NobbDHevBHk4h4PJt+eYzmDCUSmn+SEfHid477/sdh+QOz40MZxqAPkYGb5AEOh5rKesDfoc3XhasjAKW8GNPaEg6AJWzLFvatlXRY1n6JONMdC6HzgUjAzW7TxmcsqBg3ozMDJawG1QOuNp8MEyYCZu1nPj/sxt0L1Wxb2dzTS2rUF8bF8kX0CvqAxsijteJAIM58KDn/asnMNDHRCxykzUaTN96NRdvevidzWRKTdPToDmTVaBRhw2s3nZRNQhpFXwnibimYRLwdadWJ18dlxpvIbQ/FwW6Zimc">İstanbul Satılık Arsa</a></li>
                                                <li><a title="Belediyeden Ankara Satılık Arsa" href="/liste/satilik/1/arsa/4/#/ankara/belediyeden/_objectdata_U2FsdGVkX1/Q/nf7uDs1/lYsqTF/6x9TnVzg5Z8dNzYsxkQCCQ2y42nkAGzYAMVZYCmRvYNz82S4kuwuqSmYq4mVKzoT1VD6aO0KuWhjjGnpcBWSZbdOiLk15CPELPmF4t4P29KaO82K9hsU0b7HBBdXKL5RZ//5FavKulLfXqYq+wCk+8L5okzg6z6QaKWVADWDwQEmxchbdl0j+ia7QWdnQVIA9flsy3LtsV0fq5H+9ksw1n3lfnUcRBtg2M4txjZMqQUVAvGWA7nxtd5bRmKs0QLPl1GbAGXGZLPi8yoDa9oJKTHtVI7dmnmyDRyd">Ankara Satılık Arsa</a></li>
                                                <li><a title="Belediyeden İzmir Satılık Arsa" href="/liste/satilik/1/arsa/4/#/izmir/belediyeden/_objectdata_U2FsdGVkX1+0B0lMNNMc3BjkviS/bAEPMtwlpJwyoBCiet/87AQ2U32Tnfresh0SexECvHvdSa6rdtk+4yzFaNB1AAnt+CpqrvzNjc5zf+e9P3FafdHGEZl8Bld6ulU+XtBf2mOTNzPp2K32CbOnttk8Dts55BzTUgJ9LBbq22uAxWOcs045KFH4ahdXoJSUuXDfcBCK0thvifreYe+Cov2tjAf+YsMf/+3O9d4NpSJ89vZTbR2dlzoaRhvg1yLJEcep8jG+XMDRkJ4Ugwnjx384j2qh0GbQwA76MhsqvATiJQUHFS2008rGx9ocBxOQ">İzmir Satılık Arsa</a></li>
                                                <li><a title="Belediyeden Bursa Satılık Arsa" href="/liste/satilik/1/arsa/4/#/bursa/belediyeden/_objectdata_U2FsdGVkX1+6QYXxrgBQ5CwyhTC0r3K9SLsfKKz0E80bGvUv1Zmwta4KClxAQC8DeM/EZuh1uiHuyD4AQU6NcpHjWb7pqYV/6js4A9cYAb/3BEU/q2KZrAIFUPzw5+TV34S6sIg9kH2ROmuIITbfALs0SVLafc1C1dXbfGU936wLoCJiVuRlgvOX0vex8TDl7x4dgNZ6wU4OGt8GYAGeJe8iKx4oJqG1iE3SSGWRFY1Wy0rSnz+na25JsBtZNkZUk9xZ4WNqkDi+NtiD4Ejcfr8nIVwX8/uWNfQ6qL4ka5luwBQnrNplWnldZ6OyRyDC">Bursa Satılık Arsa</a></li>
                                                <li><a title="Belediyeden Antalya Satılık Arsa" href="/liste/satilik/1/arsa/4/#/antalya/belediyeden/_objectdata_U2FsdGVkX181iV8Kvd8SI4A0Yf0bokjGU+0NeUmniqcnqV2V6lxUFpmTieA1kc657GUj2zkMxTT4N6j2x0+rQFc3NR09Gog5LSxYVInBmTfhA6GBp+3gMkVs7l/wv+7eVOaR1+eDJ28xpOE6GPwxTWdx5RFE5LGYHvRGjNFDIkTIVBp/sILH66ckjYTag1vEpTHPXBoi5rlaQfOHEatutCkbM766lpYS3NZrS6XDXe6S0OsKA3Vt2uq1P64hhQhL+G9eJc+Io90AkmvceAtvul7SimWwBI7Kj3FYtgj+YEBbrk4+ZJ0Rz82AHciszbhD">Antalya Satılık Arsa</a></li>
                                                <li><a title="Belediyeden Adana Satılık Arsa" href="/liste/satilik/1/arsa/4/#/adana/belediyeden/_objectdata_U2FsdGVkX1+jflKRoDdPWmuxhEYfOFNRi4XhnXw7yyJjmS9EJGSFxVard3xm73CyoDrVapSASBITgv1GFvCugCNEA5F+8aCadcm1T14Or2OEzsiojIWXAk+WKSYilv1iEA4B+DiyKBsb0rLsT4xaOQ3NStX5vOsNY9ljiLJQUXnaQuiLuK7UtmrsCH3NTu6FlMY7+hgwPOED9BrQE3jPH7zjR6JNDa45uksJISXBRg276sfeI44PJJNxR6Ld0+xDFP+0TDtbitNbAq6w3fiYJLL2EZ+xZ4+WP44Fq2ZlQBRpAzG4ARN+ad9O2F3utYVD">Adana Satılık Arsa</a></li>
                                                <li><a title="Belediyeden İstanbul Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/istanbul/belediyeden/_objectdata_U2FsdGVkX1/OEyAPMF24Wxb4dj3VcnwAVjklcZ3x2Lrk18YZZcqwtUQW7bAbZsH4EkvHf4K87eFr9dLqLJw2RlIFYDKXvJC39Q3aFT6pmsBGx0hvr4943qNzB2cAC07Ti0+rOYUkZ78bxEPAlIKNS5JeCJupkE+9I9FMmQManFTwdw6m1yoAIN6F1TvYeKnwlDUQAOciQ93n49F5V0gAPhMAhKQfkfbMgN6vAGEJ+mYtKGPgj5Q2pxRxxDIU/6jLEhnkzbpRDZ24RnHJ3MplL/Uq83d2Ohg6XgK5IUndpGTSHrxsIUpsKOrn5zeMR0f4">İstanbul Kiralık Arsa</a></li>
                                                <li><a title="Belediyeden Ankara Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/ankara/belediyeden/_objectdata_U2FsdGVkX19mvH1NyO7hKP67iy0QVwNAntyVv+B3xlMJCA06cu5P0PAzZm2NdzwkEGCHWcrf7r29TG4UXOuqux0QnzG4A1slwUOTHGwgKVkB+bwft49jMSOpnPiz4KV3XgB8s7pJ1Uw0jPHHOSPukgIMLuMPT3sNOEVQHVC3T+7zCafhp9r4kjFGGn6m8h1XVsrKNWc2AYYdktPAEyZiqfQlA7cfcod5MU4cGabYFeBFWaU8au6E4vYVQoZb4AlS7pBspkAQmx+C6ivWvFOBOfOPGCSjhs8szHzNNfHRzff4itV8++hAREhmPw87s2CC">Ankara Kiralık Arsa</a></li>
                                                <li><a title="Belediyeden İzmir Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/izmir/belediyeden/_objectdata_U2FsdGVkX1+neuI4usPkdnyQw8Ox6ZnxlDNEoG8Q0AfY4vGbTUe0QKiiUgo0FnbNpHXW1lNduP64NeMqtWzOOPSvnKvKjdqiHQcrAGIDjk/iTfecSa7DW5rGk3dpA4h+cpYeNW72NhCBrqY6FYW25R+HQUpXzHOx1G9SZ4lEU0IOwIpiKCsVwHD6C9OQKrUtfWAfEN7bgbndJBjZ13An3aOJs1enhvAZe0oZNyqUVKaEW6p+0KMCi8nR6WRdvLGZ37O3f8rH6hTraHxcjzJ8l60YZE/+xcVslHmwTOqpLvMjThs6Gn8gkW6dT1oDbvDb">İzmir Kiralık Arsa</a></li>
                                                <li><a title="Belediyeden Bursa Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/bursa/belediyeden/_objectdata_U2FsdGVkX1+QwU4kx8Ah1VPa4FcJdV4D3pwrzoqYNQ49cjsNZ44ZwNfXfO5AuswNsPyGNFril8xlGq744Z3s17OoEHNlU/9OIBLEG8cCrzt1bqeVP6+xioRCAUIEs3Y9iuJOvGCmqOtMF1HN7gfj0N4MLNhWab6qrY1huAn7IOm+M1Vn/EP49xWdH+yNvu1aGoimTcXcSXUcYuUFStFtKTqKkW67Kdmf4HHruZlyFIO2joea587QH0duM6RaI0vl9FxvcUU6VREirsNbIIgDvjoCP5Tr70b4C9xMiDXcOUtcdfJstAlznvg6s45KjDAv">Bursa Kiralık Arsa</a></li>
                                                <li><a title="Belediyeden Antalya Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/antalya/belediyeden/_objectdata_U2FsdGVkX1+SkweoR/CvYJgz7X5R/dRC6aL4Kg/4DpRYps/dVRCvIeuLp9B6vi3JrnviG1OFZBor0uf2uySf0eXuDy6jClt1fmAURDF2KWHI/qhD6WePXARIbDX6BTZXCzhoD14CqXDnXsLSmy8v0n38p4XlfVtYnLCH5A7CITPPzLpu3IN2FdDB5NNVJQL8tZLMbpQ1DKssj5Ao2ARJMQ42pl3hCZihQ8CUOEk4qSc0hZumYtwHozrTQBm+5lmchF2gqeuoCTVGcL3qf+5zEjz3KnMjVly6fT5LuHAuB8qm2MUvl0cbR1ea79w9ZjLb">Antalya Kiralık Arsa</a></li>
                                                <li><a title="Belediyeden Adana Kiralık Arsa" href="/liste/kiralik/2/arsa/4/#/adana/belediyeden/_objectdata_U2FsdGVkX1+2oSwunzGVCb95nykpd9pco7vf1lD7J1njwrLnbYXBlPR6kz3NIgAkE8aEnQXQQLX1a0Bpnh5BfhDHNlnapa/JeWwg5ImJtz1IhTihtliolXtwTvZ7rCwtlpiN+OtflfoQJxKcXQchGGZK+D+nd0PBkKz+smBLUOzxthXj3cgDKrcw9eGpFO6sL88SpYBPuIlyrHT6qpgnRbN+p2hkxD4B1INhokiBOzlV95nhCjyU5+uAlq9jmt+ZmGl9TfXCqrKC1/nLDTkWCoefn1+seRMtwdyZ6C73TeRZFTaW7khJduDDy+os0ghy">Adana Kiralık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Belediyeden İstanbul Satılık Bina" href="/liste/satilik/1/bina/5/#/istanbul/belediyeden/_objectdata_U2FsdGVkX182AIZhOvMk2Ax8irr4ea2kgSDDI5kioNvi8ua6cw0Ab64+B80ZAxPFRCtzUMVEJDID5MxiJSvtc91SLaas2Hko5kmgmFl5O6mPA13NkYEKGPsIPdVcSaX5vuXskjHFiEW9dgWXfs4/2/2sTZajjDvSvETbQ0R1t3glHrGb/BY9EwiDzAu0wD2sjoGfT7Vt+3TFjsscVbrRzkxizk8rWvVcC/4iJNdyfOgCdNHlSdDS0ORbCsfEVy7KH/KwAQ5vSVjZ6xiE/Scrtg==">İstanbul Satılık Bina</a></li>
                                                <li><a title="Belediyeden Ankara Satılık Bina" href="/liste/satilik/1/bina/5/#/ankara/belediyeden/_objectdata_U2FsdGVkX1+y4Yk6LGg8VERdlFEOR6tReK0ca9Pr87B0HjU3GQ6zRIxvb+iS7aN9oM7ZlID9SbG9ImizB8AnlNlG28cm5TELrvqhNJKMVgtRnklYnZtm/q623iTT4P6H0VjYIYiXOeATnTZD47nUT7FdWUFQBEwP6u5GiYtFA8HE0PZX4PR/Pg3LywwYEx3TmdjsMzsOYGq3keIEJ9XauwCZhUrHeskNgOAO5gmQ6Tu1HyltWsHKSiKmbXyJtOGvhPPgM/Ie+pbZfjI8Ro+WXw==">Ankara Satılık Bina</a></li>
                                                <li><a title="Belediyeden İzmir Satılık Bina" href="/liste/satilik/1/bina/5/#/izmir/belediyeden/_objectdata_U2FsdGVkX1+z/pygL/9jT4V8KIOwMi5zO32zmVEUhyXe/veSGNwTsNiZ2rl8fpiFA5tBVKs1j6OWmz8nw3H7c0sbNY6wMrrHJdvCxV8V5nUsT2NAhF2dXiYs2ZTc4c/I9palalhT1Bt/hu4poqAfmPBy2m5I572Agjv9deng24lnouA5DqgxTCvDbnvPcw8yEQ9RKjfa0NpiClEN8oV1c11YNHfaRVpTqqWIJ/42eDuG85L0yHCJiCtlaNcaJI0MY/J+NdzJ0ox/PhD+8fzVrw==">İzmir Satılık Bina</a></li>
                                                <li><a title="Belediyeden Bursa Satılık Bina" href="/liste/satilik/1/bina/5/#/bursa/belediyeden/_objectdata_U2FsdGVkX18rUXkWxGyyuw1EgeVkdNwZdHR4ispkbBh4j8focq1PW8/HezwATM0J0Vhh9MR0uNykW5HeuIYnLm0pYgHzqPi9HcptT586mSonP8gB/V1Zgfwc7ppq/6IrUxORKPYM4Oh+s+2PuBEDCpa/4sF9yd7kOkkGx2QDhaePpe4/qcs1xjvjeN+QAMXa2RODk51z/waTqZZZFY4Y7+1KhYGYvSL/GfB+Sl3SbV7KBnINVVsYWxqefpCbErndr4i53cMTNzR5fjo9pLu82g==">Bursa Satılık Bina</a></li>
                                                <li><a title="Belediyeden Antalya Satılık Bina" href="/liste/satilik/1/bina/5/#/antalya/belediyeden/_objectdata_U2FsdGVkX19nnI7cSzOwxpodqqgxhFHvs+PfEVNI+lowM6vaLiyNhb1OKDwFHMSE2/K0DE5ygnVqgEWFRySDAA5wdodQCychDytZ9zguj4k0/7mCzN4xOudRavMRRKHKd0jGG7Oxz65XJ7MU/j0/WmiclAWkbWrbsmOFqROpK1tUGZaRSRi0kVNtFBYu1W25IFd5nMA+PAA93nGwkueQcvH6RndkOdjKdK9imtmwQZU8pS9wV0+MeW7YX3OWjy3Sn7yk4T1DIAd+TlfP6tjlkA==">Antalya Satılık Bina</a></li>
                                                <li><a title="Belediyeden Adana Satılık Bina" href="/liste/satilik/1/bina/5/#/adana/belediyeden/_objectdata_U2FsdGVkX1/RZs5cwEHqPPzOggMmPQ/LtP+ghSTV0CZ+WLeK4Ovk7Qs68jubqrRJAakxvmhattZUEB0WNswuwNb3Mm3BXE2kcMu3v3slIeADOOnY3X4lCKuvlSgvwQO3YxHJTVnDKQBI/iQU5A+Uxl8dSiyZqkh7LSC1pakP4IOmJqQIm+qstmXc8StRU5Nmybeago5fPo3+We96r5d9YYoXai6vzbqpX7U7CYomyJJEi4fKjkC/KS+9DKDDOZonSR7XWf4dNiNnLf83OPs3IA==">Adana Satılık Bina</a></li>
                                                <li><a title="Belediyeden İstanbul Kiralık Bina" href="/liste/kiralik/2/bina/5/#/istanbul/belediyeden/_objectdata_U2FsdGVkX19w77SUXeogQnUEP6ShRftPUntuffuR8xXJEdpd6sbVbEshrM+zIMWFESGNFf2PaBtO3kvMNhFi5bTR14poV1CZfyu/j5rYdVIkry/Esv3ZMDGH2T5omdSVoqRps8rehoN9/WaPEsmLNA7EC8YGpWwFPHxoO1+NQua+0v278gk4tP51m8SwwnFfX23tvpggfhgRSwiUJZjDM4/jidwpcReRgnxD5alzw33bzFu7B+NZjwwMYKCb8uMLU2/iUMFclOBzAn+VNbzNow==">İstanbul Kiralık Bina</a></li>
                                                <li><a title="Belediyeden Ankara Kiralık Bina" href="/liste/kiralik/2/bina/5/#/ankara/belediyeden/_objectdata_U2FsdGVkX19M/jlgpV3kwrA9SKCAsdiQ/KEBlhCEM6Ivcb0GfZAVzSAJMtygizZEbgJciMdXkApMprXVJ8NJ6mblYc9LlnRxYUrYQX0TUGio9Kue9P9lrmEd+XgJCBUBReLSJolv7kADnMgL9Wi7b44SAUaxdWe7c0A8QvgW8Qbs4hjz/Pw6kgx5BGwNx8cg4iXMug91D2fWL6y0/z+lG8HupUstzyA+a6D7Oj4BqutGxkEEXNBPE9PkfCMmSfdI8NaDO0OJ8yor6i/Ls01pJg==">Ankara Kiralık Bina</a></li>
                                                <li><a title="Belediyeden İzmir Kiralık Bina" href="/liste/kiralik/2/bina/5/#/izmir/belediyeden/_objectdata_U2FsdGVkX1/BLm3Yqm1f8l6g8Gymc9NP+muMGZdb2dFp+q352wRoGa8zDqOs+3mX4qQQodq/y1r/gLu3gTIXI9DTerAr6mT6iB2+0x1bshGE0Oc5zjN56pgVCfvvEAuSuttczi5LyiM+chI0q+hMg/WIRKj6jFG5JXxVACaTvSXCf2VN1OO0LLJsUl8J+xUkDgvMJRG4+GZMKxbSHUnDoSUFOZaY3O6nk81Ick46GnTFuM0BWDOX5vII8FDt0tvpbfiPCMN+nd/g3cHI++tsew==">İzmir Kiralık Bina</a></li>
                                                <li><a title="Belediyeden Bursa Kiralık Bina" href="/liste/kiralik/2/bina/5/#/bursa/belediyeden/_objectdata_U2FsdGVkX19Mvj5Iy9k5w25WJUiWr10jCDK7HsNWPqoe8be/QgrVG9YqbUZ28Aplj8gD+PdRQr6yPTo1hPSEeA+Mq9zdcoR8ZL+veWFbLrg+ONgfwx133pm+XWM7UOo4nDNfDHJh6xRZAuI0+UZ8ZRRtZRXeQGtPk8d4uH7kkLUcWPfo/NNXFE1XdxrFwkTJjklEJgScuOVSyLbxsfOrsnLZ7iBp7iItHW71jy5YL5MaEiDY35I0HSRrgKjoJYQnJiga0MHIxHNi6PsDwAet9g==">Bursa Kiralık Bina</a></li>
                                                <li><a title="Belediyeden Antalya Kiralık Bina" href="/liste/kiralik/2/bina/5/#/antalya/belediyeden/_objectdata_U2FsdGVkX19civUwlXDhB7KJNeDPbvmZ1b4PrX1WJKOR/lVHSNUeWGM4NaMavMH+uherHlNiU9miUvZOPzIPZ6/nZm3jxgcTcLnYjFBG3iZfKNsLQVKSEiNp0F14kbpXafws+lZud8yM90TB+9Ihh+DpGgXHf6thkPxBfeYm4QEF+93WD4s82+JxLGCxL3W3sFyt/pS/uVZGezpRqYJSbqdM4kG7v2rVfZpMnfJJqZM0dF4BUspjeUTqFUqgcuy3G/OfOj5DC3DgBS6LDXDfqw==">Antalya Kiralık Bina</a></li>
                                                <li><a title="Belediyeden Adana Kiralık Bina" href="/liste/kiralik/2/bina/5/#/adana/belediyeden/_objectdata_U2FsdGVkX1+VJ1GHl+D6h51ncki8c7Va4SMQniBkb1mopO0N2Vf9TC1JLXG/fPoI5MGYBSUmknnMEOSyYdWaJCqWTP5MGprxgHx1y/T00NnNGgtl/zQitnR4IG2DI1PUhZOvK5Ht/010cXqplLoke5fN82FuvgMMzU72wSFB8MEvcAlsZEtdiBm70QsCGHHKwd1orx4kX33WDB/B8Y5McDK16M2PTLKk6H651jAUurmu8dO03oGuQvHY5H2hNVaLb8zNJBvfaDArewuzboTdyg==">Adana Kiralık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_g">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Hazineden İstanbul Satılık Daire" href="/liste/satilik/1/daire/8/#/istanbul/milli-hazineden-guncel/_objectdata_U2FsdGVkX1/P1b/5Y+FGqlo1TiTWD8lwOiHtgMizxJDVZ64FoCJwOiAw1SGB9ISsy2GHjbyfweoV/uZEg+GqpZC5clJ9C7dp3AXevN1+LFOR59tZ+i7myx89JWYvInKqGizijeyjveCrEIcxaQxeAAwHG+sCk6KFDqErCdb32SvdI7A9pZ56pag7qUrLim8Qwc4rPA+4mG9d4YrqL142Rv1uOepYxbrZolpwgp2OIXc=">İstanbul Satılık Daire</a></li>
                                                <li><a title="Hazineden Ankara Satılık Daire" href="/liste/satilik/1/daire/8/#/ankara/milli-hazineden-guncel/_objectdata_U2FsdGVkX18+nutJ0dNcRT2EN6glr46hNga/YH9aqblm9CoTCvskT+y2PA2HvvoL2kGVlalOGHJ55XrprlC19ApvY2NDVOFE95VCYeG0guO+QupWmsVZWzuDuShCSrDv2kjtWo2lGPoMaAwhxhHoXs+gPiIDunxjQbTMTDY8hQhnS0MrBfn8Rvr2YTKq+68bk1yGru/eT4kuNQ2sPU1iZi3IiAeNprAsJ7+59+49hag=">Ankara Satılık Daire</a></li>
                                                <li><a title="Hazineden İzmir Satılık Daire" href="/liste/satilik/1/daire/8/#/izmir/milli-hazineden-guncel/_objectdata_U2FsdGVkX1/MXGCHsdMC2WM5YB2se0IIlYAV1HxGHHZj4qkIpilNsJ16M9NHuFK9/eHTEqJkEn53g9SUy7eC5K2TiSEZqsgtPKNPTyNn5reEL+/rnvot4bm9FslQo35si5PsJ8t76YMzehLjqgaiHbQ+mHVweW3VzeFfuxCAGBjY2nS9PW/ur/uFD9yS7m+JnokxshH7T9xkF+GcO2rkJ/Qk3baSt/2URuzww6D3iOM=">İzmir Satılık Daire</a></li>
                                                <li><a title="Hazineden Bursa Satılık Daire" href="/liste/satilik/1/daire/8/#/bursa/milli-hazineden-guncel/_objectdata_U2FsdGVkX19TQTC1ts1isHJrf1BaLTxF8vVAeWMWeEcbafkgp4yMok5E/9oXmqdunxDfgYhAqqx0mvcYlmPAj+VLA3289bQI2pS7cV3mkuaJ2E0y2F0HOYQ75jZT+fVGzwd2HoiM/CxZ2JJm4+MgZJu4sqR5T01OSLGacjDxc5uPvqoxDm3296TX6fFSZPSjBBM/pZB1zVYr5T6I0b4sTNAWa+6jz/Ht4Ndw8x0ieAU=">Bursa Satılık Daire</a></li>
                                                <li><a title="Hazineden Antalya Satılık Daire" href="/liste/satilik/1/daire/8/#/antalya/milli-hazineden-guncel/_objectdata_U2FsdGVkX19uaQ8vXLIPqVrC6pKm5Zd9MZAptBiFcPgxbnYVLyba25Ix7ChzDsfxDXcXTRhbQAe/SSdiulHgdvM/DL/XxDqyRJmT9kEsuqKuSV7LYycSee9ML897mTAYwGgPt5Smh7riuyKdi1L3lFmqeTyGZEnGkpkaO7UKzejZsqMq1s1QBQj/vD0/4eOeXBCSqRMrFMSI5QEFxHdWHrV4et5BCmSJBh9WwyYoNps=">Antalya Satılık Daire</a></li>
                                                <li><a title="Hazineden Adana Satılık Daire" href="/liste/satilik/1/daire/8/#/adana/milli-hazineden-guncel/_objectdata_U2FsdGVkX19dMYlyw5qOzcJAVNrQMMr0SP7Hc7scXOVu2IdP5a0qDeodIfH73R56D8WXjHz6Qu474MlWHbLo3A3pabAoEDu8I4A9YadE9u3oOvSq1K4HkWbZmRoE4Hy0boKAD5bwmQLrlrk0uAoEyEdeMFIrUiBKe3BrauoOHlg75QH3PIzif/RPvB/2LEz7wxJP9ut0MMbRr8zkEP8J6OK7a6yWDrDu1AWs7/4wSRc=">Adana Satılık Daire</a></li>
                                                <li><a title="Hazineden İstanbul Kiralık Daire" href="/liste/kiralik/2/daire/8/#/istanbul/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+/bow8PMdvG7Q1ttIxEE9SKgVU+FUuY4VvnCrEPPtxTAUXKQXyqWDPRP6aI0qtYnJofqxVieuCH3DARR9t9h86Wt0ydQCAi9vgyfJJiGBgMIxwlqW8rN8WA3+s/YziucyIo86y/pMciU5Mypm9ghofZCqiAwSuyQt0H//Um+CZ+J7Tba/awPCZfOAlBApeFEDGv7FhrmL8taWkRz+YAg2ZycVA7s9J0RU=">İstanbul Kiralık Daire</a></li>
                                                <li><a title="Hazineden Ankara Kiralık Daire" href="/liste/kiralik/2/daire/8/#/ankara/milli-hazineden-guncel/_objectdata_U2FsdGVkX19GPtUr0o5RqbwakAYuJYrSZATSqByzI6cJcwf/p1aK5dQiOQfBthSTv/em9lN6Zw420Vv9rnLinVtwrF7vq3aCEBCzbQ6uEwGBaOGE35qusJWeqAcwGxvwXBdgkBalq3NYSR03IxaQNckgQqjXBKuuMMJH3AHOyropX2ZgP29mqc3zYoJCtQsUSVES+NDmYb2Q0t3M2hSKflwLktezMk7P4uIJFPyL97w=">Ankara Kiralık Daire</a></li>
                                                <li><a title="Hazineden İzmir Kiralık Daire" href="/liste/kiralik/2/daire/8/#/izmir/milli-hazineden-guncel/_objectdata_U2FsdGVkX1/PO4oNOvwNVVLpc0ZYJOOutc8NJoTMZXuDtX2nx4cnDneZc3SQInHzVsBZ/WRx/Bl6/ZshTAd/mp47SRyw7CRTZnqOQ2nit5I4BVxHw6A8PAJmAxFnFrcKpXedgGYanQVH1TZL42Lj9d+uFTOSddtTDdqwTPD1dRSNgxaq9OgbBXV9J3fwVqk85rIF5WJjy8YZkxCM0bbUdGYFXi9vYzOTTLXxvWxNXAg=">İzmir Kiralık Daire</a></li>
                                                <li><a title="Hazineden Bursa Kiralık Daire" href="/liste/kiralik/2/daire/8/#/bursa/milli-hazineden-guncel/_objectdata_U2FsdGVkX19LnlelR4oryMbPUxMHYUWEgCjumuxk9a0NcVUCj8Q4+18DgGb5Z3vViq96simAvFuMHDI8FJ6gXL6sUfAPsZiTPbGQ8uhkpUz2ntHhLwMKsQvzmfoUtE4DiLLyxMFnq2wlHtxuNuU2H6OzViVGHxRtNnI0m+tMaLYiFBGxxXtLFVUgpWWfrHBVaCSQ6oRgaz4PQp7/NRX4pj80wo7/jLmyvci5Gmi0GDI=">Bursa Kiralık Daire</a></li>
                                                <li><a title="Hazineden Antalya Kiralık Daire" href="/liste/kiralik/2/daire/8/#/antalya/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+q2qr0zFjyuSdCQMSwC4hn4R9f/Sgs/Pbga2TK0r1LhMoKnD3GwRBwOz9rRCsvHc26LIp8ABxomvN8703Rb9dsUixmgNWpZHLu4BuNdd3qDKqS+HGa4F3ab0glgC65yQlaZyvr1QqIQZtkyCUljaAgDYioEIosfe/Jzm8DTPE6oxUC9a7KeUfDJeByefNucH+U0wcIfkEMFPwsZfXDFSz2hkpvJwztD4E=">Antalya Kiralık Daire</a></li>
                                                <li><a title="Hazineden Adana Kiralık Daire" href="/liste/kiralik/2/daire/8/#/adana/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+yrooRzVN0ZYRJp9v8qfC7wCC9rYcy4Lv3skmpcTRznipASYrFs9T98ueoK+RodgyL+/2rr1p3m7Rg+/1HaE841XSfbWckQyUVr7SAwgaFan6EvHRbtUbFG9Mw6IJrYSIMVT87tKHL6ukNfdcTUA/Y/TVLVNlzf24gDwSdrG5wgxy1W8qMW5P+CpkZtlUuG+BezvtNyVzvGx49yW4N+aXVx+1RBpnrmqM=">Adana Kiralık Daire</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Hazineden İstanbul Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/istanbul/milli-hazineden-guncel/_objectdata_U2FsdGVkX18tsF+qn8c6onTSA2xVtErnZ3qYyJDME91pCPb67AsqSZ9EwGwDYeATCX7Ql+04HCCogVP6r8sJpd3vF24GISU+4RylwR7BPHqMGu4/zd0X+kpRObF+6xoV5jfPvZg+oxGM3YnwTxS6fEIwtqrLWY7VyaVxNcYTil9QzY0jmR7NDDcA/nvpWvrt">İstanbul Satılık İşyeri</a></li>
                                                <li><a title="Hazineden Ankara Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/ankara/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+w6hhzT9UBpe0R4l6OB1Dv04JflQ4O2/iheQqDUmrh2rtN4VeWGPQ/jDx8+S3HNo4rtHBtLgDeRu6ioR3FaBashXZ4nt3Ss6LYwbBpFfSsXIghqNqRj9tEj6wDKrOWNyKsBzkS0YnZcR3GeNPQFBaP7WkO8Aw2nSem+/URgJjdPKIUGIk3G1uH">Ankara Satılık İşyeri</a></li>
                                                <li><a title="Hazineden İzmir Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/izmir/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+eksJ2kB6gNknfrUXP39PHFXT9PRlW7XI115wh8fuv3JilkB+3wsXGfBiTz+CLn03A33uaDgqKFWQ3VR+67waNUtYsbJ0ha3N1ZqMkq+8Kw4u2r5SBSspdpDl1HKpucY1iJPlGqlEwfAW9hojEWPbYKLfF0X3Y4KnvpSb+4cGuaaw+bw6H2yuV">İzmir Satılık İşyeri</a></li>
                                                <li><a title="Hazineden Bursa Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/bursa/milli-hazineden-guncel/_objectdata_U2FsdGVkX185ojfBlZwwKPwFomii103P+pxA5+CZkkRDosG1bIq/qkaLa7TQwUzdICImQ7Nj5Nmv8LVGIDXrCp0EFHGIINnGE1LIJhBxL172JeA71BiiJMfkdARMGxuTj/QXISa/VzuW0S1C8/SIZL9uSlpxEPLvgXBj/aPJKfuQutsEaTnQMjqzYtGXYv1i">Bursa Satılık İşyeri</a></li>
                                                <li><a title="Hazineden Antalya Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/antalya/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+9y3YVupGDVkBulG+2AYCcTP1LL/CwdMIRh6Vjfiek7B6B4M+eDxc17WiRrCWh6ICJ0tKcCRM1e8ilQvHoUjx84QS5xLZb5ge/GynKDFGFdelaH5L9HcDMBzC5kQnslK5Utw+cA5Eoe47HKV7fCRfR0iYgNr6HaAhGuGLqjmsg0cZdHG5Zz+Pj">Antalya Satılık İşyeri</a></li>
                                                <li><a title="Hazineden Adana Satılık İşyeri" href="/liste/satilik/1/isyeri/3/#/adana/milli-hazineden-guncel/_objectdata_U2FsdGVkX19a+xWJb1AZJQ5w/fFTE/z1XhAwyHiIe1PHDgv9SZAvX8qXHy9V48uaA7jnbhLzbPEBdQquz4+tvCwjta1Ug+F3pPMqYj77ymcdgLOdTmaOuGClgVO4rgLQsHVPSvTY9oDq/mldkLWi/ZEnZDns6/0joXP+d4L8LTsI6TixW59sK3ICUjP5Ij0O">Adana Satılık İşyeri</a></li>
                                                <li><a title="Hazineden İstanbul Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/istanbul/milli-hazineden-guncel/_objectdata_U2FsdGVkX19h8aOemVOKuuegUXziL1odaGJBM5lTfP30H2ekfvCRq+GHTsZyVNSj72SEA5Bm4DUvGsXO317KuQ7cryd8ZiKF0IliEITe9LfyjZ/3xsz9PW+jHrZgxhAo+kK43NyZHCccmHGlhMd3+OFUjGqD78JxUTPFWydnKyy15AMBTxSLS6qxyQdwrzkz">İstanbul Kiralık İşyeri</a></li>
                                                <li><a title="Hazineden Ankara Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/ankara/milli-hazineden-guncel/_objectdata_U2FsdGVkX19j5UJ/VaAnxXjFZCri8CUXByeVKL1/lW53xTESfZe/oScL/ylQlUJxa6f4YaAlGLxIhWEpIETflRPKpNAGivnJLvGHaRAp2jnuBQm/z+HcuUQ1EzBQgSq7DE5EgdkAlfFAhEyGaRRcIq6Qe8PkZI5SRpdToObjfEPNJ+8sy/pYU0UctroN8mSA">Ankara Kiralık İşyeri</a></li>
                                                <li><a title="Hazineden İzmir Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/izmir/milli-hazineden-guncel/_objectdata_U2FsdGVkX19K5XhyzaZPsvXLbQg75Z5C0DKSz51mGXAfqJZ4Xmqef5u8hQgNalN71mBL4ZbogT5OkYWs3l8ix9k4TUR/3EQ4CvdcPP1TuzLWNLeX8yzWuQ55DGTU6rHv/8MpLnGJqr2nGfATcDeNQ4ctsNtMIdVPk03bsYDVLUr4j6+dkxi+I4EbW2Sa8SH5">İzmir Kiralık İşyeri</a></li>
                                                <li><a title="Hazineden Bursa Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/bursa/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+P2OfuNLDlvKt4bzy3RfKHGzcAK9jmOzUmCPSV87ZpEOP8yD88F1SidwWMfOsK8vd2cQF+KED/4ooXWmiX+lOwQOmRF52xHIc9R0xjgecsnOcnBfcIVFM5ANu7tsCreXdhskhOmDRL2NaPDnJUWgq1dMV7+HTQbrRoOUX6uS9rL4/2QL+xJyna">Bursa Kiralık İşyeri</a></li>
                                                <li><a title="Hazineden Antalya Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/antalya/milli-hazineden-guncel/_objectdata_U2FsdGVkX1+8Yjt5NSCC12kTo2fgza6hCPDY/Ojt7RgK3Fwp0mwO1BSO6/5ZkrJUhb76ON1osoIjy7pdP5uEmTYUBPFVQ4VRLfv+8IN44JdsS3MB1MSteFMR1fFwu4Hudn6Ip4zga4j1HXBUSn2ahqWkYjCD24wZ0rqn3hSNhkMt/1bMSm6KxPuAYQPzKHXH">Antalya Kiralık İşyeri</a></li>
                                                <li><a title="Hazineden Adana Kiralık İşyeri" href="/liste/kiralik/2/isyeri/3/#/adana/milli-hazineden-guncel/_objectdata_U2FsdGVkX1/BW9hdmfsVExRJe6Edf8ZiLlxCMMOgCQuR3X6M0rvhSkLoISmtPCzJ+ln17IDKGyqTzFeggMX6KanylxdZJbeEoZtM5SW1CGr16p/Ryzwmtya4C91TTn+XPxW/UF69QaefB8eezS65kULaqwKpc7gzc56+m2AUx7oa+jI8OJRJk/jT2zB26WUF">Adana Kiralık İşyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Hazineden İstanbul Satılık Arsa" href="/liste/satilik-arsa/istanbul/milli-hazineden-guncel">İstanbul Satılık Arsa</a></li>
                                                <li><a title="Hazineden Ankara Satılık Arsa" href="/liste/satilik-arsa/ankara/milli-hazineden-guncel">Ankara Satılık Arsa</a></li>
                                                <li><a title="Hazineden İzmir Satılık Arsa" href="/liste/satilik-arsa/izmir/milli-hazineden-guncel">İzmir Satılık Arsa</a></li>
                                                <li><a title="Hazineden Bursa Satılık Arsa" href="/liste/satilik-arsa/bursa/milli-hazineden-guncel">Bursa Satılık Arsa</a></li>
                                                <li><a title="Hazineden Antalya Satılık Arsa" href="/liste/satilik-arsa/antalya/milli-hazineden-guncel">Antalya Satılık Arsa</a></li>
                                                <li><a title="Hazineden Adana Satılık Arsa" href="/liste/satilik-arsa/adana/milli-hazineden-guncel">Adana Satılık Arsa</a></li>
                                                <li><a title="Hazineden İstanbul Kiralık Arsa" href="/liste/kiralik-arsa/istanbul/milli-hazineden-guncel">İstanbul Kiralık Arsa</a></li>
                                                <li><a title="Hazineden Ankara Kiralık Arsa" href="/liste/kiralik-arsa/ankara/milli-hazineden-guncel">Ankara Kiralık Arsa</a></li>
                                                <li><a title="Hazineden İzmir Kiralık Arsa" href="/liste/kiralik-arsa/izmir/milli-hazineden-guncel">İzmir Kiralık Arsa</a></li>
                                                <li><a title="Hazineden Bursa Kiralık Arsa" href="/liste/kiralik-arsa/bursa/milli-hazineden-guncel">Bursa Kiralık Arsa</a></li>
                                                <li><a title="Hazineden Antalya Kiralık Arsa" href="/liste/kiralik-arsa/antalya/milli-hazineden-guncel">Antalya Kiralık Arsa</a></li>
                                                <li><a title="Hazineden Adana Kiralık Arsa" href="/liste/kiralik-arsa/adana/milli-hazineden-guncel">Adana Kiralık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Hazineden İstanbul Satılık Bina" href="/liste/satilik-bina/istanbul/milli-hazineden-guncel">İstanbul Satılık Bina</a></li>
                                                <li><a title="Hazineden Ankara Satılık Bina" href="/liste/satilik-bina/ankara/milli-hazineden-guncel">Ankara Satılık Bina</a></li>
                                                <li><a title="Hazineden İzmir Satılık Bina" href="/liste/satilik-bina/izmir/milli-hazineden-guncel">İzmir Satılık Bina</a></li>
                                                <li><a title="Hazineden Bursa Satılık Bina" href="/liste/satilik-bina/bursa/milli-hazineden-guncel">Bursa Satılık Bina</a></li>
                                                <li><a title="Hazineden Antalya Satılık Bina" href="/liste/satilik-bina/antalya/milli-hazineden-guncel">Antalya Satılık Bina</a></li>
                                                <li><a title="Hazineden Adana Satılık Bina" href="/liste/satilik-bina/adana/milli-hazineden-guncel">Adana Satılık Bina</a></li>
                                                <li><a title="Hazineden İstanbul Kiralık Bina" href="/liste/kiralik-bina/istanbul/milli-hazineden-guncel">İstanbul Kiralık Bina</a></li>
                                                <li><a title="Hazineden Ankara Kiralık Bina" href="/liste/kiralik-bina/ankara/milli-hazineden-guncel">Ankara Kiralık Bina</a></li>
                                                <li><a title="Hazineden İzmir Kiralık Bina" href="/liste/kiralik-bina/izmir/milli-hazineden-guncel">İzmir Kiralık Bina</a></li>
                                                <li><a title="Hazineden Bursa Kiralık Bina" href="/liste/kiralik-bina/bursa/milli-hazineden-guncel">Bursa Kiralık Bina</a></li>
                                                <li><a title="Hazineden Antalya Kiralık Bina" href="/liste/kiralik-bina/antalya/milli-hazineden-guncel">Antalya Kiralık Bina</a></li>
                                                <li><a title="Hazineden Adana Kiralık Bina" href="/liste/kiralik-bina/adana/milli-hazineden-guncel">Adana Kiralık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab_h">
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Daire</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Satılık Daire" href="/haritada-ara/satilik/1/daire/8/">Satılık Daire</a></li>
                                                <li><a title="Kiralık Daire" href="/haritada-ara/kiralik/2/daire/8/">Kiralık Daire</a></li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">İşyeri</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Satılık İşyeri" href="/haritada-ara/satilik/1/isyeri/3/">Satılık İşyeri</a></li>
                                                <li><a title="Kiralık İşyeri" href="/haritada-ara/kiralik/2/isyeri/3/">Kiralık İşyeri</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Arsa</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Satılık Arsa" href="/haritada-ara/satilik/1/arsa/4/">Satılık Arsa</a></li>
                                                <li><a title="Kiralık Arsa" href="/haritada-ara/kiralik/2/arsa/4/">Kiralık Arsa</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-2 col-sm-2 col-xs-6">
                                        <div class="footer-col">
                                            <p class="footer-title">Bina</p>
                                            <ul class="list-unstyled footer-nav">
                                                <li><a title="Satılık Bina" href="/haritada-ara/satilik/1/bina/5/">Satılık Bina</a></li>
                                                <li><a title="Kiralık Bina" href="/haritada-ara/kiralik/2/bina/5/">Kiralık Bina</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.main-container -->
    <div class="page-bottom-info">
        <div class="page-bottom-info-inner">
            <div class="page-bottom-info-content text-center">
                <a class="btn  btn-lg btn-primary-dark" href="/kayit/">
                    <i class="icon icon-user-add"></i><span class="hide-xs color50">Hemen</span> Üye Ol </a>
                <h4 class="footer-text" style="margin-top: 15px;">Sahibinden Ücretsiz İlan Ver</h4>
                <h4 style="font-size: 23px; font-weight: bold; margin-top: 15px; line-height: 30px;">Sahibinden satılık daire, kiralık ev, iş yeri, arsa, tarla ile Belediyeden, bankadan, icradan, hazineden kısacası tüm kamu kurumlarından satılık kiralık en uygun emlak ilanlarını, gerçek konum ve şekilleriyle uydu haritasından görme imkanı dünyada sadece kral ilan 'da     
                </h4>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <style type="text/css">
        .img-box {
            height: 350px;
            display: inline-block;
            position: relative;
            width: 100%;
            overflow: hidden;
            z-index: 90;
            margin: 10px 0;
            border-radius: 3px;
        }

        @media only screen and (min-width:1026px) {
            .fadeshow-mobile {
                display: none;
            }
        }

        .categories {
            margin-bottom: -30px;
        }

        .category {
            background-image: url("../img/tmp/tmp-12.jpg");
            border-radius: 3px;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0 0 30px 0;
            height: 220px;
            overflow: hidden;
            position: relative;
            text-align: center;
        }

            .category a {
                background-color: rgba(0, 0, 0, 0.35);
                border-radius: 3px;
                bottom: 0;
                left: 0;
                position: absolute;
                right: 0;
                top: 0;
                transition: background-color .15s linear;
            }

                .category a:hover {
                    text-decoration: none;
                }

            .category:hover .category-link {
                background-color: rgba(0, 0, 0, 0.5);
            }

        .category-content-1 {
            bottom: 40px;
            display: block;
            left: 50%;
            position: absolute;
            top: 50%;
            transform: translateX(-50%) translateY(-35%);
            transition: all .15s linear;
        }

            .category-content-1 .btn, .category-content-1 .pricing-btn {
                border: 0;
                border-radius: 0;
                font-size: .9em;
                margin: 15px 0 0 0;
                opacity: 0;
                padding: 8px 20px;
                transition: all .15s linear;
                visibility: hidden;
            }

        .category:hover .category-content-1 .btn, .category:hover .category-content-1 .pricing-btn {
            opacity: 1;
            visibility: visible;
        }

        .category:hover .category-content-1 {
            bottom: 0;
        }

        .category-title {
            color: #fff;
            display: block;
            font-size: 1.6em;
            font-weight: 600;
        }

        .category-subtitle {
            color: rgba(255, 255, 255, 0.9);
            display: block;
            font-size: 1.2em;
            margin: 0;
            white-space: nowrap;
        }

        .category-vertical {
            height: 470px;
        }

        @media (min-width: 1200px) {
            .colty {
                width: 255px;
            }
        }

        .box-title p, .tab-lite .nav-tabs > li > a {
            text-transform: uppercase;
            line-height: normal;
        }

        .box-title p {
            margin: 15px 0;
            padding: 0;
            font-size: 18px;
            font-weight: 500;
            display: inline-block;
            font-family: Roboto Condensed,Helvetica Neue,Helvetica,sans-serif;
            font-weight: 400;
            margin: 0;
            padding-top: 15px;
            padding-bottom: 15px;
        }

            .box-title p span {
                font-weight: lighter;
            }

        .headline {
            line-height: 24px;
            font-family: Roboto Condensed, Helvetica Neue, Helvetica, sans-serif;
            font-weight: normal;
            margin: 0;
            padding-bottom: 15px;
        }

        .cat-list {
            padding-top: 25px;
        }
    </style>
    <link href="libraries/assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="libraries/assets/css/owl.theme.css" rel="stylesheet" />
    <link href="/libraries/assets/css/ki-default-style.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazy/1.7.4/jquery.lazy.min.js"></script>
    <%--    <script type="text/javascript" charset="utf-8" src='<%= Page.ResolveUrl("~/libraries/assets/plugins/autocomplete/jquery.mockjax.js")%>'></script>
    <script type="text/javascript" charset="utf-8" src='<%= Page.ResolveUrl("~/libraries/assets/plugins/autocomplete/jquery.autocomplete.js")%>'></script>
    <script type="text/javascript" charset="utf-8" src='<%= Page.ResolveUrl("~/libraries/assets/plugins/autocomplete/usastates.js") %>'></script>
    <script type="text/javascript" charset="utf-8" src='<%= Page.ResolveUrl("~/libraries/assets/plugins/autocomplete/autocomplete-demo.js")%>'></script>--%>
    <script type="text/javascript" charset="utf-8" src='<%= Page.ResolveUrl("~/libraries/assets/js/ki-default-jquery.js")%>'></script>
    <script>
        $(function () {
            $('.lazy').lazy();
        });

        var _number = Math.floor((Math.random() * 4) + 1);

        var _fantom = $(".f-category")[_number];
        $("<div class='col-lg-2 col-md-3 col-sm-3 col-xs-4 f-category'><a href='/kategori-secimini-yap/' title='ilanım burada gözüksün'><img src='/libraries/images/you-are-here.png' class='img-responsive' alt='ilanım burada gözüksün' /><h6><a href='/kategori-secimini-yap/' class='btn btn-md btn-danger'><i class='icon ion-plus'></i><span> İlan Yükle</span></a></h6></a></div>").insertBefore(_fantom);

        var _point = $(".emergency")[_number];
        $("<div class='item emergency'><a href='/kategori-secimini-yap/' title='ilanım burada gözüksün'><span class='item-carousel-thumb'><img src='/libraries/images/you-are-here.png' class='img-responsive' alt='ilanım burada gözüksün'></span><span class='btn btn-danger'><i class='icon ion-plus'></i> İlan Yükle</span></a></div>").insertBefore(_point);
    </script>
</asp:Content>
