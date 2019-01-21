<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="satici-profil.aspx.cs" Inherits="PL.satici_profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <style>
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
                <div class="inner-box ">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="seller-info seller-profile">
                                <div class="seller-profile-img">
                                    <a>
                                        <img src="/upload/<%= thmbUserProfile %>" class="img-responsive thumbnail" alt="<%= userName %>" />
                                    </a>
                                </div>
                                <h3 class="no-margin no-padding link-color ">
                                    <%= userName %></h3>
                                <div class="user-ads-action">

                                    <button class="btn followButton" rel="6">Takip Et</button>
                                </div>

                                <div class="seller-social-list">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section-block" id="sectionblock">
                    <div class="row">
                        <div class="col-sm-9 col-thin-left page-content ">
                            <div class="category-list">
                                <div class="tab-box ">
                                    <ul class="nav nav-tabs add-tabs" role="tablist">
                                        <li class="active"><a href="#allAds" role="tab" data-toggle="tab">Kullanıcının Tüm İlanları
                                           
                                            <span class="badge"><%= userClassifiedCount %></span></a></li>
                                    </ul>
                                </div>
                                <div class="listing-filter">
                                    <div class="pull-left col-xs-6">
                                    </div>
                                    <div class="pull-right col-xs-6 text-right listing-view-action">
                                        <span
                                            class="list-view active"><i class="  icon-th"></i></span><span
                                                class="compact-view"><i class=" icon-th-list  "></i></span><span
                                                    class="grid-view "><i class=" icon-th-large "></i></span>
                                    </div>
                                    <div style="clear: both"></div>
                                </div>
                                <div class="adds-wrapper">
                                    <div class="adds-wrapper" id="addswrap">
                                    </div>
                                </div>
                                <div class="tab-box save-search-bar text-center">
                                    <a href=""><i class=" icon-plus"></i>
                                        Kullanıcıyı Takip Et </a>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3  page-sidebar-right">
                            <aside>
                                <div class="panel sidebar-panel panel-contact-seller">
                                    <div class="panel-heading">
                                        Takip Ettikleri <span class="badge"><%= userFollowedCount %></span>
                                    </div>
                                    <div class="panel-content user-info">
                                        <div class="panel-body text-center">
                                            <ul class="list-unstyled list-user-list">
                                                <asp:Repeater ID="rpuserfollowed" runat="server">
                                                    <ItemTemplate>
                                                        <li><a>
                                                            <img alt="img" onerror="this.src='../upload/system_resim/user.jpg'" src='upload/profil/<%# Eval("profilResim") %>'
                                                                class="img-circle"></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel sidebar-panel panel-contact-seller">
                                    <div class="panel-heading">
                                        Takipçileri <span class="badge"><%= userFollowerCount %></span>
                                    </div>
                                    <div class="panel-content user-info">
                                        <div class="panel-body text-center">
                                            <ul class="list-unstyled list-user-list long-list-user">
                                                <asp:Repeater ID="rpuserfollower" runat="server">
                                                    <ItemTemplate>
                                                        <li><a>
                                                            <img alt="<%# Eval("profilResim") %>" src='upload/profil/<%# Eval("profilResim") %>'
                                                                class="img-circle"></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="/libraries/assets/js/owl.carousel.min.js"></script>
    <script>

        $('button.followButton').on('click', function (e) {
            if(<%= userid%>!=0)
            {
                e.preventDefault();
                $button = $(this);
                if ($button.hasClass('following')) {
                    jQuery.ajax({
                        type: "POST",
                        url: "/enpoint/kullanicitakipservice.asmx/Delete",
                        dataType: "json",
                        data: "{ UserId:'" + <%= userid %> + "'" + ", FollowerId:'" + <%= sellerProfilId %> + "'}",
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
                        url: "/endpoint/kullanicitakipservice.asmx/Add",
                        dataType: "json",
                        data: "{ UserId:'" + <%= userid %> + "'" + ", FollowerId:'" + <%= sellerProfilId %> + "'}",
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

    </script>
    <script type="text/javascript">
        var pageIndex = 0, pageIsRefresh = true;
        var list_kind = 5;
        var sonistek = -1;
        function GetIlan(index, count, opt, tur, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }
            var sellerId = getValueAtIndex(4);

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListSeller",
                dataType: "json",
                data: "{ index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + 1 + "' , tur:'" + tur + "' , whoFrom:'" + sellerId + "' , sort:'" + -1 + "'}",
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

        function getValueAtIndex(index) {
            var str = window.location.href;
            return str.split("/")[index];
        }

        jQuery(document).ready(function () {
            GetIlan(pageIndex, 10, 1, list_kind, false, true);
            if(<%= userid%>!=0)
            {
                if(<%= ctrlFollow%>==1)
                {
                    $('button.followButton').addClass('following');
                    $('button.followButton').text('Takiptesin');
                }
                else
                {
                    $('button.followButton').removeClass('following');
                    $('button.followButton').removeClass('unfollow');
                    $('button.followButton').text('Takip Et');

                }

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
            }
        })

        $(window).on('scroll', function () {
            if ($(window).scrollTop() + $(window).height() > $("#sectionblock").height() - 50)
                if (pageIsRefresh == true) {
                    pageIndex++;
                    GetIlan(pageIndex, 10, 1, list_kind, false, false);
                }

        })
        $("#cl_price").on("click", function () {
            if (list_kind == 2) {
                list_kind = 3;
            }
            else {
                list_kind = 2;
            }
            liste_sifirlama();

        })

        function liste_sifirlama() {
            pageIndex = 0;
            GetIlan(pageIndex, 10, 1, list_kind, false, true);
        }

        $("#cl_date").on("click", function () {
            if (list_kind == 4) {
                list_kind = 5;
            }
            else {
                list_kind = 4;
            }
            liste_sifirlama();

        })
        $("#cl_provindist").on("click", function () {
            if (list_kind == 6) {
                list_kind = 7;
            }
            else {
                list_kind = 6;
            }
            liste_sifirlama();

        })
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
</asp:Content>

