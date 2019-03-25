<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="duzenle.ascx.cs" Inherits="PL.management.anaYonetim.ilanYonetimi.ilan_duzenle" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/basic.min.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS1wH5TdTQ8gbD5zB6Ghi2hN4BpkkbJ5M&callback=initMap" async="async" defer="defer"></script>
<style>
    #map {
        height: 428px;
        width: 100%;
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
<script type="text/javascript">
    function showmodalpopup() {
        //$("#popupdiv").dialog({

        //});

        $.dialog({
            title: 'Merhaba Editör',
            content: 'Kullanıcıyla iletişim kısa sürede sağlanacaktır.',
            theme: 'supervan'
        });
    };

    function showmodalpopup1() {
        //$("#popupdiv").dialog({

        //});

        $.dialog({
            title: 'Merhaba Editör',
            content: 'İletişim bilgileri alınmadı, daha sonra tekrar deneyiniz.',
            theme: 'supervan'
        });
    };
</script>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>İlan Düzenle
            <small>bu alandan ilanları düzenleyebilirsin.</small>
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
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">İlan Sahibi İletişim</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <asp:Repeater ID="sahipRepeater" runat="server">
                                <ItemTemplate>
                                    <li><a href="#"><i class="fa fa-phone text-success"></i><%# Eval("telefon") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <div class="col-md-9">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Mağaza Bilgileri</h3>
                    </div>
                    <div class="box-body" runat="server" id="box_body">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Kimden Seçiniz</label>
                                <div class="clearfix"></div>
                                <asp:DropDownList ID="drpKimden" runat="server" CssClass="select2 kimden" Style="width: 100%;" AutoPostBack="True" OnSelectedIndexChanged="drpKimden_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
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
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label>İl</label>
                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>İlçe</label>
                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpIlce_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Mahalle</label>
                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpMahalle" runat="server"></asp:DropDownList>
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
            <div class="col-md-9 col-xs-12 pull-right" id="showcaseplace" runat="server">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Vitrin Bilgileri</h3>
                    </div>
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-12" style="background: url('../../../libraries/images/bg_1.png') repeat left top;">
                                <ul class="todo-list">

                                    <asp:Repeater ID="rpshowcase" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <span class="handle">
                                                    <i class="fa fa-ellipsis-v"></i>
                                                    <i class="fa fa-ellipsis-v"></i>
                                                </span>
                                                <!-- checkbox -->
                                                <!-- todo text -->
                                                <span class="text"><%# Eval("DopingAdi") %> <%# Eval("DopingSure") %> </span>
                                                <!-- Emphasis label -->
                                                <small class="label label-success"><i class="fa fa-clock-o"></i><%# Eval("BaslangicTarihi") %></small>
                                                <small class="label label-primary"><i class="fa fa-clock-o"></i><%# Eval("BitisTarihi") %></small>
                                                <small class="label label-danger"><i class="fa fa-check"></i><%# Eval("DopingDurum") %></small>

                                                <!-- General tools such as edit or delete-->
                                                <div class="tools">
                                                    <i class="fa fa-edit"></i>
                                                    <i class="fa fa-trash-o"></i>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <div class="col-md-9 col-xs-12 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Resim Ekle</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-12">
                                <div class="dropzone" id="dropzoneForm" style="border-radius: 15px; background: url('../../../libraries/images/bg_1.png') repeat left top;">
                                    <div class="fallback">
                                        <input name="file" type="file" multiple="multiple" />
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <div class="col-md-9 col-xs-12 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Hızlı Seçim ve Mail</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div class="callout callout-info" style="background-color: #1bc0a3 !important; border-color: #1bc0a3;">
                                <h4>Uyarı!</h4>
                                <p><%= status %></p>
                            </div>
                            <div class="col-md-3" style="border: dashed; border-radius: 25px; border-color: #1bc0a3">
                                <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                    <br />
                                    <div class="form-group" id="rddaterange">
                                        <label>
                                            <input value="1" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Yayın için Onayla</label><br />
                                        <label>
                                            <input value="2" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Onaylama
                                        </label>
                                        <br />
                                        <label>
                                            <input value="3" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Pasife Al</label><br />
                                        <label>
                                            <input value="4" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Onay Bekleme Durumuna Getir
                                        </label>
                                        <br />
                                        <label>
                                            <input value="5" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Silindi Olarak İşaretle</label><br />
                                        <label>
											<input value="6" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Satıldı Olarak İşaretle</label><br />
                                        <label>
                                            <input value="-1" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Seçim Yok</label><br />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="form-group">
                                    <input type="email" class="form-control" name="emailto" placeholder="Eposta Adresi:" value="<%= mailaddress %>">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="subject" placeholder="Konu">
                                </div>
                                <div>
                                    <textarea class="textarea" name="message" placeholder="Mesaj" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                </div>
                                <div>
                                    <button class="pull-right btn btn-default" id="sendEmail" runat="server" onserverclick="sendEmail_ServerClick">Gönder <i class="fa fa-arrow-circle-right"></i></button>
                                </div>
                            </div>
                            <div class="col-md-8" style="background: url('../../../libraries/images/bg_1.png') repeat left top;">
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>

            <!-- left column -->
            <div class="col-md-9 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">İlan Detayları</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label for="txtBaslik">Başlık</label>
                                    <asp:TextBox ID="txtBaslik" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label for="txtFiyat">Fiyat</label>
                                    <asp:TextBox ID="txtFiyat" CssClass="form-control double" runat="server"></asp:TextBox>
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

    <!-- /.content -->
    <div class="col-md-9 col-md-offset-3" style="float: none; padding-bottom: 30px">
        <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
        <asp:Button ID="Vezgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgeç_Click" />
    </div>
</div>
<script src="../../plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.js") %>'></script>
<script src="//cdn.ckeditor.com/4.11.1/full/ckeditor.js"></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/datepicker/bootstrap-datepicker.js") %>'></script>
<script type="text/javascript">
    //File Upload response from the server
    var myDropzone = null;
    Dropzone.options.dropzoneForm = {
        maxFiles: 20,
        dictDefaultMessage: "Resimleri sürükle veya buraya tıkla",
        acceptedFiles: ".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF",
        autoProcessQueue: true,
        url: "/upload.ashx?ilanid=<%= ilanId %>",
        init: function () {
            myDropzone = this;
            getPics(<%= ilanId %>);
            this.on("maxfilesexceeded", function (data) {
                var res = eval('(' + data.xhr.responseText + ')');
            });

            this.on("removedfile", function (file) {
                $.ajax({
                    type: "post",
                    url: "/upload.ashx?ilanid=<%= ilanId %>&type=remove&file=" + file.name

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

    function getPics(adsid) {
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_operation.asmx/getAdsPic",
            dataType: "json",
            data: "{ adsid:'" + adsid + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var d = JSON.parse(data.d);

                for (var i = 0; i < d.length; i++) {
                    var mockFile = {
                        name: d[i].resim,
                        size: 0,
                        type: 'image/jpeg',
                        status: Dropzone.ADDED,
                        url: '/upload/ilan/' + d[i].resim
                    };

                    // Call the default addedfile event handler
                    myDropzone.emit("addedfile", mockFile);

                    // And optionally show the thumbnail of the file:
                    myDropzone.emit("thumbnail", mockFile, mockFile.url);

                    myDropzone.files.push(mockFile);
                }
            },
            error: function (e) {
            }
        });
    }

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

    window.onload = function () {
        var editor = CKEDITOR.replace('<% = txtCKeditorAdi.ClientID %>');
    };

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
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

            var color = '';

            ctrlStore($(".kimden").val());

            var map;
            function initMap(koordinat) {
                var koordinatlar = [];

                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 6,
                    center: { lat: 39, lng: 36 },
                    mapTypeId: google.maps.MapTypeId.HYBRID
                });

                ctrlStore($(".kimden").val());

                var obj = JSON.parse(koordinat);

                if (obj["features"] != null) {
                    for (var j = 0; j < obj["features"][0]["geometry"]["coordinates"][0].length; j++) {
                        koordinatlar.push({ lat: obj["features"][0]["geometry"]["coordinates"][0][j][1], lng: obj["features"][0]["geometry"]["coordinates"][0][j][0] });
                    }
                }
                else if (obj["coordinates"] != null) {
                    for (var j = 0; j < obj["coordinates"][0][0].length; j++) {
                        koordinatlar.push({ lat: obj["coordinates"][0][0][j][1], lng: obj["coordinates"][0][0][j][0] });
                    }

                }
                else if (obj["geometry"]["coordinates"] != null) {
                    for (var j = 0; j < obj["geometry"]["coordinates"][0][0].length; j++) {
                        koordinatlar.push({ lat: obj["geometry"]["coordinates"][0][0][j][1], lng: obj["geometry"]["coordinates"][0][0][j][0] });
                    }
                }

                sekil = new google.maps.Polygon({
                    paths: koordinatlar,
                    strokeColor: color,
                    strokeOpacity: 0.8,
                    strokeWeight: 3,
                    fillColor: color,
                    fillOpacity: 0.35
                });
                sekil.setMap(map);

                var markerPosition = { lat: koordinatlar[0]["lat"], lng: koordinatlar[0]["lng"] }
                var marker = new google.maps.Marker({
                    position: markerPosition,
                    map: map,
                    title: "ilan"
                });

                map.setZoom(17);
                map.setCenter({ lat: koordinatlar[0]["lat"], lng: koordinatlar[0]["lng"] });
            }

            jQuery('.koordinat').focusout(function () {
                initMap($(this).val());
            });


            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });
            });

            //Date picker
            $('.satis-tarihi-1').datepicker({
                autoclose: true
            });
            //Date picker
            $('.satis-tarihi-2').datepicker({
                autoclose: true
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
