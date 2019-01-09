<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="icerikkategoriekle.ascx.cs" Inherits="PL.management.anaYonetim.yardimIcerikYonetimi.icerikkategoriekle" %>
<div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            İçerik Kategori Ekle
            <small>buradan içerik kategori ekleyebilirsiniz.</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
          </ol>
        </section>
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">İçerik Kategori Ekle Formu</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div role="form">
                  <div class="box-body">
                    <div class="col-md-6">
                    <div class="form-group">
                      <label for="kategoriad">Yardım İçerik Kategori Adı</label>
                      <input type="text" class="form-control" id="kategoriad" placeholder="İlan">
                    </div>
                 </div>
                </div><!-- /.box-body -->
                  <div class="box-footer">
                    <button type="submit" class="btn btn-success">Kaydet</button>
                    <button type="submit" class="btn btn-danger">Vazgeç</button>
                  </div>
                </div>
              </div><!-- /.box -->
            </div><!--/.col (left) -->
            <!-- right column -->
            <!--/.col (right) -->
          </div>   <!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->