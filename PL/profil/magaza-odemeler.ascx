<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="magaza-odemeler.ascx.cs" Inherits="PL.profil.magaza_odemeler" %>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-hourglass"></i>Mağaza Ödemelerim </h2>
        <div class="table-responsive">
            <div class="table-action">
            </div>
            <table id="addManageTable"
                class="table table-striped table-bordered add-manage-table table demo"
                data-filter="#filter" data-filter-text-only="true">
                <thead>
                    <tr>
                        <th>Ödeme Tipi</th>
                        <th>Tarih</th>
                        <th>Kart No</th>
                        <th>İşlem Tipi</th>
                        <th data-type="numeric">Tutar</th>
                        <th>Durum</th>
                    </tr>
                </thead>
                <tbody id="addswrap">
                </tbody>
            </table>
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
            url: "/services/ki_operation.asmx/getPaymentInfo",
            dataType: "json",
            data: "{ inuserid:'" + inuserid + "', operationtype:'" + 15 + "' , index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                edata = data.d;

                var dataArr = JSON.parse(edata);
                result = "";
                for(var i = 0; i < dataArr.length; i++) {
             
                    var status = "";

                    if (dataArr[i].basariliMi == false)
                        status = '<a class="btn btn-danger btn-xs"><i class="fa fa-edit"></i>Ödeme Yapılmadı </a>';
                    else
                        status = '<a class="btn btn-success btn-xs"><i class="fa fa-edit"></i>Ödeme Yapıldı </a>';

                    result += ' <tr>\
                            <td class="add-img-td">' + dataArr[i].odemeTipFormat + '</td>\
                            <td class="add-img-td">' + dataArr[i].tarihFormat + '</td>\
                            <td class="add-img-td">' + dataArr[i].kartNo + '</td\
                            <td class="ads-details-td\
                                <div\
                                    ' + dataArr[i].siparisTipFormat + ' \
                                </div>\
                            </td>\
                            <td class="price-td">\
                                <div>&#x20BA;\
                                ' + dataArr[i].odemeTutar + '\
                                </div>\
                            </td>\
                            <td class="action-td">\
                                <div>\
                                    <p>\
                                        ' + status + '\
                                    </p>\
                                </div>\
                            </td>\
                        </tr>';

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
        if ($(window).scrollTop() + $(window).height() > $("#addManageTable").height() - 50)
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