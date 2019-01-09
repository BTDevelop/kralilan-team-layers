<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="magaza-profil.ascx.cs" Inherits="PL.profil.magaza_profil" %>

<%--<link rel="stylesheet" href="../management/plugins/datepicker/datepicker3.css" />
<link rel="stylesheet" href="../management/plugins/select2/select2.min.css" />
<link rel="stylesheet" href="../management/dist/css/AdminLTE.min.css" />--%>
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

    .checkbox label {
        padding-left: 0.5em !important;
    }

    .form-control {
        border-radius: 6px;
    }

        .form-control:focus {
            border-color: #16A085;
            border: 1px solid #16A085;
        }

    .btn-success {
        background-color: #16A085;
        color: #FFFFFF;
        width: 110px;
        font-weight: bold;
    }

    .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
        border-radius: 6px;
    }

    .select2-container--default .select2-results__option--highlighted[aria-selected] {
        background-color: #16A085;
        color: white;
    }

    .box.box-solid.box-primary > .box-header {
        color: #fff;
        background: #d9534f;
        background-color: #d9534f;
    }

    box.box-solid.box-primary {
        border: 1px solid #d9534f;
    }
</style>
<div class="col-sm-9 page-content">

    <div class="inner-box">
        <div id="accordion" class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="#collapseB1" data-toggle="collapse">Mağaza Bilgilerim </a></h4>
                </div>
                <div class="panel-collapse collapse in" id="collapseB1">
                    <div class="panel-body">
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Mağazamın Adı</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="storename" value="<%= storename %>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Mağazamın Açıklaması</label>
                                <div class="col-sm-9">
                                   <textarea class="form-control" id="textarea" name="storeexp" required="required" name="storetextarea"><%= storeexp %></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Mağazamın Tipi</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= storetype %>" disabled="disabled">
                                </div>
                            </div>
                            <!-- /.form group -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">İş Telefonu 1</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="no1" data-inputmask='"mask": "(999) 999-9999"' data-mask value="<%= phone1 %>">
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">İş Telefonu 2</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="no2" data-inputmask='"mask": "(999) 999-9999"' data-mask value="<%= phone2 %>">
                                </div>
                                <!-- /.input group -->
                            </div>
                         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">İl</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList CssClass="form-control" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">İlçe</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList CssClass="form-control" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpIlce_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Mahalle</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList CssClass="form-control" Style="width: 100%;" ID="drpMahalle" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="form-group">
                                <label id="lblTc" class="col-sm-3 control-label" runat="server">TC Kimlik No / Vergi No</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= identitynum %>" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group" id="vergiPnl" runat="server">
                                <label class="col-sm-3 control-label">Vergi Dairesi</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= taxadmin %>" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Mağazamın Logosu</label>
                                <div class="col-sm-9">
                                    <div class="input-group image-preview">
                                        <input type="text" class="form-control image-preview-filename" disabled="disabled">
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
                                                <asp:FileUpload ID="fuprofile" CssClass="resimSec" accept="image/png, image/jpeg" runat="server" />
                                                <!-- rename it -->
                                            </span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="col-md-3 control-label"></label>

                                <div class="col-md-8">                                       
                                    <button type="submit" class="btn btn-success-ki btn-lg" runat="server" onserverclick="btnKaydet_Click">Güncelle</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="accordion1" class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="#collapseB3" data-toggle="collapse">Mağaza Paket Bilgilerim </a></h4>
                </div>
                <div class="panel-collapse collapse in" id="collapseB3">
                    <div class="panel-body">
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Kategorisi</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= storecat %>" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Paket Tipi</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= storepac %>" disabled="disabled">
                                </div>
                            </div>
                           <div class="form-group">
                                <label class="col-sm-3 control-label">Paket Süresi</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= storepactime %>" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Paket Başlangıç Tarihi</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= strdate %>" disabled="disabled">
                                </div>
                            </div>
                           <%--  <div class="form-group">
                                <label class="col-sm-3 control-label">Paket Bitiş Tarihi</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="<%= enddate %>" disabled="disabled">
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </div>      
    </div>
<script src="/management/plugins/input-mask/jquery.inputmask.js"></script>
<script src="/management/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script>
    $(function () {
        $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
        //Money Euro
        $("[data-mask]").inputmask();
    });
</script>
<script>
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
                title: "<strong>Önizleme</strong>" + $(closebtn)[0].outerHTML,
                content: "Dosya seçilmedi",
                placement: 'bottom'
            });
            // Clear event
            $('.image-preview-clear').click(function () {
                $('.image-preview').attr("data-content", "").popover('hide');
                $('.image-preview-filename').val("");
                $('.image-preview-clear').hide();
                $('.image-preview-input input:file').val("");
                $(".image-preview-input-title").text("Resim Yükle");
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
