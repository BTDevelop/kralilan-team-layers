<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="duzenle.ascx.cs" Inherits="PL.management.anaYonetim.kullaniciYonetimi.duzenle" %>

<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Kullanıcı Düzenle
            <small>bu alandan kayıtlı kullanıcıyı düzenleyebilirsin.</small>
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

            </div>
            <!-- left column -->
            <div class="col-md-9">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Kullanıcı Bilgileri</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label for="ad">Ad</label>
                                    <asp:TextBox ID="txtAd" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="soyad">Soyad</label>
                                    <asp:TextBox ID="txtSoyad" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="sifre">Şifre</label>
                                    <asp:TextBox ID="txtSifre" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="mail">Email</label>
                                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>GSM</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <asp:TextBox ID="txtGsm1" runat="server" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Yetki</label>
                                    <asp:DropDownList ID="drpYetki" runat="server" class="form-control select2">
                                        <asp:ListItem Value="1">Yönetici</asp:ListItem>
                                        <asp:ListItem Value="2">Admin</asp:ListItem>
                                        <asp:ListItem Value="3">Editör</asp:ListItem>
                                        <asp:ListItem Value="4">Üye</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="callout callout-info" style="background-color: #1bc0a3 !important; border-color: #1bc0a3;">
                                    <h4>Uyarı!</h4>
                                    <p><%= status %></p>
                                </div>
                                <div class="col-md-3" style="border: dashed; border-radius: 25px; border-color: #1bc0a3">
                                    <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                        <br />
                                        <div class="form-group" id="rddaterange">

                                            <label>
                                                <input value="1" type="radio" name="ctrlselect" class="ctrlselect" />
                                                Hesabı Silindi Olarak İşaretle</label><br />
                                            <label>
                                                <input value="-1" type="radio" name="ctrlselect" class="ctrlselect" />
                                                Seçim Yok</label><br />
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <asp:Button ID="Kaydet" class="btn btn-success" runat="server" OnClick="Kaydet_Click" Text="Kaydet" />
                            <asp:Button ID="Vazgec" class="btn btn-danger" runat="server" OnClick="Vazgec_Click" Text="Vazgeç" />
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
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
<script>

    $(function () {

        //Initialize Select2 Elements
        $(".select2").select2();

    });

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
    //Money Euro
    $("[data-mask]").inputmask();

    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

</script>


