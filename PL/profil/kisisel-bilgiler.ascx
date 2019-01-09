<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="kisisel-bilgiler.ascx.cs" Inherits="PL.profil.kisisel_bilgiler" %>
<link rel="stylesheet" href="/management/plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="/management/plugins/select2/select2.min.css">
<link rel="stylesheet" href="/management/dist/css/AdminLTE.min.css">
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

    <style > .checkbox label {
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
                    <h4 class="panel-title"><a href="#collapseB1" data-toggle="collapse">Kişisel Bilgilerim </a></h4>
                </div>
                <div class="panel-collapse collapse in" id="collapseB1">
                    <div class="panel-body">
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Ad</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txtAd" runat="server">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Soyad</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txtSoyad" runat="server">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">TC Kimlik No</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txtKimlikNo" runat="server">
                                </div>
                            </div>
 <%--                           <div class="form-group">
                                <label class="col-sm-3 control-label">Cinsiyet</label>
                                <div class="col-sm-9">
                                    <asp:RadioButtonList ID="rdCinsiyet" runat="server" RepeatDirection="Horizontal" Height="33px" Width="386px">
                                        <asp:ListItem Value="0">  Kadın </asp:ListItem>
                                        <asp:ListItem Value="1"> Erkek</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Doğum Tarihi</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="data-mask" runat="server" id="txtTarih">
                                    </div>
                                </div>
                                <!-- /.input group -->
                            </div>
                            <!-- /.form group -->
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">İl</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">İlçe</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpIlce_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Mahalle</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpMahalle" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Eğitim Durumu</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpEgitim" runat="server">
                                        <asp:ListItem Value="-1" Selected="True">Seçiniz</asp:ListItem>
                                        <asp:ListItem Value="1">Üniversite</asp:ListItem>
                                        <asp:ListItem Value="2">Yüksekokul</asp:ListItem>
                                        <asp:ListItem Value="3">Lise</asp:ListItem>
                                        <asp:ListItem Value="4">Ortaokul</asp:ListItem>
                                        <asp:ListItem Value="5">İlkokul</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Fotoğraf</label>
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
                                                <span class="image-preview-input-title">Resim Yükle</span>
                                                <asp:FileUpload ID="fuprofile" CssClass="resimSec" accept="image/png, image/jpeg" runat="server" />
                                                <!-- rename it -->
                                            </span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <asp:Button ID="Guncelle" type="submit" CssClass="btn btn-success" runat="server" Text="Güncelle" OnClick="Guncelle_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-box End-->
    </div>
</div>
<%--<script src="/management/plugins/input-mask/jquery.inputmask.js"></script>--%>
<%--<script src="/management/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>--%>

