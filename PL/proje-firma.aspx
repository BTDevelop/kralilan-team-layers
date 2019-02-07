<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="proje-firma.aspx.cs" Inherits="PL.proje_firma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .prop-info {
            padding: 15px 0 0;
        }

        .prop-info-block {
            border-right: 1px solid #ccc;
            color: #666;
            display: table-cell;
            margin: 0;
            min-height: 20px;
            padding: 0 10px 5px;
            float: left;
            text-align: center;
            width: 30%;
        }

        .prop-info span.title {
            font-size: 16px;
            font-weight: 600;
            color: #222;
        }

        .prop-info-block span {
            display: block;
            line-height: 1.2;
        }

        .prop-info span.text {
            font-size: 12px;
            font-family: "Roboto Condensed",Helvetica,Arial,sans-serif;
        }

        .make-grid .prop-info-block {
            border-right: 0;
            color: #666;
            display: inline;
            margin: 0;
            min-height: 0;
            padding: 0;
            text-align: left;
            width: 100%;
        }

        .make-compact .prop-info {
            display: none;
        }
    </style>
    <div class="main-container inner-page">
        <div class="container">
            <div class="section-content">
                <div class="inner-box ">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="seller-info seller-profile">
                                <div class="seller-profile-img">
                                    <a>
                                        <img src="/upload/estate-company/<%= flogo %>" class="img-responsive thumbnail" alt="<%= fadi %>" />
                                    </a>
                                </div>
                                <h1 class="no-margin no-padding link-color "><%= fadi %></h1>
                                <div class="seller-social-list">
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    Hakkında:<br>
                                    <%= fhakkinda %>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="seller-contact-info">
                                <h3 class="no-margin uppercase color-danger">İletişim Bilgileri </h3>
                                <dl class="dl-horizontal">
                                    <dt>Adres:</dt>
                                    <dd class="contact-sensitive">
                                        <%= fadres %>
                                    </dd>
                                    <dt>Telefon:</dt>
                                    <dd class="contact-sensitive"><%= (!String.IsNullOrEmpty(ftelefon))? "+90-"+ ftelefon.Substring(0,3)+"-"+ftelefon.Substring(3,7) : "-"%> </dd>
                                    <dt>Fax:</dt>
                                    <dd class="contact-sensitive"><%= (!String.IsNullOrEmpty(ffaks))? "+90-"+ ffaks.Substring(0,3)+"-"+ffaks.Substring(3,7) : "-"   %></dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section-block" id="sectionblock">
                    <div class="row">
                        <div class="col-sm-12 col-thin-left page-content ">
                            <div class="category-list">
                                <div class="tab-box ">
                                    <ul class="nav nav-tabs add-tabs" role="tablist">
                                        <li class="active" id="salesCont"><a href="#" role="tab" data-toggle="tab">Satışı Devam Eden 
                                        </a></li>
                                        <li id="salesEnd"><a href="#" role="tab" data-toggle="tab">Satışı Tamamlanan
                                        </a></li>
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
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/libraries/assets/js/owl.carousel.min.js"></script>
    <script type="text/javascript">
        var pageIndex = 0, pageIsRefresh = true;
        var sonistek = -1;
        var options = 1;

        function GetIlan(index, count, opt, tur, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }
            var sellerId = getValueAtIndex(5);

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListCompanyProject",
                dataType: "json",
                data: "{ index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "' , tur:'" + tur + "' , whoFrom:'" + sellerId + "' , sort:'" + -1 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    edata = data.d;
                    var dataArr = JSON.parse(edata);
                    result = "";
                    for (var i = 0; i < dataArr.length; i++) {
                        var text, parser, xmlDoc;

                        text = dataArr[i].pgaleri;
                        parser = new DOMParser();
                        xmlDoc = parser.parseFromString(text, "text/xml");
                        var resim = "noImage.jpg";
                        if (xmlDoc.getElementsByTagName("resimDataType")[0]) {
                            resim = xmlDoc.getElementsByTagName("resimDataType")[0].childNodes[0].firstChild;
                        }

                        //text = dataArr[i].pbilgiler;
                        //parser = new DOMParser();
                        //xmlDoc = parser.parseFromString(text, "text/xml");
                        //var resim = "noImage.jpg";
                        //if (xmlDoc.getElementsByTagName("girilenDataType")[0]) {
                        //    resim = xmlDoc.getElementsByTagName("girilenDataType")[0].childNodes[0].firstChild;
                        //}

                        //for (var i = 0; i < xmlDoc.getElementsByTagName("girilenDataType").length() ; i++) {
                        //    console.log(xmlDoc.getElementsByTagName("girilenDataType")[0]);

                        //    if (data.ozellikId == 8756) {
                        //        projealani = data.deger;
                        //    }
                        //    if (data.ozellikId == 8757) {
                        //        konutsayisi = data.deger;
                        //    }
                        //    if (data.ozellikId == 8758)
                        //        if (data.deger == "check")
                        //            teslimtarihi = "Hemen Teslim";
                        //        else
                        //            teslimtarihi = data.deger;
                        //}


                        //var resdata = dataArr[i].pgaleri;
                        //resler = (List<resimDataType>)toolkit.GetObjectInXml(resdata, typeof(List<resimDataType>));

                        //var projealani = "";
                        //var konutsayisi = "";
                        //var teslimtarihi = "";

                        //txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(item.pbilgiler, typeof(List<BLL.ExternalClass.girilenDataType>));

                        //for (var i = 0; i < txtlist.le ; i++)
                        //{
                        //    if (data.ozellikId == 8756) projealani = data.deger;
                        //    if (data.ozellikId == 8757) konutsayisi = data.deger;                               
                        //    if (data.ozellikId == 8758)
                        //        if (data.deger == "check")
                        //            teslimtarihi = "Hemen Teslim";
                        //        else
                        //            teslimtarihi = data.deger;
                        //}

                        result += '<div class="item-list">\
                                            <div class="col-sm-3 no-padding photobox">\
                                                <div class="add-image">\
                                                    <a href="#">\
                                                        <img class="thumbnail no-margin" src="/upload/estate-projects/' + dataArr[i].projeid + '/' + resim.data + '" alt="img" /></a>\
                                                </div>\
                                            </div>\
                                            <div class="col-sm-6 add-desc-box">\
                                                <div class="add-details">\
                                                    <h5 class="add-title"><a href="/proje/' + dataArr[i].projeFormat + '/' + dataArr[i].projeid + '/detay">' + dataArr[i].padi + '</a></h5>\
                                                    <span class="info-row"><span class="item-location">' + dataArr[i].ilAdi + ' - ' + dataArr[i].ilceAdi + ' | <a><i class="icon-location-2"></i>Konum</a></span></span>\
                                                    <div class="prop-info-box">\
                                                        <div class="prop-info">\
                                                            <div class="clearfix prop-info-block">\
                                                                <span class="title">' + projealani + ' m2</span>\
                                                                <span class="text">Proje Alanı</span>\
                                                            </div>\
                                                            <div class="clearfix prop-info-block middle">\
                                                                <span class="title prop-area">' + konutsayisi + '</span>\
                                                                <span class="text">Konut Sayısı</span>\
                                                            </div>\
                                                            <div class="clearfix prop-info-block">\
                                                                <span class="title prop-room">Teslim Tarihi</span>\
                                                                <span class="text">' + teslimtarihi + ' </span>\
                                                            </div>\
                                                        </div>\
                                                    </div>\
                                                </div>\
                                            </div>\
                                            <div class="col-sm-3 text-right  price-box">\
                                                    <a class="btn btn-success btn-sm bold" href="/proje/' + dataArr[i].projeFormat + '/' + dataArr[i].projeid + '/detay">Projeyi İncele</a>\
                                                    <div style="clear: both"></div>\
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
            GetIlan(pageIndex, 10, options, 1, false, true);
        })



        $(window).on('scroll', function () {
            if ($(window).scrollTop() + $(window).height() > $("#sectionblock").height() - 50)
                if (pageIsRefresh == true) {
                    pageIndex++;
                    GetIlan(pageIndex, 10, options, 1, false, false);
                }

        })

        $("#salesCont").on("click", function () {
            options = 1;
            liste_sifirlama();
            $("#salesEnd").removeClass("active");
            GetIlan(pageIndex, 10, options, 1, false, true, whoFrom);
            $("#salesCont").attr('class', 'active');

        })
        $("#salesEnd").on("click", function () {
            options = 0;
            liste_sifirlama();
            $("#salesCont").removeClass("active");
            GetIlan(pageIndex, 10, options, 1, false, true, whoFrom);
            $("#salesEnd").attr('class', 'active');

        })

        function liste_sifirlama() {
            pageIndex = 0;
            GetIlan(pageIndex, 10, options, 1, false, true);
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
