<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mesajgonder.ascx.cs" Inherits="PL.management.araclar.mesajgonder" %>
<link rel="stylesheet" href="../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mesaj Gönder
            <small>tüm mesajlara bu alandan ulaşılabilir.</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Mailbox</li>
        </ol>
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
            <!-- /.col -->
            <div class="col-md-9">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Yeni Mesaj</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <label>Kimden</label>
                            <input class="form-control" id="txtKimden" runat="server">
                        </div>
                        <div class="form-group">
                            <label>Kime</label>
                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpKime" runat="server"></asp:DropDownList>
                        </div>
<%--                        <div class="form-group">
                            <input class="form-control" placeholder="Konu" id="txtKonu" runat="server">
                        </div>--%>
                        <div class="form-group">
                            <label for="editor1">İçerik</label>
                            <div>
                                <asp:TextBox ID="txtCKeditorAdi" runat="server" TextMode="MultiLine" ValidateRequestMode="Disabled"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <div class="pull-right">
                            <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Gönder" OnClick="Kaydet_Click" />
                        </div>
                        <asp:Button ID="Vazgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgec_Click" />
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /. box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!-- jQuery 2.1.4 -->

<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();

    });
</script>
<script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>

    window.onload = function () {

        var editor = CKEDITOR.replace('<% = txtCKeditorAdi.ClientID %>');

    };

</script>
