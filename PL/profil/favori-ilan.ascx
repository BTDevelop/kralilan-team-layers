<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="favori-ilan.ascx.cs" Inherits="PL.profil.favori" %>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-heart-1"></i>Favori İlanlarım</h2>
        <div class="section-block" id="listviewdiv">
            <div class="row">
                <div class="page-content ">
                    <div class="category-list" id="pagecontent">
                        <div class="tab-box ">
                        </div>
                        <div class="listing-filter">
                            <div class="pull-left col-xs-6">
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <div class="adds-wrapper" id="addswrap">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var pageIndex = 0, pageIsRefresh = true;
        var sonistek = -1;
        var opt = 1;

        function GetIlan(inuserid, index, count, opt, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/endpoint/ilanfavoriservice.asmx/GetByAdsUserId",
                dataType: "json",
                data: "{ UserId:'" + inuserid + "' , Index:'" + index + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    edata = data.d;
                    var dataArr = JSON.parse(edata);
                    result = "";
                    var status = "";
                    for(var i = 0; i < dataArr.length; i++) {
                        var text, parser, xmlDoc;

                        text = dataArr[i].Resimler;
                        parser = new DOMParser();
                        xmlDoc = parser.parseFromString(text, "text/xml");
                        var resim = "noImage.jpg";
                        if (xmlDoc.getElementsByTagName("resimDataType")[0]) {
                            resim = xmlDoc.getElementsByTagName("resimDataType")[0].childNodes[0].firstChild;
                        }

                        status = "";
                        //if (dataArr[i].satildiMi == true)
                            //status += '<span class="item-location"><i class="icon-docs"></i>&nbsp; satıldı </span>';

                        result += '<div class="item-list">\
                                        <div class="col-sm-2 no-padding photobox">\
                                            <div><a href="/ilan/'+ dataArr[i].Url +'-'+ dataArr[i].IlanId +'/detay"\
                                                    title="' + dataArr[i].Baslik + '">\
                                                        <img\
                                                            class="thumbnail no-margin" src="/upload/ilan/' + resim.data +  '"\
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
                                                                '+ status +'\
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

        jQuery(document).ready(function () {
            GetIlan(<%= kullaniciId%>, pageIndex, 10, opt, false, true);
        })

            $(window).on('scroll', function () {
                if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
                    if (pageIsRefresh == true) {
                        pageIndex++;
                        GetIlan(<%= kullaniciId%>, pageIndex, 10, opt, false, false);
                    }

            })

            function liste_sifirlama() {
                pageIndex = 0;
                GetIlan(<%= kullaniciId%>, pageIndex, 10, opt, false, true);
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
