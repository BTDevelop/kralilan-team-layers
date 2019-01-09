<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="firma-duzenle.ascx.cs" Inherits="PL.management.anaYonetim.projeYonetimi.firma_duzenle" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>'>
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
        <h1>Firma Düzenle
            <small>bu alandan firma düzenleyebilirsin.</small>
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
                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gelenkutusu" runat="server"><i class="fa fa-inbox"></i>Gelen Kutusu </asp:HyperLink></li>
                            <li>
                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gonderilen-kutusu" runat="server"><i class="fa fa-envelope-o"></i>Gönderilen Kutusu</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->
            </div>                        
            <div class="col-md-9 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Firma Hakkıında</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <fieldset>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="comname">Firma Adı</label>
                                            <asp:TextBox ID="comname" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="compost">E-Posta</label>
                                            <asp:TextBox ID="compost" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Telefon</label>
                                            <div class="input-icon">
                                                <i class="icon-phone fa"></i>
                                                <asp:TextBox ID="comphone" CssClass="form-control input-md" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Faks</label>
                                            <div class="input-icon">
                                                <i class="icon-phone fa"></i>
                                                <asp:TextBox ID="comfaks" CssClass="form-control input-md" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="comaddr">Adres</label>
                                            <asp:TextBox ID="comaddr" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="comweb">Website</label>
                                            <asp:TextBox ID="comweb" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="comaddr">Hakkında</label>
                                            <asp:TextBox ID="comabout" Height="100px" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Logo</label>
                                            <div class="input-group image-preview">
                                                <input type="text" class="form-control image-preview-filename" disabled="disabled" />
                                                <!-- don't give a name === doesn't send on POST/GET -->
                                                <span class="input-group-btn">
                                                    <!-- image-preview-clear button -->
                                                    <button type="button" class="btn btn-default image-preview-clear" style="display: none;">
                                                        <span class="glyphicon glyphicon-remove"></span>Sil
                                                    </button>
                                                    <!-- image-preview-input -->
                                                    <span class="btn btn-default image-preview-input">
                                                        <span class="glyphicon glyphicon-folder-open"></span>
                                                        <span class="image-preview-input-title">Logo Yükle</span>
                                                        <asp:FileUpload ID="comlogo" CssClass="resimSec" accept="image/png, image/jpeg" runat="server" />
                                                        <!-- rename it -->
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-xs-12 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Hızlı Seçim</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-3" style="border: dashed; border-radius: 25px; border-color: #1bc0a3">
                                <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                    <br />
                                    <div class="form-group" id="rddaterange">
                                        <label>
                                            <input value="5" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Silindi Olarak İşaretle</label><br />
                                        <label>
                                            <input value="-1" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Seçim Yok</label><br />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8" style="background: url('../../../libraries/images/bg_1.png') repeat left top;">
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </div>
    </section>
    <div class="col-md-9 col-md-offset-3" style="float: none; padding-bottom: 30px">
        <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
        <asp:Button ID="Vezgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vezgec_Click" />
    </div>
</div>
<!-- /.content-wrapper -->
<script src="../../plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>--%>
<script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/datepicker/bootstrap-datepicker.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.js") %>'></script>
<script>
    $(function () {
        $("[data-mask]").inputmask();
    });

    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
        $(document).on('click', '#close-preview', function () {
            $('.image-preview').popover('hide');
            // Hover befor close the preview
            $('.image-preview').hover(
                function () {
                    $('.image-preview').popover('show');
                },
                 function () {
                     $('.image-preview').popover('hide');
                 }
            );
        });

        $(function () {
            // Create the close button
            var closebtn = $('<button/>', {
                type: "button",
                text: 'x',
                id: 'close-preview',
                style: 'font-size: initial;',
            });
            closebtn.attr("class", "close pull-right");
            // Set the popover default content
            $('.image-preview').popover({
                trigger: 'manual',
                html: true,
                title: "<strong>Plan Önizleme</strong>" + $(closebtn)[0].outerHTML,
                content: "Dosya seçilmedi",
                placement: 'bottom'
            });
            // Clear event
            $('.image-preview-clear').click(function () {
                $('.image-preview').attr("data-content", "").popover('hide');
                $('.image-preview-filename').val("");
                $('.image-preview-clear').hide();
                $('.image-preview-input input:file').val("");
                $(".image-preview-input-title").text("Logo Yükle");
            });
            // Create the preview image
            $(".image-preview-input input:file").change(function () {
                var img = $('<img/>', {
                    id: 'dynamic',
                    width: 250,
                    height: 200
                });
                var file = this.files[0];
                var reader = new FileReader();
                // Set preview image into the popover data-content
                reader.onload = function (e) {
                    $(".image-preview-input-title").text("Değiştir");
                    $(".image-preview-clear").show();
                    $(".image-preview-filename").val(file.name);
                    img.attr('src', e.target.result);
                    $(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
                }
                reader.readAsDataURL(file);
            });
        });
    });
</script>
<script type="text/javascript">
   
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

    $(function () {
        $(".datepicker").datepicker({
            format: "mm-yyyy",
            startView: "months",
            minViewMode: "months"
        });
    });


</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS1wH5TdTQ8gbD5zB6Ghi2hN4BpkkbJ5M&libraries=drawing&callback=initMap" async defer></script>
