<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ilcelistele.ascx.cs" Inherits="PL.management.anaYonetim.bolgeYonetimi.ilceListele" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>İlçeler
            <small>Tüm ilçeler burada listelenir.</small>
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
                        <h3 class="box-title">İlçe Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>İlçe No</th>
                                    <th>Adı</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="ilceRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("ilceId") %></td>
                                            <td><%# Eval("ilceAdi") %></td>
                                            <td>

                                                <asp:HyperLink ID="hypGoruntule" runat="server" CssClass="btn btn-primary btn-xs" NavigateUrl='<%# String.Format("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=mahallelistele&ilId={0}&ilceId={1}", Request.QueryString["ilId"] ,Eval("ilceId"))%>'> Mahalleleri Görüntüle</asp:HyperLink>
                                                <asp:HyperLink ID="hypDuzenle" runat="server" CssClass="btn btn-warning btn-xs" NavigateUrl='<%# Eval("ilceId","~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=ilceduzenle&ilceId={0}") %>'>Düzenle</asp:HyperLink>
                                                <asp:HyperLink ID="hypEkle" runat="server" CssClass="btn btn-info btn-xs" NavigateUrl='<%# String.Format("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=mahalleekle&ilId={0}&ilceId={1}", Request.QueryString["ilId"] ,Eval("ilceId"))%>'> Mahalle Ekle</asp:HyperLink>

                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>İlçe No</th>
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
