<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ekle.ascx.cs" Inherits="PL.management.anaYonetim.kullaniciYonetimi.ekle" %>

<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Yeni Kullanıcı
            <small>bu alandan yeni kullanıcı ekleyebilirsin.</small>
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
                                <asp:HyperLink NavigateUrl="/management/araclar/araclar.aspx?page=gelenkutusu" runat="server"><i class="fa fa-inbox"></i>Gelen Kutusu </asp:HyperLink></li>
                            <li>
                                <asp:HyperLink NavigateUrl="/management/araclar/araclar.aspx?page=gonderilen-kutusu" runat="server"><i class="fa fa-envelope-o"></i>Gönderilen Kutusu</asp:HyperLink></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->
<%--                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Online Kullanıcılar</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <asp:Repeater ID="onlineRepeater" runat="server">
                                <ItemTemplate>
                                    <li><a href="#"><i class="fa fa-circle text-success"></i><%# Eval("kullaniciAdSoyad") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>--%>
                <!-- /.box -->
            </div>
            <!-- left column -->
            <div class="col-md-9">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Kullanıcı Ekle</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label for="username">Ad</label>
                                    <input type="text" class="form-control" name="username" id="username">
                                </div>
                                <div class="form-group">
                                    <label for="usersurname">Soyad</label>
                                    <input type="text" class="form-control" name="usersurname" id="usersurname">
                                </div>
                                <div class="form-group">
                                    <label for="password">Şifre</label>
                                    <input type="text" class="form-control" name="password" id="password">
                                </div>
                                <div class="form-group">
                                    <label for="mail">Email</label>
                                    <input type="text" class="form-control" name="mail" id="mail">
                                </div>
                                <!-- phone mask -->
                                <div class="form-group">
                                    <label for="phone">GSM</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask name="phone" id="phone">
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <div class="form-group">
                                    <label>Yetki</label>
                                    <select class="form-control select2 slcttax" style="width: 100%;" id="slctauthority" name="slctauthority">
                                        <option value="-1">Seçiniz</option>
                                        <option value="1">Yönetici</option>
                                        <option value="2">Admin</option>
                                        <option value="3">Editör</option>
                                        <option value="4">Üye</option>
                                    </select>
                                </div>
                                <!-- /.form-group -->
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <asp:Button ID="Kaydet" class="btn btn-success" runat="server" Text="Kaydet" OnClick="Kaydet_Click" />
                            <asp:Button ID="Vazgec" class="btn btn-danger" runat="server" Text="Vazgeç" OnClick="Vazgec_Click" />
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
<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
        //Money Euro
        $("[data-mask]").inputmask();

    });
</script>

