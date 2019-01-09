<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ilan-bilgi-detay.aspx.cs" Inherits="PL.ilan_bilgi_detay" %>

<%@ Import Namespace="BLL.EnumHelper" %>

<asp:Content ID="Content4" ContentPlaceHolderID="styles" runat="server">
    <meta property="og:url" content="https://www.kralilan.com/ilan/<%= BLL.PublicHelper.Tools.URLConverter(heading)%>-<%= number %>/detay" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="<%= heading %>" />
    <meta property="og:description" content="<%= Page.MetaDescription %>" />
    <meta property="og:image" content="https://kralilan.com/upload/ilan/<%= resimler[0].resim %>" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:site" content="@kralilan" />
    <meta name="twitter:creator" content="kralilan" />
    <meta name="twitter:title" content="<%= heading %>" />
    <meta name="twitter:description" content="<%= Page.MetaDescription %>" />
    <meta name="twitter:image:src" content="https://kralilan.com/upload/ilan/<%= resimler[0].resim %>" />
    <link href="/libraries/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/flat/red.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/boostrap-lte.min.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
    <link href="/libraries/assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="/libraries/assets/css/owl.theme.css" rel="stylesheet" />
    <style>
        .box-title {
            padding: 0px;
            border: 0px;
        }


        #lightbox .modal-content {
            display: inline-block;
            text-align: center;
        }

        #lightbox .close {
            opacity: 1;
            color: rgb(255, 255, 255);
            background-color: rgb(25, 25, 25);
            padding: 5px 8px;
            border-radius: 30px;
            border: 2px solid rgb(255, 255, 255);
            position: absolute;
            top: -15px;
            right: -55px;
            z-index: 1032;
        }

        @media only screen and (max-width: 1026px) {
            .fadeshow1 {
                display: none;
            }
        }

        /*-webkit-print-color-adjust: exact;*/
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="metalog" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="intro" id="intro" runat="server" style="background: url('/libraries/images/bg_3.png') repeat left top; height: 105px;">
        <div class="dtable hw100">
            <div class="dtable-cell hw100">
                <div class="container text-center">
                    <h1 class="intro-title animated fadeInDown" id="title">Satıldı</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="main-container">
        <div class="container">
            <%--<ol class="breadcrumb pull-left">
                <li><a href="#"><i class="icon-home fa"></i></a></li>
                <li><a href="category.html">All Ads</a></li>
                <li><a href="sub-category-sub-location.html">Electronics</a></li>
                <li class="active">Mobile Phones</li>
            </ol>--%>
            <div class="pull-right backtolist">
                <%--   <a href="#"><i class="fa fa-angle-double-left"></i>Arama sonuçlarına geri dön</a> --%>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 page-content col-thin-right">
                    <div class=" text-center" runat="server" id="ProjeBox">
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
                </div>
                <div class="col-md-9 page-content col-thin-right">
                    <div class="inner inner-box ads-details-wrapper">
                        <h1 style="font-size: 24px; line-height: 28px;">
                            <%= heading %>
                            <small class="label label-default adlistingtype" style="background-color: #d9534f; color: #fff">
                                <%= fromWho %></small>
                        </h1>
                        <h2 class="info-row" style="color: #d9534f;"><span class="date"><i class=" icon-clock"></i>
                            <%= date %></span> - <span class="item-location"><i
                                class="icon-location-2"></i>
                                <%= location %>
                            </span>- <span class="item-location"><i
                                class="icon-eye-3"></i>
                                <%= visitor %>
                            </span></h2>
                        <div class="ads-image ads-img-v2">
                            <p class="pricetag" style="background: #16A085; top: 65px; line-height: 35px;">
                                <%=  price %>
                            </p>
                            <div class="img-slider-box">
                                <div class="slider-left">
                                    <ul class="bxslider">
                                        <asp:Repeater ID="rpbxslider" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <img src="/upload/ilan/<%# ((BLL.ExternalClass.resimDataType)Container.DataItem).resim %>" alt="<%= heading %>" /></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                                <div id="bx-pager">
                                    <asp:Repeater ID="rpbxpager" runat="server">
                                        <ItemTemplate>
                                            <a class="thumb-item-link" data-slide-index="<%= phindex++ %>" href="">
                                                <img
                                                    src="/upload/ilan/thmb_<%# ((BLL.ExternalClass.resimDataType)Container.DataItem).resim %>" alt="<%= heading %>" /></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <!--ads-image-->
                        </div>
                        <!--ads-image-->
                        <div class="Ads-Details">
                            <h5 class="list-title"><strong>İLAN BİLGİLERİ</strong></h5>
                            <div class="row">
                                <div class="col-md-6 automobile-left-col">
                                    <%--<div class="left">
                                        <table class="attributes">
                                            <tbody>
                                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                            </tbody>
                                        </table>
                                    </div>--%>
                                    <div class="inner">
                                        <div class="key-features">
                                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                        </div>
                                        <%--<div class="key-features" id="detailprop"></div>--%>
                                    </div>
                                </div>
                                <div class="col-md-6 automobile-left-col">
                                    <div class="inner">
                                        <aside class="panel panel-body panel-details">
                                            <div class="key-features">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <span class="data-type">İLAN NUMARASI</span>

                                                        <span class="media-heading"><%= number %></span>
                                                    </div>
                                                </div>

                                                <div class="media">
                                                    <div class="media-body">
                                                        <span class="data-type">İLAN TARİHİ</span>

                                                        <span class="media-heading"><%= date %></span>
                                                    </div>
                                                </div>
                                                <div class="media">
                                                    <div class="media-body">
                                                        <span class="data-type">EMLAK TİPİ</span>
                                                        <span class="media-heading"><%= adsType %></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </aside>
                                    </div>
                                    <div class="ads-action">
                                        <a class="btn btn-danger btn-block" href="<%= link %>"><i class="icon-heart"></i>Favorilerime Ekle</a>
                                        <a class="btn btn-default btn-block" href="#" data-toggle="modal" data-target="#lightbox"><i class="icon-print"></i>Yazdır</a>
                                        <br />
                                        <div class="addthis_inline_share_toolbox"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-footer text-left">
                            </div>
                        </div>
                    </div>
                    <!--/.ads-details-wrapper-->
                </div>
                <!--/.page-content-->
                <div class="col-md-3 page-sidebar-right noprint">
                    <aside>
                        <div class="panel sidebar-panel panel-contact-seller">
                            <div class="panel-heading">Satıcı Bilgileri</div>
                            <div class="panel-content user-info">
                                <div class="panel-body text-center">
                                    <div class="seller-info">
                                        <div class="company-logo-thumb">
                                            <a>
                                                <img src='/upload/<%= profileImage %>' alt="img" />
                                            </a>
                                        </div>
                                        <h3 class="no-margin"><%= sellername %></h3>
                                    </div>
                                    <div class="user-ads-action">
                                        <a class="btn btn-success btn-block" style="background-color: #16A085" href="<%= link %>"><i class=" icon-docs"></i>Tüm İlanları</a>
                                        <a class="btn btn-danger btn-block" href="#contactAdvertiser" data-toggle="modal" runat="server" id="messageAuth"><i class=" icon-mail-2"></i>Mesaj Gönder</a>
                                        <a class="btn btn-danger btn-block" onclick="showmodalpopup2();" runat="server" id="messageNonAuth"><i class=" icon-mail-2"></i>Mesaj Gönder</a>

                                        <a class="btn btn-default btn-block" href="<%= link %>"><i class=" icon-plus"></i>Takip Et</a>

                                        <asp:Repeater ID="rpuserphone" runat="server">
                                            <ItemTemplate>
                                                <a href="tel:0<%# Eval("telefon") %>"
                                                    class="btn btn-default btn-block"><i class="icon-phone-1"></i>
                                                    <%# EnumHelper.GetDescription((PhoneTypeString)Enum.Parse(typeof(PhoneTypeString), Eval("telefonTur").ToString())) %>  <%# "+90-"+Eval("telefon").ToString().Substring(0,3)+"-"+Eval("telefon").ToString().Substring(3,7) %>
                                                </a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Go to www.addthis.com/dashboard to customize your tools -->
                        <div class="panel sidebar-panel">
                            <div class="panel-heading">Güvenlik İpuçları</div>
                            <div class="panel-content">
                                <div class="panel-body text-left">
                                    <ul class="list-check">
                                        <li>Ödeme işlemleri tamamlandıktan sonra satışınızı gerçekleştirin</li>
                                        <li>Ayrıca ilanınız fiyatı hakkında editörlerimizden yardım alabilirsiniz</li>
                                    </ul>
                                    <p>
                                        <a class="pull-right" target="_blank" href="/sss/">Daha fazlası<i
                                            class="fa fa-angle-double-right"></i></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
            <div class="col-lg-12 content-box ">
                <div class="row row-featured">
                    <div style="clear: both"></div>
                    <div class="">
                        <div class="tab-lite">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs " role="tablist">
                                <li role="presentation" id="konum"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab"><i class="icon-location-2"></i>Konumu</a></li>
                                <li role="presentation" id="ilan_detay" class="active"><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab"><i class="icon-doc-new"></i>İlan Detayları</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane" id="tab1">
                                    <div class="intro-inner">
                                        <div class="contact-intro">
                                            <div id="map" style="width: 100%; height: 550px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane active" id="tab2">
                                    <div class="col-lg-12 tab-inner">
                                        <div class="row" runat="server" id="box_footer">
                                            <div class="form-group">
                                                <div class="box box-default collapsed-box box-solid">
                                                    <div class="box-header with-border">
                                                        <h3 class="box-title">Açıklama</h3>
                                                        <div class="box-tools pull-right">
                                                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                                        </div>
                                                        <!-- /.box-tools -->
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body" id="lblAciklama" runat="server">
                                                        <%= explanation %>
                                                    </div>
                                                    <!-- /.box-body -->
                                                </div>
                                                <!-- /.box -->
                                            </div>
                                            <div>
                                                <asp:PlaceHolder ID="placeholder" runat="server"></asp:PlaceHolder>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--            <div class="row">
                <div class="col-lg-12 page-content col-thin-right">
                    <div class="inner-box relative">
                        <p class="title-2 headline" style="text-transform: uppercase">
                            Bu İlana Bakanlar, Bunları da İncelediler            
                            <a id="nextItem" class="link  pull-right carousel-nav"><i class="icon-right-open-big"></i></a>
                            <a id="prevItem" class="link pull-right carousel-nav"><i class="icon-left-open-big"></i>
                            </a>
                        </p>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="no-margin item-carousel owl-carousel owl-theme" style="padding-top: 25px;">
                                    <asp:Repeater ID="rpNearPosition" runat="server">
                                        <ItemTemplate>
                                            <div class="item">
                                                <a href='<%# String.Format("/ilan/{0}-{1}/detay", PublicHelper.Tools.URLConverter(((BLL.ExternalClass.ilanDataType)Container.DataItem).baslik),((BLL.ExternalClass.ilanDataType)Container.DataItem).ilanId) %>'>
                                                    <span class="item-carousel-thumb">
                                                        <img class="item-img lazy"
                                                            src="/libraries/images/loadingv.gif"
                                                            data-src='/upload/ilan/<%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).resim %>'
                                                            alt="<%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).baslik %>" />
                                                    </span><span
                                                        class="item-name"><%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).baslik %> </span><span class="price"><%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).fiyatTurId %> <%# String.Format(" {0:N0}", ((BLL.ExternalClass.ilanDataType)Container.DataItem).fiyat) %> </span></a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
    <!-- /.main-container -->
    <!-- Modal contactAdvertiser -->
    <div class="modal fade" id="contactAdvertiser" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><i class=" icon-mail-2"></i>Mesaj Gönder </h4>

                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                </div>
                <div class="modal-body">
                    <div role="form">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Ad Soyad:</label>
                            <input class="form-control required" id="recipientName" placeholder="Ad Soyad" runat="server"
                                data-placement="top" data-trigger="manual"
                                data-content="En az 3 karakter girilmelidir."
                                type="text" />
                        </div>
                        <div class="form-group">
                            <label for="sender-email" class="control-label">E-Posta Adresi:</label>
                            <input id="senderEmail" type="text"
                                data-content="Doğru bir mail adresi giriniz." data-trigger="manual" runat="server"
                                data-placement="top" placeholder="e-Posta" class="form-control email" />
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">Mesaj:</label>
                            <textarea class="form-control" id="message-text" placeholder="Mesajını buraya yaz.."
                                data-placement="top" data-trigger="manual"></textarea>
                        </div>
                        <div class="form-group">
                            <p class="help-block pull-left text-danger hide" id="form-error">
                                &nbsp; The form is not
							valid.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">İptal</button>
                    <button type="submit" class="btn btn-success pull-right" runat="server" onserverclick="Unnamed_ServerClick">Gönder!</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->
    <!-- Modal contactAdvertiser -->
    <div id="lightbox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <button type="button" class="close hidden" data-dismiss="modal" aria-hidden="true">×</button>
            <div class="modal-content" style="width: 1015px; height: 620px; margin-left: -195px; border-radius: 5px;">
                <div class="modal-body">
                    <iframe src="/ilan/<%= number %>/yazdir" style="border: 0px;" width="1020" height="600" id="iprint"></iframe>
                    <br />
                    <input onclick="printFrame();" class="btn btn-success" style="background-color: #16A085; float: right; width: 158px; margin-right: -15px;" type="button" value="Yazdır" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/owl.carousel.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/bxslider/jquery.bxslider.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.fs.scroller/jquery.fs.scroller.js")%>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/icheck.min.js") %>'></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazy/1.7.4/jquery.lazy.min.js"></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
    <script type="text/javascript">
        function showmodalpopup() {
            $.dialog({
                title: 'Bilgilendirme',
                content: 'Mesajınız başarıyla ilan sahibine iletildi.',
            });
        };

        function showmodalpopup1() {
            $.dialog({
                title: 'Bilgilendirme',
                content: 'İletişim bilgileri alınmadı, daha sonra tekrar deneyiniz.',
            });
        };

        function showmodalpopup2() {
            $.dialog({
                title: 'Bilgilendirme',
                content: 'Mesaj gönderebilmek için lütfen giriş yapınız.'
            });
        };

        $(function () {
            $('.lazy').lazy();
        });

        $('.bxslider').bxSlider({
            pagerCustom: '#bx-pager'
        });

        $(document).ready(function () {
            //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                var $target = $(e.target);
                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {
                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);
            });
            $(".prev-step").click(function (e) {
                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);
            });
        });

        var urlParamsBody = getValueAtIndex(4);
        var urlParams = urlParamsBody.split('-');
        var adsId = urlParams[urlParams.length - 1];

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }

        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }

        function printFrame() {
            var frm = document.getElementById("iprint").contentWindow;
            frm.focus();// focus on contentWindow is needed on some ie versions
            frm.print();
            return false;
        }

        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_flat-red',
                increaseArea: '20%' // optional
            });
            $(".box.box-default.box-solid.collapsed-box").removeClass("collapsed-box");
            $(".box-tools.pull-right").css("display", "none");
            $(".icheckbox_flat-red input").attr("disabled", "disabled");
        });

        var map;
        var color = "#FFFFFF";
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 6,
                center: { lat: 39, lng: 36 },
                mapTypeId: google.maps.MapTypeId.HYBRID
            });

            getCoords(adsId, 3);
        }

        function colorGive(store) {
            var rtcolor = "";
            if (store == 0)
                rtcolor = "#FF0000";
            else if (store == 1)
                rtcolor = "#7F00FF";
            else if (store == 2)
                rtcolor = "#FF8000";
            else if (store == 3)
                rtcolor = "#FF00FF";
            else if (store == 4)
                rtcolor = "#00FF00";
            else if (store == 5)
                rtcolor = "#FFFF00";
            else if (store == 6)
                rtcolor = "#0080FF";
            else if (store == 7)
                rtcolor = "#0000FF";
            else if (store == 8)
                rtcolor = "#00FF80";
            else if (store == 9)
                rtcolor = "#FF007F";
            else if (store == 10)
                rtcolor = "#00FFFF";
            else
                rtcolor = "#FF0000";

            return rtcolor;
        }

        function markerTypeGive(store) {
            var marker = "";
            if (store == 1)
                marker = '/libraries/images/marker/purple.png';
            else if (store == 2)
                marker = '/libraries/images/marker/orange.png';
            else if (store == 3)
                marker = '/libraries/images/marker/plato.png';
            else if (store == 4)
                marker = '/libraries/images/marker/green2.png';
            else if (store == 5)
                marker = '/libraries/images/marker/yellow.png';
            else if (store == 6)
                marker = '/libraries/images/marker/blue.png';
            else if (store == 7)
                marker = '/libraries/images/marker/blue2.png';
            else if (store == 8)
                marker = '/libraries/images/marker/green.png';
            else if (store == 9)
                marker = '/libraries/images/marker/pink.png';
            else if (store == 10)
                marker = '/libraries/images/marker/turquoise.png';
            else
                marker = '/libraries/images/marker/red.png';

            return marker;
        }

        var icon = "";
        function getCoords(_inadsid, opt) {
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getDetailAds",
                dataType: "json",
                data: "{ inadsid:'" + _inadsid + "'" + ", opt:'" + opt + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var poly = "";
                    var panorama = "";

                    if (data.d != "") {
                        var coordinates = [];
                        var coords = JSON.parse(data.d);

                        coords = coords["coordinates"][0][0];

                        for (var i = 0; i < coords.length; i++) {
                            coordinates.push({ lat: coords[i][1], lng: coords[i][0] });
                        }

                        color = colorGive(<%= whoFromId %>);
                        icon = markerTypeGive(<%= whoFromId %>);
                        poly = new google.maps.Polygon({
                            paths: coordinates,
                            strokeColor: color,
                            strokeOpacity: 0.8,
                            strokeWeight: 3,
                            fillColor: color,
                            fillOpacity: 0.35
                        });

                        poly.setMap(map);

                        var markerPosition = { lat: coordinates[0]["lat"], lng: coordinates[0]["lng"] };

                        var marker = new google.maps.Marker({
                            icon: icon,
                            position: markerPosition,
                            animation: google.maps.Animation.DROP,
                            map: map,
                            title: "konumu"
                        });

                        map.setZoom(17);
                        map.setCenter({ lat: coordinates[0]["lat"], lng: coordinates[0]["lng"] });
                    }
                    else {
                        $("#tab1").css("display", "none");
                        $("#konum").css("display", "none");
                        $("#tab2").addClass("active");
                        $("#ilan_detay").addClass("active")
                    }

                },
                error:
                    {

                    }
            });
        }

        function getValueAtIndex(index) {
            var str = window.location.href;
            return str.split("/")[index];
        }

        function getParameterByName(name, url) {
            if (!url) {
                url = window.location.href;
            }
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFMOi-Vi2hXZROzNxUjmg9keIYxvsyuxM&callback=initMap" async="async" defer="defer"></script>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-58c17f0bb3be1504"></script>
</asp:Content>
