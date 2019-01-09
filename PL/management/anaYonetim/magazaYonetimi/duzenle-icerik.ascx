<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="duzenle-icerik.ascx.cs" Inherits="PL.management.anaYonetim.magazaYonetimi.duzenle_icerik" %>

<link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>
<style>
    .pricing-table .plan {
        margin-left: 0px;
        border-radius: 5px;
        text-align: center;
        background-color: #f3f3f3;
        -moz-box-shadow: 0 0 6px 2px #b0b2ab;
        -webkit-box-shadow: 0 0 6px 2px #b0b2ab;
        box-shadow: 0 0 6px 2px #b0b2ab;
    }

    .plan:hover {
        background-color: #fff;
        -moz-box-shadow: 0 0 12px 3px #b0b2ab;
        -webkit-box-shadow: 0 0 12px 3px #b0b2ab;
        box-shadow: 0 0 12px 3px #b0b2ab;
    }

    .plan {
        padding: 20px;
        margin-left: 0px;
        color: #ff;
        background-color: #5e5f59;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .plan-name-bronze {
        padding: 20px;
        color: #fff;
        background-color: #665D1E;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .plan-name-silver {
        padding: 20px;
        color: #fff;
        background-color: #C0C0C0;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .plan-name-gold {
        padding: 20px;
        color: #fff;
        background-color: #FFD700;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .pricing-table-bronze {
        padding: 20px;
        color: #fff;
        background-color: #f89406;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .pricing-table .plan .plan-name span {
        font-size: 20px;
    }

    .pricing-table .plan ul {
        list-style: none;
        margin: 0;
        -moz-border-radius: 0 0 5px 5px;
        -webkit-border-radius: 0 0 5px 5px;
        border-radius: 0 0 5px 5px;
    }

        .pricing-table .plan ul li.plan-feature {
            padding: 15px 10px;
            border-top: 1px solid #c5c8c0;
            margin-right: 35px;
        }

    .pricing-three-column {
        margin: 0 auto;
        width: 80%;
    }

    .pricing-variable-height .plan {
        float: none;
        margin-left: 2%;
        vertical-align: bottom;
        display: inline-block;
        zoom: 1;
        *display: inline;
    }

    .plan-mouseover .plan-name {
        background-color: #4e9a06 !important;
    }

    .btn-plan-select {
        padding: 8px 25px;
        font-size: 18px;
    }
</style>
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
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mağaza Düzenle          
            <small>bu alandan mağaza düzenleyebilirsiniz.</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="main-container">
                <div class="container">
                    <div class="row form-group">
                        <div class="col-xs-12">
                            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                <li class="disabled"><a href="#step-1">
                                    <h4 class="list-group-item-heading"><i class="fa fa-archive fa-2x"></i></h4>
                                    <p class="list-group-item-text">Mağaza Seçimi</p>
                                </a></li>
                                <li class="disabled"><a href="#step-2">
                                    <h4 class="list-group-item-heading"><i class="fa fa-ticket fa-2x"></i></h4>
                                    <p class="list-group-item-text">Mağaza Tipi</p>
                                </a></li>
                                <li class="active"><a href="#step-3">
                                    <h4 class="list-group-item-heading"><i class="fa fa-object-group fa-2x"></i></h4>
                                    <p class="list-group-item-text">Düzenle</p>
                                </a></li>
                                <li class="disabled"><a href="#step-4">
                                    <h4 class="list-group-item-heading"><i class="fa fa-credit-card fa-2x"></i></h4>
                                    <p class="list-group-item-text">Ödeme</p>
                                </a></li>
                                <%--                                <li class="disabled"><a href="#step-5">
                                    <h4 class="list-group-item-heading"><i class="fa fa-check fa-2x"></i></h4>
                                    <p class="list-group-item-text">Tamamlandı</p>
                                </a></li>--%>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <div class="row setup-content" id="step-1">
                        </div>
                    </div>
                    <div class="row setup-content" id="step-2">
                        <div class="col-xs-12">
                        </div>
                    </div>
                    <div class="row setup-content" id="step-3">
                        <div class="col-xs-12">
                            <!-- general form elements -->
                            <div class="box box-default">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Mağaza İçeriği</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <asp:ScriptManager runat="server" />

                                <div role="form">
                                    <div class="box-body" id="box_body" runat="server">
                                        <div>
                                            <div class="form-group">
                                                <label for="txtMagazaAdi">Mağaza Adı</label>
                                                <input type="text" class="form-control" id="txtMagazaAdi" runat="server">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Hesap Tipi</label>
                                                <div class="col-md-9">
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <asp:RadioButtonList ID="rdKurumsal" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdKurumsal_SelectedIndexChanged" AutoPostBack="true" Height="29px" Width="267px">
                                                                <asp:ListItem Value="False"> Bireysel</asp:ListItem>
                                                                <asp:ListItem Value="True"> Kurumsal</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>İş Telefonu</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server" id="txtIsTlf">
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <div class="form-group">
                                                <label>İş Telefonu 2</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server" id="txtIsTlf2">
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <!-- /input-group image-preview [TO HERE]-->
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <div class="form-group">
                                                        <label>İl</label>
                                                        <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>İlçe</label>
                                                        <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIlce_SelectedIndexChanged"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Mahalle</label>
                                                        <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpMahalle" runat="server"></asp:DropDownList>
                                                    </div>
                                                    <!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label id="lblTc" runat="server">TC Kimlik No / Vergi No</label>
                                                        <input type="text" class="form-control" id="txtTcNo" runat="server">
                                                    </div>
                                                    <!-- /.form-group -->
                                                    <div class="form-group" id="vergiPnl" runat="server">
                                                        <label>Vergi Dairesi</label>
                                                        <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpVergi" runat="server"></asp:DropDownList>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <div class="form-group">
                                                <label for="txtAciklama">Mağaza Hakkında</label>
                                                <asp:TextBox ID="txtAciklama" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <!-- /.form group -->
                                            <div class="form-group">
                                                <label>Logo Seçimi</label>
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
                                            </div>
                                            <div class="form-group">
                                                <label>Mağaza Türü</label>
                                                <asp:DropDownList ID="drpTur" CssClass="form-control select2" Style="width: 100%;" runat="server">
                                                    <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                    <asp:ListItem Value="8">Emlak Ofisi</asp:ListItem>
                                                    <asp:ListItem Value="9">İnşaat Firması</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3" style="border: dashed; border-radius: 25px; border-color: #1bc0a3">
                                                <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                                    <br />
                                                    <div class="form-group" id="rddaterange">
                                                        <label>
                                                            <input value="0" type="radio" name="ctrlselect" class="ctrlselect" />
                                                            Onay bekleme durumuna getir                                   
                                                        </label>
                                                        <br />
                                                        <label>
                                                            <input value="1" type="radio" name="ctrlselect" class="ctrlselect" />
                                                            Mağaza bilgilerini onayla
                                                        </label>
                                                        <br />
                                                        <label>
                                                            <input value="2" type="radio" name="ctrlselect" class="ctrlselect" />
                                                            Silindi olarak işaretle
                                                        </label>
                                                        <br />
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /input-group image-preview [TO HERE]-->
                                        </div>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                            </div>
                            <!-- /.box -->
                            <div class="col-xs-1 col-xs-offset-11">
                                <asp:Button ID="devam" runat="server" CssClass="btn btn-success" Text="Durumunu Güncelle" OnClick="devam_Click" Style="float: right; margin-top: 15px;" />
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-4">
                        <div class="col-xs-12">
                        </div>
                    </div>
                    <div class="row setup-content" id="step-5">
                        <div class="col-xs-12">
                        </div>
                    </div>
                    <div class="row setup-content" id="step-6">
                        <div class="col-xs-12">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div>
<script src="../../plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
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
            title: "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
            content: "There's no image",
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
</script>

<script>
    $(function () {
        //Initialize Select2 Elements
        //Initialize Select2 Elements
        $(".select2").select2();


        //Date range picker
        $('.tarih').daterangepicker();

        //Datemask dd/mm/yyyy
        //Money Euro
        $("[data-mask]").inputmask();

    });
</script>
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>

<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
