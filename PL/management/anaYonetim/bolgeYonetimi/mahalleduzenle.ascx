<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mahalleduzenle.ascx.cs" Inherits="PL.management.anaYonetim.bolgeYonetimi.mahalleduzenle" %>

<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mahalle Düzenle
            <small>buradan mahalle düzenleyebilirsiniz.</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
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
            <!-- left column -->
            <div class="col-md-9">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Mahalle Düzenleme Formu</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label>İl</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>İlçe</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIlce" runat="server"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="txtMahalle">Mahalle Adı</label>
                                    <input type="text" class="form-control" id="txtMahalle" runat="server">
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

<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
    });
</script>
