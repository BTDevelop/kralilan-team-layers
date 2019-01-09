<%@ Page Title="İlanını Düzenle - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ilan-duzenle.aspx.cs" Inherits="PL.ilan_duzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/flat/red.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/boostrap-lte.min.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/basic.min.css") %>' />
    <style>
        .pricing-table .plan {
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

        .wizard {
        }

            .wizard .nav-tabs {
                position: relative;
                margin: 40px auto;
                margin-bottom: 0;
                border-bottom-color: #e0e0e0;
            }

            .wizard > div.wizard-inner {
                position: relative;
            }

        .connecting-line {
            height: 2px;
            background: #e0e0e0;
            position: absolute;
            width: 80%;
            margin: 0 auto;
            left: 0;
            right: 0;
            top: 50%;
            z-index: 1;
        }

        .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
            color: #555555;
            cursor: default;
            border: 0;
            border-bottom-color: transparent;
        }

        span.round-tab {
            width: 70px;
            height: 70px;
            line-height: 70px;
            display: inline-block;
            border-radius: 100px;
            background: #fff;
            border: 2px solid #e0e0e0;
            z-index: 2;
            position: absolute;
            left: 0;
            text-align: center;
            font-size: 25px;
        }

            span.round-tab i {
                color: #555555;
            }

        .wizard li.active span.round-tab {
            background: #fff;
            border: 2px solid #16A085;
        }

            .wizard li.active span.round-tab i {
                color: #16A085;
            }

        span.round-tab:hover {
            color: #333;
            border: 2px solid #333;
        }

        .wizard .nav-tabs > li {
            width: 20%;
        }

        .wizard li:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 0;
            margin: 0 auto;
            bottom: 0px;
            border: 5px solid transparent;
            border-bottom-color: #16A085;
            transition: 0.1s ease-in-out;
        }

        .wizard li.active:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 1;
            margin: 0 auto;
            bottom: 0px;
            border: 10px solid transparent;
            border-bottom-color: #16A085;
        }

        .wizard .nav-tabs > li a {
            width: 70px;
            height: 70px;
            margin: 20px auto;
            border-radius: 100%;
            padding: 0;
        }

            .wizard .nav-tabs > li a:hover {
                background: transparent;
            }

        .wizard .tab-pane {
            position: relative;
            padding-top: 50px;
        }

        .wizard h3 {
            margin-top: 0;
        }

        @media( max-width : 585px ) {

            .wizard {
                width: 90%;
                height: auto !important;
            }

            span.round-tab {
                font-size: 16px;
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard .nav-tabs > li a {
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard li.active:after {
                content: " ";
                position: absolute;
                left: 35%;
            }
        }

        .checkbox label {
            padding-left: 0.5em !important;
        }

        .form-control {
            border-radius: 6px;
        }

            .form-control:focus {
                border-color: #16A085;
                border: 2px solid #16A085;
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

        #uploadImage {
            float: none;
        }

        .box-title {
            border: none !important;
        }

        .box-header h3 {
            padding-bottom: 0 !important;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <section>
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="disabled">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Sen Bu Aşamayı Çoktan Geçtin">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-stop"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="active">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="İlanının Bilgilerini Düzenle">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-forward"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Hızlı Satışı Gör">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-pause"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab" title="Satışının Karşılığını Gör">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-fast-forward"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Artık kralilan.com'da Yayındasın">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-ok"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div role="form">
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="step1">
                                    <div class="main-container">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12 page-content">
                                                    <div class="inner-box category-content">
                                                        <h2 class="title-2 uppercase"><strong><i class="icon-user fa"></i>İLETİŞİM BİLGİLERİ</strong></h2>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-horizontal">
                                                                    <div class="well">
                                                                        <h3><i class=" icon-certificate icon-color-3"></i>Seninle Nasıl İletişim Kurulsun?
                                                                        </h3>
                                                                        <p>Seninle iletişim kurulması için bir iletişim kanal seçimi yap birçok satıcı sana ulaşmaya çalışacaktır, doğru seçimi yap.                                                                            
                                                                            <a href="/sss/" target="_blank">Daha fazlası...</a>
                                                                        </p>
                                                                        <div class="form-group">
                                                                            <table class="table table-hover checkboxtable">
                                                                                <tr>
                                                                                    <td>
                                                                                        <div class="radio">
                                                                                            <label>
                                                                                                <input type="radio" name="optionsRadios"
                                                                                                    id="optionsRadios0" value="1" checked />
                                                                                                <strong>Telefon + Mesaj Kanalı</strong>
                                                                                            </label>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <p>Alıcılar bana tüm kanallardan ulaşsın</p>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div class="radio">
                                                                                            <label>
                                                                                                <input type="radio" name="optionsRadios"
                                                                                                    id="optionsRadios1" value="2" />
                                                                                                <strong>Mesaj Kanalı</strong>
                                                                                            </label>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <p>Bana ulaşmak kısıtlı olsun</p>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-md-12 page-content">
                                                    <div class="inner-box category-content">
                                                        <h2 class="title-2 uppercase"><strong><i class="icon-docs"></i>İlan Detayları</strong></h2>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-horizontal">
                                                                    <div>
                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label for="txtBaslik">İlan Başlığı</label>
                                                                                <asp:TextBox ID="txtBaslik" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                                                            </div>
                                                                            <!-- /.form-group -->
                                                                            <div class="form-group">
                                                                                <label for="txtFiyat">Fiyat</label>
                                                                                <asp:TextBox ID="txtFiyat" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="editor1">Açıklama</label>
                                                                                <div>
                                                                                    <asp:TextBox ID="txtCKeditorAdi" runat="server" TextMode="MultiLine" required="required" ValidateRequestMode="Disabled"></asp:TextBox>
                                                                                </div>
                                                                            </div>
                                                                            <div class="content-subheading">
                                                                                <i class="icon-plus fa"></i><strong>DETAY BİLGİLERİ
                                                                                </strong>
                                                                            </div>
                                                                            <div id="box_footer" runat="server">
                                                                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                                                                <div class="content-subheading">
                                                                                    <i class="icon-plus fa"></i><strong>DETAY ÖZELLİKLERİ
                                                                                    </strong>
                                                                                </div>
                                                                                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                <div class="col-md-12 page-content">
                                                    <div class="inner-box category-content">
                                                        <h2 class="title-2 uppercase"><strong><i class="icon-address"></i>ADRES BİLGİLERİ</strong></h2>
                                                        <div class="row">
                                                            <fieldset>
                                                                <div class="well">
                                                                    <h3><i class=" icon-certificate icon-color-3"></i>Konum Bilgileri Neden Önemli?
                                                                    </h3>
                                                                    <p>
                                                                        Emlak kategorisi için konum bilgilerin çok önemli ilanının ada, parsel bilgilerini detaylı girerek harita üzerinde örnekteki gibi işaretlenmesini ve ilanını kolayca bulmalarını sağlayabilirsin.
                                                                   
                                                                    </p>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <asp:UpdatePanel runat="server">
                                                                        <ContentTemplate>
                                                                            <div class="form-group">
                                                                                <label>İl</label>
                                                                                <asp:DropDownList CssClass="form-control select2" required="required" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>İlçe</label>
                                                                                <asp:DropDownList CssClass="form-control select2" required="required" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpIlce_SelectedIndexChanged"></asp:DropDownList>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Mahalle</label>
                                                                                <asp:DropDownList CssClass="form-control select2" required="required" Style="width: 100%;" ID="drpMahalle" runat="server"></asp:DropDownList>
                                                                            </div>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    <div id="box_loc" runat="server">
                                                                        <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <img style="width: 700px; height: 467px; margin-bottom: 20px;" src="/libraries/images/map-polygon.png"></img>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 page-content">
                                                    <div class="inner-box category-content">
                                                        <h2 class="title-2 uppercase"><strong><i class="icon-picture"></i>FOTOĞRAF</strong></h2>
                                                        <div class="row">
                                                            <div class="well">
                                                                <h3><i class=" icon-certificate icon-color-3"></i>İlanın Görsel Olsun.
                                                                </h3>
                                                                <p>
                                                                    İlanına en fazla 20 adet resim yükleyebilirsin böylece alıcılar seni daha çok görüntüleyecektir.
                                                               
                                                                </p>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="dropzone" id="dropzoneForm" style="border-radius: 15px;">
                                                                    <div class="fallback">
                                                                        <input name="file" type="file" multiple="multiple" />
                                                                    </div>
                                                                </div>
                                                                <br />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-1 col-xs-offset-11" style="padding: 0;">
                                                        <asp:Button ID="devam" runat="server" CssClass="btn btn-success" Text="Devam Et" OnClick="devam_Click" Style="float: right; margin-top: 15px;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </section>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="/libraries/assets/js/owl.carousel.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/app.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/icheck.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.js") %>'></script>
    <script type="text/javascript">
        //File Upload response from the server
        var myDropzone = null;
        Dropzone.options.dropzoneForm = {
            maxFiles: <%= resimSayisi%>,
            dictDefaultMessage: "Resimleri sürükle veya buraya tıkla",
            acceptedFiles: ".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF",
            autoProcessQueue: true,
            url: "/upload.ashx?ilanid=<%= ilanId %>",
            init: function () {
                myDropzone = this;
                getPics(<%= ilanId%>);
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

        $(document).ready(function () {
            //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });
        });

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }
        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }

        window.onload = function () {
            var editor = CKEDITOR.replace('<% = txtCKeditorAdi.ClientID %>');
        };

            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat-red',
                    radioClass: 'iradio_flat-red',
                    increaseArea: '20%' // optional
                });
            });


            $('.double').keypress(function (event) {
                if ((event.which != 44 || $(this).val().indexOf(',') != -1) && (event.which < 48 || event.which > 57)) {
                    event.preventDefault();
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
    </script>
</asp:Content>
