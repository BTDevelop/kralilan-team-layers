<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mahallelistele.ascx.cs" Inherits="PL.management.anaYonetim.bolgeYonetimi.mahallelistele" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mahalleler
            <small>tüm mahalleler burada listelenir.</small>
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
                        <h3 class="box-title">Mahalle Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Mahalle No</th>
                                    <th>Adı</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="mahalleRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("mahalleId") %></td>
                                            <td><%# Eval("mahalleAdi") %></td>
                                            <td>
                                                <asp:HyperLink ID="hypDuzenle" runat="server" CssClass="btn btn-primary btn-xs" NavigateUrl='<%# String.Format("~/management/anaYonetim/bolgeYonetimi/bolge.aspx?page=mahalleduzenle&ilId={0}&ilceId={1}&mahalleId={2}", Request.QueryString["ilId"] ,Eval("ilceId"),Eval("mahalleId"))%>'> Düzenle</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Mahalle No</th>
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
