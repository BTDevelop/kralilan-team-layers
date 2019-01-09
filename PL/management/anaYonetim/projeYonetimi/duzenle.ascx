<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="duzenle.ascx.cs" Inherits="PL.management.anaYonetim.projeYonetimi.duzenle" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>'>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/dropzone.min.css") %>' />
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/dropzone/basic.min.css") %>' />

<%--<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" rel="stylesheet" />--%>
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
        <h1>Proje Düzenle
            <small>bu alandan proje düzenleyebilirsin.</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Proje İstatistik</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <a href="#"><i class="fa fa-eye"></i>Görüntülenme: <%= _inproviews %> </a></li>
                            <li>
                                <a href="#"><i class="fa fa-mouse-pointer"></i>Tıklanma: <%= _inproclick %></a></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Proje Ödeme Bilgisi</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <asp:Repeater ID="rppayment" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a href="#"><i class="fa fa-bullseye"></i><small class="label label-primary"><i class="fa fa-check"></i><%# ((BLL.ExternalClass.ilanDataType)Container.DataItem).aciklama %></small></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->
            </div>
            <div class="col-md-9">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Firma Bilgileri</h3>
                    </div>
                    <div class="box-body" runat="server" id="box_body">
                        <div class="col-md-4">
                            <img src="/upload/estate-company/<%= _infirlogo %>" />
                        </div>
                        <div class="col-md-4">
                            <span><%= _infirmaadi %></span><br />
                            <span><b>e-Posta:</b> <%= _infirposta %></span><br />
                            <span><b>Telefon:</b> <%= _infirtelefon %></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-xs-12 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Konum Bilgileri</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-4">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label>İl</label><!--OnSelectedIndexChanged="drpIl_SelectedIndexChanged"-->
                                            <asp:DropDownList CssClass="form-control select2 province" Style="width: 100%;" ID="drpIl" OnSelectedIndexChanged="drpIl_SelectedIndexChanged" runat="server" AutoPostBack="True"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>İlçe</label>
                                            <asp:DropDownList CssClass="form-control select2 district" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="true"></asp:DropDownList>
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
                                <div class="form-group">
                                    <label for="prokoordinat">Koordinat</label>
                                    <asp:TextBox ID="prokoordinat" CssClass="form-control koordinat" runat="server"></asp:TextBox>
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
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Proje Galerisi</h3>
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
                                <input runat="server" name="txtgecici" id="txtgecici" visible="False" />
                                <br />
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
                        <h3 class="box-title">Hızlı Seçim</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <%--  <div class="callout callout-info" style="background-color: #1bc0a3 !important; border-color: #1bc0a3;">
                                <h4>Uyarı!</h4>
                                <p><%= status %></p>
                            </div>--%>
                            <div class="col-md-3" style="border: dashed; border-radius: 25px; border-color: #1bc0a3">
                                <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                    <br />
                                    <div class="form-group" id="rddaterange">
                                        <label>
                                            <input value="1" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Yayın için Onayla</label><br />
                                        <label>
                                            <input value="3" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Satışı Tamamlandı Olarak İşaretle</label><br />
                                        <label>
                                            <input value="4" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Satışı Tamamlanmadı Olarak İşaretle
                                        </label>
                                        <br />
                                        <label>
                                            <input value="5" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Silindi Olarak İşaretle</label><br />
                                        <label>
                                            <input value="-1" type="radio" name="ctrlselect" class="ctrlselect" />
                                            Seçim Yok</label><br />
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="col-md-9">
                                <div class="form-group">
                                    <input type="email" class="form-control" name="emailto" placeholder="Eposta Adresi:" value="<%= _infirposta %>">
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
                            </div>--%>
                            <div class="col-md-8" style="background: url('../../../libraries/images/bg_1.png') repeat left top;">
                            </div>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <div class="col-md-9 pull-right">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Proje Detayları</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="txtBaslik">Proje Adı</label>
                                            <asp:TextBox ID="txtproname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <!-- /.form-group -->
                                        <div class="form-group">
                                            <label>Proje Hakkında</label>
                                            <asp:TextBox ID="txtabout" TextMode="MultiLine" CssClass="form-control double price" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>E-Posta</label>
                                            <asp:TextBox ID="propost" TextMode="Email" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Telefon</label>
                                            <asp:TextBox ID="prophone" CssClass="form-control input-md" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Faks</label>
                                            <asp:TextBox ID="profaks" CssClass="form-control input-md" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server"></asp:TextBox>
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
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Detay Bilgileri</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="proplace">Proje Alanı</label>
                                            <asp:TextBox ID="proplace" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="procount">Konut Sayısı</label>
                                            <asp:TextBox ID="procount" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="prodate">Teslim Tarihi</label>
                                            <asp:TextBox ID="prodate" CssClass="form-control datepicker" runat="server"></asp:TextBox>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="optionsRadiosDelivery0"
                                                        id="optionsRadiosDelivery0" value="1" />
                                                    <strong>Hemen Teslim</strong>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="content-subheading">
                                            <i class="icon-plus fa"></i><strong>Vaziyet Planı
                                            </strong>
                                        </div>
                                        <div class="form-group">
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
                                                        <span class="image-preview-input-title">Plan Yükle</span>
                                                        <asp:FileUpload ID="FileUploadStatus" CssClass="resimSec" accept="image/png, image/jpeg" runat="server" />
                                                        <!-- rename it -->
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Kat Planları</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
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
                                                    <div class="col-md-4">
                                                        <label>Resim</label>
                                                        <asp:FileUpload ID="FileUpload10" CssClass="resimSec btn btn-default" accept="image/png, image/jpeg" runat="server" />
                                                    </div>
                                                </div>
                                            </asp:PlaceHolder>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Özellikler</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div id="box_footer" runat="server">
                                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="col-md-9 col-md-offset-3" style="float: none; padding-bottom: 30px">
        <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
        <asp:Button ID="Vezgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgeç_Click" />
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
                $(".image-preview-input-title").text("Plan Yükle");
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
    //File Upload response from the server
    var myDropzone = null;
    Dropzone.options.dropzoneForm = {
        maxFiles: 20,
        dictDefaultMessage: "Resimleri sürükle veya buraya tıkla",
        acceptedFiles: ".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF",
        autoProcessQueue: true,
        url: "/services/ki-generalupload.ashx?emptydata=<%= tempcer  %>",
        init: function () {
            myDropzone = this;
            getPics(<%= _inprojeid %>);
            this.on("maxfilesexceeded", function (data) {
                var res = eval('(' + data.xhr.responseText + ')');
            });

            this.on("removedfile", function (file) {
                $.ajax({
                    type: "post",
                    url: "/services/ki-generalupload.ashx?normalizedata=<%= tempcer %>&defdata=<%= _inprojeid %>&type=remove&file=" + file.name

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
            url: "/services/ki_operation.asmx/getProjectGalery",
            dataType: "json",
            data: "{ proid:'" + adsid + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var d = JSON.parse(data.d);

                for (var i = 0; i < d.length; i++) {
                    var mockFile = {
                        name: d[i].resim,
                        size: 0,
                        type: 'image/jpeg',
                        status: Dropzone.ADDED,
                        url: '/upload/estate-projects/<%= _inprojeid %>/' + d[i].resim
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

    var koordinat;
    var map;
    function initMap() {
        var koordinatlar = [];

        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 6,
            center: { lat: 39, lng: 36 },
            mapTypeId: google.maps.MapTypeId.HYBRID
        });


        var obj = JSON.parse($(".koordinat").val());

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
            strokeColor: "#FF0000",
            strokeOpacity: 0.8,
            strokeWeight: 3,
            fillColor: "#FF0000",
            fillOpacity: 0.35
        });
        sekil.setMap(map);

        var markerPosition = { lat: koordinatlar[0]["lat"], lng: koordinatlar[0]["lng"] }
        var marker = new google.maps.Marker({
            position: markerPosition,
            map: map,
            title: "proje"
        });

        map.setZoom(17);
        map.setCenter({ lat: koordinatlar[0]["lat"], lng: koordinatlar[0]["lng"] });

        var drawingManager = new google.maps.drawing.DrawingManager({
            drawingControl: true,
            drawingControlOptions: {
                position: google.maps.ControlPosition.TOP_CENTER,
                drawingModes: ['polygon', 'rectangle']
            }
        });
        drawingManager.setMap(map);


        var resetControl = $('<div>Temizle</div>').css({
            backgroundColor: 'white',
            borderColor: '#AAA',
            borderStyle: 'solid',
            borderWidth: '1px',
            color: '#333',
            cursor: 'pointer',
            margin: '5px',
            padding: '5px'
        })[0];
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(resetControl);
        google.maps.event.addDomListener(resetControl, 'click', function () {
            resetMap();
        });
    }

    jQuery('.koordinat').focusout(function () {
        initMap();
        koordinat = ($(this).val);
    });

    var mapOverlays = [],
    mapDataId = 'map-data',
    mapOverlayStyle = {
        fillColor: '#21CCCA',
        fillOpacity: 0.25,
        strokeWeight: 0.75
    };

    function resetMap() {
        removeMapOverlays();
        removeMapData();
    }

    /**
 * Removes map overlays (global variable)
 *
 */
    function removeMapOverlays() {
        while (mapOverlays[0])
            mapOverlays.pop().setMap(null);
    }


    /**
     * Removes DOM elements with map data
     *
     */
    function removeMapData() { $('#' + mapDataId).empty() }


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

    ////Date picker
    //$('.satis-tarihi-1').datepicker({
    //    autoclose: true
    //});
    ////Date picker
    //$('.satis-tarihi-2').datepicker({
    //    autoclose: true
    //});

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS1wH5TdTQ8gbD5zB6Ghi2hN4BpkkbJ5M&libraries=drawing&callback=initMap" async defer></script>

