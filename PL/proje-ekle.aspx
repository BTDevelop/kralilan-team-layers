<%@ Page Title="Proje Yayınla - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="proje-ekle.aspx.cs" Inherits="PL.proje_ekle" %>
<asp:Content ID="Content3" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/flat/red.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/boostrap-lte.min.css") %>' />
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

        .image-preview-inputsec {
            position: relative;
            overflow: hidden;
            margin: 0px;
            color: #333;
            background-color: #fff;
            border-color: #ccc;
        }

            .image-preview-inputsec input[type=file] {
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

        .image-preview-input-titlesec {
            margin-left: 2px;
        }

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

        .checkbox label {
            padding-left: 0.5em !important;
        }

        .form-control {
            border-radius: 6px !important;
        }

            .form-control:focus {
                border-color: #16A085 !important;
                border: 2px solid #16A085 !important;
            }

        .btn-success {
            background-color: #16A085;
            color: #FFFFFF;
            width: 110px;
            font-weight: bold;
        }

        .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
            border-radius: 6px !important;
        }

        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #16A085 !important;
            color: white !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <section>
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Projeni Bilgilerle Doldur">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-play"></i>
                                        </span>
                                    </a>
                                </li>
                                <%--  <li role="presentation" class="active">
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Projeni Önizle">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-forward"></i>
                                        </span>
                                    </a>
                                </li>--%>
                                <li role="presentation" class="disabled">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Projenin Satışını Yap">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-pause"></i>
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
                                                        <h2 class="title-2 uppercase"><strong><i class="icon-suitcase fa"></i>FİRMA BİLGİLERİ</strong></h2>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-horizontal">
                                                                    <div class="col-md-6">
                                                                        <fieldset>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">
                                                                                    <label for="comname">Firma Adı</label>
                                                                                    <asp:TextBox ID="comname" CssClass="form-control" runat="server"></asp:TextBox>
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
                                                                    <div class="col-md-6">
                                                                        <div class="well">
                                                                            <h3><i class=" icon-certificate icon-color-3"></i>Kayıtlı Firmalar
                                                                            </h3>
                                                                            <p>
                                                                                Projenin firmasını kayıtlı olan firmalarından seçebilirsin.
                                                                           
                                                                                <a href="/sss/" target="_blank">Daha fazlası...</a>
                                                                            </p>
                                                                            <div class="form-group">
                                                                                <table class="table table-hover checkboxtable">
                                                                                    <asp:Repeater ID="rpcompany" runat="server">
                                                                                        <ItemTemplate>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <div class="radio">
                                                                                                        <label>
                                                                                                            <input type="radio" name="optionsRadios"
                                                                                                                id="<%# Eval("FirmaId") %>" value="<%# Eval("FirmaId") %>" />
                                                                                                            <img src="/upload/estate-company/<%# Eval("Logo") %>" width="55" />
                                                                                                            <strong><%# Eval("FirmaAdi") %></strong>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <div class="radio">
                                                                                                <label>
                                                                                                    <input type="radio" name="optionsRadios"
                                                                                                        id="optionsRadios1" value="-1" />
                                                                                                    <strong>Seçim Yok </strong>
                                                                                                </label>
                                                                                            </div>
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
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-md-12 page-content">
                                                    <div class="inner-box category-content">
                                                        <h2 class="title-2 uppercase"><strong><i class="icon-docs"></i>Proje Detayları</strong></h2>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-horizontal">
                                                                    <div class="col-md-12">

                                                                        <fieldset>
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">
                                                                                    <label for="proname">Proje Adı</label>
                                                                                    <asp:TextBox ID="proname" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="proabout">Proje Hakkında</label>
                                                                                    <asp:TextBox ID="proabout" Height="100px" CssClass="form-control" TextMode="MultiLine" required="required" runat="server"></asp:TextBox>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="col-md-6">
                                                                                        <div class="form-group">
                                                                                            <label for="propost">E-Posta</label>
                                                                                            <asp:TextBox ID="propost" TextMode="Email" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label class="control-label">Telefon</label>
                                                                                            <div class="input-icon">
                                                                                                <i class="icon-phone fa"></i>
                                                                                                <asp:TextBox ID="prophone" CssClass="form-control input-md" required="required" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label class="control-label">Faks</label>
                                                                                            <div class="input-icon">
                                                                                                <i class="icon-phone fa"></i>
                                                                                                <asp:TextBox ID="profaks" CssClass="form-control input-md" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server"></asp:TextBox>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="proaddr">Adres</label>
                                                                                            <asp:TextBox ID="proaddr" CssClass="form-control" TextMode="MultiLine" required="required" runat="server"></asp:TextBox>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="proweb">Website</label>
                                                                                            <asp:TextBox ID="proweb" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="content-subheading">
                                                                                    <i class="icon-plus fa"></i><strong>Detay Bilgileri
                                                                                    </strong>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="col-md-6">
                                                                                        <div class="form-group">
                                                                                            <label for="proplace">Proje Alanı</label>
                                                                                            <asp:TextBox ID="proplace" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="proplace">Konut Sayısı</label>
                                                                                            <asp:TextBox ID="procount" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="proplace">Teslim Tarihi</label>
                                                                                            <asp:TextBox ID="prodate" CssClass="form-control datepicker" runat="server"></asp:TextBox>
                                                                                            <div class="checkbox">
                                                                                                <label>
                                                                                                    <input type="checkbox" name="optionsRadiosDelivery0"
                                                                                                        id="optionsRadiosDelivery0" value="1" />
                                                                                                    <strong>Hemen Teslim</strong>
                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="content-subheading">
                                                                                    <i class="icon-plus fa"></i><strong>Konum Bilgileri
                                                                                    </strong>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="col-md-6">
                                                                                        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                                                                                        <asp:UpdatePanel runat="server">
                                                                                            <ContentTemplate>
                                                                                                <div class="form-group">
                                                                                                    <label>İl</label>
                                                                                                    <asp:DropDownList CssClass="form-control" required="required" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <label>İlçe</label>
                                                                                                    <asp:DropDownList CssClass="form-control" required="required" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                                                                </div>
                                                                                            </ContentTemplate>
                                                                                        </asp:UpdatePanel>
                                                                                        <div class="form-group">
                                                                                            <label for="proname">Ada</label>
                                                                                            <asp:TextBox ID="proada" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="proname">Parsel</label>
                                                                                            <asp:TextBox ID="proparsel" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="content-subheading">
                                                                                    <i class="icon-plus fa"></i><strong>Resim Galerisi
                                                                                    </strong>
                                                                                </div>
                                                                                <div class="well">
                                                                                    <h3><i class=" icon-certificate icon-color-3"></i>Projen Görsel Olsun.
                                                                                    </h3>
                                                                                    <p>
                                                                                        Projene sınırsız resim yükleyebilirsin böylece alıcılar projeni daha çok görüntüleyecektir.
                                                                                   
                                                                                    </p>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="col-sm-12">
                                                                                        <div class="dropzone" id="dropzoneForm" style="border-radius: 15px;">
                                                                                            <div class="fallback">
                                                                                                <input name="file" type="file" multiple="multiple" />
                                                                                            </div>
                                                                                        </div>
                                                                                        <br />
                                                                                    </div>
                                                                                </div>
                                                                                <input runat="server" name="txtgecici" id="Text1" visible="False" />

                                                                                <div class="content-subheading">
                                                                                    <i class="icon-plus fa"></i><strong>Vaziyet Planı
                                                                                    </strong>
                                                                                </div>
                                                                                <div class="well">
                                                                                    <h3><i class=" icon-certificate icon-color-3"></i>Projene Ait Vaziyet Planı Olsun.
                                                                                    </h3>
                                                                                    <p>
                                                                                        Projene ait vaziyet planını bu alandan yükleyebilirsin.
                                                                                   
                                                                                    </p>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <div class="input-group image-previewsec">
                                                                                        <input type="text" class="form-control image-preview-filenamesec" disabled="disabled" />
                                                                                        <!-- don't give a name === doesn't send on POST/GET -->
                                                                                        <span class="input-group-btn">
                                                                                            <!-- image-preview-clear button -->
                                                                                            <button type="button" class="btn btn-default image-preview-clearsec" style="display: none;">
                                                                                                <span class="glyphicon glyphicon-remove"></span>Sil
                                                                                           
                                                                                            </button>
                                                                                            <!-- image-preview-input -->
                                                                                            <span class="btn btn-default image-preview-inputsec">
                                                                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                                                                <span class="image-preview-input-titlesec">Vaziyet Planı Yükle</span>
                                                                                                <asp:FileUpload ID="FileUpload11" CssClass="resimSec" accept="image/png, image/jpeg" runat="server" />
                                                                                                <!-- rename it -->
                                                                                            </span>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="content-subheading">
                                                                                    <i class="icon-plus fa"></i><strong>Kat Planları
                                                                                    </strong>
                                                                                </div>
                                                                                <div class="well">
                                                                                    <h3><i class=" icon-certificate icon-color-3"></i>Projene Ait Kat Planları Olsun.
                                                                                    </h3>
                                                                                    <p>
                                                                                        Projenize ait kat plan sayısı kadar plan ekleyebilirsin. 
                                                                                   
                                                                                    </p>
                                                                                </div>
                                                                                <asp:UpdatePanel runat="server">
                                                                                    <ContentTemplate>
                                                                                        <div id="plancontent" runat="server">
                                                                                            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="drpodasayisi" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList1" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload2" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList2" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList3" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload1" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList4" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList5" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload3" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList6" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList7" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload4" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList8" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList9" runat="server">

                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload5" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList10" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList11" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload6" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList12" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList13" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload7" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList14" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList15" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload8" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList16" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList17" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload9" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-group">
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Oda Sayısı</label>
                                                                                                        <asp:DropDownList name="1" CssClass="form-control" Style="width: 100%;" ID="DropDownList18" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Stüdyo</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">1</asp:ListItem>
                                                                                                            <asp:ListItem Value="3">1+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">2+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">2+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">3+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="7">3+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="8">4+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="9">4+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="10">4+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">4+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="12">5</asp:ListItem>
                                                                                                            <asp:ListItem Value="13">5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="14">5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="15">5+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="16">5+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="17">6+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="18">6+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="19">6+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="20">7+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="21">7+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="22">7+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="23">8+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="24">8+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="25">8+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="26">9+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="27">9+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="28">9+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="29">9+4</asp:ListItem>
                                                                                                            <asp:ListItem Value="30">9+5</asp:ListItem>
                                                                                                            <asp:ListItem Value="31">9+6</asp:ListItem>
                                                                                                            <asp:ListItem Value="32">10+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="33">10+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="34">10 Üzeri</asp:ListItem>
                                                                                                            <asp:ListItem Value="35">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="36">11+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="37">3+3</asp:ListItem>
                                                                                                            <asp:ListItem Value="38">Ticari</asp:ListItem>
                                                                                                            <asp:ListItem Value="39">0+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="40">3,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="41">4,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="42">2,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="43">5,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="44">6,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="46">1,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="47">2,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="48">4,5+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="49">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="50">3</asp:ListItem>
                                                                                                            <asp:ListItem Value="51">2</asp:ListItem>
                                                                                                            <asp:ListItem Value="52">1+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="53">0+2</asp:ListItem>
                                                                                                            <asp:ListItem Value="54">1+1,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="55">1+0,5</asp:ListItem>
                                                                                                            <asp:ListItem Value="56">6+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="57">8+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="58">3+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="59">4</asp:ListItem>
                                                                                                            <asp:ListItem Value="60">6</asp:ListItem>
                                                                                                            <asp:ListItem Value="62">Dükkan</asp:ListItem>
                                                                                                            <asp:ListItem Value="63">2+0</asp:ListItem>
                                                                                                            <asp:ListItem Value="64">6,5+1</asp:ListItem>
                                                                                                            <asp:ListItem Value="65">Ofis</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>Daire Tipi</label>
                                                                                                        <asp:DropDownList name="2" CssClass="form-control" Style="width: 100%;" ID="DropDownList19" runat="server">
                                                                                                            <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                                                                                            <asp:ListItem Value="1">Daire</asp:ListItem>
                                                                                                            <asp:ListItem Value="4">Villa</asp:ListItem>
                                                                                                            <asp:ListItem Value="5">Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="6">Ev Ofis</asp:ListItem>
                                                                                                            <asp:ListItem Value="2">Residence</asp:ListItem>
                                                                                                            <asp:ListItem Value="11">Dükkan</asp:ListItem>
                                                                                                        </asp:DropDownList>
                                                                                                    </div>
                                                                                                    <div class="col-md-2">
                                                                                                        <label>m2</label>
                                                                                                        <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server"></asp:TextBox>
                                                                                                    </div>
                                                                                                    <div class="col-md-6">
                                                                                                        <label>Resim</label>
                                                                                                        <asp:FileUpload ID="FileUpload10" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                                                                    </div>
                                                                                                </div>
                                                                                            </asp:PlaceHolder>
                                                                                        </div>
                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                                <br />
                                                                                <div class="content-subheading">
                                                                                    <i class="icon-plus fa"></i><strong>Özellikler
                                                                                    </strong>
                                                                                </div>
                                                                                <input runat="server" name="txtgecici" id="txtgecici" visible="False" />

                                                                                <div id="box_footer" runat="server">
                                                                                    <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                                                                                </div>
                                                                            </div>

                                                                        </fieldset>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 page-content">
                                                    <div class="col-xs-1 col-xs-offset-11" style="padding: 0;">
                                                        <asp:Button ID="devam" runat="server" CssClass="btn btn-success" Text="Devam Et" OnClick="devam_Click1" Style="float: right; margin-top: 15px;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/fileinput.min.js") %>' type="text/javascript"></script>
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

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(document).on('click', '#close-previewsec', function () {
                $('.image-previewsec').popover('hide');
                // Hover befor close the preview
                $('.image-previewsec').hover(
                    function () {
                        $('.image-previewsec').popover('show');
                    },
                     function () {
                         $('.image-previewsec').popover('hide');
                     }
                );
            });

            $(function () {
                // Create the close button
                var closebtn = $('<button/>', {
                    type: "button",
                    text: 'x',
                    id: 'close-previewsec',
                    style: 'font-size: initial;',
                });
                closebtn.attr("class", "close pull-right");
                // Set the popover default content
                $('.image-previewsec').popover({
                    trigger: 'manual',
                    html: true,
                    title: "<strong>Önizleme</strong>" + $(closebtn)[0].outerHTML,
                    content: "Dosya seçilmedi",
                    placement: 'bottom'
                });
                // Clear event
                $('.image-preview-clearsec').click(function () {
                    $('.image-previewsec').attr("data-content", "").popover('hide');
                    $('.image-preview-filenamesec').val("");
                    $('.image-preview-clearsec').hide();
                    $('.image-preview-inputsec input:file').val("");
                    $(".image-preview-input-titlesec").text("Resim Yükle");
                });
                // Create the preview image
                $(".image-preview-inputsec input:file").change(function () {
                    var img = $('<img/>', {
                        id: 'dynamic',
                        width: 250,
                        height: 200
                    });
                    var file = this.files[0];
                    var reader = new FileReader();
                    // Set preview image into the popover data-content
                    reader.onload = function (e) {
                        $(".image-preview-input-titlesec").text("Değiştir");
                        $(".image-preview-clearsec").show();
                        $(".image-preview-filenamesec").val(file.name);
                        img.attr('src', e.target.result);
                        $(".image-previewsec").attr("data-content", $(img)[0].outerHTML).popover("show");
                    }
                    reader.readAsDataURL(file);
                });
            });
        });
    </script>
    <script src="/libraries/assets/js/owl.carousel.min.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/app.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/iCheck/icheck.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/datepicker/bootstrap-datepicker.js") %>'></script>
    <script type="text/javascript">
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_flat-red',
                radioClass: 'iradio_flat-red',
                increaseArea: '20%' // optional
            });
        });

        $(function () {
            $("[data-mask]").inputmask();
        });

        //File Upload response from the server
        Dropzone.options.dropzoneForm = {
            maxFiles: 20,
            dictDefaultMessage: "Resimleri sürükle veya buraya tıkla",
            acceptedFiles: ".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF",
            autoProcessQueue: true,
            url: "/services/ki-generalupload.ashx?emptydata=<%= tempcer %>",
            init: function () {
                this.on("maxfilesexceeded", function (data) {
                    var res = eval('(' + data.xhr.responseText + ')');
                });
                this.on("removedfile", function (file) {
                    $.ajax({
                        type: "post",
                        url: "/services/ki-generalupload.ashx?emptydata=<%= tempcer %>&type=remove&file=" + file.name

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

        $('.double').keypress(function (event) {
            if ((event.which != 44 || $(this).val().indexOf(',') != -1) && (event.which < 48 || event.which > 57)) {
                event.preventDefault();
            }
        });

        $(function () {
            $(".datepicker").datepicker({
                format: "mm-yyyy",
                startView: "months",
                minViewMode: "months"
            });
        });
    </script>
</asp:Content>
