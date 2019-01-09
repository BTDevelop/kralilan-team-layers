<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listele.ascx.cs" Inherits="PL.management.anaYonetim.ozelAlanYonetimi.listele" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Özel Alanlar
            <small>tüm özel alanlar burada listelenir.</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Tables</a></li>
            <li class="active">Data tables</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Özel Alan Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Özel Alan No</th>
                                    <th>Adı</th>
                                    <th>Seçilebilir Alan</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="ozellikRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("ozellikId") %></td>
                                            <td><%# Eval("ozellikAdi") %></td>
                                            <td><%# Convert.ToInt32(Eval("secilebilirMi"))==1 ? "Evet" : "Hayır"%></td>
                                            <td>
                                                <button class="btn btn-primary btn-xs">Değerleri Görüntüle</button>
                                                <button class="btn btn-success btn-xs">Düzenle</button>
                                                <button class="btn btn-danger btn-xs">Sil</button>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Özel Alan No</th>
                                    <th>Adı</th>
                                    <th>Seçilebilir Alan</th>
                                    <th>İşlemler</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
