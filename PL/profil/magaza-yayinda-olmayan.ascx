<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="magaza-yayinda-olmayan.ascx.cs" Inherits="PL.profil.magaza_yayinda_olmayan" %>
<div class="col-md-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-docs"></i>Yayında Olmayan İlanlarım </h2>
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

<%--<div class="modal fade modalHasList fade" id="select-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: block; padding-right: 17px;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title uppercase font-weight-bold" id="exampleModalLabel"><i class=" icon-map"></i>Bilgilendrime</h4>

				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Kapat</span></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="row" style="padding: 0 20px">
					 Bu ilanı silmek istediğinden emin misin?
					</div>
				</div>
			</div>
		</div>
	</div>
</div>--%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script type="text/javascript">

    var globUser = <%= userIdentifier %>;
    var globStore = <%= storeIdentifier %>;

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
            data: "{index:'" + index + "'" + ", count:'" + count + "'" + ", userId:'" + -1 + "'" + ", storeId:'" + globStore + "'" + ", searchWord:'" + $('#filter').val() + "'" + ", status:'" + 2 + "'" + ", dataType:'" + 1 + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                //alert(userId);
                //alert(JSON.stringify(data));

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
                                </strong></p><p><strong>İlan Tarihi </strong>:'+edata[i].baslangicTarihi+'</p>\
                                <p><strong>Görüntülenme: </strong>'+edata[i].ziyaretci+' <strong>Konum: </strong>'+edata[i].ilAdi+' / '+edata[i].ilceAdi+'</p>\
                            </div>\
                        </td>\
                        <td style="width:16%" class="price-td">\
                            <div><strong>'+edata[i].fiyatFormat+' TL</strong></div>\
                        </td>\
                        <td style="width:10%" class="action-td">\
                            <div>\
                                <p><a class="btn btn-info btn-sm" href="/secure/yayindaki-ilanlarim/?pass=' + edata[i].ilanId +'"> <i class="fa fa-mail-forward"></i> Yayına Al\
                                </a></p>\
                                <p><a class="btn btn-danger btn-sm" href="/secure/yayindaki-ilanlarim/?dlt=' + edata[i].ilanId +'"> <i class=" fa fa-trash"></i> Sil\
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

                //if(totalCount < (pageIndex + 1) * 10) document.getElementById("next").disabled = true;

                //if(pageIndex < 0) document.getElementById("previous").disabled = true;

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

