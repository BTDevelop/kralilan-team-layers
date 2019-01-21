<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="magaza-profil.aspx.cs" Inherits="PL.magaza_profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <style>
        /* -- color classes -- */
        .coralbg {
            background-color: #16A085;
        }

        .coral {
            color: #16A085;
        }

        .turqbg {
            background-color: #16A085;
        }

        .turq {
            color: #16A085;
        }

        .white {
            color: #fff !important;
        }

        /* -- The "User's Menu Container" specific elements. Custom container for the snippet -- */
        div.user-menu-container {
            z-index: 10;
            background-color: #fff;
            margin-top: 20px;
            background-clip: padding-box;
            opacity: 0.97;
            filter: alpha(opacity=97);
            -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
            box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
        }

            div.user-menu-container .btn-lg {
                padding: 0px 12px;
            }

            div.user-menu-container h4 {
                font-weight: 300;
                color: #8b8b8b;
            }

            div.user-menu-container a, div.user-menu-container .btn {
                transition: 1s ease;
            }

            div.user-menu-container .thumbnail {
                width: 100%;
                min-height: 200px;
                border: 0px !important;
                padding: 0px;
                border-radius: 0;
                border: 0px !important;
            }

            /* -- Vertical Button Group -- */
            div.user-menu-container .btn-group-vertical {
                display: block;
            }

                div.user-menu-container .btn-group-vertical > a {
                    padding: 20px 25px;
                    background-color: #16A085;
                    color: white;
                    border-color: #fff;
                }

        div.btn-group-vertical > a:hover {
            color: white;
            border-color: white;
        }

        div.btn-group-vertical > a.active {
            background: #8b8b8b;
            box-shadow: none;
            color: white;
        }
        /* -- Individual button styles of vertical btn group -- */
        div.user-menu-btns {
            padding-right: 0;
            padding-left: 0;
            padding-bottom: 0;
        }

            div.user-menu-btns div.btn-group-vertical > a.active:after {
                content: '';
                position: absolute;
                left: 100%;
                top: 50%;
                margin-top: -13px;
                border-left: 0;
                border-bottom: 13px solid transparent;
                border-top: 13px solid transparent;
                border-left: 10px solid #16A085;
            }
        /* -- The main tab & content styling of the vertical buttons info-- */
        div.user-menu-content {
            color: #323232;
        }

        ul.user-menu-list {
            list-style: none;
            margin-top: 20px;
            margin-bottom: 0;
            padding: 10px;
            border: 1px solid #eee;
        }

            ul.user-menu-list > li {
                padding-bottom: 8px;
                text-align: center;
            }

        div.user-menu div.user-menu-content:not(.active) {
            display: none;
        }

        /* -- The btn stylings for the btn icons -- */
        .btn-label {
            position: relative;
            left: -12px;
            display: inline-block;
            padding: 6px 12px;
            background: rgba(0,0,0,0.15);
            border-radius: 3px 0 0 3px;
        }

        .btn-labeled {
            padding-top: 0;
            padding-bottom: 0;
        }

        /* -- Custom classes for the snippet, won't effect any existing bootstrap classes of your site, but can be reused. -- */

        .user-pad {
            padding: 20px 25px;
        }

        .no-pad {
            padding-right: 0;
            padding-left: 0;
            padding-bottom: 0;
        }

        .user-details {
            background: #eee;
            min-height: 333px;
        }

        .user-image {
            max-height: 200px;
            overflow: hidden;
        }

        .overview h3 {
            font-weight: 300;
            margin-top: 15px;
            margin: 10px 0 0 0;
        }

        .overview h4 {
            font-weight: bold !important;
            font-size: 40px;
            margin-top: 0;
        }

        .view {
            position: relative;
            overflow: hidden;
            margin-top: 10px;
        }

            .view p {
                margin-top: 20px;
                margin-bottom: 0;
            }

        .caption {
            position: absolute;
            top: 0;
            right: 0;
            background: rgba(70, 216, 210, 0.44);
            width: 100%;
            height: 100%;
            padding: 2%;
            display: none;
            text-align: center;
            color: #fff !important;
            z-index: 2;
        }

            .caption a {
                padding-right: 10px;
                color: #fff;
            }

        .info {
            display: block;
            padding: 10px;
            background: #eee;
            text-transform: uppercase;
            font-weight: 300;
            text-align: right;
        }

            .info p, .stats p {
                margin-bottom: 0;
            }

        .stats {
            display: block;
            padding: 10px;
            color: white;
        }

        .share-links {
            border: 1px solid #eee;
            padding: 15px;
            margin-top: 15px;
        }

        /* -- media query for user profile image -- */
        @media (max-width: 767px) {
            .user-image {
                max-height: 400px;
            }
        }

        .btnfollow {
            cursor: pointer;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            padding: 9px 14px 9px;
            color: #666666;
            font-size: 11px;
            background-position: 0px 0px;
            text-shadow: 0 1px 0 #fff;
            background-color: #ffffff;
        }

            .btnfollow:hover {
                color: #333;
            }

            .btnfollow:active {
            }

            .btnfollow:focus {
                outline: none;
                border-color: #BD4A39;
            }


        /* Follow Button Styles */

        button.followButton {
            width: 160px;
        }

            button.followButton.following {
                background-color: #57A957;
                color: #fff;
            }

            button.followButton.unfollow {
                background-color: #C43C35;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container inner-page">
        <div class="container">
            <div class="section-content">
                <div class="row user-menu-container square">
                    <div class="col-md-7 user-details">
                        <div class="row coralbg white">
                            <div class="col-md-6 no-pad">
                                <div class="user-pad">
                                    <h1>
                                        <asp:Label ID="lblMagazaAdi" runat="server"></asp:Label></h1>
                                    <br />
                                    <br />
                                    <button class="btn btnfollow followButton" rel="6">Takip Et</button>
                                </div>
                            </div>
                            <div class="col-md-6 no-pad">
                                <div class="user-image">
                                    <img onerror="this.src='/upload/default-images/no-store.jpg'" width="300" height="200" src='/upload/ads-providers/<%= storeLogo %>' class="img-responsive thumbnail" alt="img" />
                                </div>
                            </div>
                        </div>
                        <div class="row overview">
                            <div class="col-md-4 user-pad text-center">
                                <h3>Takipçileri</h3>
                                <h4><%= storeFollowerCount %></h4>
                            </div>
                            <div class="col-md-4 user-pad text-center">
                                <h3>İlan Sayısı</h3>
                                <h4><%= storeClassifiedCount %></h4>
                            </div>
                            <div class="col-md-4 user-pad text-center">
                                <h3>Danışman Sayısı</h3>
                                <h4>0</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1 user-menu-btns">
                        <div class="btn-group-vertical square" id="responsive">
                            <a href="#" class="btn btn-block btn-default active" style="height: 84px;">
                                <i class="fa fa-phone fa-3x"></i>
                            </a>
                            <a href="#" class="btn btn-default" style="height: 84px;">
                                <i class="fa fa-bars fa-3x"></i>
                            </a>
                            <a href="#" class="btn btn-default" style="height: 84px;">
                                <i class="fa fa-question fa-3x"></i>
                            </a>
                            <a href="#" class="btn btn-default" style="height: 84px;">
                                <i class="fa fa-life-buoy fa-3x"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 user-menu user-pad">
                        <div class="user-menu-content active">
                            <h3>Bizimle İletişime Geçin
                            </h3>
                            <div class="share-links">
                                <div id="phonewrap">
                                </div>
                            </div>
                        </div>
                        <div class="user-menu-content">
                            <h3>Portföyümüz
                            </h3>
                            <div class="share-links">
                                <div>
                                    <button type="button" class="btn btn-lg btn-labeled btn-danger" href="#" style="margin-bottom: 15px;" runat="server">
                                        <span class="btn-label"><i class="fa fa-bars"></i>&nbsp;</span><%= storecat %>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="user-menu-content">
                            <h3>Hakkımızda
                            </h3>
                            <ul class="user-menu-list">
                                <li>
                                    <h4>
                                        <%= storexp %></h4>
                                </li>
                            </ul>
                        </div>
                        <div class="user-menu-content">
                            <h2 class="text-center">Danışmanlarımız
                            </h2>
                            <div class="share-links" id="userwrap">
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="section-block" id="sectionblock">
                    <div class="row">
                        <div class="col-sm-9 col-thin-left page-content ">
                            <div class="category-list">
                                <div class="tab-box ">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs add-tabs" role="tablist">
                                        <li class="active"><a href="#allAds" role="tab" data-toggle="tab">Mağazanın Tüm İlanları
                                           
                                            <span class="badge"><%= storeClassifiedCount %></span></a></li>
                                    </ul>
                                    <div class="tab-filter">
                                        <select class="selectpicker" data-style="btn-select" data-width="auto" id="myselect">
                                            <option value="1" id="cl_datenew">Tarih: En Yeni</option>
                                            <option value="2" id="cl_dateold">Tarih: En Eski</option>
                                            <option value="3" id="cl_priceexp">Fiyat: En Yüksek</option>
                                            <option value="4" id="cl_pricecheap">Fiyat: En Düşük</option>
                                        </select>
                                    </div>
                                </div>
                                <!--/.tab-box-->

                                <div class="listing-filter">
                                    <div class="pull-left col-xs-6">
                                    </div>
                                    <div class="pull-right col-xs-6 text-right listing-view-action">
                                        <span
                                            class="list-view active"><i class="  icon-th"></i></span><span
                                                class="compact-view"><i class=" icon-th-list"></i></span><span
                                                    class="grid-view "><i class=" icon-th-large "></i></span>
                                    </div>
                                    <div style="clear: both"></div>
                                </div>
                                <!--/.listing-filter-->
                                <div class="adds-wrapper" id="addswrap">
                                </div>
                                <!--/.adds-wrapper-->

                                <div class="tab-box  save-search-bar text-center">
                                    <a href=""><i class=" icon-plus"></i>
                                        Mağazayı Takip Et </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3  page-sidebar-right" runat="server">
                            <aside>
                                <div class="panel sidebar-panel panel-contact-seller">
                                    <div class="panel-heading">
                                        Takipçileri <span class="badge"><%= storeFollowerCount %></span>
                                    </div>
                                    <div class="panel-content user-info">
                                        <div class="panel-body text-center">
                                            <ul class="list-unstyled list-user-list long-list-user" id="followwrap">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!--/.categories-list-->
                            </aside>
                        </div>
                        <!--/.page-side-bar-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal contactAdvertiser -->
    <div class="modal fade" id="contactAdvertiser" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span
                            class="sr-only">Kapat</span></button>
                    <h4 class="modal-title"><i class=" icon-mail-2"></i>Contact advertiser </h4>
                </div>
                <div class="modal-body">
                    <div role="form">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Adınız:</label>
                            <input class="form-control required" id="recipient-name" placeholder="Adınız"
                                data-placement="top" data-trigger="manual"
                                data-content="Must be at least 3 characters long, and must only contain letters."
                                type="text" />
                        </div>
                        <div class="form-group">
                            <label for="sender-email" class="control-label">E-mail:</label>
                            <input id="sender-email" type="text"
                                data-content="Must be a valid e-mail address (user@gmail.com)" data-trigger="manual"
                                data-placement="top" placeholder="email@.." class="form-control email" />
                        </div>
                        <div class="form-group">
                            <label for="recipient-Phone-Number" class="control-label">Cep Telefonu:</label>
                            <input type="text" maxlength="60" class="form-control" id="Cep Telefonu" />
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">Mesaj <span class="text-count">(300) </span>:</label>
                            <textarea class="form-control" id="message-text" placeholder="Mesajınız..."
                                data-placement="top" data-trigger="manual"></textarea>
                        </div>
                        <div class="form-group">
                            <p class="help-block pull-left text-danger hide" id="form-error">
                                &nbsp; Doğru girilmeyen bilgi var.                         
                            </p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Vazgeç</button>
                    <button type="submit" class="btn btn-success pull-right">Gönder!</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="/libraries/assets/js/owl.carousel.min.js"></script>
    <script src="/libraries/assets/js/form-validation.js"></script>
    <script>
        $('button.followButton').on('click', function (e) {
            if(<%= userid%>!=0)
            {
                e.preventDefault();
                $button = $(this);
                if ($button.hasClass('following')) {

                    jQuery.ajax({
                        type: "POST",
                        url: "/endpoint/magazatakipservice.asmx/Delete",
                        dataType: "json",
                        data: "{ StoreId:'" + <%= sellerProfilId %> + "'" + ", UserId:'" + <%= userid%> + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {


                        },
                        error: function (e) {
                            var s;
                            s = e;

                        }
                    });
                    $button.removeClass('following');
                    $button.removeClass('unfollow');
                    $button.text('Takip Et');
                } else {

                    jQuery.ajax({
                        type: "POST",
                        url: "/endpoint/magazatakipservice.asmx/Add",
                        dataType: "json",
                        data: "{ StoreId:'" + <%= sellerProfilId %> + "'" + ", UserId:'" + <%= userid %> + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {


                        },
                        error: function (e) {
                            var s;
                            s = e;

                        }
                    });
                    $button.addClass('following');
                    $button.text('Takiptesin');
                }
            }
            else
            {
                location.href = "https://kralilan.com/giris-yap.aspx";
            }
        });

        $('button.followButton').hover(function () {
            $button = $(this);
            if ($button.hasClass('following')) {
                $button.addClass('unfollow');
                $button.text('Takibi Bırak');
            }
        }, function () {
            if ($button.hasClass('following')) {
                $button.removeClass('unfollow');
                $button.text('Takiptesin');
            }
        });

        $( document ).ready(function() {
            console.log( "ready!" );
        });

        function getValueAtIndex(index) {
            var str = window.location.href;
            return str.split("/")[index];
        }

        var pageIndex = 0, pageIsRefresh = true;
        var list_kind = 1;
        var sonistek = -1;
        var storeId;
        function GetIlan(index, count, opt, tur, istop, clear) {
            console.log(index);

            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }
            storeId = getValueAtIndex(4);
            console.log(storeId);
            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListSeller",
                dataType: "json",
                data: "{ index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + 2 + "' , tur:'" + tur + "' , whoFrom:'" + storeId + "' , sort:'" + tur + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    edata = data.d;

                    var dataArr = JSON.parse(edata);
                    result = "";
                    for(var i = 0; i < dataArr.length; i++) {
                        var text, parser, xmlDoc;

                        text = dataArr[i].resim;
                        parser = new DOMParser();
                        xmlDoc = parser.parseFromString(text, "text/xml");
                        var resim = "noImage.jpg";
                        if (xmlDoc.getElementsByTagName("resimDataType")[0]) {
                            resim = xmlDoc.getElementsByTagName("resimDataType")[0].childNodes[0].firstChild;
                        }

                        result += '<div class="item-list">\
                                        <div class="col-sm-2 no-padding photobox">\
                                            <div><a href="/ilan/'+ dataArr[i].baslikFormat +'-'+ dataArr[i].ilanId +'/detay"\
                                                    title="' + dataArr[i].baslik + '">\
                                                        <img\
                                                            class="thumbnail no-margin" src="/upload/ilan/thmb_' + resim.data +  '"\
                                                            alt="' + dataArr[i].baslik + '"></a>\
                                            </div>\
                                        </div>\
                                        <div class="col-sm-7 add-desc-box">\
                                            <div class="add-details">\
                                                <h5 class="add-title">\
                                                <a href="/ilan/' + dataArr[i].baslikFormat + '-' + dataArr[i].ilanId + '/detay"\
                                                        title="' + dataArr[i].baslik + '">' + dataArr[i].baslik + '</a></h5>\
                                                <span class="info-row"><span\
                                                        class="date"><i class="icon-clock"></i>' + dataArr[i].tarihFormat + '</span> - <span\
                                                            class="category">' + dataArr[i].ilanTur + ' ' + dataArr[i].kategoriAdi + '</span><span\
                                                                class="item-location"><i class="icon-location-2"></i>&nbsp;' + dataArr[i].ilAdi + ' / ' + dataArr[i].ilceAdi + ' / ' + dataArr[i].mahalleAdi + '</span>\
                                                </span>\
                                            </div>\
                                        </div>\
                                        <div class="col-sm-3 text-right price-box">\
                                            <h2 class="item-price">' + dataArr[i].fiyatTur + ' ' + dataArr[i].fiyatFormat + '</h2>\
                                        </div>\
                                    </div>';
                    }

                    if (istop == true) {
                        $("#addswrap").prepend(result);
                    } else {
                        $("#addswrap").append(result);
                    }
                    pageIsRefresh = true;
                },
                error: function (e) {
                    var s;
                    s = e;
                    pageIsRefresh = true;
                }
            });
            if (clear == true) {
                $("#addswrap").empty();
            }
        }

        jQuery(document).ready(function() {
            GetIlan(pageIndex, 10, 1, list_kind, false, true);
            if (<%= userid%> != 0) {
                if (<%= ctrlFollow%> == 1) {
                    $('button.followButton').addClass('following');
                    $('button.followButton').text('Takiptesin');
                } else {
                    $('button.followButton').removeClass('following');
                    $('button.followButton').removeClass('unfollow');
                    $('button.followButton').text('Takip Et');

                }

                $('button.followButton').hover(function() {
                        $button = $(this);
                        if ($button.hasClass('following')) {
                            $button.addClass('unfollow');
                            $button.text('Takibi Bırak');
                        }
                    },
                    function() {
                        if ($button.hasClass('following')) {
                            $button.removeClass('unfollow');
                            $button.text('Takiptesin');
                        }
                    });
            }
        });

        $(window).on('scroll', function () {
            if ($(window).scrollTop() + $(window).height() > $("#sectionblock").height() - 50)
                if (pageIsRefresh == true) {
                    pageIndex++;
                    GetIlan(pageIndex, 10, 1, list_kind, false, false);
                }

        })
        
        $(".selectpicker").change(function () {
            list_kind = $("#myselect").val();
            liste_sifirlama();
        });


        function liste_sifirlama() {
            pageIndex = 0;
            GetIlan(pageIndex, 10, 1, list_kind, false, true);
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


        var opt = 1;

        function getPhone(instoreid, opt, istop, clear) {
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListPhone",
                dataType: "json",
                data: "{instoreid:'" + instoreid + "' , opt:'" + opt + "', datatype:'" + 1 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    edata = data.d;
                    var dataArr = JSON.parse(edata);
                    result = "";
                    for(var i = 0; i < dataArr.length; i++) {
                       
                        result += '<button type="button" class="btn btn-lg btn-labeled btn-danger" href="#" style="margin-bottom: 15px;">\
                            <span class="btn-label"><i class="fa fa-phone"></i>&nbsp;'+ dataArr[i].telefonTur + '</span>+90-' + dataArr[i].telefonFormat + '</button>';

                    }

                    if (istop == true) {
                        $("#phonewrap").prepend(result);
                    } else {
                        $("#phonewrap").append(result);
                    }
                },
                error: function (e) {
                    var s;
                    s = e;
                }
            });

        }

        function getInfo(instoreid, index, count, opt, datatype, istop, clear) {
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListStoreInfo",
                dataType: "json",
                data: "{instoreid:'" + instoreid + "', index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "', datatype:'" + datatype + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    edata = data.d;
                    if (opt == 1) {                           
                        
                        var dataArr = JSON.parse(edata);
                        result = "";
                        for(var i = 0; i < dataArr.length; i++) {
                            var resData = dataArr[i].profilResim;
                            if (resData) resData = 'noUser.jpg';
                            
                            result += '<li><a><img class="img-circle" alt="img" src="/upload/profil/'+ resData + '"/></a></li>';

                        }

                        if (istop == true) {
                            $("#followwrap").prepend(result);
                        } else {
                            $("#followwrap").append(result);
                        }
                    }
                    else {
                        var dataArr = JSON.parse(edata);
                        result = "";
                        for(var i = 0; i < dataArr.length; i++) {
                        

                            result += '<button type="button" class="btn btn-lg btn-labeled btn-danger" href="#" style="margin-bottom: 15px;">\
                                <span class="btn-label"><i class="fa fa-life-buoy"></i>&nbsp;</span>' + dataArr[i].kullaniciAdSoyad + '\
                               </button>';
                        }

                        if (istop == true) {
                            $("#userwrap").prepend(result);
                        } else {
                            $("#userwrap").append(result);
                        }
                    }
                },
                error: function (e) {
                    var s;
                    s = e;
                }
            });

        }

        jQuery(document).ready(function () {
            getPhone(storeId, 1, false, true);
            getInfo(storeId, 0, 6, 1, 1, false, true);
            getInfo(storeId, -1, -1, 2, 2, false, true);
        })

    </script>
    <script>
        $(document).ready(function () {
            var $btnSets = $('#responsive'),
            $btnLinks = $btnSets.find('a');

            $btnLinks.click(function (e) {
                e.preventDefault();
                $(this).siblings('a.active').removeClass("active");
                $(this).addClass("active");
                var index = $(this).index();
                $("div.user-menu>div.user-menu-content").removeClass("active");
                $("div.user-menu>div.user-menu-content").eq(index).addClass("active");
            });
        });

        $(document).ready(function () {
            $("[rel='tooltip']").tooltip();
            $('.view').hover(
                function () {
                    $(this).find('.caption').slideDown(250); //.fadeIn(250)
                },
                function () {
                    $(this).find('.caption').slideUp(250); //.fadeOut(205)
                }
            );
        });
    </script>
</asp:Content>
