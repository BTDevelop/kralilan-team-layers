<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kral-harita.aspx.cs" Inherits="PL.harita.kral_harita" %>

<%@ Import Namespace="BLL.EnumHelper" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="tr" xml:lang="tr">
<head runat="server">
    <title>kralilan: En Ucuz Sahibinden Satılık Daire Kiralık Ev, Emlak İlanları</title>
    <meta charset="utf-8" />
    <meta name="robots" content="noindex" />
    <meta name="googlebot" content="noindex" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Tüm kamu Kurumlarından ve sahibinden satılık ev kiralık daire arsa tarla bağ bahçe villa iş yeri plaza ilanlarını takip etme ve haritadan görme imkanı sitemizde" />
    <meta name="keywords" content="sahibinden,satılık,kiralık,ucuz,emlak,daire,plaza,ev" />
    <meta name="author" content="BT Develop" />
    <meta name="google-site-verification" content="gbU4UNxHbBsUcELtHVxxjVlXoYJ9zneG8BWQqOsPHoI" />
    <meta name="robots" content="index, follow" />
    <meta name="content-language" content="tr" />
    <meta name="copyright" content="© 2015 kralilan.com" />
    <meta name="robots" content="all" />
    <!-- Chrome, Firefox OS and Opera -->
    <meta name="theme-color" content="#16A085" />
    <!-- Windows Phone -->
    <meta name="msapplication-navbutton-color" content="#16A085" />
    <!-- iOS Safari -->
    <meta name="apple-mobile-web-app-status-bar-style" content="#16A085" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/upload/default-images/apple-touch-icon-144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/upload/default-images/apple-touch-icon-114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/upload/default-images/apple-touch-icon-72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="/upload/default-images/apple-touch-icon-57-precomposed.png" />
    <link rel="shortcut icon" href="../libraries/assets/ico/favicon.png" />
    <link href="../libraries/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../libraries/assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../libraries/assets/plugins/iCheck/flat/red.css" />
    <link rel="stylesheet" href="../libraries/assets/css/htmn.css" />
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <style>
        #filtre-btn {
            position: fixed;
            bottom: -15px;
            left: 10px;
            width: 250px;
            border-style: solid;
            border-width: 10px;
            border-color: #FFFFFF;
            z-index: 999999;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <nav class="navbar navbar-site navbar-default" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                            <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                                class="icon-bar"></span><span class="icon-bar"></span>
                        </button>
                        <a href="/">
                            <img style="padding: 11px;" src="/upload/default-images/apple-touch-icon-57-precomposed.png" /></a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right" runat="server" id="userPanel" visible="false" style="margin-right: -425px; margin-top: 17px;">
                            <li>
                                <a href="/secure/bildirimlerim/">
                                    <i class="icon icon-bell-1"></i>
                                    <span class="label label-danger" runat="server" id="span1"></span>

                                </a>
                            </li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span>
                                    <asp:Label Text="text" runat="server" ID="lblUserName" /></span> <i class="icon-user fa"></i><i
                                        class=" icon-down-open-big fa"></i></a>
                                <ul class="dropdown-menu user-menu">
                                    <li>
                                        <a href="/secure/benim-sayfam/"><i class="icon-home"></i>Benim Sayfam</a>
                                    </li>
                                    <li>
                                        <a href="/secure/ilanlarim/"><i class="icon-th-thumb"></i>İlanlarım </a></li>
                                    <li>
                                        <a href="/secure/favori-ilanlarim/"><i class="icon-heart"></i>Favorilerim </a>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Cikis_Click"><i class="glyphicon glyphicon-off"></i>Çıkış</asp:LinkButton></li>
                                </ul>
                            </li>
                            <li class="postadd">
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right" runat="server" id="visitorPanel" style="margin-right: -425px; margin-top: 17px;">
                            <li>
                                <a href="/giris-yap/"><i class="icon icon-login"></i>&nbsp;Giriş Yap</a></li>
                            <li>
                                <a href="/kayit/"><i class="icon icon-user-add"></i>&nbsp;Üye Ol</a></li>
                            <li class="postadd">
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="map-area clearfix">
            <span class="slide-a slide-a-left"></span>
            <div class="left-list">
                <div class="harita-blok harita-blok-left">
                    <div class="scroll-blok">
                        <ul class="nav nav-tabs" data-tabs="tabs">
                            <li class="tabli active"><a data-toggle="tab" href="#arama">Filtre</a></li>
                            <li class="tabli"><a data-toggle="tab" href="#firmalar">Firmalar</a></li>
                            <li id="project" class="tabli"><a data-toggle="tab" href="#projeler">Projeler</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="arama" class="tab-pane fade in active">
                                <div class="col-lg-12">
                                    <div class="categories-list  list-filter">
                                        <h5 class="list-title"><strong>
                                            <a href="/haritada-ara/"><i class="fa fa-angle-left"></i>
                                                TÜM KATEGORİLER</a></strong></h5>
                                        <ul class=" list-unstyled" runat="server" id="subcategori">
                                            <li><a href="#"><span class="title"><strong runat="server" id="ustStr"></strong></span><span
                                                class="count">&nbsp;</span></a>
                                                <a href="#"><span class="title">&nbsp;<strong runat="server" id="altStr"></strong></span><span
                                                    class="count">&nbsp;</span></a>
                                                <asp:HyperLink ID="HyperLink2" runat="server" Visible='<%# catKind(Eval("kategoriId"))==true?true:false %>'><span class="title">&nbsp;&nbsp;<strong runat="server"> <%= EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), RouteData.Values["TurNo"].ToString())) %></strong></span><span
                                        class="count">&nbsp;</span></asp:HyperLink>
                                                <ul class=" list-unstyled long-list">
                                                    <asp:Repeater ID="rpcategories" runat="server">
                                                        <ItemTemplate>
                                                            <li>
                                                                <a href='<%# String.Format("/haritada-ara/{0}/{1}/{2}/{3}", BLL.PublicHelper.Tools.URLConverter(EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString),RouteData.Values["TurNo"].ToString()))),RouteData.Values["TurNo"], BLL.PublicHelper.Tools.URLConverter(Eval("kategoriAdi")), Eval("kategoriId")) %>'><%# Eval("kategoriAdi") %><span class="count"><%# count(Eval("kategoriId").ToString(),RouteData.Values["TurNo"].ToString()) %></span></a>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </li>
                                        </ul>
                                        <ul class=" list-unstyled" runat="server" id="Ul1">
                                            <li><a href="#"><span class="title"><strong runat="server" id="topcategoristrong"></strong></span><span
                                                class="count">&nbsp;</span></a>
                                                <a href="#"><span class="title">&nbsp;<strong runat="server" id="topcategoristrong2"></strong></span><span
                                                    class="count">&nbsp;</span></a>

                                                <ul class=" list-unstyled long-list">
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <ItemTemplate>
                                                            <li>
                                                                <a href='<%# String.Format("/haritada-ara/{0}/{1}/", BLL.PublicHelper.Tools.URLConverter(Eval("kategoriAdi")), Eval("kategoriId")) %>'><%# Eval("kategoriAdi") %><span class="count"><%# count(Eval("kategoriId").ToString() , "-1") %></span>
                                                                </a>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </li>
                                        </ul>
                                        <ul class=" list-unstyled" runat="server" id="Ul2">
                                            <li><a href="#"><span class="title"><strong runat="server" id="Strong1"></strong></span><span
                                                class="count">&nbsp;</span></a>
                                                <a href="#"><span class="title">&nbsp;<strong runat="server" id="Strong2"></strong></span><span
                                                    class="count">&nbsp;</span></a>
                                                <ul class=" list-unstyled long-list">
                                                    <asp:Repeater ID="Repeater2" runat="server">
                                                        <ItemTemplate>
                                                            <li>
                                                                <a href='<%# String.Format("/haritada-ara/{0}/{1}/{2}/{3}", BLL.PublicHelper.Tools.URLConverter(EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString),Eval("turId").ToString()))),Eval("turId"), RouteData.Values["Tur"], RouteData.Values["TurNo"]) %>'><%# EnumHelper.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString),Eval("turId").ToString())) %><span class="count"><%# count(RouteData.Values["TurNo"].ToString(),Eval("turId").ToString()) %></span>
                                                                </a>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <h5 class="list-title"><strong><a href="#">İl</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctprovi"></select>
                                    </div>
                                    <h5 class="list-title"><strong><a href="#">İlçe</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctdist"></select>
                                    </div>
                                    <h5 class="list-title"><strong><a href="#">Mahalle</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctneig"></select>
                                    </div>
                                    <h5 class="list-title"><strong><a href="#">Fiyat</a></strong></h5>
                                    <div class="form-group" style="padding-right: 0">
                                        <input class="form-control" type="text" placeholder="En az" id="inminprice" />
                                    </div>
                                    <div class="form-group" style="padding-right: 0">
                                        <input type="text" class="form-control" placeholder="En çok" id="inmaxprice" />
                                    </div>
                                    <asp:PlaceHolder ID="placeHolder" runat="server"></asp:PlaceHolder>
                                    <h5 class="list-title"><strong><a href="#">Kimden</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" size="4" id="slctwho">
                                            <option value="-1">Seçiniz</option>
                                            <option value="0">Sahibinden</option>
                                            <option value="7">Emlakçıdan</option>
                                            <option value="1">Belediyeden</option>
                                            <option value="5">Bankadan</option>
                                            <option value="3">İzaley-i Şuyudan</option>
                                            <option value="2">İcradan</option>
                                            <option value="10">Milli Hazineden (Satışı Devam Eden)</option>
                                            <option value="4">Milli Hazineden (Satılamayan)</option>
                                            <option value="9">Özelleştirme İdaresinden</option>
                                            <option value="8">İnşaat Firmasından</option>
                                            <option value="6">Diğer Kamu Kurumlarından</option>
                                        </select>
                                    </div>
                                    <h5 class="list-title"><strong><a href="#">İlan Tarihi</a></strong></h5>
                                    <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                        <div class="form-group" id="rddaterange">
                                            <label>
                                                <input value="1" type="radio" name="daterange" class="daterangecls" />
                                                Son 1 Gün
                                            </label><br />
                                            <label>
                                                <input value="3" type="radio" name="daterange" class="daterangecls" />
                                                Son 3 Gün                                                                      
                                            </label><br />
                                            <label>
                                                <input value="7" type="radio" name="daterange" class="daterangecls" />
                                                Son 1 Hafta
                                            </label><br />
                                            <label>
                                                <input value="15" type="radio" name="daterange" class="daterangecls" />
                                                Son 15 Gün                                                                     
                                            </label><br />
                                            <label>
                                                <input value="30" type="radio" name="daterange" class="daterangecls" />
                                                Son 1 Ay
                                            </label><br />
                                        </div>
                                    </div>
                                    <div id="filtre-btn" class="form-group">
                                        <input type="button" class="form control btn btn-success btn-block" id="filter" value="Filtrele" />
                                    </div>
                                </div>
                            </div>
                            <div id="firmalar" class="tab-pane fade">
                            </div>
                            <div id="projeler" class="tab-pane fade">
                                <ul class="list-2" id="projewrap">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <span class="slide-a slide-a-right"></span>
            <div class="right-list">
                <div class="harita-blok harita-blok-right">
                    <div class="scroll-blok">
                        <ul class="nav nav-tabs" data-tabs="tabs">
                            <li id="allads" class="tabli active"><a data-toggle="tab" href="#ilanlar">İlanlar</a></li>
                            <li id="emerads" class="tabli"><a data-toggle="tab" href="#acilacil">Acil Acil</a></li>
                            <li id="actualads" class="tabli"><a data-toggle="tab" href="#yeniler">Günceller</a></li>
                            <li id="soldads" class="tabli"><a data-toggle="tab" href="#satilanlar">Satılanlar</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="ilanlar" class="tab-pane fade in active">
                                <ul class="list-2" id="addswrap">
                                </ul>
                            </div>
                            <div id="acilacil" class="tab-pane fade">
                                <ul class="list-2" id="emerwrap">
                                </ul>
                            </div>
                            <div id="yeniler" class="tab-pane fade">
                                <ul class="list-2" id="actualwrap">
                                </ul>
                            </div>
                            <div id="satilanlar" class="tab-pane fade">
                                <ul class="list-2" id="soldwrap">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="legend">
                <div id="open-legend" class="off"><span></span></div>
                <div><span class="color sahibinden"></span>Sahibinden</div>
                <div><span class="color bankadan"></span>Bankadan</div>
                <div><span class="color hazinedens"></span>Hazineden</div>
                <div><span class="color emlakcidan"></span>Emlak Ofisinden</div>
                <div><span class="color izaleden"></span>izalei şuyudan</div>
                <div><span class="color insattan"></span>inşaat Firmasından</div>
                <div><span class="color hazindend"></span>Hazineden (Güncel)</div>
                <div><span class="color icradan"></span>icradan</div>
                <div><span class="color ozellesmeden"></span>Özelleştirme idaresinden</div>
                <div><span class="color kamudan"></span>Kamu Kurumlarından</div>
                <div><span class="color belediyeden"></span>Belediyeden</div>
            </div>
            <div class="map" id="map"></div>
        </div>
    </form>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/bootstrap/js/bootstrap.min.js")%>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/icheck.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/owl.carousel.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/htmn.js")%>'></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        $('.double').keypress(function (event) {
            if ((event.which != 44 || $(this).val().indexOf(',') != -1) && (event.which < 48 || event.which > 57)) {
                event.preventDefault();
            }
        });

        $(function () {
            $('input').iCheck({
                radioClass: 'iradio_flat-red',
                increaseArea: '20%' // optional
            });
        });

        var map;
        var _listtype = 1;
        var _lefttype = 1;

        $("#allads").on("click", function () {
            _listtype = 1;
        });

        $("#emerads").on("click", function () {
            _listtype = 2;
        });

        $("#actualads").on("click", function () {
            _listtype = 3;
        });

        $("#soldads").on("click", function () {
            _listtype = 4;
        });

        $("#project").on("click", function () {
            _lefttype = 2;
        });

        google.load('visualization', '1.0');

        $(document).ready(function () {
            $("#map").css("height", 900);

            GetLocation(-1, -1, 1);
            $('.clsprov option[value=-1]').attr('selected', true);
            //getListFiltre();

            $("#slctprovi").change(function () {
                $("#slctdist").empty();
                GetLocation($(this).val(), -1, 2);

            });

            $("#slctdist").change(function () {
                $("#slctneig").empty();
                GetLocation(-1, $(this).val(), 3);
                $("slctneig").val(0);

            });

        });

        function GetLocation(proid, distid, opt) {
            jQuery.ajax({
                type: "POST",
                url: "/endpoint/locationservice.asmx/GetLocation",
                dataType: "json",
                data: "{ RegionId:'" + proid + "'" + ", CityId:'" + distid + "' }",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var d = JSON.parse(data.d);

                    if (opt == 1) {
                        $("#slctprovi").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                            $("#slctprovi").append(appnd);

                        }
                        $("slctprovi").val(0);
                        $("slctdist").val(0);

                    }
                    if (opt == 2) {
                        $("#slctdist").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlceId + "'>" + d[i].IlceAdi + "</option>";
                            $("#slctdist").append(appnd);

                        }
                        $("slctdist").val(0);
                        $("slctneig").val(0);

                    }
                    if (opt == 3) {
                        $("#slctneig").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].MahalleId + "'>" + d[i].MahalleAdi + "</option>";
                            $("#slctneig").append(appnd);

                        }
                        $("slctneig").val(0);
                    }

                },
                error: function (e) {

                }

            });
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

        var aramaStr = "";

        function clickFilterButton() {
            pageIndex = 0;
            _control = 0;
            getListFiltre();

        }

        function getValueAtIndex(index) {
            var str = window.location.href;
            return str.split("/")[index];
        }

        function getListFiltre(isdrag) {

            ilId = $("#slctprovi").val();
            ilceId = $("#slctdist").val();
            if (ilceId == null) {
                ilceId = -1;
            }
            mahalleId = $("#slctneig").val();
            if (mahalleId == null) {
                mahalleId = -1;
            }
            kimdenId = $("#slctwho").val();
            if (kimdenId == null) {
                kimdenId = -1;
            }
            fiyatMax = $("#inmaxprice").val();
            fiyatMin = $("#inminprice").val();
            tarihAralik = $('.daterangecls:checked').val();
            if (tarihAralik == null) {
                tarihAralik = -1;
            }

            var catId = getValueAtIndex(7);
            var turId = getValueAtIndex(5);
            if (catId == null) {
                catId = -1;
            }
            if (turId == null) {
                turId = -1;
            }
            var droplist = $(".slct-values");
            var drpstr = "";
            var listdrop = [];
            for (var i = 0; i < droplist.length; i++) {

                var item = droplist[i];
                //var _value = item.options[item.selectedIndex].value;
                var _value = $(item).val();
                var _id = $(item).data("wid");
                var drpitem = new ItemDataDrop();
                drpitem.id = _id;
                drpitem.value = _value;

                // var drpitem = [_id, _value];
                if (_value != null || _value != -1) {
                    //   drpitem[_id, _value];
                    listdrop[i] = drpitem;
                }

                //    alert("burada"+listdrop);
            }


            var textliist = $(".txt-values");

            var listtext = [];
            for (var i = 0; i < textliist.length; i++) {

                var item = textliist[i];
                var _value = item.value;
                var _id = $(item).data("wid").split("_")[0];
                var tur = $(item).data("wid").split("_")[1];
                var txtitem = new ItemDataText();


                var bl = -1;
                for (var y = 0; y < listtext.length ; y++) {
                    var slcdata = listtext[y];
                    if (slcdata.id == _id) {

                        if (tur == 1) {
                            slcdata.Min = _value;
                        }
                        if (tur == 2) {
                            slcdata.Max = _value;

                        }
                        bl = 0;


                    }

                }
                if (bl == -1) {
                    txtitem.id = _id;
                    if (tur == 1) {
                        txtitem.Min = _value;
                    }
                    if (tur == 2) {
                        txtitem.Max = _value;

                    }
                    listtext[listtext.length] = txtitem;
                }
            }

            var pageIndex = 0;

            var itemfiyat = new ItemDataFiyat();
            itemfiyat.Max = fiyatMax;
            itemfiyat.Min = fiyatMin;

            var dataintext = new DataTypeIntext();
            dataintext.ListDrop = listdrop;
            dataintext.ListText = listtext;
            dataintext.FiyatData = itemfiyat;

            if (isdrag != undefined) {
                if (isdrag == true) {
                    dataintext.isdrag = true;
                    dataintext.Koordinatlar = coord;
                }
            }

            var _income = [catId, turId, ilId, ilceId, mahalleId, kimdenId, tarihAralik, 5];

            if (pageIndex == 0) {
                getListFilteWithAjax(_income, dataintext, pageIndex, 50, 1, 1, true, false);

                if (_lefttype == 2) {
                    getListProjectFilteWithAjax(_income, dataintext, pageIndex, 10, 1, 1, true, false);
                }
            }

            else {
                getListFilteWithAjax(_income, dataintext, pageIndex, 50, 1, 1, false, false);

                if (_lefttype == 2) {
                    getListProjectFilteWithAjax(_income, dataintext, pageIndex, 10, 1, 1, false, false);
                }
            }
        }

        function DataTypeIntext() {
            this.ListDrop;
            this.ListText;
            this.FiyatData;
            this.isCoordinates = true;
            this.Koordinatlar;
            this.isdrag = false;
        }

        function ItemDataDrop() {
            this.id;
            this.value;
        }

        function ItemDataText() {
            this.id;
            this.Max;
            this.Min;
        }

        function ItemDataCoords() {
            this.minLat;
            this.maxLat;
            this.minLng;
            this.maxLng;
        }

        function ItemDataFiyat() {
            this.Max;
            this.Min;
        }

        $("#filter").click(function () {
            clickFilterButton();
        });

        function projectDT() {
            this.proid;
            this.proname;
            this.province;
            this.district;
            this.image;
            this.comlogo;
            this.comname;
            this.deliverytime;
            this.estatecnt;
            this.proplace;
            this.coordinates;
        }

        function ilanDataType() {
            this.ilanId,
            this.baslik,
            this.aciklama,
            this.ilId,
            this.ilAdi,
            this.ilceId,
            this.ilceAdi,
            this.mahalleId,
            this.mahalleAdi,
            this.magazaId,
            this.magazaTurId,
            this.kullaniciId,
            this.onay,
            this.resim,
            this.girilenOzellik,
            this.secilenOzellik
            this.turAdi,
            this.turId,
            this.baslangicTarihi,
            this.satildi,
            this.kategoriAdi,
            this.kategoriId,
            this.koordinat,
            this.satisTarihi1,
            this.satisTarihi2
            this.fiyat,
            this.fiyatTurId,
            this.ilat,
            this.ilng,
            this.guncelMi,
            this.satildi,
            this.acilMi
        }

        var pageIsRefresh = false;
        var zoomStatus;
        var clickharitakonum;
        var coord = new ItemDataCoords();
        var sonNorthEast = null;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 6,
                center: { lat: 39, lng: 36 },
                mapTypeId: google.maps.MapTypeId.HYBRID,
                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                    position: google.maps.ControlPosition.RIGHT_TOP
                },
            });

            map.addListener('mouseover', function (es) {
                clickharitakonum = es.latLng;
            });

            map.addListener('dragend', function (es) {
                var bl = false;

                if (sonNorthEast != null) {
                    if (map.getBounds().getNorthEast() == sonNorthEast) {
                        bl = true;
                    }
                }

                sonNorthEast = map.getBounds().getNorthEast();
                var latNEValue = map.getBounds().getNorthEast().lat();
                // NorthEast Longitude : 180
                var longNEValue = map.getBounds().getNorthEast().lng();
                // SouthWest Latitude : -87.71179927260242
                var latSWValue = map.getBounds().getSouthWest().lat();
                // Southwest Latitude :  -180
                var longSWValue = map.getBounds().getSouthWest().lng();

                if (latNEValue < latSWValue) {
                    coord.minLat = latNEValue;
                    coord.maxLat = latSWValue;
                }
                else {
                    coord.minLat = latSWValue;
                    coord.maxLat = latNEValue;
                }

                if (longNEValue < longSWValue) {
                    coord.minLng = longNEValue;
                    coord.maxLng = longSWValue;
                }
                else {
                    coord.minLng = longSWValue;
                    coord.maxLng = longNEValue;
                }

                if (bl == false) {
                    getListFiltre(true);
                }

            });

            map.addListener('zoom_changed', function () {
                if (map.getZoom() >= 8) {
                    var cntr;
                    zoomStatus = 2;
                    cntr = map.getCenter();

                }
                else {
                    zoomStatus = 0;
                    if (overlays != null) {
                        for (var i = 0; i < overlays.length; i++) {
                            overlays[i].setMap(null);

                        }
                    }

                    toastr.warning('Zoom değerini yaklaştırınız.');
                }

                if (zoomStatus == 2) {
                    var bl = false;

                    if (sonNorthEast != null) {
                        if (map.getBounds().getNorthEast() == sonNorthEast) {
                            bl = true;
                        }
                    }
                    sonNorthEast = map.getBounds().getNorthEast();
                    var latNEValue = map.getBounds().getNorthEast().lat();
                    // NorthEast Longitude : 180
                    var longNEValue = map.getBounds().getNorthEast().lng();
                    // SouthWest Latitude : -87.71179927260242
                    var latSWValue = map.getBounds().getSouthWest().lat();
                    // Southwest Latitude :  -180
                    var longSWValue = map.getBounds().getSouthWest().lng();

                    if (latNEValue < latSWValue) {
                        coord.minLat = latNEValue;
                        coord.maxLat = latSWValue;
                    }
                    else {
                        coord.minLat = latSWValue;
                        coord.maxLat = latNEValue;
                    }


                    if (longNEValue < longSWValue) {
                        coord.minLng = longNEValue;
                        coord.maxLng = longSWValue;
                    }
                    else {
                        coord.minLng = longSWValue;
                        coord.maxLng = longNEValue;
                    }

                    if (bl == false) {
                        getListFiltre(true);
                    }
                }
            });

            getAdsCount("", 1);
        }

        function polygonCenter(poly) {
            var lowx,
                highx,
                lowy,
                highy,
                lats = [],
                lngs = [],
                vertices = poly.getPath();

            for (var i = 0; i < vertices.length; i++) {
                lngs.push(vertices.getAt(i).lng());
                lats.push(vertices.getAt(i).lat());
            }

            lats.sort();
            lngs.sort();
            lowx = lats[0];
            highx = lats[vertices.length - 1];
            lowy = lngs[0];
            highy = lngs[vertices.length - 1];
            center_x = lowx + ((highx - lowx) / 2);
            center_y = lowy + ((highy - lowy) / 2);
            return [center_x, center_y];
            //return (new google.maps.LatLng(center_x, center_y));
        }

        var cityCountData;
        var slctdCity;
        var oncekipoly;
        function getAdsCount(inprov, opt) {
            jQuery.ajax({
                type: "POST",
                url: "/endpoint/ilanservice.asmx/GetAllRegion",
                dataType: "json",
                //data: "{ inprovname:'" + inprov + "'" + ", opt:'" + opt + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);
                    var obj = data.d;
                    cityCountData = JSON.parse(obj);
                    var sql = encodeURIComponent("SELECT City,Location,Place FROM 1JUoe66aZCZFv6_gx3xLWhajjPtuUm71K6xv8ElIm WHERE Text IN ('Il')");
                    var query = new google.visualization.Query('https://www.google.com/fusiontables/gvizdata?tq=' + sql);
                    query.send(function (response) {
                        var data = response.getDataTable();
                        var datarow = data.Nf;
                        var lng = datarow.length;
                        for (var i = 0; i < lng; i++) {
                            var item = datarow[i].c;
                            var city = item[0].v;
                            var lat = item[1].v;
                            var centerLoc = item[2].v;

                            var newCoordinates = [];
                            var geometries = $(lat).find("coordinates");


                            for (var j = 0 ; j < geometries.length; j++) {
                                newCoordinates.push(constructNewCoordinates(geometries[j].textContent.split(" ")));
                            }

                            var dat = "";
                            for (var k = 0; k < cityCountData.length; k++) {
                                if (city == cityCountData[k].Adi) {
                                    dat = cityCountData[k];
                                }
                            }

                            var contentString = "";
                            var dataid = 0;

                            if (dat != "") {
                                contentString = '<div class="marker-tooltip">' + dat.Adi + '<br>' + dat.Sayi + '</div>'
                                dataid = dat.Id;
                            }

                            var infW = new google.maps.InfoWindow({
                                pixelOffset: new google.maps.Size(100, 100),
                                content: contentString,
                                maxWidth: 125
                            });

                            google.maps.event.addListener(infW, 'domready', function () {
                                var iwOuter = $('.gm-style-iw');
                                var iwBackground = iwOuter.prev();
                                iwBackground.children(':nth-child(2)').css({ 'display': 'none' });//infowindow u kapsayan alanları gösterme
                                iwBackground.children(':nth-child(4)').css({ 'display': 'none' });//infowindow u kapsayan alanları gösterme
                                iwOuter.css({ "background-color": "#000080", "padding": "10px 10px", "color": "#fff", "border-radius": "4px", "text-align": "center" });// açılan alanın css şekillendirmesi
                                var iwCloseBtn = iwOuter.next();
                                var arrow = iwOuter.prev();
                                arrow.css("display", "none");// arrow görünmesin
                                iwCloseBtn.css({ "display": 'none' });//kapat butonu görünmesin
                            });


                            infW.setContent(contentString);
                            var city = new google.maps.Polygon({
                                paths: newCoordinates,
                                strokeColor: "#000000",
                                strokeOpacity: 0.5,
                                strokeWeight: 1,
                                fillColor: "#C1CDCD",
                                fillOpacity: 0.5,
                                datac: dat,
                                data: infW,
                            });

                            //var cityCenter = polygonCenter(city);

                            if (centerLoc) {
                                var centerCalc = (new google.maps.LatLng(centerLoc.split(',')[0], centerLoc.split(',')[1]));
                                city.set('datalng', centerCalc);
                            }
                            else {
                                city.set('datalng', newCoordinates[0][0]);
                            }

                            // alert(polygonCenter(city)[0]);

                            google.maps.event.addListener(city, 'mouseover', function (event) {
                                if (this.datac != slctdCity) {

                                    this.setOptions({ fillOpacity: 0.3 });
                                    this.setOptions({ fillColor: "#16A085" });
                                    this.data.setPosition(event.latLng);
                                    this.data.open(map);
                                }
                            });

                            google.maps.event.addListener(city, 'mouseout', function () {
                                if (this.datac != slctdCity) {
                                    this.setOptions({ fillOpacity: 0.5 });
                                    this.setOptions({ fillColor: "#C1CDCD" });
                                    this.data.close();
                                }
                            });

                            google.maps.event.addListener(city, 'click', function () {
                                if (this.datac != slctdCity) {

                                    if (oncekipoly != null) {
                                        oncekipoly.setMap(map);
                                        oncekipoly.setOptions({ fillColor: "#C1CDCD" });
                                    }

                                    oncekipoly = this;
                                    slctdCity = this.datac;
                                    map.setCenter(this.datalng);
                                    map.setZoom(13);
                                    this.setMap(null);
                                    this.data.close();
                                    var itemCity = $("#slctprovi").val(slctdCity.Id).attr("selected", true);
                                    $("#slctprovi").change();
                                    //getListFiltre(true);
                                    google.maps.event.trigger(map, 'zoom_changed');
                                    //clickFilterButton();
                                }
                            });

                            city.setMap(map);
                        }
                    });
                },
                error:
                {

                }
            });
        }

        var distCountData;
        var slctDist;
        var oncekiDistPoly;
        var distPolyList = [];

        function constructNewCoordinates(polygon) {
            var newCoordinates = [];
            for (var i in polygon) {
                var dt = polygon[i].split(",");
                newCoordinates.push(
                    new google.maps.LatLng(dt[1], dt[0]));
            }
            return newCoordinates;
        }

        var markers = [];
        var overlays = [];
        var color = "";
        var bordercolor = "";
        var infoWindow;
        function getListFilteWithAjax(_income, _intext, index, count, opt, tur, clear, istop) {
            pageIsRefresh = false;
            var fnc = new ilanDataType();
            var dt;
            if (clear == false) {
                if (sonistek == index) return;
            }

            var _incomestr = JSON.stringify(_income);
            var _intextstr = JSON.stringify(_intext);

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListFiltre",
                dataType: "json",
                data: "{ _incomestr:'" + _incomestr + "'" + ", _intextstr:'" + _intextstr + "'" + ", index:'" + index + "' , count:'" + count + "' , opt:'" + opt + "' , tur:'" + tur + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    edata = data.d;
                    dt = JSON.parse(edata);
                    var poly = "";
                    var color = "#2a0cae";
                    var infoWindow = "";
                    var markertype;


                    if (markers != null) {
                        for (var i = 0; i < markers.length; i++) {
                            markers[i].setMap(null);
                        }
                    }
                    markers = [];

                    if (overlays != null) {
                        for (var i = 0; i < overlays.length; i++) {
                            overlays[i].setMap(null);

                        }
                    }

                    overlays = [];

                    if (dt != null) {
                        toastr.success('İlanlar yükkleniyor...');
                        toastr.options.progressBar = true;
                        toastr.options.closeDuration = 50;
                        toastr.options.newestOnTop = false;


                        $("#addswrap").empty();
                        $("#actualwrap").empty();
                        $("#soldwrap").empty();
                        $("#emerwrap").empty();


                        for (var j = 0; j < dt.length; j++) {

                            if (dt[j].koordinat != null) {

                                var coordinates = [];
                                var coords;

                                try {
                                    coords = JSON.parse(dt[j].koordinat);
                                }
                                catch (err) {
                                    throw "devam";
                                }

                                coords = coords["coordinates"][0][0];

                                for (var i = 0; i < coords.length; i++) {
                                    coordinates.push({ lat: coords[i][1], lng: coords[i][0] });
                                }

                                if (dt[j].guncelMi) {
                                    bordercolor = "#000000";
                                }
                                else {
                                    bordercolor = "#FFFFFF";
                                }

                                if (_listtype == 1) {

                                    var appndix = "<li>" +
		                                    "<a href='/ilan/" + trConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
			                                "<div><img src='/upload/ilan/" + dt[j].resim + "' alt='" + dt[j].baslik + "'></div>" +
			                                "<div>" +
				                            "<span class='list-price'>" + dt[j].fiyatTurId + " " + dt[j].fiyat + " </span>" +
				                            "<strong class='title'>" + dt[j].baslik + "</strong>" +
                                            "<br/>" +
				                            //"<span class='proje-firma'>" + dt[j].ilAdi + "" + "-" + "" + dt[j].ilceAdi + " </span>" +
                                            "<span class='list-size'><span class='list-btn'>" + dt[j].baslangicTarihi.toString().split("T")[0] + "</span></span>" +
			                               "</div>" +
		                                "</a>" +
	                                "</li>";

                                    $("#addswrap").append(appndix);
                                }


                                if (_listtype == 2) {
                                    if (dt[j].acilMi) {
                                        var appndix = "<li>" +
                                                "<a href='/ilan/" + trConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
                                                "<div><img src='/upload/ilan/" + dt[j].resim + "' alt='" + dt[j].baslik + "'></div>" +
                                                "<div>" +
                                                "<span class='list-price'>" + dt[j].fiyatTurId + " " + dt[j].fiyat + " </span>" +
                                                "<strong class='title'>" + dt[j].baslik + "</strong>" +
                                                "<br/>" +
                                                //"<span class='proje-firma'>" + dt[j].ilAdi + "" + "-" + "" + dt[j].ilceAdi + " </span>" +
                                                "<span class='list-size'><span class='list-btn'>" + dt[j].baslangicTarihi.toString().split("T")[0] + "</span></span>" +
                                               "</div>" +
                                            "</a>" +
                                        "</li>";

                                        $("#emerwrap").append(appndix);
                                    }
                                }

                                if (_listtype == 3) {
                                    if (dt[j].guncelMi) {
                                        var appndix = "<li>" +
                                                "<a href='/ilan/" + trConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
                                                "<div><img src='/upload/ilan/" + dt[j].resim + "' alt='" + dt[j].baslik + "'></div>" +
                                                "<div>" +
                                                "<span class='list-price'>" + dt[j].fiyatTurId + " " + dt[j].fiyat + " </span>" +
                                                "<strong class='title'>" + dt[j].baslik + "</strong>" +
                                                "<br/>" +
                                                //"<span class='proje-firma'>" + dt[j].ilAdi + "" + "-" + "" + dt[j].ilceAdi + " </span>" +
                                                "<span class='list-size'><span class='list-btn'>" + dt[j].baslangicTarihi.toString().split("T")[0] + "</span></span>" +
                                               "</div>" +
                                            "</a>" +
                                        "</li>";

                                        $("#actualwrap").append(appndix);
                                    }
                                }

                                if (_listtype == 4) {
                                    if (dt[j].satildi) {
                                        var appndix = "<li>" +
                                                "<a href='/ilan/" + trConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
                                                "<div><img src='/upload/ilan/" + dt[j].resim + "' alt='" + dt[j].baslik + "'></div>" +
                                                "<div>" +
                                                "<span class='list-price'>" + dt[j].fiyatTurId + " " + dt[j].fiyat + " </span>" +
                                                "<strong class='title'>" + dt[j].baslik + "</strong>" +
                                                "<br/>" +
                                                //"<span class='proje-firma'>" + dt[j].ilAdi + "" + "-" + "" + dt[j].ilceAdi + " </span>" +
                                                "<span class='list-size'><span class='list-btn'>" + dt[j].baslangicTarihi.toString().split("T")[0] + "</span></span>" +
                                               "</div>" +
                                            "</a>" +
                                        "</li>";

                                        $("#soldwrap").append(appndix);
                                    }
                                }

                                color = colorGive(dt[j].magazaTurId);

                                if (dt[j].magazaId == 100001342) {
                                    markertype = '/libraries/images/marker/is-bankasi.png';
                                }
                                else {
                                    markertype = markerTypeGive(dt[j].magazaTurId);
                                }

                                poly = new google.maps.Polygon({
                                    paths: coordinates,
                                    strokeColor: bordercolor,
                                    strokeOpacity: 0.8,
                                    strokeWeight: 3,
                                    fillColor: color,
                                    fillOpacity: 0.35
                                });

                                poly.setMap(map);
                                overlays.push(poly);

                                var markerPosition = { lat: coordinates[0]["lat"], lng: coordinates[0]["lng"] };


                                var marker = new google.maps.Marker({
                                    icon: markertype,
                                    position: markerPosition,
                                    animation: google.maps.Animation.DROP,
                                    map: map,
                                    title: dt[j].baslik
                                });

                                if (dt[j].acilMi) {
                                    marker.setAnimation(google.maps.Animation.BOUNCE);
                                }


                                markers.push(marker);
                                markerConn(marker);

                                //getUrlConverter(dt[j].baslik);

                                var contentString = '<div id="info-container">' +
                                  '<a href="/ilan/' + trConverter(dt[j].baslik) + '-' + dt[j].ilanId + '/detay" target="_blank" style="color:#111">' +
                                  '<div class="info-content">' +
                                    '<div class="info-left"><img src="/upload/ilan/' + dt[j].resim + '" alt=""><div class="list-btn">No: ' + dt[j].ilanId + '</div></div>' +
                                    '<div class="info-right">' +
                                    '<div class="info-baslik">' + dt[j].baslik + '</div>' +
                                    '<div class="info-price">' + dt[j].fiyatTurId + '' + " " + '' + dt[j].fiyat + '</span></div>' +
                                    '<div class="info-detay"><span class="list-btn">' + dt[j].baslangicTarihi.toString().split("T")[0] + '</span></div>' +
                                  '</div>' +
                                  '</a>'
                                '</div>';

                                var infoWindow = new google.maps.InfoWindow({});

                                google.maps.event.addListener(infoWindow, 'domready', function () {
                                    var iwOuter = $('.gm-style-iw');
                                    var iwBackground = iwOuter.prev();
                                    iwBackground.children(':nth-child(2)').css({ 'display': 'none' });
                                    iwBackground.children(':nth-child(4)').css({ 'display': 'none' });
                                    var iwCloseBtn = iwOuter.next();
									var width = $("body").width();
                                    if (width < 795) {
                                        iwCloseBtn.css({ opacity: '1', right: '30px', top: '20px', 'z-index':'100' });
                                    } else {
                                        iwCloseBtn.css({ opacity: '1', right: '55px', top: '20px' });
                                    }

                                    var arrow = iwOuter.prev();

                                    arrow.css("display", "none");// arrow görünmesin
                                    iwCloseBtn.mouseout(function () {
                                        $(this).css({ opacity: '0.5', 'background-color': '#E74C3C' });
                                    });
                                });


                                polyConn(poly, infoWindow, contentString);

                            }
                        }
                    }
                    toastr.clear()
                    pageIsRefresh = true;
                },
                error: function (e) {
                    var s;
                    s = e;
                    pageIsRefresh = true;
                }
            });
            if (clear == true) {
                $("#tablebdy").empty();
            }

        }

        function urlConverter(_income) {
            var strSonuc = _income.toString();

            strSonuc = strSonuc.trim();
            strSonuc = strSonuc.toLowerCase();

            strSonuc = strSonuc.replace(/-/g, " ");
            strSonuc = strSonuc.replace(/ /g, " ");

            strSonuc = strSonuc.replace("ç", "c");
            strSonuc = strSonuc.replace("Ç", "C");

            strSonuc = strSonuc.replace("ğ", "g");
            strSonuc = strSonuc.replace("Ğ", "G");

            strSonuc = strSonuc.replace("ı", "i");
            strSonuc = strSonuc.replace("İ", "I");

            strSonuc = strSonuc.replace("ö", "o");
            strSonuc = strSonuc.replace("Ö", "O");

            strSonuc = strSonuc.replace("ş", "s");
            strSonuc = strSonuc.replace("Ş", "S");

            strSonuc = strSonuc.replace("ü", "u");
            strSonuc = strSonuc.replace("Ü", "U");

            strSonuc = strSonuc.trim();
            strSonuc = strSonuc.replace((new RegExp("[^a-zA-Z0-9+]"), 'g'), "");
            strSonuc = strSonuc.trim();
            strSonuc = strSonuc.replace("/+/g", "-");
            strSonuc = strSonuc.replace(/ /g, "-");
            return strSonuc.toLowerCase();
        }

        function colorGive(store) {
            var rtcolor = "";
            if (store == 1)
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

        function polyConn(polygon, infowindow, exp) {
            polygon.addListener('click', function (event) {
                infowindow.setContent(exp);
                infowindow.setPosition(event.latLng);
                infowindow.open(map);
            });
        }

        function markerConn(marker) {
            marker.addListener('click', function () {
                map.setZoom(17);
                map.setCenter(marker.getPosition());
            });
        }

        function goLocation(lat, lng) {
            map.setZoom(17);
            map.setCenter({ lat: lat, lng: lng });
        }

        $("#filter").click(function () {
            clickFilterButton();
        });

        function trConverter(text) {
            text = text.trim();
            text = text.replace(/\u00c7/g, 'c'); // Ç
            text = text.replace(/\u00e7/g, 'c'); // ç
            text = text.replace(/\u011e/g, 'g'); // Ğ
            text = text.replace(/\u011f/g, 'g'); // ğ
            text = text.replace(/\u0130/g, 'i'); // İ
            text = text.replace(/\u0131/g, 'i'); // ı
            text = text.replace(/\u015e/g, 's'); // Ş
            text = text.replace(/\u015f/g, 's'); // ş
            text = text.replace(/\u00d6/g, 'o'); // Ö
            text = text.replace(/\u00f6/g, 'o'); // ö
            text = text.replace(/\u00dc/g, 'u'); // Ü
            text = text.replace(/\u00fc/g, 'u'); // ü
            text = text.replace(/\s/gi, "-");
            text = text.replace(/[-]+/gi, "-");

            return text.toLowerCase();
        }

        var urldata = "";
        //function getUrlConverter(inurl) {
        //    var url = "";
        //    jQuery.ajax({
        //        type: "POST",
        //        url: "/services/ki_operation.asmx/getUrlConverter",
        //        dataType: "json",
        //        data: "{ income:'" + inurl + "'}",
        //        contentType: "application/json; charset=utf-8",
        //        success: function (data) {
        //            edata = data.d;
        //            urldata = edata;
        //            return (edata);

        //        },
        //        error: function (e) {

        //        }
        //    });

        //}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS1wH5TdTQ8gbD5zB6Ghi2hN4BpkkbJ5M&callback=initMap" async="async" defer="defer"></script>
    <!-- Start Alexa Certify Javascript -->
    <script type="text/javascript">
        _atrk_opts = { atrk_acct: "SAVTo1IWhd10uG", domain: "kralilan.com", dynamic: true };
        (function () { var as = document.createElement('script'); as.type = 'text/javascript'; as.async = true; as.src = "https://d31qbv1cthcecs.cloudfront.net/atrk.js"; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(as, s); })();
    </script>
    <noscript><img src="https://d5nxst8fruw4z.cloudfront.net/atrk.gif?account=SAVTo1IWhd10uG" style="display:none" height="1" width="1" alt="" /></noscript>
    <!-- End Alexa Certify Javascript -->
</body>
</html>
