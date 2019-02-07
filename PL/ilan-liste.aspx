<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ilan-liste.aspx.cs" Inherits="PL.ilan_liste" %>
<%@ Import Namespace="BLL.EnumHelper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="metalog" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/flat/red.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/css/listview.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/css/ki-listview-style.css") %>' />
    <style>
        .col-thin-left {
            padding-left: 10px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="search-row-wrapper" style="background: url('/libraries/images/bg.png') repeat left top;">
        <div class="container ">
            <div class="col-md-12">
                <h1 class="intro-title animated fadeInDown text-center"><%= pageTitle %> </h1>
            </div>
			<%--<span class="ion ion-pause" style="margin-right: 15px;"></span><span class="text-title"><%= typename %>  <%= catname %></span>--%>
            <span style="visibility: hidden;" class="hidden-intro"><%= typename %> <%= catname %></span>
            <span style="visibility: hidden;" class="hidden-category"><%= typename %>/<%= catname %></span>
        </div>
    </div>
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 page-sidebar mobile-filter-sidebar">
                    <aside>
                        <div class="inner-box">
                            <div class="categories-list  list-filter">
                                <h5 class="list-title"><strong>
                                    <a title="Kategoriler" href="/"><i class="fa fa-angle-left"></i>
                                        TÜM KATEGORİLER</a></strong></h5>
                                <ul class=" list-unstyled">
                                    <li><a href="#"><span class="title"><strong runat="server" id="ustStr"></strong></span><span
                                        class="count">&nbsp;</span></a>
                                        <a href="#"><span class="title">&nbsp;<strong runat="server" id="altStr"></strong></span><span
                                            class="count">&nbsp;</span></a>
                                        <asp:HyperLink ID="HyperLink2" runat="server" Visible='<%# catKind(Eval("kategoriId"))==true?true:false %>'><span class="title">&nbsp;&nbsp;<strong runat="server"> <%= EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), typeId.ToString()))  %></strong></span><span
                                        class="count">&nbsp;</span></asp:HyperLink>
                                        <ul class=" list-unstyled long-list">
                                            <asp:Repeater ID="rpcategories" runat="server">
                                                <ItemTemplate>
                                                    <li>
                                                        <a href='<%# String.Format("/liste/{0}-{1}", BLL.PublicHelper.Tools.URLConverter(EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), typeId.ToString()))), BLL.PublicHelper.Tools.URLConverter(Eval("kategoriAdi"))) %>'><%# Eval("kategoriAdi") %><span class="count"><%# count(Eval("kategoriId"),typeId.ToString()) %></span></a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="locations-list  list-filter">
                                <div id="filtre">
                                    <h5 class="list-title"><strong><a title="il" href="#">İl</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctprovi"></select>
                                    </div>
                                    <h5 class="list-title"><strong><a title="ilçe" href="#">İlçe</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctdist"></select>
                                    </div>
                                    <h5 class="list-title"><strong><a title="mahalle" href="#">Mahalle</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctneig"></select>
                                    </div>
                                    <h5 class="list-title"><strong><a title="fiyat" href="#">Fiyat</a></strong></h5>
                                    <div class="form-group" style="padding-right: 0">
                                        <input class="form-control" type="text" placeholder="En az" id="inminprice" />
                                    </div>
                                    <div class="form-group" style="padding-right: 0">
                                        <input type="text" class="form-control" placeholder="En çok" id="inmaxprice" />
                                    </div>
                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                    <h5 class="list-title"><strong><a title="kimden" href="#">Kimden</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" size="4" id="slctwho">
                                            <option value="-1">Seçiniz</option>
                                            <option value="0">Sahibinden</option>
                                            <option value="7">Emlak Ofisinden</option>
                                            <option value="1">Belediyeden</option>
                                            <option value="5">Bankadan</option>
                                            <option value="3">İzaley-i Şuyudan</option>
                                            <option value="2">İcradan</option>
                                            <option value="10">Milli Hazineden Güncel</option>
                                            <option value="4">Milli Hazineden Satılamayan</option>
                                            <option value="9">Özelleştirme İdaresinden</option>
                                            <option value="8">İnşaat Firmasından</option>
                                            <option value="6">Kamu Kurumlarından</option>
                                        </select>
                                    </div>
                                    <h5 class="list-title"><strong><a title="ilan tarihi" href="#">İlan Tarihi</a></strong></h5>
                                    <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                        <div class="form-group" id="rddaterange">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="daterange" class="daterangecls" value="1" id="son1" />
                                                    <strong>Son 1 Gün</strong>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="daterange" class="daterangecls" value="3" id="son3" />
                                                    <strong>Son 3 Gün</strong>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="daterange" class="daterangecls" value="7" id="son1h" />
                                                    <strong>Son 1 Hafta</strong>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="daterange" class="daterangecls" value="15" id="son15" />
                                                    <strong>Son 15 Gün</strong>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="daterange" class="daterangecls" value="30" id="son1a" />
                                                    <strong>Son 1 Ay</strong>
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="daterange" class="daterangecls" value="-1" id="nonselect" />
                                                    <strong>Seçim Yok</strong>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="filtre-btn" class="form-group">
                                        <input type="button" class="form control btn btn-success btn-block" id="filter" value="Filtrele" />
                                    </div>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </aside>
                </div>
                <div class="col-sm-9 page-content col-thin-left">
                    <div class="post-promo text-center">
                        <h2>Listeleme Yapmak İstemiyorsan?</h2>
                        <h5>Harita ile devam et ve ilanları birebir konumlarıyla gör</h5>
                        <a href='<%= String.Format("/haritada-ara/{0}/{1}/{2}/{3}/", RouteData.Values["Tur"], typeId, BLL.PublicHelper.Tools.URLConverter(RouteData.Values["Kategori"]), categoryId) %>' class="btn btn-lg btn-border btn-post btn-danger">Haritaya Git </a>
                    </div>
                    <br />
                    <div class="category-list" id="category-list">
                        <div class="tab-box " id="tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs add-tabs" role="tablist">
                                <li id="clallads"><a role="tab">Tüm İlanlar <span class="badge" id="tum_ilanlar">?</span></a>
                                </li>
                                <li id="clsahibinden"><a role="tab">Sahibinden                                  
                                    <span class="badge" id="sahibinden">?</span></a></li>
                                <li id="clicradan"><a role="tab">İcradan                                 
                                    <span class="badge" id="icradan">?</span></a></li>
                                <li id="clbelediye"><a role="tab">Belediyeden                                   
                                    <span class="badge" id="belediyeden">?</span></a></li>
                                <li id="clbankadan"><a role="tab">Bankadan                                  
                                    <span class="badge" id="bankadan">?</span></a></li>
                                <li role="presentation" class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Diğerleri<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li id="clizale"><a role="tab">İzale-i Şuyudan             
                                            <span class="badge" id="izaleyi_suyu">?</span></a></li>
                                        <li id="clinsaatfir"><a role="tab">İnşaat Firması                                
                                            <span class="badge" id="insaat_firmasindan">?</span></a></li>
                                        <li id="clemlakofisi"><a role="tab">Emlak Ofisi                                  
                                            <span class="badge" id="emlakcidan">?</span></a></li>
                                        <li id="clhazineden1"><a role="tab">Hazineden (Satılamayan)                                   
                                            <span class="badge" id="milli_hazineden">?</span></a></li>
                                        <li id="clhazineden2"><a role="tab">Hazineden (Güncel)                                  
                                            <span class="badge" id="milli_hazineden1">?</span></a></li>
                                        <li id="clozelidare"><a role="tab">Özelleştirme İdaresiden                                  
                                            <span class="badge" id="ozellestirme_dairesinden">?</span></a></li>
                                        <li id="clkamukurum"><a role="tab">Diğer Kamu Kurumlarından                                 
                                            <span class="badge" id="kamu_kurumlarindan">?</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="tab-filter">
                            </div>
                        </div>
                        <div class="mobile-filter-bar col-lg-12  ">
                            <ul class="list-unstyled list-inline no-margin no-padding">
                                <li class="filter-toggle">
                                    <a title="filtre">
                                        <i class="fa fa-filter"></i>
                                        FİLTRE
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="menu-overly-mask"></div>
                        <!-- Mobile Filter bar End-->
                        <div class="adds-wrapper">
                            <div class="tab-content">
                                <div id="example1" class="list-responsive">
                                    <div class="list-responsive-header">
                                        <div class="list-r-header list-r-header-1"></div>
                                        <div class="list-r-header list-r-header-2">İlan Başlığı</div>
                                        <div class="list-r-header list-r-header-3" id="cl_price">Fiyat</div>
                                        <div class="list-r-header list-r-header-4" id="cl_date">İlan Tarihi</div>
                                        <div class="list-r-header list-r-header-5" id="cl_provindist">İl/İlçe</div>
                                    </div>
                                    <div id="tablebdy" class="list-responsive-body">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.adds-wrapper-->
                        <div id="wait" style="display: none; position: relative; top: 50%; left: 50%; padding: 2px;">
                            <img src='/libraries/images/loading.gif' />
                        </div>
                        <br />
                    </div>
                </div>
                <!--/.page-content-->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
     <script src="/management/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/management/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/icheck.min.js") %>'></script>
    <script src="/libraries/assets/js/owl.carousel.min.js"></script>
    <script src="/libraries/assets/js/form-validation.js"></script>
    <script src="/libraries/assets/js/ki-listview-jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/enc-utf8.js"></script>
    <script>
        $('.double').keypress(function (event) {
            if ((event.which != 44 || $(this).val().indexOf(',') != -1) && (event.which < 48 || event.which > 57)) {
                event.preventDefault();
            }
        });
        if ($(window).width() > 992) {
            $(window).on('scroll', function () {
                if ($(window).scrollTop() - $("#filtre").height() >= -531) {
                    $("#filtre-btn").css("position", "absolute");
                    $("#filtre-btn").css("z-index", "0");
                    $("#filtre-btn").css("bottom", "-40px");
                    $("#filtre-btn").css("border-width", "0px");
                    $("#filtre-btn").css("width", "200px");
                    $("#filtre-btn").css("margin-left", "-7px");
                }
                if ($(window).scrollTop() - $("#filtre").height() < -531) {
                    $("#filtre-btn").css("position", "fixed");
                    $("#filtre-btn").css("z-index", "999999");
                    $("#filtre-btn").css("bottom", "-15px");
                    $("#filtre-btn").css("border-width", "15px");
                    $("#filtre-btn").css("width", "230px");
                    $("#filtre-btn").css("margin-left", "-22px");
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="head" runat="server">
</asp:Content>
