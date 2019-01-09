<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="arama-sonuclari.aspx.cs" Inherits="PL.arama_sonuclari" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @media only screen and (max-width:1026px) {
            .fadeshow1 {
                display: none;
            }
        }
    </style>
    <div class="intro" style="background: url('/libraries/images/bg.png') repeat left top; height: 250px;">
        <div class="dtable hw100">
            <div class="dtable-cell hw100">
                <div class="container text-center">
                    <h1 class="intro-title animated fadeInDown"><%= search_data %>arama sonuçları</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="main-container" id="pagecontent">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 page-content col-thin-right fadeshow1">
                    <div class="col-lg-12 content-box ">
                        <div class="row row-featured row-featured-category">
                            <div class="col-lg-12  box-title no-border">
                                <div class="inner">
                                    <h2><span>ARAMA SONUÇ</span>
                                        VİTRİNİ <a href="/vitrin/arama-sonuc/2" class="sell-your-item">TÜMÜNÜ GÖSTER <i
                                            class="  icon-th-list"></i></a></h2>
                                </div>
                            </div>
                            <%--       <div id="homeshowcase">
                            </div>--%>
                            <asp:Repeater ID="rphomeshowcase" runat="server">
                                <ItemTemplate>
                                    <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 f-category">
                                        <a href='<%# String.Format("/ilan/{0}-{1}/detay", BLL.PublicHelper.Tools.URLConverter(((BLL.ExternalClass.ilanDataType)Container.DataItem).baslik),((BLL.ExternalClass.ilanDataType)Container.DataItem).ilanId) %>' title='<%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).baslik %>'>
                                            <img src='/upload/ilan/<%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).resim %>' class="img-responsive" width="120" height="80" alt="<%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).baslik %>" />
                                            <h6><%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).baslik %> </h6>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <!-- this (.mobile-filter-sidebar) part will be position fixed in mobile version -->
                <div class="col-sm-3 page-sidebar mobile-filter-sidebar">
                    <aside>
                        <div class="inner-box">
                            <div class="categories-list  list-filter">
                                <h5 class="list-title"><strong><a href="#">KATEGORİLER</a></strong></h5>
                                <ul class=" list-unstyled">
                                    <asp:Repeater ID="rpcategories" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <li>
                                                    <a href='<%# String.Format("/kategori/emlak-{0}/{1}", BLL.PublicHelper.Tools.URLConverter(((BLL.ExternalClass.CategoriCS)Container.DataItem).kategoriAdi), ((BLL.ExternalClass.CategoriCS)Container.DataItem).kategoriId) %>'>
                                                        <%-- <asp:hyperlink id="hlUrunler" navigateurl="<%$ RouteUrl:RouteName=kategori, Kategori=<%# ((BLL.deff.categoriDT)Container.DataItem).kategoriAdi %> %>" runat="server">--%>

                                                        <%--<a href='<%# "/kategoriler.aspx?cat="+((BLL.deff.categoriDT)Container.DataItem).kategoriId
                                                                 %>'>--%><%# ((BLL.ExternalClass.CategoriCS)Container.DataItem).kategoriAdi %> (<%# String.Format("{0:N0}", ((BLL.ExternalClass.CategoriCS)Container.DataItem).count) %>)<%--</asp:hyperlink>--%></a>
                                                </li>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <!--/.categories-list-->
                            <div style="clear: both"></div>
                        </div>
                        <!--/.categories-list-->
                    </aside>
                    <!-- ReklamStore kodu basla -  160x600 -->
                </div>
                <!--/.page-side-bar-->
                <div class="col-sm-9 page-content col-thin-left">
                    <div class="category-list">
                        <div class="tab-box ">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs add-tabs" role="tablist">
                                <li class="active"><a href="#allAds" role="tab" data-toggle="tab">Tüm İlanlar <span
                                    class="badge">Arama Sonuçları</span></a></li>
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
                            <div class="pull-right col-xs-6 text-right listing-view-action">
                                <span
                                    class="list-view active"><i class="  icon-th"></i></span><span
                                        class="compact-view"><i class=" icon-th-list  "></i></span><span
                                            class="grid-view"><i class=" icon-th-large "></i></span>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <!--/.listing-filter-->
                        <!-- Mobile Filter bar-->
                        <div class="mobile-filter-bar col-lg-12  ">
                            <ul class="list-unstyled list-inline no-margin no-padding">
                                <li class="filter-toggle">
                                    <a class="">
                                        <i class="  icon-th-list"></i>
                                        KATEGORİLER
                                    </a>
                                </li>

                            </ul>
                        </div>
                        <div class="menu-overly-mask"></div>
                        <!-- Mobile Filter bar End-->
                        <div class="adds-wrapper hasGridView" id="addswrap">
                            <!--/. item-list make-grid-->
                        </div>
                        <!--/.adds-wrapper-->
                        <div id="wait" style="display: none; position: relative; top: 50%; left: 50%; padding: 2px;">
                            <img src='/libraries/images/loading.gif' />
                        </div>
                        <br />
                        <div class="tab-box  save-search-bar text-center">
                            <a href="#"><i class=" icon-star-empty"></i>
                                Aramayı Kaydet </a>
                        </div>
                    </div>
                    <br />
                </div>
                <!--/.page-content-->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
    <script type="text/javascript">
        var pageIndex = 0, pageIsRefresh = true;
        var list_kind = 1;
        var sonistek = -1;
        var searchtext1 = "";
        var searchtext2 = "";

        // searchtext1 = getValueAtIndex(4);
        // searchtext2 = getValueAtIndex(5);

        searchtext1 = "<%= provi %>";
        searchtext2 = "<%= text %>";

        function getValueAtIndex(index) {
            var str = window.location.href;
            return str.split("/")[index];
        }

        if (searchtext1 === "all")
            searchtext1 = "-1";
        if (searchtext2 === "all")
            searchtext2 = "-1";

        var opt = 1;
        function GetIlan(index, count, opt, tur, sort, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListSearching",
                dataType: "json",
                data: "{_incity:'" + searchtext1 + "'" + ",_intext:'" + searchtext2 + "'" + " ,index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "' , tur:'" + tur + "' , sort:'" + sort + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    edata = data.d;
                    if (istop == true) {
                        $("#addswrap").prepend(edata);
                    } else {
                        $("#addswrap").append(edata);
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
            GetIlan(pageIndex, 10, opt, 3, list_kind, false, true);
        })

        $(window).on('scroll', function () {
            if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
                if (pageIsRefresh == true) {
                    pageIndex++;
                    GetIlan(pageIndex, 10, opt, 3, list_kind, false, false);
                }

        })
        $(".selectpicker").change(function () {
            list_kind = $("#myselect").val();
            liste_sifirlama();
        });

        $(document).ajaxStart(function () {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function () {
            $("#wait").css("display", "none");
        });

        function liste_sifirlama() {
            pageIndex = 0;
            GetIlan(pageIndex, 10, opt, 3, list_kind, false, true);
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
