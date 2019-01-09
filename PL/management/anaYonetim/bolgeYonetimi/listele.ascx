<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listele.ascx.cs" Inherits="PL.management.anaYonetim.bolgeYonetimi.listele" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Bölgeler
            <small>tüm bölgeler burada listelenir.</small>
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
                        <h3 class="box-title">Bölge Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>İl No</th>
                                    <th>Adı</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="ilRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("ilId") %></td>
                                            <td><%# Eval("ilAdi") %></td>
                                            <td>
                                                <asp:HyperLink ID="hypGoruntule" runat="server" CssClass="btn btn-primary btn-xs" NavigateUrl='<%# Eval("ilId","~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=ilcelistele&ilId={0}") %>'>İlçeleri Görüntüle</asp:HyperLink>
                                                <asp:HyperLink ID="hypDuzenle" runat="server" CssClass="btn btn-warning btn-xs" NavigateUrl='<%# Eval("ilId","~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=duzenle&ilId={0}") %>'>Düzenle</asp:HyperLink>
                                                <asp:HyperLink ID="hypEkle" runat="server" CssClass="btn btn-info btn-xs" NavigateUrl='<%# Eval("ilId","~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=ilceekle&ilId={0}") %>'>İlçe Ekle</asp:HyperLink>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>İl No</th>
                                    <th>Adı</th>
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
