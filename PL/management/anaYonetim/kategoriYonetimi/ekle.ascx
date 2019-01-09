<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ekle.ascx.cs" Inherits="PL.management.anaYonetim.kategoriYonetimi.ekle" %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Kategori Ekle
            <small>buradan kategori ekleyebilirsiniz.</small>
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
                <a href="mailbox.html" class="btn btn-primary btn-block margin-bottom">Gelen Kutusu Dön</a>
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Dosyalar</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="mailbox.html"><i class="fa fa-inbox"></i>Gelen Kutusu <span class="label label-primary pull-right">12</span></a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>Gönderilenler</a></li>
                            <li><a href="#"><i class="fa fa-trash-o"></i>Silinenler</a></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Online Kullanıcılar</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="#"><i class="fa fa-circle text-success"></i>Important</a></li>
                            <li><a href="#"><i class="fa fa-circle text-success"></i>Promotions</a></li>
                            <li><a href="#"><i class="fa fa-circle text-success"></i>Social</a></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- left column -->
            <div class="col-md-9">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Kategori Ekle Formu</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="txtKategori">Kategori Adı</label>
                                    <input type="text" class="form-control" id="txtKategori" placeholder="Daire" runat="server">
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
                            <asp:Button ID="Vazgeç" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgeç_Click" />
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
