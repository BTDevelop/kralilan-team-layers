<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ilan.ascx.cs" Inherits="PL.profil.ilan" %>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-docs"></i>İlanlarım </h2>
        <div class="section-block">
            <div class="row">
                <div class="page-content ">
                    <div class="category-list" id="pagecontent">
                        <div class="adds-wrapper" id="addswrap">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/libraries/assets/js/footable.js?v=2-0-1" type="text/javascript"></script>
<script src="/libraries/assets/js/footable.filter.js?v=2-0-1" type="text/javascript"></script>
<script src="/libraries/assets/plugins/jquery.fs.scroller/jquery.fs.scroller.js"></script>
<script src="/libraries/assets/plugins/jquery.fs.selecter/jquery.fs.selecter.js"></script>
<script src="/libraries/assets/js/script.js"></script>
<script type="text/javascript">
    var globUser= <%= userid %>;
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
            url: "/services/ki_operation.asmx/getListSpclUserAds",
            dataType: "json",
            data: "{inuserid:'" + inuserid + "' , index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "'}",
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

                    var controlItems = ""
                    if (dataArr[i].onay == 1)
                    {
                        status += "yayında";
                        controlItems = '<a class="btn btn-success btn-sm make-favorite" href="/secure/ilanlarim/?pass=' + dataArr[i].ilanId + '"><i\
                        class="fa fa-minus"></i><span> Pasife Al</span></a>\
                        <a class="btn btn-danger btn-sm make-favorite" href="/secure/ilanlarim/?dlt=' + dataArr[i].ilanId + '"><i\
                        class="fa fa-close"></i><span> Sil</span></a>\
                        <a class="btn btn-primary btn-sm make-favorite" href="/ilanini-duzenle/' + dataArr[i].ilanId + '"><i\
                        class="fa fa-wrench"></i><span> Düzenle</span></a>';

                        if (dataArr[i].satildiMi == false)
                        {
                            controlItems += '<a class="btn btn-default btn-sm make-favorite" href="/secure/ilanlarim/?sale=' + dataArr[i].ilanId + '"><i\
                            class="fa fa-check"></i><span> Satıldı Olarak İşaretle</span></a>';
                        }
                    }
                    else if (dataArr[i].onay == 2)
                    {
                        status += "onay bekliyor";
                        controlItems += '<a class="btn btn-success btn-sm make-favorite" href="/secure/ilanlarim/?pass=' + dataArr[i].ilanId + '"><i\
                                            class="fa fa-minus"></i><span> Pasife Al</span></a>\
                                            <a class="btn btn-danger btn-sm make-favorite" href="/secure/ilanlarim/?dlt=' + dataArr[i].ilanId + '"><i\
                                            class="fa fa-close"></i><span> Sil</span></a>\
                                            <a class="btn btn-primary btn-sm make-favorite" href="/ilanini-duzenle/' + dataArr[i].ilanId + '"><i\
                                            class="fa fa-wrench"></i><span> Düzenle</span></a>';

                    }
                    else if (dataArr[i].onay == 0)
                    {
                        status += "onaylanmamış";
                        controlItems += '<a class="btn btn-danger btn-sm make-favorite" href="/secure/ilanlarim/?dlt=' + dataArr[i].ilanId + '"><i\
                                            class="fa fa-close"></i><span> Sil</span></a>\
                                            <a class="btn btn-primary btn-sm make-favorite" href="/ilanini-duzenle/' + dataArr[i].ilanId + '"><i\
                                            class="fa fa-wrench"></i><span> Düzenle</span></a>';
                    }
                    else if (dataArr[i].onay == 3)
                    {
                        status += "pasif";
                        controlItems = '<a class="btn btn-success btn-sm make-favorite" href="/secure/ilanlarim/?bcon=' + dataArr[i].ilanId + '"><i\
                                            class="fa fa-wifi"></i><span> Yayına Al</span></a>\
                                            <a class="btn btn-danger btn-sm make-favorite" href="/secure/ilanlarim/?dlt=' + dataArr[i].ilanId + '"><i\
                                            class="fa fa-close"></i><span> Sil</span></a>';
                    }

                    if (dataArr[i].satildiMi == true)
                        status += "satıldı";


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
                                            <h2 class="item-price">' + dataArr[i].fiyatTur + ' ' + dataArr[i].fiyatFormat + '</h2>'+ controlItems +'</div>\
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
        GetIlan(globUser, pageIndex, 10, opt, false, true);
    })

    $(window).on('scroll', function () {
        if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
            if (pageIsRefresh == true) {
                pageIndex++;
                GetIlan(globUser, pageIndex, 10, opt, false, false);
            }

    })

    function liste_sifirlama() {
        pageIndex = 0;
        GetIlan(globUser, pageIndex, 10, opt, false, true);
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




