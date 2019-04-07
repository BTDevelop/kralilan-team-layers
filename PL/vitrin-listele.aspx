<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="vitrin-listele.aspx.cs" Inherits="PL.vitrin_listele" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="intro" id="intro" runat="server" style="background: url('/libraries/images/bg.png') repeat left top; height: 155px !important;">
        <div class="dtable hw100">
            <div class="dtable-cell hw100">
                <div class="container text-center">
                    <h1 class="intro-title animated fadeInDown" id="title" runat="server"><%= showcasename %> </h1>
                </div>
            </div>
        </div>
    </div>
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 page-sidebar mobile-filter-sidebar">
                    <aside>
                        <div class="inner-box">
                            <div class="categories-list  list-filter">
                                <h5 class="list-title"><strong><a href="#">TÜM VİTRİNLER</a></strong></h5>
                                <ul class=" list-unstyled">
                                    <li> <a title="Anasayfa Vitrini" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Anasayfa"), "1") %>'><span
                                        class="title">Anasayfa Vitrini</span><span class="count">&nbsp;(<%= count(1) %>) </span></a>
                                    </li>
                                    <li> <a title="Kategori Vitrini" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Kategori"), "3") %>'><span
                                        class="title">Kategori Vitrini</span><span class="count">&nbsp;(<%= count(3) %>)</span></a>
                                    </li>
                                    <li><a title="Arama Sonuç Vitrini" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Arama Sonuç"), "2") %>'><span
                                        class="title">Arama Sonuç Vitrini</span><span class="count">&nbsp;(<%= count(2) %>)</span></a>
                                    </li>
                                    <li><a title="Acil Acil" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Acil Acil"), "5") %>'><span class="title">Acil Acil</span><span
                                        class="count">&nbsp;(<%= count(5) %>)</span></a></li>
                                    <li><a title="Fiyatı Düşenler" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Fiyatı Düşen"), "8") %>'><span
                                        class="title">Fiyatı Düşen</span><span class="count">&nbsp;(<%= count(8) %>)</span></a></li>
                                    <li><a title="Son 48 Saat" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Son 48 Saat"), "48") %>'><span
                                        class="title">Son 48 Saat </span><span class="count">&nbsp;(<%= count(48) %>)</span></a></li>
                                    <li><a title="Satılanlar" href='<%= String.Format("/vitrin/{0}/{1}", BLL.PublicHelper.Tools.URLConverter("Satilanlar"), "50") %>'><span
                                        class="title">Satılanlar </span><span class="count">&nbsp;(<%= count(50) %>)</span></a></li>
                                </ul>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </aside>
                </div>
                <div class="col-sm-9 page-content col-thin-left" id="pagecontent">
                    <div class="category-list">
                        <div class="tab-box ">
                            <ul class="nav nav-tabs add-tabs" role="tablist">
                                <li class="active"><a href="#allAds" role="tab" data-toggle="tab">Tüm İlanlar <span
                                    class="badge"><%= showcasename %></span></a></li>
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
                        <div class="listing-filter">
                            <div class="pull-right col-xs-6 text-right listing-view-action">
                                <span
                                    class="list-view active"><i class="  icon-th"></i></span><span
                                        class="compact-view"><i class=" icon-th-list"></i></span><span
                                            class="grid-view"><i class=" icon-th-large "></i></span>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <div class="mobile-filter-bar col-lg-12  ">
                            <ul class="list-unstyled list-inline no-margin no-padding">
                                <li class="filter-toggle">
                                    <a title="Vitrin">
                                        <i class="icon-th-list"></i>
                                        VİTRİNLER
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="menu-overly-mask"></div>
                        <div class="adds-wrapper hasGridView" id="addswrap">
                        </div>
                        <div id="wait" style="display: none; position: relative; top: 50%; left: 50%; padding: 2px;">
                            <img src='/libraries/images/loading.gif' />
                        </div>
                                      
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
    <script src="/libraries/assets/js/owl.carousel.min.js"></script>
    <script src="/libraries/assets/js/form-validation.js"></script>
    <script type="text/javascript">
        var pageIndex = 0, pageIsRefresh = true;
        var list_kind = 1;
        var sonistek = -1;
        var shwcase = getValueAtIndex(5);
        var opt = 1;
        if (shwcase == 48)
            opt = 2;
        else if (shwcase == 50)
            opt = 3;

        function GetAdsFaceted(index, opt, tur, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }

            var result = "";
            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/endpoint/ilanservice.asmx/GetBySaleFaceted",
                dataType: "json",
                data: "{ Index:'" + index + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    edata = data.d;

                    var dataArr = JSON.parse(edata);
                    result = "";
                    for(var i = 0; i < dataArr.length; i++) {
                        var text, parser, xmlDoc;

                        text = dataArr[i].Resimler;
                        parser = new DOMParser();
                        xmlDoc = parser.parseFromString(text, "text/xml");
                        var resim = "noImage.jpg";
                        var str = "";
                        if (xmlDoc.getElementsByTagName("resimDataType")[0]) {
                            resim = xmlDoc.getElementsByTagName("resim")[0].childNodes[0];
                        }

                        result += '<div class="item-list">\
                                        <div class="col-sm-2 no-padding photobox">\
                                            <div><a href="/ilan/'+ dataArr[i].Url +'-'+ dataArr[i].IlanId +'/detay"\
                                                    title="' + dataArr[i].Baslik + '">\
                                                        <img\
                                                            class="thumbnail no-margin" src="/upload/ilan/thmb_' + resim.data + '"\
                                                            alt="' + dataArr[i].Baslik + '"></a>\
                                            </div>\
                                        </div>\
                                        <div class="col-sm-7 add-desc-box">\
                                            <div class="add-details">\
                                                <h5 class="add-title">\
                                                <a href="/ilan/' + dataArr[i].Url + '-' + dataArr[i].IlanId + '/detay"\
                                                        title="' + dataArr[i].Baslik + '">' + dataArr[i].Baslik + '</a></h5>\
                                                <span class="info-row"><span\
                                                        class="date"><i class="icon-clock"></i>' + dataArr[i].BaslangicTarihi + '</span> - <span\
                                                            class="category">' + dataArr[i].EmlakTipi + ' ' + dataArr[i].KategoriAdi + '</span><span\
                                                                class="item-location"><i class="icon-location-2"></i>&nbsp;' + dataArr[i].IlAdi + ' / ' + dataArr[i].IlceAdi + ' / ' + dataArr[i].MahalleAdi + '</span>\
                                                </span>\
                                            </div>\
                                        </div>\
                                        <div class="col-sm-3 text-right price-box">\
                                            <h2 class="item-price">' + dataArr[i].FiyatTipi + ' ' + dataArr[i].Fiyat + '</h2>\
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


        function GetIlan(index, count, opt, tur, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }

            var result = "";
            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListDoping",
                dataType: "json",
                data: "{ index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "' , tur:'" + tur + "' , doping:'" + shwcase + "', datatype:'" + 3 + "'}",
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
                        var str = "";
                        if (xmlDoc.getElementsByTagName("resimDataType")[0]) {
                            resim = xmlDoc.getElementsByTagName("resim")[0].childNodes[0];
                        }

                        result += '<div class="item-list">\
                                        <div class="col-sm-2 no-padding photobox">\
                                            <div><a href="/ilan/'+ dataArr[i].baslikFormat +'-'+ dataArr[i].ilanId +'/detay"\
                                                    title="' + dataArr[i].baslik + '">\
                                                        <img\
                                                            class="thumbnail no-margin" src="/upload/ilan/thmb_' + resim.data + '"\
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

        jQuery(document).ready(function () {

            if (shwcase == 50) {
                GetAdsFaceted(pageIndex, opt, list_kind, false, true);
            } else {
                GetIlan(pageIndex, 10, opt, list_kind, false, true);
            }

        })

        $(window).on('scroll', function () {
            if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
                if (pageIsRefresh == true) {
                    pageIndex++;
                    if (shwcase == 50) {
                        GetAdsFaceted(pageIndex, opt, list_kind, false, false);
                    } else {
                        GetIlan(pageIndex, 10, opt, list_kind, false, false);
                    }
                }

        })
        $(".selectpicker").change(function () {
            list_kind = $("#myselect").val();
            liste_sifirlama();
        });

        function liste_sifirlama() {
            pageIndex = 0;
            if (shwcase == 50) {
                GetAdsFaceted(pageIndex, opt, list_kind, false, true);
            } else {
                GetIlan(pageIndex, 10, opt, list_kind, false, true);
            }
        }

        $(document).ajaxStart(function () {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function () {
            $("#wait").css("display", "none");
        });

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
</asp:Content>
 