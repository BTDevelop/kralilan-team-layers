<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="magaza-yayinda.ascx.cs" Inherits="PL.profil.magaza_yayinda" %>
<style type="text/css">
    #lightbox .modal-content {
        display: inline-block;
        text-align: center;
    }

    #lightbox .close {
        opacity: 1;
        color: rgb(255, 255, 255);
        background-color: rgb(25, 25, 25);
        padding: 5px 8px;
        border-radius: 30px;
        border: 2px solid rgb(255, 255, 255);
        position: absolute;
        top: -15px;
        right: -55px;
        z-index: 1032;
    }

    @media only screen and (max-width: 1026px) {
        .fadeshow1 {
            display: none;
        }
    }

    -webkit-print-color-adjust: exact;
</style>
<div class="col-md-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-docs"></i>Yayındaki İlanlarım </h2>
        <div class="table-responsive">
            <div class="table-action">
                <%--<label for="checkAll">
                       <a href="#" class="btn btn-sm btn-danger">Seçilenleri Sil <i class="glyphicon glyphicon-remove "></i></a> </label>--%>
                <div class="table-search pull-right col-sm-7">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-sm-5 control-label text-right">
                                Ara
                                <br>
                                <a title="clear filter" class="clear-filter" onclick="searchTextClear();" href="#clear">[temizle]</a>
                            </label>
                            <div class="col-sm-7 searchpan">
                                <input type="text" class="form-control" id="filter">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table id="addManageTable" class="table table-striped table-bordered add-manage-table table demo footable-loaded footable" data-filter="#filter" data-filter-text-only="true">
                <thead>
                    <tr>
                        <th>Fotoğraf</th>
                        <th data-sort-ignore="true">Detaylar</th>
                        <th data-type="numeric">Fiyat</th>
                        <th>İşlem</th>
                    </tr>
                </thead>
                <tbody id="table-body">
                </tbody>
            </table>
        </div>
    </div>
    <nav aria-label="Page navigation" style="padding-left: 50% !important;" class="d-inline-b">
        <ul class="pagination">
            <li class="page-item" id="previous"><a class="page-link" onclick="pagerDirector(1);" href="#">Geri</a></li>
            <li class="page-item" id="next">
                <a class="page-link" onclick="pagerDirector(2);" href="#">İleri</a>
            </li>
        </ul>
    </nav>
</div>
<div id="lightbox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <button type="button" class="close hidden" data-dismiss="modal" aria-hidden="true">×</button>
        <div class="modal-content" style="width: 1015px; height: 620px; margin-left: -195px; border-radius: 5px;">
            <div class="modal-body">
                <iframe src="/ilan/100037874/vitrin-yazdir" style="border: 0px;" width="1020" height="600" id="iprint"></iframe>
                <br />
                <input onclick="printFrame();" class="btn btn-success" style="background-color: #16A085; float: right; width: 158px; margin-right: -15px;" type="button" value="Yazdır" />
            </div>
        </div>
    </div>
</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script type="text/javascript">

    var globUser = <%= userIdentifier %>;
    var globStore = <%= storeIdentifier %>;

    function printFrame() {
        var frm = document.getElementById("iprint").contentWindow;
        frm.focus();
        frm.print();
        return false;
    }

    function printFrameChange(param){
        document.getElementById('iprint').src = "/ilan/"+param+"/vitrin-yazdir";       
    }

    var pageIndex = 0, pageIsRefresh = true;
    var lastRequest = -1;
    var opt = 1;
    var count = 10;
    var totalCount = 0;
    var rootUrl = location.origin;

    function GetClassifiedBySeller(userId, index, count, opt, istop, clear) {
        pageIsRefresh = false;
        if (clear == false) {
            if (lastRequest == index) return;
        }

        lastRequest = index;
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_operation.asmx/getClassifiedBySeller",
            dataType: "json",
            data: "{index:'" + index + "'" + ", count:'" + count + "'" + ", userId:'" + -1 + "'" + ", storeId:'" + globStore + "'" + ", searchWord:'" + $('#filter').val() + "'" + ", status:'" + 1 + "'"+  ", dataType:'" + 1 +"'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {

                if(data && pageIndex >= 0) {
                    edata = JSON.parse(data.d);
                    var _item = "";
                    for(var i = 0; i < edata.length; i++)
                    {
                        var text, parser, xmlDoc;
                        text = edata[i].resim;
                        parser = new DOMParser();
                        xmlDoc = parser.parseFromString(text, "text/xml");
                        var resim = "noImage.jpg";
                        if (xmlDoc.getElementsByTagName("resimDataType")[0]) {
                            resim = xmlDoc.getElementsByTagName("resimDataType")[0].childNodes[0].firstChild
                        }
                        console.log(resim);

                        totalCount = edata[i].toplamSayi;
                        var subData = '<tr> \
                        <td style="width:14%" class="add-img-td"><a href="'+rootUrl+'/ilan/'+edata[i].baslikFormat+'-'+edata[i].ilanId+'/detay"><img class="thumbnail img-responsive" src="'+rootUrl+'/upload/ilan/thmb_'+resim.data+'" alt="img"></a></td>\
                        <td style="width:58%" class="ads-details-td">\
                            <div>\
                                <p><strong> <a href="'+rootUrl+'/ilan/'+edata[i].baslikFormat+'-'+edata[i].ilanId+'/detay" title="'+edata[i].baslik+'">'+edata[i].baslik+'</a>\
                                </strong></p><p><strong>İlan Tarihi </strong>:'+edata[i].tarihFormat+'</p>\
                                <p><strong>Görüntülenme: </strong>'+edata[i].ziyaretci+' <strong>Konum: </strong>'+edata[i].ilAdi+' / '+edata[i].ilceAdi+'</p>\
                            </div>\
                        </td>\
                        <td style="width:16%" class="price-td">\
                            <div><strong>'+edata[i].fiyatFormat+' TL</strong></div>\
                        </td>\
                        <td style="width:10%" class="action-td">\
                            <div>\
                                <p><a href="'+rootUrl+'/ilanini-duzenle/'+edata[i].ilanId+'/" class="btn btn-primary btn-sm"> <i class="fa fa-edit"></i> Düzenle </a>\
                                </p>\
                                <p><a class="btn btn-info btn-sm" href="/secure/yayindaki-ilanlarim/?pass=' + edata[i].ilanId +'"> <i class="fa fa-mail-forward"></i> Yayından Kaldır\
                                </a></p>\
                                <p><a class="btn btn-danger btn-sm" href="/secure/yayindaki-ilanlarim/?dlt=' + edata[i].ilanId +'"> <i class=" fa fa-trash"></i> Sil\
                                </a></p>\
                                <p><a class="btn btn- btn-sm" data-toggle="modal" data-target="#lightbox" onclick="printFrameChange('+edata[i].ilanId+')"> <i class="icon-print"></i> Yazdır\
                                </a></p>\
                            </div>\
                        </td>\
                    </tr>';

                        _item += subData; 
                    }
                }

                if (istop == true) {
                    $("#table-body").prepend(_item);
                } else {
                    $("#table-body").append(_item);
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
            $("#table-body").empty();
        }
    }

    jQuery(document).ready(function () {
        GetClassifiedBySeller(globUser, pageIndex, 10, opt, false, true);
    })

    function pagerDirector(pagerParam) {
        if(pagerParam == 1) {
            $("#table-body").empty();
            if (pageIsRefresh == true) {
                pageIndex--;
                GetClassifiedBySeller(globUser, pageIndex, 10, opt, false, false);
                $("#previous").addClass("active");
                $("#next").removeClass("active");

            }

        }
        if(pagerParam == 2) {
            $("#table-body").empty();
            if (pageIsRefresh == true) {
                pageIndex++;
                GetClassifiedBySeller(globUser, pageIndex, 10, opt, false, false);
                $("#next").addClass("active");
                $("#previous").removeClass("active");
            }

        }
    }

    function searchTextClear() {
        $("#filter").val("");
        pageIndex = 0;
        GetClassifiedBySeller(globUser, pageIndex, 10, opt, false, true);

    }

    function onDelete(inparam) {
        $("#select-delete").addClass("show");
        alert(inparam);
    }

    $( "#filter" ).change(function() {
        pageIndex = 0;
        GetClassifiedBySeller(globUser, pageIndex, 10, opt, false, true);
    });

    function listRefresher() {
        pageIndex = 0;
        GetClassifiedBySeller(globUser, pageIndex, 10, opt, false, true);
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

