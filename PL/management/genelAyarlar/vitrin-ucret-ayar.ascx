﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="vitrin-ucret-ayar.ascx.cs" Inherits="PL.management.genelAyarlar.vitrin_ucret_ayar" %>
<link rel="stylesheet" href="../plugins/select2/select2.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Vitrin Ücret Düzenle
            <small>bu alandan vitrin ücreti düzenlenebilirsin.</small>
        </h1>

    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Ücret Düzenle Formu</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Vitrin Kategori</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpKategori" runat="server" Enabled="false"></asp:DropDownList>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Vitrin Türü</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpTur" runat="server" Enabled="false"></asp:DropDownList>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Vİtrin Süresi</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpSure" runat="server" Enabled="false">
                                        <asp:ListItem Value="-1">Seçiniz</asp:ListItem>
                                        <asp:ListItem Value="1">1 Hafta</asp:ListItem>
                                        <asp:ListItem Value="2">2 Hafta</asp:ListItem>
                                        <asp:ListItem Value="4">4 Hafta</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <!-- /.form-group -->
                                <label>Vitrin Ücreti</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-try"></i></span>
                                    <input type="text" class="form-control" runat="server" id="txtFiyat">
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                        </div>
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
<script src="../plugins/select2/select2.full.min.js"></script>
<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

    });
</script>
