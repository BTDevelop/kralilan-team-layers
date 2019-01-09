<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="projeler.ascx.cs" Inherits="PL.profil.projeler" %>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-docs"></i>Projelerim </h2>
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
            url: "/services/ki_operation.asmx/getListSpclUserProject",
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

                    if (item.ponay == true)
                    {
                        status += "proje yayında";
                        controlbutton += '<a class="btn btn-danger btn-sm make-favorite" href="/secure/projelerim/?dlt=' + dataArr[i].projeid + '><i\
                        class="fa fa-close"></i><span> Sil</span></a>';

                        if (item.psatistami == true) {
                            status += " satışı devam ediyor";
                            controlbutton += ' <a class="btn btn-success btn-sm make-favorite" href="/secure/projelerim/?sales=' + dataArr[i].projeid + '/"><i\
                                    class="fa fa-check"></i><span> Satışı Tamamlandı</span></a>';
                        }
                        else {
                            status += " satışı tamamlanmış";
                            controlbutton += ' <a class="btn btn-success btn-sm make-favorite" href="/secure/projelerim/?salescont=' + dataArr[i].projeid + '/"><i\
                                    class="fa fa-hourglass"></i><span> Satışı Devam Ediyor</span></a>';
                        }
                    }
                    else {
                        status += "proje onay bekliyor";
                        controlbutton += '<a class="btn btn-danger btn-sm make-favorite" href="/secure/projelerim/?dlt=' + dataArr[i].projeid + '><i\
                                        class="fa fa-close"></i><span> Sil</span></a>';

                    }

                    result += '<div class="item-list">\
                                        <div class="col-sm-3 no-padding photobox">\
                                          <div class="add-image">\
                                            <a href="/proje/' + dataArr[i].projeAdFormat + '/' + dataArr[i].projeid + '/detay">\
                                               <img class="thumbnail no-margin" src="/upload/estate-projects/' + dataArr[i].projeid + '/' + resim.data + ' alt="img"/></a>\
                                           </div>\
                                        </div>\
                                        <div class="col-sm-6 add-desc-box">\
                                           <div href="/proje/' + dataArr[i].projeAdFormat + '/' + dataArr[i].projeid + '/detay">\
                                            <h5 class="add-title"><a href="/proje/' + dataArr[i].projeAdFormat + '/' + dataArr[i].projeid + '/detay">' + dataArr[i].padi + '</a></h5>\
                                            <span class="info-row">\
                                              <span class="item-location">' + dataArr[i].ilAdi + ' - ' + dataArr[i].ilceAdi + ' | <a><i class="icon-eye-3"></i>Görüntüleme: ' + views + '</a><a><i class="icon-mouse"></i>Tıklanma: ' + click + '</a></span>\
                                              <span class="item-location">' + dataArr[i].status + '</span>\
                                           </span></div>\
                                        </div>\
                            <div class="col-sm-3 text-right price-box">\
                                       ' + controlbutton + '\
                                div style="clear: both"></div>\
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
        GetIlan(<%= usid %>, pageIndex, 10, opt, false, true);
})

$(window).on('scroll', function () {
    if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
        if (pageIsRefresh == true) {
            pageIndex++;
            GetIlan(<%= usid %>, pageIndex, 10, opt, false, false);
            }

    })

    function liste_sifirlama() {
        pageIndex = 0;
        GetIlan(<%= usid %>, pageIndex, 10, opt, false, true);
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
