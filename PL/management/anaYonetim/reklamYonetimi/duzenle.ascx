<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="duzenle.ascx.cs" Inherits="PL.management.anaYonetim.reklamYonetimi.duzenle" %>
<link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>
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
        <h1>Reklam Düzenle
            <small>buradan reklam düzenleyebilirsiniz.</small>
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

                <!-- /.box -->
            </div>
            <!-- left column -->
            <div class="col-md-9">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Reklam Bilgileri</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label>Reklamı Veren</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpKullanici" runat="server"></asp:DropDownList>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label for="txtReklamAd">Reklam Adı</label>
                                    <asp:TextBox ID="txtReklamAd" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                                </asp:UpdatePanel>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Tarih:</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <asp:TextBox ID="txtTarih" CssClass="tarih form-control pull-right" runat="server"></asp:TextBox>
                                    </div>
                                    <!-- /.input group -->
                                </div>

                                <div class="form-group">
                                    <label>Mevcut Reklam Resmi</label>
                                    <div class="clearfix"></div>
                                    <asp:Image ID="reklamResim" runat="server" />
                                </div>
                                <!-- /.form group -->
                                <div class="form-group" id="resimyukle" runat="server">
                                    <label>Yeni Reklam Resmi</label>
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
                                    <div class="checkbox icheck">
                                        <asp:CheckBox ID="chcYeniResim" type="checkbox" CssClass="resimGuncelle" Text="Reklam Resmini Güncelledim" runat="server" />
                                    </div>
                                </div>
                                <!-- /input-group image-preview [TO HERE]-->
                                <div class="form-group">
                                    <label for="txtReklamLink">Reklam Linki(URL)</label>
                                    <asp:TextBox ID="txtReklamLink" runat="server" class="form-control" placeholder="www.netteilanver.com/"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
                            <asp:Button ID="Vazgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgec_Click" />
                        </div>
                    </div>
                </div>
                <!-- /.box -->
            </div>
            <!--/.col (left) -->
            <!-- right column -->
            <!--/.col (right) -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
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
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>

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
            text: 'kapat',
            id: 'close-preview',
            style: 'font-size: initial;',
        });
        closebtn.attr("class", "close pull-right");
        // Set the popover default content
        $('.image-preview').popover({
            trigger: 'manual',
            html: true,
            title: "<strong>Önizleme</strong>" + $(closebtn)[0].outerHTML,
            content: "Önizleme için resim yok",
            placement: 'bottom'
        });
        // Clear event
        $('.image-preview-clear').click(function () {
            $('.image-preview').attr("data-content", "").popover('hide');
            $('.image-preview-filename').val("");
            $('.image-preview-clear').hide();
            $('.image-preview-input input:file').val("");
            $(".image-preview-input-title").text("Resim Yükle");
            $(".icheckbox_square-blue").removeClass("checked");
            $("#ContentPlaceHolder1_ctl00_chcYeniResim").removeAttr("checked");
        });

        $(".image-preview-input input:file").change(function () {
            $(".icheckbox_square-blue").addClass("checked");
            $("#ContentPlaceHolder1_ctl00_chcYeniResim").attr("checked","checked");
            var genislik, yukseklik;
            var kontrol = true;
            if ($("#select2-ContentPlaceHolder1_ctl00_drpReklamTur-container").html() == "Harita Çevresi") {
                genislik = 250;
                yukseklik = 150;
            }
            else if ($("#select2-ContentPlaceHolder1_ctl00_drpReklamTur-container").html() == "Site İçi") {
                if ($("#select2-ContentPlaceHolder1_ctl00_drpKonum-container").html() == "Anasayfa - 728 * 90") {
                    genislik = 728;
                    yukseklik = 90;
                }
                else if ($("#select2-ContentPlaceHolder1_ctl00_drpKonum-container").html() == "Anasayfa - sağ üst - 230 * 230") {
                    genislik = 230;
                    yukseklik = 230;
                }
                else if ($("#select2-ContentPlaceHolder1_ctl00_drpKonum-container").html() == "Anasayfa - sağ alt - 230 * 230") {
                    genislik = 230;
                    yukseklik = 230;
                }
                else if ($("#select2-ContentPlaceHolder1_ctl00_drpKonum-container").html() == "Liste - 728 * 90") {
                    genislik = 728;
                    yukseklik = 90;
                }
                else if ($("#select2-ContentPlaceHolder1_ctl00_drpKonum-container").html() == "Detay - 230 * 230") {
                    genislik = 230;
                    yukseklik = 230;
                }
                else {
                    kontrol = false;
                }
            }
            else {
                kontrol = false;
            }

            if (kontrol == true) {
                var img = $('<img/>', {
                    height: yukseklik,
                    width: genislik
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
            }
            else {
                alert("Lütfen Resim Tür veya Resim konum Seçiniz");
            }
        });
    });
</script>
<!-- Page script -->
<script>
    $(function () {
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    });

    $(function () {
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(".select2").select2();
        });

        //Date range picker
        $('.tarih').daterangepicker();

        //Datemask dd/mm/yyyy
        //Money Euro
        $("[data-mask]").inputmask();

    });
</script>
