<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ekle.ascx.cs" Inherits="PL.management.anaYonetim.reklamYonetimi.ekle" %>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/select2/select2.min.css")%>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/datepicker/datepicker3.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/daterangepicker-bs3.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/skins/_all-skins.min.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/basic.min.css") %>' />
<style>
    .image-preview-input {
        position: relative;
        overflow: hidden;
        margin: 0px;
        color: #333;
        background-color: #fff;
        border-color: #ccc;
    }

        .image-preview-input input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
        }

    .image-preview-input-title {
        margin-left: 2px;
    }
</style>
<!-- AdminLTE Skins. Choose a skin from the css/skins
    folder instead of downloading all of them to reduce the load. -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Yeni Reklam
            <small>bu alandan reklam ekleyebilirsin.</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
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
                                <a href="~/management/araclar/araclar.aspx?page=gelenkutusu"><i class="fa fa-inbox"></i>Gelen Kutusu </a></li>
                            <li>
                                <a href="~/management/araclar/araclar.aspx?page=gonderilen-kutusu"><i class="fa fa-envelope-o"></i>Gönderilen Kutusu</a></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->

            </div>
            <!-- left column -->
            <div class="col-md-9">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Reklam Bilgileri</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body" id="box_body" runat="server">
                            <div>
                                <div class="form-group">
                                    <label for="adminmail">Reklam Verenin E-postası</label>
                                    <input type="text" class="form-control" name="adminmail" id="adminmail">
                                </div>
                                <div class="form-group">
                                    <label for="adminname">Reklam Veren Ad Soyad</label>
                                    <input type="text" class="form-control" name="adminname" id="adminname" disabled>
                                </div>
                                <%--        <div class="form-group">
                                    <label>Reklamı Veren</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpKullanici" runat="server"></asp:DropDownList>
                                </div>--%>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label for="adsname">Reklam Başlığı</label>
                                    <input type="text" class="form-control" name="adsname" id="adsname">
                                </div>
                                <%--                  <div class="form-group">
                                    <label for="txtReklamAd">Reklam Adı</label>
                                    <asp:TextBox ID="txtReklamAd" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>--%>
                                <%--                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label>Reklam Türü</label>
                                            <asp:DropDownList ID="drpReklamTur" CssClass="form-control select2 reklamTur" Style="width: 100%;" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpReklamTur_SelectedIndexChanged">
                                                <asp:ListItem Selected>Seçiniz</asp:ListItem>
                                                <asp:ListItem Value="1">Site İçi</asp:ListItem>
                                                <asp:ListItem Value="2">Harita Çevresi</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label>Reklam Konumu</label>
                                            <asp:DropDownList ID="drpKonum" CssClass="form-control select2 reklamKonum" Style="width: 100%;" runat="server" AutoPostBack="True">
                                                <asp:ListItem Selected Value="null">Seçiniz</asp:ListItem>
                                                <asp:ListItem Value="1">Anasayfa - 728 * 90</asp:ListItem>
                                                <asp:ListItem Value="2">Anasayfa - sağ üst - 230 * 230</asp:ListItem>
                                                <asp:ListItem Value="3">Anasayfa - sağ alt - 230 * 230</asp:ListItem>
                                                <asp:ListItem Value="4">Liste - 728 * 90</asp:ListItem>
                                                <asp:ListItem Value="4">Detay - 230 * 230</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label>Reklam İli</label>
                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True"></asp:DropDownList>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>--%>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Reklam İli</label>
                                    <select class="form-control select2 slctprovi" name="slctprovi" style="width: 100%;" id="slctprovi"></select>
                                </div>
                                <div class="form-group">
                                    <label>Tarih Aralığı</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="reservation" name="reservation" />
                                    </div>
                                    <!-- /.input group -->
                                </div>


                                <%--                                <div class="form-group">
                                    <label>Tarih Aralığı:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <asp:TextBox ID="txtTarih" CssClass="tarih form-control pull-right" runat="server"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>--%>
                                <!-- /.form group -->
                                <%--                                <div class="form-group">
                                    <label>Reklam Resmi</label>
                                    <div class="input-group image-preview">
                                        <input type="text" class="form-control image-preview-filename" disabled="disabled">
                                        <!-- don't give a name === doesn't send on POST/GET -->
                                        <span class="input-group-btn">
                                            <!-- image-preview-clear button -->
                                            <button type="button" class="btn btn-default image-preview-clear" style="display: none;">
                                                <span class="glyphicon glyphicon-remove"></span>Sil
                                            </button>
                                            <!-- image-preview-input -->
                                            <div class="btn btn-default image-preview-input">
                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                <span class="image-preview-input-title">Resim Yükle</span>
                                                <asp:FileUpload ID="FileUpload1" CssClass="resimSec" accept="image/png, image/jpeg, image/gif" runat="server" />
                                                <!-- rename it -->
                                            </div>
                                        </span>
                                    </div>
                                </div>--%>
                                <!-- /input-group image-preview [TO HERE]-->
                                <div class="form-group">
                                    <label for="adslink">Reklamın Linki</label>
                                    <input type="text" class="form-control" name="adslink" id="adslink">
                                </div>
                                <%-- <div class="form-group">
                                    <label for="txtReklamLink">Reklam Linki(URL)</label>
                                    <asp:TextBox ID="txtReklamLink" runat="server" class="form-control" placeholder="www.kralilan.com/"></asp:TextBox>
                                </div>--%>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
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
                                <%--                       <div class="form-group">
                                    <div id='uploadImage'>
                                        <asp:FileUpload ID="FileUpload1" CssClass="fUp" runat="server" AllowMultiple="true" onChange="preview(this)" maxRequestLength="2048" />
                                        <a class="dSec" onclick="triggerFileUpload()"><span class="fa fa-camera" style="font-size: 45px;"></span>Resim Seç</a>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div id="previews">
                                    </div>
                                </div>--%>
                                <div class="dropzone" id="dropzoneForm" style="border-radius: 15px; background: url('../../../libraries/images/bg_1.png') repeat left top;">
                                    <div class="fallback">
                                        <input name="file" type="file" multiple="multiple" />
                                    </div>
                                </div>
                                <input runat="server" name="txtgecici" id="txtgecici" visible="False" />

                                <br />
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <div class="box-footer">
                            <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
                            <asp:Button ID="Vazgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgec_Click" />
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <!--/.col (left) -->
            <!-- right column -->
            <!--/.col (right) -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div>
<script src='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/moment.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/daterangepicker.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/select2/select2.full.min.js")%>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.js") %>'></script>
<script>

    $(document).ready(function () {
        GetLocation(-1, -1, 1);
    });

    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });

        $('#reservation').daterangepicker();

        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });
    });
</script>
<script type="text/javascript">
    //File Upload response from the server
    Dropzone.options.dropzoneForm = {
        maxFiles: 1,
        dictDefaultMessage: "Reklam resmini sürükle veya buraya tıkla",
        acceptedFiles: ".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF",
        autoProcessQueue: true,
        url: "/general-upload.ashx?tempnumber=<%= tempnumber %>"+"&filetype=ads",
        init: function () {
            this.on("maxfilesexceeded", function (data) {
                var res = eval('(' + data.xhr.responseText + ')');
            });
            this.on("removedfile", function (file) {
                $.ajax({
                    type: "post",
                    url: "/upload.ashx?tempnumber=<%= tempnumber %>&type=remove&file=" + file.name

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
</script>

<script>




    //$(document).on('click', '#close-preview', function () {
    //    $('.image-preview').popover('hide');
    //    // Hover befor close the preview
    //    $('.image-preview').hover(
    //        function () {
    //            $('.image-preview').popover('show');
    //        },
    //            function () {
    //                $('.image-preview').popover('hide');
    //            }
    //    );
    //});

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
                    $(".slctprovi").append("<option value='-1' selected='selected'>Seçiniz</option>");
                    for (var i = 0; i < d.length; i++) {
                        var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                        $(".slctprovi").append(appnd);

                    }
                }
            },
            error: function (e) {

            }

        });
    }

    jQuery('#adminmail').focusout(function () {
        var mail = $("#adminmail").val();

        if (mail != "") {
            ctrlUser(mail);
        }
    });

    function ctrlUser(_inmail) {
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_api.asmx/giveMeUserInfo",
            dataType: "json",
            data: "{ mail:'" + _inmail + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data != null) {
                    var d = JSON.parse(data.d);
                    $("#adminname").val(d.kullaniciAdSoyad);
                }
            },
            error: function (e) {
                var s;
                s = e;
            }
        });
    }
</script>
<!-- Page script -->
