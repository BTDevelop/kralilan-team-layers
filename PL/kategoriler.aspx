<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="PL.kategoriler" %>

<asp:Content ID="Content3" ContentPlaceHolderID="styles" runat="server">
    <link href="/libraries/assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="/libraries/assets/css/owl.theme.css" rel="stylesheet" />
    <style>
        .fadeshow1 {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="intro" id="intro" runat="server" style="background: url('/libraries/images/bg.png') repeat left top; height: 155px;">
        <div class="dtable hw100">
            <div class="dtable-cell hw100">
                <div class="container text-center">
                    <h1 class="intro-title animated fadeInDown"><span class="ion ion-play" style="margin-right: 15px;"></span><%= CategoriName %> İlanları ve <%= CategoriName %> Fiyatları</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 page-sidebar col-thin-right">
                    <aside>
                        <div class="inner-box">
                            <h2 class="title-2"><%= CategoriName%></h2>
                            <div class="inner-box-content">
                                <ul class="cat-list arrow">
                                    <asp:Repeater ID="rpTypes" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <a title='<%# Eval("Adi") %>' href='/liste/<%# BLL.PublicHelper.Tools.URLConverter(Eval("Adi")) %>-<%= BLL.PublicHelper.Tools.URLConverter(CategoriName) %>'>
                                                    <%# Eval("Adi")+ " " +"("+String.Format("{0:N0}", Eval("Sayi")+")") %></a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </aside>
                </div>
                <div class="col-lg-9 page-content col-thin-left text-center">
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
                <div class="col-lg-12 page-content col-thin-right">
                    <div class="col-lg-12 content-box ">
                        <div class="row row-featured row-featured-category">
                            <div class="col-lg-12  box-title no-border">
                                <div class="inner">
                                    <h2><span><%= CategoriName %></span>
                                        VİTRİNİ <a title="Kategori Vitrini" href="/vitrin/kategori/3" class="sell-your-item">TÜMÜNÜ GÖSTER <i
                                            class="  icon-th-list"></i></a></h2>
                                </div>
                            </div>
                            <asp:Repeater ID="rpcategorishowcase" runat="server">s
                                <ItemTemplate>
                                    <%--<div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 f-category">
                                        <a href='<%# String.Format("/ilan/{0}-{1}/detay", BLL.PublicHelper.Tools.URLConverter(Eval("baslik")),Eval("ilanId")) %>' title='<%# Eval("baslik") %>'>
                                            <img src='/upload/ilan/<%# ParsePictures(Eval("resim").ToString()) %>' class="img-responsive" width="120" height="80" alt="<%# Eval("baslik") %>" />
                                            <h6><%# Eval("baslik") %> </h6>
                                        </a>
                                    </div>--%>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="inner-box relative">
                        <div class="row">
                            <div class="col-md-5">
                                <div>
                                    <h3 class="title-2"><i class="icon-location-2"></i>Emlakları Haritada Gör</h3>
                                    <div class="row">
                                        <ul class="cat-list col-xs-6">
                                            <li><a href="/haritada-ara/satilik/1/konut/2/" title="Satılık Konut">Satılık Konut</a></li>
                                            <li><a href="/haritada-ara/satilik/1/isyeri/3/" title="Satılık İşyeri">Satılık İşyeri</a></li>
                                            <li><a href="/haritada-ara/satilik/1/arsa/4/" title="Satılık Arsa">Satılık Arsa</a></li>
                                            <li><a href="/haritada-ara/satilik/1/bina/5/" title="Satılık Bina">Satılık Bina</a></li>
                                            <li><a href="/haritada-ara/satilik/1/turistik-tesis/7/" title="Satılık Turistik Tesis">Satılık Turistik Tesis</a></li>
                                        </ul>
                                        <ul class="cat-list cat-list-border col-xs-6">
                                            <li><a href="/haritada-ara/kiralik/2/arsa/4/" title="Kiralık Arsa">Kiralık Arsa</a></li>
                                            <li><a href="/haritada-ara/kiralik/2/bina/5/" title="Kiralık Bina">Kiralık Bina</a></li>
                                            <li><a href="/haritada-ara/kiralik/2/konut/2/" title="Kiralık Konut">Kiralık Konut</a></li>
                                            <li><a href="/haritada-ara/kiralik/2/isyeri/3/" title="Kiralık İşyeri">Kiralık İşyeri</a></li>
                                            <li><a href="/haritada-ara/devren/4/isyeri/3/" title="Devren İşyeri">Devren İşyeri</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 ">
                                <h3 class="title-2"><i class="icon-search-1"></i>Haritada En Çok Arananlar</h3>
                                <div class="row">
                                    <ul class="cat-list col-md-4 col-xs-4 col-xxs-6">
                                        <li><a href="/haritada-ara/gunluk-kiralik/3/konut/2/" title="Günlük Kiralık Konut">Günlük Kiralık Konut</a></li>
                                        <li><a href="/haritada-ara/devren-satilik/6/konut/2/" title="Devren Satılık Konut">Devren Satılık Konut</a></li>
                                        <li><a href="/haritada-ara/kiralik/2/dukkan--magaza/23/" title="Kiralık Dükkan & Mağaza">Kiralık Dükkan & Mağaza</a></li>
                                        <li><a href="/haritada-ara/devren/4/dukkan--magaza/23/" title="Devren Dükkan & Mağaza">Devren Dükkan & Mağaza</a></li>
                                    </ul>
                                    <ul class="cat-list col-md-4 col-xs-4 col-xxs-6">
                                        <li><a href="/haritada-ara/kiralik/2/turistik-tesis/7/" title="Kiralık Turistik Tesis">Kiralık Turistik Tesis</a></li>
                                        <li><a href="/haritada-ara/kiralik/2/otel/35/" title="Kiralık Otel">Kiralık Otel</a></li>
                                        <li><a href="/haritada-ara/kiralik/2/motel/41/" title="Kiralık Motel">Kiralık Motel</a></li>
                                        <li><a href="/haritada-ara/kiralik/2/daire/8/" title="Kiralık Daire">Kiralık Daire</a></li>
                                    </ul>
                                    <ul class="cat-list col-md-4 col-xs-4 col-xxs-6">
                                        <li><a href="/haritada-ara/satilik/1/dukkan--magaza/23/" title="Satılık Dükkan & Mağaza">Satılık Dükkan & Mağaza</a></li>
                                        <li><a href="/haritada-ara/satilik/1/otel/35/" title="Satılık Otel">Satılık Otel</a></li>
                                        <li><a href="/haritada-ara/satilik/1/motel/41/" title="Satılık Motel">Satılık Motel</a></li>
                                        <li><a href="/haritada-ara/satilik/1/daire/8/" title="Satılık Daire">Satılık Daire</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-bottom-info">
        <div class="page-bottom-info-inner">
            <div class="page-bottom-info-content text-center">
                <h2>Belediyeden, bankadan, icradan, hazineden yani tüm kamu kurumlarından ve sahibinden satılık daire, işyeri, arsa, tarla, müstakil ev ile kiralık en uygun emlak ilanlarını, gerçek konum ve şekilleriyle uydu haritasından görme imkanı sadece kralilan.com da. İlan vermek için</h2>
                <a class="btn  btn-lg btn-primary-dark" href="/kayit/">
                    <i class="icon icon-user-add"></i><span class="hide-xs color50">Hemen</span> Üye Ol </a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/owl.carousel.min.js") %>'></script>
</asp:Content>
