<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="projeler-filtrele.aspx.cs" Inherits="PL.projeler_filtrele" %>
<asp:Content ID="Content3" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <style>
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
    </style>--%>
    <div class="intro-inner">
        <div class="about-intro" style="box-shadow: inset 250px 250px 250px 450px rgba(0, 0, 128, 0.54); background: url(../libraries/images/bg2.jpg) no-repeat center; background-size: cover;">
            <div class="dtable hw100">
                <div class="dtable-cell hw100">
                    <div class="container text-center">
                        <h1 class="intro-title animated fadeInDown"><span class="ion ion-bookmark" style="margin-right: 15px;"></span>Projeler kralilan.com'da </h1>
                    </div>
                </div>
            </div>
        </div>
        <!--/.about-intro -->
    </div>
    <!-- /.intro-inner -->
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 page-sidebar mobile-filter-sidebar">
                    <aside>
                        <div class="inner-box">
                            <div class="locations-list  list-filter">
                                <div id="filtre">
                                    <h5 class="list-title"><strong><a href="#">İl</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctprovi"></select>
                                    </div>
                                    <h5 class="list-title"><strong><a href="#">İlçe</a></strong></h5>
                                    <div class="form-group">
                                        <select class="form-control" style="width: 100%;" id="slctdist"></select>
                                    </div>
                                    <div class="form-group">
                                        <input type="button" class="form control btn btn-success btn-block" id="filter" value="Ara" />
                                    </div>
                                    <a class="clickMe" data-toggle="modal" data-target="#myModal" hidden="hidden"></a>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <!--/.categories-list-->
                    </aside>
                </div>
                <!--/.page-side-bar-->
                <div class="col-md-9 page-content col-thin-left">
                    <div class="category-list">
                        <!-- Mobile Filter bar-->
                        <div class="mobile-filter-bar col-lg-12  ">
                            <ul class="list-unstyled list-inline no-margin no-padding">
                                <li class="filter-toggle">
                                    <a class="">
                                        <i class="fa fa-filter"></i>
                                        FİLTRE
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="menu-overly-mask"></div>
                        <!-- Mobile Filter bar End-->
                        <div class="adds-wrapper">
                            <div class="map" id="map"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 page-content">
                    <div class="category-list">
                        <div class="tab-box ">
                            <ul class="nav nav-tabs add-tabs" role="tablist">
                                <li class="active"><a href="#allAds" role="tab" data-toggle="tab">Proje Vitrini </a></li>
                            </ul>
                        </div>
                        <div class="listing-filter">
                            <div class="pull-left col-xs-6">
                                <div class="breadcrumb-list">
                                    <a href="#" class="current"><span>All Properties</span></a> in
                               
                                    <span class="cityName">New York </span><a href="#selectRegion" id="dropdownMenu1" data-toggle="modal"><span class="caret"></span></a>
                                </div>
                            </div>
                            <div class="pull-right col-xs-6 text-right listing-view-action"><span class="list-view active"><i class="  icon-th"></i></span><span class="compact-view"><i class=" icon-th-list  "></i></span><span class="grid-view "><i class=" icon-th-large "></i></span></div>
                            <div style="clear: both"></div>
                        </div>
                        <div class="mobile-filter-bar col-lg-12  ">
                            <ul class="list-unstyled list-inline no-margin no-padding">
                                <li class="filter-toggle">
                                    <a class="">
                                        <i class="  icon-th-list"></i>
                                        Filters
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" class="dropdown-toggle"><i class="caret "></i>Short by </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="" rel="nofollow">Relevance</a></li>
                                            <li><a href="" rel="nofollow">Date</a></li>
                                            <li><a href="" rel="nofollow">Company</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="menu-overly-mask"></div>
                        <div class="adds-wrapper property-list">
                            <div class="item-list">
                                <div class="col-sm-3 no-padding photobox">
                                    <div class="add-image">
                                        <a href="property-details.html">
                                            <img class="thumbnail no-margin" src="upload/3d22e44732503d7d.jpg" alt="img" /></a>
                                    </div>
                                </div>
                                <div class="col-sm-6 add-desc-box">
                                    <div class="add-details">
                                        <h5 class="add-title"><a href="property-details.html">Elite Konsept</a></h5>
                                        <span class="info-row"><span class="item-location">İstanbul - Kadıköy | <a><i class="icon-location-2"></i>Konum</a></span></span>
                                        <div class="prop-info-box">
                                            <div class="prop-info">
                                                <div class="clearfix prop-info-block">
                                                    <span class="title ">442</span>
                                                    <span class="text">Proje Alanı</span>
                                                </div>
                                                <div class="clearfix prop-info-block middle">
                                                    <span class="title prop-area">171</span>
                                                    <span class="text">Konut Sayısı</span>
                                                </div>
                                                <div class="clearfix prop-info-block">
                                                    <span class="title prop-room">Teslim Tarihi</span>
                                                    <span class="text">Haziran 2016 </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 text-right  price-box">
                                    <h3 class="item-price "><strong>64 m2 - 216 m2 </strong></h3>
                                    <div style="clear: both"></div>
                                </div>
                            </div>
                            <div class="item-list">
                                <div class="col-sm-3 no-padding photobox">
                                    <div class="add-image">
                                        <a href="property-details.html">
                                            <img class="thumbnail no-margin" src="upload/3d22e44732503d7d.jpg" alt="img" /></a>
                                    </div>
                                </div>
                                <div class="col-sm-6 add-desc-box">
                                    <div class="add-details">
                                        <h5 class="add-title"><a href="property-details.html">Elite Konsept</a></h5>
                                        <span class="info-row"><span class="item-location">İstanbul - Kadıköy | <a><i class="icon-location-2"></i>Konum</a></span></span>
                                        <div class="prop-info-box">
                                            <div class="prop-info">
                                                <div class="clearfix prop-info-block">
                                                    <span class="title ">442</span>
                                                    <span class="text">Proje Alanı</span>
                                                </div>
                                                <div class="clearfix prop-info-block middle">
                                                    <span class="title prop-area">171</span>
                                                    <span class="text">Konut Sayısı</span>
                                                </div>
                                                <div class="clearfix prop-info-block">
                                                    <span class="title prop-room">Teslim Tarihi</span>
                                                    <span class="text">Haziran 2016 </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 text-right  price-box">
                                    <h3 class="item-price "><strong>64 m2 - 216 m2 </strong></h3>
                                    <div style="clear: both"></div>
                                </div>
                            </div>
                            <div class="item-list">
                                <div class="col-sm-3 no-padding photobox">
                                    <div class="add-image">
                                        <a href="property-details.html">
                                            <img class="thumbnail no-margin" src="upload/3d22e44732503d7d.jpg" alt="img" /></a>
                                    </div>
                                </div>
                                <div class="col-sm-6 add-desc-box">
                                    <div class="add-details">
                                        <h5 class="add-title"><a href="property-details.html">Elite Konsept</a></h5>
                                        <span class="info-row"><span class="item-location">İstanbul - Kadıköy | <a><i class="icon-location-2"></i>Konum</a></span></span>
                                        <div class="prop-info-box">
                                            <div class="prop-info">
                                                <div class="clearfix prop-info-block">
                                                    <span class="title ">442</span>
                                                    <span class="text">Proje Alanı</span>
                                                </div>
                                                <div class="clearfix prop-info-block middle">
                                                    <span class="title prop-area">171</span>
                                                    <span class="text">Konut Sayısı</span>
                                                </div>
                                                <div class="clearfix prop-info-block">
                                                    <span class="title prop-room">Teslim Tarihi</span>
                                                    <span class="text">Haziran 2016 </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 text-right  price-box">
                                    <h3 class="item-price "><strong>64 m2 - 216 m2 </strong></h3>
                                    <div style="clear: both"></div>
                                </div>
                            </div>
                            <div class="item-list">
                                <div class="col-sm-3 no-padding photobox">
                                    <div class="add-image">
                                        <a href="property-details.html">
                                            <img class="thumbnail no-margin" src="upload/3d22e44732503d7d.jpg" alt="img" /></a>
                                    </div>
                                </div>
                                <div class="col-sm-6 add-desc-box">
                                    <div class="add-details">
                                        <h5 class="add-title"><a href="property-details.html">Elite Konsept</a></h5>
                                        <span class="info-row"><span class="item-location">İstanbul - Kadıköy | <a><i class="icon-location-2"></i>Konum</a></span></span>
                                        <div class="prop-info-box">
                                            <div class="prop-info">
                                                <div class="clearfix prop-info-block">
                                                    <span class="title ">442</span>
                                                    <span class="text">Proje Alanı</span>
                                                </div>
                                                <div class="clearfix prop-info-block middle">
                                                    <span class="title prop-area">171</span>
                                                    <span class="text">Konut Sayısı</span>
                                                </div>
                                                <div class="clearfix prop-info-block">
                                                    <span class="title prop-room">Teslim Tarihi</span>
                                                    <span class="text">Haziran 2016 </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 text-right  price-box">
                                    <h3 class="item-price "><strong>64 m2 - 216 m2 </strong></h3>
                                    <div style="clear: both"></div>

                                </div>
                            </div>
                            <div class="item-list">
                                <div class="col-sm-3 no-padding photobox">
                                    <div class="add-image">
                                        <a href="property-details.html">
                                            <img class="thumbnail no-margin" src="upload/3d22e44732503d7d.jpg" alt="img" /></a>
                                    </div>
                                </div>
                                <div class="col-sm-6 add-desc-box">
                                    <div class="add-details">
                                        <h5 class="add-title"><a href="property-details.html">Elite Konsept</a></h5>
                                        <span class="info-row"><span class="item-location">İstanbul - Kadıköy | <a><i class="icon-location-2"></i>Konum</a></span></span>
                                        <div class="prop-info-box">
                                            <div class="prop-info">
                                                <div class="clearfix prop-info-block">
                                                    <span class="title ">442</span>
                                                    <span class="text">Proje Alanı</span>
                                                </div>
                                                <div class="clearfix prop-info-block middle">
                                                    <span class="title prop-area">171</span>
                                                    <span class="text">Konut Sayısı</span>
                                                </div>
                                                <div class="clearfix prop-info-block">
                                                    <span class="title prop-room">Teslim Tarihi</span>
                                                    <span class="text">Haziran 2016 </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 text-right  price-box">
                                    <h3 class="item-price "><strong>64 m2 - 216 m2 </strong></h3>
                                    <div style="clear: both"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scripts" runat="server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <script type="text/javascript">
        var map;
        google.load('visualization', '1.0');

        $(document).ready(function () {
            $("#map").css("height", 400);

            GetLocation(-1, -1, 1);
            $('.clsprov option[value=-1]').attr('selected', true);

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
                data: "{ RegionId:'" + proid + "'" + ", CityId:'" + distid + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var d = JSON.parse(data.d);

                    if (opt == 1) {
                        $("#slctprovi").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                            $("#slctprovi").append(appnd);

                        }
                        $("slctdist").val(0);

                    }
                    if (opt == 2) {
                        $("#slctdist").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlceId + "'>" + d[i].IlceAdi + "</option>";
                            $("#slctdist").append(appnd);

                        }
                        $("slctneig").val(0);

                    }
                    if (opt == 3) {
                        $("#slctneig").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].MahalleId + "'>" + d[i].MahalleAdi + "</option>";
                            $("#slctneig").append(appnd);

                        }
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

        //function getListFiltre(isdrag) {

        //    ilId = $("#slctprovi").val();
        //    ilceId = $("#slctdist").val();
        //    if (ilceId == null) {
        //        ilceId = -1;
        //    }
        //    mahalleId = $("#slctneig").val();
        //    if (mahalleId == null) {
        //        mahalleId = -1;
        //    }
        //    kimdenId = $("#slctwho").val();
        //    if (kimdenId == null) {
        //        kimdenId = -1;
        //    }
        //    fiyatMax = $("#inmaxprice").val();
        //    fiyatMin = $("#inminprice").val();
        //    tarihAralik = $('.daterangecls:checked').val();
        //    if (tarihAralik == null) {
        //        tarihAralik = -1;
        //    }


        //    var catId = getValueAtIndex(7);
        //    var turId = getValueAtIndex(5);
        //    if (catId == null) {
        //        catId = -1;
        //    }
        //    if (turId == null) {
        //        turId = -1;
        //    }
        //    var droplist = $(".slct-values");
        //    var drpstr = "";
        //    var listdrop = [];
        //    for (var i = 0; i < droplist.length; i++) {

        //        var item = droplist[i];
        //        //var _value = item.options[item.selectedIndex].value;
        //        var _value = $(item).val();
        //        var _id = $(item).data("wid");
        //        var drpitem = new ItemDataDrop();
        //        drpitem.id = _id;
        //        drpitem.value = _value;

        //        // var drpitem = [_id, _value];
        //        if (_value != null || _value != -1) {
        //            //   drpitem[_id, _value];
        //            listdrop[i] = drpitem;
        //        }

        //        //    alert("burada"+listdrop);
        //    }


        //    var textliist = $(".txt-values");

        //    var listtext = [];
        //    for (var i = 0; i < textliist.length; i++) {

        //        var item = textliist[i];
        //        var _value = item.value;
        //        var _id = $(item).data("wid").split("_")[0];
        //        var tur = $(item).data("wid").split("_")[1];
        //        var txtitem = new ItemDataText();


        //        var bl = -1;
        //        for (var y = 0; y < listtext.length ; y++) {
        //            var slcdata = listtext[y];
        //            if (slcdata.id == _id) {

        //                if (tur == 1) {
        //                    slcdata.Min = _value;
        //                }
        //                if (tur == 2) {
        //                    slcdata.Max = _value;

        //                }
        //                bl = 0;


        //            }

        //        }
        //        if (bl == -1) {
        //            txtitem.id = _id;
        //            if (tur == 1) {
        //                txtitem.Min = _value;
        //            }
        //            if (tur == 2) {
        //                txtitem.Max = _value;

        //            }
        //            listtext[listtext.length] = txtitem;
        //        }
        //    }

        //    var pageIndex = 0;

        //    var itemfiyat = new ItemDataFiyat();
        //    itemfiyat.Max = fiyatMax;
        //    itemfiyat.Min = fiyatMin;

        //    var dataintext = new DataTypeIntext();
        //    dataintext.ListDrop = listdrop;
        //    dataintext.ListText = listtext;
        //    dataintext.FiyatData = itemfiyat;

        //    if (isdrag != undefined) {
        //        if (isdrag == true) {
        //            dataintext.isdrag = true;
        //            dataintext.Koordinatlar = coord;
        //        }
        //    }

        //    var _income = [catId, turId, ilId, ilceId, mahalleId, kimdenId, tarihAralik];
        //    // var _intext = [itemfiyat, listtext, listdrop];

        //    if (pageIndex == 0) {
        //        getListFilteWithAjax(_income, dataintext, pageIndex, 50, 1, 1, true, false);
        //    }

        //    else {
        //        getListFilteWithAjax(_income, dataintext, pageIndex, 50, 1, 1, false, false);
        //    }
        //    //ilId = itemilId.options[itemilId.selectedIndex].value;
        //}

        //function DataTypeIntext() {
        //    this.ListDrop;
        //    this.ListText;
        //    this.FiyatData;
        //    this.isCoordinates = true;
        //    this.Koordinatlar;
        //    this.isdrag = false;

        //}

        //function ItemDataDrop() {
        //    this.id;
        //    this.value;
        //}

        //function ItemDataText() {
        //    this.id;
        //    this.Max;
        //    this.Min;
        //}

        //function ItemDataCoords() {
        //    this.minLat;
        //    this.maxLat;
        //    this.minLng;
        //    this.maxLng;
        //}

        //function ItemDataFiyat() {
        //    this.Max;
        //    this.Min;
        //}

        //$("#filter").click(function () {
        //    clickFilterButton();
        //});

        //function ilanDataType() {
        //    this.ilanId,
        //    this.baslik,
        //    this.aciklama,
        //    this.ilId,
        //    this.ilAdi,
        //    this.ilceId,
        //    this.ilceAdi,
        //    this.mahalleId,
        //    this.mahalleAdi,
        //    this.magazaId,
        //    this.magazaTurId,
        //    this.kullaniciId,
        //    this.onay,
        //    this.resim,
        //    this.girilenOzellik,
        //    this.secilenOzellik
        //    this.turAdi,
        //    this.turId,
        //    this.baslangicTarihi,
        //    this.satildi,
        //    this.kategoriAdi,
        //    this.kategoriId,
        //    this.koordinat,
        //    this.satisTarihi1,
        //    this.satisTarihi2
        //    this.fiyat,
        //    this.fiyatTurId,
        //    this.ilat,
        //    this.ilng,
        //    this.guncelMi,
        //    this.satildi,
        //    this.acilMi
        //}

        var pageIsRefresh = false;
        var zoomStatus;
        var clickharitakonum;
        //var coord = new ItemDataCoords();
        var sonNorthEast = null;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                tilt: 45,
                zoom: 5,
                center: { lat: 39, lng: 36 },
                styles: [
  {
      "elementType": "geometry",
      "stylers": [
        {
            "color": "#1d2c4d"
        }
      ]
  },
  {
      "elementType": "labels",
      "stylers": [
        {
            "visibility": "off"
        }
      ]
  },
  {
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#8ec3b9"
        }
      ]
  },
  {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
            "color": "#1a3646"
        }
      ]
  },
  {
      "featureType": "administrative.country",
      "elementType": "geometry.stroke",
      "stylers": [
        {
            "color": "#4b6878"
        }
      ]
  },
  {
      "featureType": "administrative.land_parcel",
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#64779e"
        }
      ]
  },
  {
      "featureType": "administrative.neighborhood",
      "stylers": [
        {
            "visibility": "off"
        }
      ]
  },
  {
      "featureType": "administrative.province",
      "elementType": "geometry.stroke",
      "stylers": [
        {
            "color": "#4b6878"
        }
      ]
  },
  {
      "featureType": "landscape.man_made",
      "elementType": "geometry.stroke",
      "stylers": [
        {
            "color": "#334e87"
        }
      ]
  },
  {
      "featureType": "landscape.natural",
      "elementType": "geometry",
      "stylers": [
        {
            "color": "#023e58"
        }
      ]
  },
  {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {
            "color": "#283d6a"
        }
      ]
  },
  {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#6f9ba5"
        }
      ]
  },
  {
      "featureType": "poi",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
            "color": "#1d2c4d"
        }
      ]
  },
  {
      "featureType": "poi.park",
      "elementType": "geometry.fill",
      "stylers": [
        {
            "color": "#023e58"
        }
      ]
  },
  {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#3C7680"
        }
      ]
  },
  {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
            "color": "#304a7d"
        }
      ]
  },
  {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#98a5be"
        }
      ]
  },
  {
      "featureType": "road",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
            "color": "#1d2c4d"
        }
      ]
  },
  {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
            "color": "#2c6675"
        }
      ]
  },
  {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
        {
            "color": "#255763"
        }
      ]
  },
  {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#b0d5ce"
        }
      ]
  },
  {
      "featureType": "road.highway",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
            "color": "#023e58"
        }
      ]
  },
  {
      "featureType": "transit",
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#98a5be"
        }
      ]
  },
  {
      "featureType": "transit",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
            "color": "#1d2c4d"
        }
      ]
  },
  {
      "featureType": "transit.line",
      "elementType": "geometry.fill",
      "stylers": [
        {
            "color": "#283d6a"
        }
      ]
  },
  {
      "featureType": "transit.station",
      "elementType": "geometry",
      "stylers": [
        {
            "color": "#3a4762"
        }
      ]
  },
  {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
            "color": "#0e1626"
        }
      ]
  },
  {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
            "color": "#4e6d70"
        }
      ]
  }
                ],



                mapTypeControl: true,
                mapTypeControlOptions: {
                    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                    position: google.maps.ControlPosition.RIGHT_TOP
                },
            });
            map.setTilt(45);

            map.addListener('mouseover', function (es) {
                clickharitakonum = es.latLng;
            });

            //map.addListener('dragend', function (es) {
            //    var bl = false;

            //    if (sonNorthEast != null) {
            //        if (map.getBounds().getNorthEast() == sonNorthEast) {
            //            bl = true;
            //        }
            //    }
            //    sonNorthEast = map.getBounds().getNorthEast();
            //    var latNEValue = map.getBounds().getNorthEast().lat();
            //    // NorthEast Longitude : 180
            //    var longNEValue = map.getBounds().getNorthEast().lng();
            //    // SouthWest Latitude : -87.71179927260242
            //    var latSWValue = map.getBounds().getSouthWest().lat();
            //    // Southwest Latitude :  -180
            //    var longSWValue = map.getBounds().getSouthWest().lng();

            //    if (latNEValue < latSWValue) {
            //        coord.minLat = latNEValue;
            //        coord.maxLat = latSWValue;
            //    }
            //    else {
            //        coord.minLat = latSWValue;
            //        coord.maxLat = latNEValue;
            //    }

            //    if (longNEValue < longSWValue) {
            //        coord.minLng = longNEValue;
            //        coord.maxLng = longSWValue;
            //    }
            //    else {
            //        coord.minLng = longSWValue;
            //        coord.maxLng = longNEValue;
            //    }

            //    if (bl == false) {
            //        getListFiltre(true);
            //    }

            //});

            //map.addListener('zoom_changed', function () {
            //    if (map.getZoom() >= 6) {
            //        var cntr;
            //        zoomStatus = 2;
            //        cntr = map.getCenter();

            //    }
            //    else if (map.getZoom() > 5 & map.getZoom() < 6) {
            //        zoomStatus = 2;
            //    }
            //    else {
            //        zoomStatus = 0;
            //    }

            //    if (zoomStatus == 2) {
            //        var bl = false;

            //        if (sonNorthEast != null) {
            //            if (map.getBounds().getNorthEast() == sonNorthEast) {
            //                bl = true;
            //            }
            //        }
            //        sonNorthEast = map.getBounds().getNorthEast();
            //        var latNEValue = map.getBounds().getNorthEast().lat();
            //        // NorthEast Longitude : 180
            //        var longNEValue = map.getBounds().getNorthEast().lng();
            //        // SouthWest Latitude : -87.71179927260242
            //        var latSWValue = map.getBounds().getSouthWest().lat();
            //        // Southwest Latitude :  -180
            //        var longSWValue = map.getBounds().getSouthWest().lng();

            //        if (latNEValue < latSWValue) {
            //            coord.minLat = latNEValue;
            //            coord.maxLat = latSWValue;
            //        }
            //        else {
            //            coord.minLat = latSWValue;
            //            coord.maxLat = latNEValue;
            //        }


            //        if (longNEValue < longSWValue) {
            //            coord.minLng = longNEValue;
            //            coord.maxLng = longSWValue;
            //        }
            //        else {
            //            coord.minLng = longSWValue;
            //            coord.maxLng = longNEValue;
            //        }

            //        if (bl == false) {
            //            getListFiltre(true);
            //        }
            //    }
            //});

            getAdsCount("", 1);
            var donusbekle = false;

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

                    var obj = data.d;
                    cityCountData = JSON.parse(obj);
                    var sql = encodeURIComponent("SELECT City,Location FROM 1JUoe66aZCZFv6_gx3xLWhajjPtuUm71K6xv8ElIm WHERE Text IN ('Il')");
                    var query = new google.visualization.Query('https://www.google.com/fusiontables/gvizdata?tq=' + sql);
                    query.send(function (response) {
                        var data = response.getDataTable();
                        var datarow = data.Nf;
                        var lng = datarow.length;
                        for (var i = 0; i < lng; i++) {
                            var item = datarow[i].c;
                            var city = item[0].v;
                            var lat = item[1].v;

                            var newCoordinates = [];

                            var geometries = $(lat).find("coordinates");

                            for (var j = 0 ; j < geometries.length; j++) {
                                newCoordinates.push(constructNewCoordinates(geometries[j].textContent.split(" ")));
                            }
                            var dat = "";
                            for (var k = 0; k < cityCountData.length; k++) {
                                if (city == cityCountData[k].provName) {
                                    dat = cityCountData[k];
                                }
                            }
                            var contentString = "";
                            var dataid = 0;

                            if (dat != "") {
                                //contentString =
                                //'<div style="width:150px;">' +

                                //        '<h6 >' + dat.provName + '</h6>' +
                                //        '<h6 >' + dat.cnt + '</h6>' +

                                //'</div>';

                                contentString = '<div class="marker-tooltip">' + dat.Adi + '<br>' + dat.Sayi + '</div>'
                                dataid = dat.provId;
                            }



                            //var infW = new google.maps.InfoWindow({
                            //    content: content,
                            //    disableAutoPan: false
                            //    , maxWidth: 0
                            //    , pixelOffset: new google.maps.Size(-140, 0)
                            //    , zIndex: null
                            //    , boxStyle: {
                            //        padding: "0px 0px 0px 0px",
                            //        width: "252px",
                            //        height: "40px"
                            //    },
                            //    closeBoxURL: "",
                            //    infoBoxClearance: new google.maps.Size(1, 1),
                            //    isHidden: false,
                            //    pane: "floatPane",
                            //    enableEventPropagation: true
                            //});

                            var infW = new google.maps.InfoWindow({
                                pixelOffset: new google.maps.Size(60, 60),
                                content: contentString,
                                maxWidth: 100


                            });

                            google.maps.event.addListener(infW, 'domready', function () {
                                var iwOuter = $('.gm-style-iw');
                                var iwBackground = iwOuter.prev();
                                iwBackground.children(':nth-child(2)').css({ 'display': 'none' });//infowindow u kapsayan alanları gösterme
                                iwBackground.children(':nth-child(4)').css({ 'display': 'none' });//infowindow u kapsayan alanları gösterme
                                iwOuter.css({ "background-color": "#000080", "padding": "3px 6px", "color": "#fff", "border-radius": "4px", "text-align": "center" });// açılan alanın css şekillendirmesi
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
                                datalng: newCoordinates[0][0]
                            });

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
                                        //   oncekipoly.setOptions({ fillOpacity: 0.5 
                                        oncekipoly.setMap(map);
                                        oncekipoly.setOptions({ fillColor: "#C1CDCD" });
                                    }
                                    oncekipoly = this;
                                    slctdCity = this.datac;
                                    map.setCenter(this.datalng);
                                    map.setZoom(8);
                                    this.setMap(null);
                                    this.data.close();
                                    var itemCity = $("#slctprovi").val(slctdCity.provId).attr("selected", true);
                                    $("#slctprovi").change();
                                    //if (_listtype == 2) {
                                    //    getEmer(pageIdx, 10, slctdCity.provId, false, false);
                                    //}
                                    //giveDistPlace(slctdCity.provName, slctdCity.provId)
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
                        $("#addswrap").empty();
                        $("#actualwrap").empty();
                        $("#soldwrap").empty();
                        $("#emerwrap").empty();


                        for (var j = 0; j < dt.length; j++) {

                            if (dt[j].koordinat != null) {

                                var coordinates = [];
                                var coords = JSON.parse(dt[j].koordinat);

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
		                                    "<a href='/ilan/" + urlConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
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
                                                "<a href='/ilan/" + urlConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
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
                                                "<a href='/ilan/" + urlConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
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
                                                "<a href='/ilan/" + urlConverter(dt[j].baslik) + "-" + dt[j].ilanId + "/detay' class='blank' target='_blank'>" +
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
                                markertype = markerTypeGive(dt[j].magazaTurId);

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

                                getUrlConverter(dt[j].baslik);

                                var contentString = '<div id="info-container">' +
                                  '<div class="info-content">' +
                                    '<div class="info-left"><img src="/upload/ilan/' + dt[j].resim + '" alt=""><div class="list-btn">No: ' + dt[j].ilanId + '</div></div>' +
                                    '<div class="info-right">' +
                                    '<div class="info-baslik">' + dt[j].baslik + '</div>' +
                                    '<div class="info-price">' + dt[j].fiyatTurId + '' + " " + '' + dt[j].fiyat + '</span></div>' +
                                    '<div class="info-detay"><span class="list-btn">' + dt[j].baslangicTarihi.toString().split("T")[0] + '</span><a href="/ilan/' + urlConverter(dt[j].baslik) + '-' + dt[j].ilanId + '/detay" target="_blank"><span class="list-btn pull-right">İlana Git</span></a></div>' +
                                  '</div>' +
                                '</div>';


                                var infoWindow = new google.maps.InfoWindow({
                                    content: "",
                                    maxWidth: 350
                                });

                                google.maps.event.addListener(infoWindow, 'domready', function () {
                                    var iwOuter = $('.gm-style-iw');
                                    var iwBackground = iwOuter.prev();
                                    iwBackground.children(':nth-child(2)').css({ 'display': 'none' });
                                    iwBackground.children(':nth-child(4)').css({ 'display': 'none' });
                                    var iwCloseBtn = iwOuter.next();
                                    iwCloseBtn.css({ opacity: '1', right: '55px', top: '20px' });
                                    iwCloseBtn.mouseout(function () {
                                        $(this).css({ opacity: '1' });
                                    });
                                });

                                polyConn(poly, infoWindow, contentString);

                            }
                        }
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
                $("#tablebdy").empty();
            }

        }

        google.maps.event.addListener(infoWindow, 'domready', function () {
            var iwOuter = $('.gm-style-iw');
            var iwBackground = iwOuter.prev();
            iwBackground.children(':nth-child(2)').css({ 'display': 'none' });
            iwBackground.children(':nth-child(4)').css({ 'display': 'none' });
            var iwCloseBtn = iwOuter.next();
            iwCloseBtn.css({ opacity: '1', right: '55px', top: '20px' });
            iwCloseBtn.mouseout(function () {
                $(this).css({ opacity: '1' });
            });
        });

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

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS1wH5TdTQ8gbD5zB6Ghi2hN4BpkkbJ5M&callback=initMap" async="async" defer="defer"></script>
</asp:Content>
