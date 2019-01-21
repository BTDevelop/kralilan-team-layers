<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ekle.ascx.cs" Inherits="PL.management.anaYonetim.ilanYonetimi.ekle" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/basic.min.css") %>' />
<style>
    #map {
        width: 100%;
        height: 428px;
    }

    #uploadImage {
        float: none;
    }

    .secili {
        border: 4px solid #679b12;
    }

    .dz-image {
        cursor: pointer !important;
    }

    .dropzone {
        cursor: pointer;
        background-color: #f8f8f8;
        height: 100%;
        border-style: dashed;
        height: auto;
    }

        .dropzone.dz-drag-hover {
            border-style: dashed;
            background-color: #f4f4f4;
        }

            .dropzone.dz-drag-hover span {
                color: #959595 !important;
            }

    .dz-default span {
        text-align: center;
        display: block;
        vertical-align: center;
        font-family: 'Tahoma';
        font-size: 24px;
        color: #959595;
    }

    .dSec {
        border: 3px solid #007e44;
        width: 150px;
        height: 150px;
        background-color: #008d4c;
        border-radius: 4px;
        color: #fff;
        cursor: pointer;
        font-size: 20px;
        font-weight: bold;
        line-height: 210px;
        text-align: center;
        display: block;
        margin-bottom: 20px;
    }

        .dSec:hover {
            background-color: #007e44;
            color: #fff;
        }

        .dSec span {
            display: block;
            position: absolute;
            left: 66px;
            top: 30px;
        }

    .dz-image {
        border-radius: 0 !important;
    }

    .resimler {
        height: 180px;
        margin-bottom: 20px;
    }

        .resimler a {
            height: 100%;
        }

        .resimler img {
            height: 100%;
        }

        .resimler span {
            display: block;
            cursor: pointer;
            color: #fff;
            text-align: center;
            line-height: 30px;
            position: absolute;
            bottom: 10px;
            padding: 0 15px;
        }

        .resimler .resimSil {
            background-color: #ba0d0d;
            right: 16px;
            bottom: 50px;
        }

            .resimler .resimSil:hover {
                background-color: #a30f0f;
            }

        .resimler .vitrin {
            background-color: #1666aa;
            right: 16px;
        }

            .resimler .vitrin:hover {
                background-color: #1886aa;
            }
</style>
<style>
    .checkbox .btn,
    .checkbox-inline .btn {
        padding-left: 2em;
        min-width: 8em;
    }

    .checkbox label,
    .checkbox-inline label {
        text-align: left;
        padding-left: 0.5em;
    }
</style>
<div class="content-wrapper">
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Yeni İlan
           
            <small>bu alandan yeni ilan ekleyebilirsin.</small>
        </h1>

    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <div>
                    <ul class="timeline timeline">
                        <li>
                            <i class="fa fa-asterisk bg-red"></i>
                            <div class="timeline-item">
                                <h3 class="timeline-header no-border"><a href="#" class="text-danger" runat="server" id="lblKind"></a></h3>
                            </div>
                        </li>
                        <li>
                            <i class="fa fa-asterisk bg-green"></i>
                            <div class="timeline-item">
                                <h3 class="timeline-header no-border"><a href="#" class="text-green" runat="server" id="lblCat"></a></h3>
                            </div>
                        </li>
                        <li>
                            <i class="fa fa-asterisk bg-green"></i>
                            <div class="timeline-item">
                                <h3 class="timeline-header no-border">
                                    <asp:HyperLink runat="server" NavigateUrl="~/management/anaYonetim/ilanYonetimi/ilan.aspx?page=ilan-kategori">Değiştir</asp:HyperLink></h3>
                            </div>
                        </li>
                        <li>
                            <i class="fa fa-asterisk bg-gray"></i>
                        </li>
                    </ul>
                </div>
                <br />
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Bana özel</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gelenkutusu" runat="server"><i class="fa fa-inbox"></i>Gelen Kutusu </asp:HyperLink></li>
                            <li>
                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gonderilen-kutusu" runat="server"><i class="fa fa-envelope-o"></i>Gönderilen Kutusu</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->
            </div>
            <div class="col-md-9">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Mağaza Bilgileri</h3>
                    </div>
                    <div class="box-body" runat="server" id="box_body">
                        <div class="col-md-4">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <label>Kimden</label>
                                        <div class="clearfix"></div>
                                        <asp:DropDownList ID="drpKimden" runat="server" CssClass="select2 kimden" Style="width: 100%;" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-xs-12 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Lokasyon Bilgileri</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-4">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label>İl</label>
                                            <asp:DropDownList CssClass="form-control select2 province" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>İlçe</label>
                                            <asp:DropDownList CssClass="form-control select2 district" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpIlce_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Mahalle</label>
                                            <asp:DropDownList CssClass="form-control select2 neibor" Style="width: 100%;" ID="drpMahalle" runat="server"></asp:DropDownList>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div id="box_loc" runat="server">
                                    <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                                </div>
                            </div>
                            <div class="col-md-8" style="background: url('../../../libraries/images/bg_1.png') repeat left top;">

                                <div id="map" style="border-radius: 5px;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <div class="col-md-9 col-xs-12 pull-right">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Resim Ekle</h3>
                    </div>
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-12">
                                <div class="dropzone" id="dropzoneForm" style="border-radius: 15px; background: url('../../../libraries/images/bg_1.png') repeat left top;">
                                    <div class="fallback">
                                        <input name="file" type="file" multiple="multiple" />
                                    </div>
                                </div>
                                <input runat="server" name="txtgecici" id="txtgecici" visible="False" />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9 pull-right">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">İlan Detayları</h3>
                    </div>
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label for="txtBaslik">Başlık</label>
                                    <asp:TextBox ID="txtBaslik" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtFiyat">Fiyat</label>
                                    <asp:TextBox ID="txtFiyat" CssClass="form-control double price" runat="server"></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <label for="editor1">Açıklama</label>
                                    <div>
                                        <asp:TextBox ID="txtCKeditorAdi" runat="server" TextMode="MultiLine" ValidateRequestMode="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div id="box_footer" runat="server">
                                            <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>
                                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
    <div class="col-md-9 col-md-offset-3" style="float: none; padding-bottom: 30px">
        <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
        <asp:Button ID="Vezgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgeç_Click" />
    </div>
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS1wH5TdTQ8gbD5zB6Ghi2hN4BpkkbJ5M&callback=initMap" async defer></script>
<!-- /.content-wrapper -->
<script src="../../plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>--%>
<script src="//cdn.ckeditor.com/4.11.1/full/ckeditor.js"></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/datepicker/bootstrap-datepicker.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.js") %>'></script>

<!-- Page script -->
<script type="text/javascript">
    //File Upload response from the server
    Dropzone.options.dropzoneForm = {
        maxFiles: 20,
        dictDefaultMessage: "Resimleri sürükle veya buraya tıkla",
        acceptedFiles: ".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF",
        autoProcessQueue: true,
        url: "/upload.ashx?gecicilanid=<%= geciciIlanId%>",
        init: function () {
            this.on("maxfilesexceeded", function (data) {
                var res = eval('(' + data.xhr.responseText + ')');
            });
            this.on("removedfile", function (file) {
                $.ajax({
                    type: "post",
                    url: "/upload.ashx?gecicilanid=<%= geciciIlanId%>&type=remove&file=" + file.name

                })
            });
            this.on("addedfile", function (file) {
                // Create the remove button
                var removeButton = Dropzone.createElement("<button class='btn btn-danger btn-block btn-sm'>Sil</button>");
                // Capture the Dropzone instance as closure.
                var _this = this;
                // Listen to the click event
                removeButton.addEventListener("click", function (e) {
                    // Make sure the button click doesn't submit the form:
                    e.preventDefault();
                    e.stopPropagation();
                    // Remove the file preview.
                    _this.removeFile(file);
                    // If you want to the delete the file on the server as well,
                    // you can do the AJAX request here.
                });
                // Add the button to the file preview element.
                file.previewElement.appendChild(removeButton);
            });
        }
    };

    $(function () {
        //Initialize Select2 Elements
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            //Initialize Select2 Elements
            $(".select2").select2();
        });
        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
        //Money Euro
        $("[data-mask]").inputmask();
    });

    jQuery('.price').focusout(function () {
        var prov = $(".province").val();
        var dist = $(".district").val();
        var neig = $(".neibor").val();
        var isl = $(".ada").val();
        var par = $(".parsel").val();
        var price = $(".price").val();

        if (prov != null & dist != null & neig != null & isl != "" & par != "" & price != "") {
            var crintext = $(".province").val() + "#" + $(".district").val() + "#" + $(".neibor").val() + "#" + $(".ada").val() + "#" + $(".parsel").val() + "#" + $(".price").val();
            var opt = 1;
            ctrlClasiified(crintext, opt);
        }
    });

    function ctrlClasiified(_intext, opt) {
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_operation.asmx/ctrlClassified",
            dataType: "json",
            data: "{ inadsdata:'" + _intext + "'" + ", opt:'" + opt + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data != null) {
                    var d = JSON.parse(data.d);


                    $.confirm({
                        icon: 'fa fa-spinner fa-spin',
                        title: 'Girilen ilan zaten yayında!',
                        content: 'Girilen ilan için yayınlama işlemi ' + d.baslangicTarihi.split('T')[0] + ' tarihli ilan kontrol edildikten sonra devam edilmelidir.<br/><br/>' + '<a style="float:left" class="btn btn-warning btn-sm" target="_blank" href="/ilan/' + trConverter(d.baslik) + '-' + d.ilanId + '/detay">Göster</a>' +
                                   '<a style="float:left;margin-left: 5px;" class="btn btn-success btn-sm" target="_blank" href="/management/anaYonetim/ilanYonetimi/ilan.aspx?page=duzenle&ilan=' + d.ilanId + '">Düzenle</a><br/><br/><br/>',
                        //type: 'red',
                        typeAnimated: true,
                        buttons: {
                            close: {
                                text: 'Kapat',
                                btnClass: 'btn-success',
                            },
                        }
                    });
                }
            },
            error: function (e) {
                var s;
                s = e;
            }
        });
    }

    window.onload = function () {
        var editor = CKEDITOR.replace('<% = txtCKeditorAdi.ClientID %>');
        };

            function trConverter(text) {

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

            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });

                //Date picker
                $('.satis-tarihi-1').datepicker({
                    autoclose: true
                });
                //Date picker
                $('.satis-tarihi-2').datepicker({
                    autoclose: true
                });

                $('.double').keypress(function (event) {
                    if ((event.which != 44 || $(this).val().indexOf(',') != -1) && (event.which < 48 || event.which > 57)) {
                        event.preventDefault();
                    }
                });

                function colorGive(store) {
                    var rtcolor = "";
                    if (store == "0")
                        rtcolor = "#FF0000";
                    else if (store == "1")
                        rtcolor = "#7F00FF";
                    else if (store == "2")
                        rtcolor = "#FF8000";
                    else if (store == "3")
                        rtcolor = "#FF00FF";
                    else if (store == "4")
                        rtcolor = "#00FF00";
                    else if (store == "5")
                        rtcolor = "#FFFF00";
                    else if (store == "6")
                        rtcolor = "#0080FF";
                    else if (store == "7")
                        rtcolor = "#0000FF";
                    else if (store == "8")
                        rtcolor = "#00FF80";
                    else if (store == "9")
                        rtcolor = "#FF007F";
                    else if (store == "10")
                        rtcolor = "#00FFFF";
                    else
                        rtcolor = "#FF0000";

                    return rtcolor;
                }

                function ctrlStore(instoreid) {
                    var mycolor = "";
                    jQuery.ajax({
                        type: "POST",
                        url: "/services/ki_operation.asmx/getStoreType",
                        dataType: "json",
                        data: "{instoreid:'" + instoreid + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            edata = data.d;
                            mycolor = edata;
                            color = colorGive(mycolor);


                        },
                        error: function (e) {
                            var s;
                            s = e;
                            pageIsRefresh = true;
                        }
                    });
                }


                var map;
                ctrlStore($(".kimden").val());
                var color = '';

                function initMap(_incoor) {

                    var _coors = [];

                    map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 6,
                        center: { lat: 39, lng: 36 },
                        mapTypeId: google.maps.MapTypeId.HYBRID
                    });

                    ctrlStore($(".kimden").val());

                    var obj = JSON.parse(_incoor);


                    if (obj["features"] != null) {
                        for (var j = 0; j < obj["features"][0]["geometry"]["coordinates"][0].length; j++) {
                            _coors.push({ lat: obj["features"][0]["geometry"]["coordinates"][0][j][1], lng: obj["features"][0]["geometry"]["coordinates"][0][j][0] });
                        }
                    }
                    else {
                        for (var j = 0; j < obj["geometry"]["coordinates"][0][0].length; j++) {
                            _coors.push({ lat: obj["geometry"]["coordinates"][0][0][j][1], lng: obj["geometry"]["coordinates"][0][0][j][0] });
                        }

                    }

                    poly = new google.maps.Polygon({
                        paths: _coors,
                        strokeColor: color,
                        strokeOpacity: 0.8,
                        strokeWeight: 3,
                        fillColor: color,
                        fillOpacity: 0.35
                    });

                    poly.setMap(map);

                    var markerPosition = { lat: _coors[0]["lat"], lng: _coors[0]["lng"] }
                    var marker = new google.maps.Marker({
                        position: markerPosition,
                        map: map,
                        title: $(".kimden").text()
                    });

                    map.setZoom(17);
                    map.setCenter({ lat: _coors[0]["lat"], lng: _coors[0]["lng"] });
                }

                jQuery('.koordinat').focusout(function () {
                    if ($(this).val() != "") {
                        initMap($(this).val());
                    }
                });

                jQuery('.m2').on('input propertychange paste', function () {
                    if ($(this).val() != "") {
                        if ($(".price").val() != "") {
                            $(".m2-fiyati").val(((parseFloat($(".price").val().replace(",", ".")) /
                                                                                        parseFloat($(".m2").val().replace(",", "."))).toFixed(2)).replace(".", ","));
                        }
                    }
                    else {
                        $(".m2-fiyati").val("");
                    }
                });

                jQuery('.price').on('input propertychange paste', function () {
                    if ($(this).val() != "") {
                        if ($(".m2").val() != "") {
                            $(".m2-fiyati").val(((parseFloat($(".price").val().replace(",", ".")) /
                                                                                        parseFloat($(".m2").val().replace(",", "."))).toFixed(2)).replace(".", ","));
                        }
                    }
                    else {
                        $(".m2-fiyati").val("");
                    }
                });

                jQuery('.hisse-alani').on('input propertychange paste', function () {
                    if ($(this).val() != "") {
                        if ($(".hisse-alani").val() != "") {

                            $(".m2-fiyati").val(((parseFloat($(".price").val().replace(",", ".")) /
                                                                                        parseFloat($(".hisse-alani").val().replace(",", "."))).toFixed(2)).replace(".", ","));
                        }
                    }
                    else {
                        $(".m2-fiyati").val(((parseFloat($(".price").val().replace(",", ".")) /
                                                                                    parseFloat($(".m2").val().replace(",", "."))).toFixed(2)).replace(".", ","));
                    }
                });
            });
</script>


