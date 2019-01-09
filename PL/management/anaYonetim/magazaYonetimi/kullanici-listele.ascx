<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="kullanici-listele.ascx.cs" Inherits="PL.management.anaYonetim.magazaYonetimi.kullanici_listele" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Kullanıcılar
            <small>kullanıcılar burada listelenir.</small>
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
                        <h3 class="box-title">Kullanıcı Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Kullanıcı No</th>
                                    <th>Ad Soyad</th>
                                    <th>Email</th>
                                    <th>Son Giriş Tarihi</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="kullaniciRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("kullaniciId") %></td>
                                            <td><%# Eval("kullaniciAdSoyad") %></td>
                                            <td><%# Eval("email") %></td>
                                            <td><%# Eval("sonGirisTarihi","{0:dd MMMM yyyy}") %></td>
                                            <td>
                                                <asp:HyperLink ID="hypGoruntule" runat="server" CssClass="btn btn-primary btn-xs" NavigateUrl='<%# Eval("kullaniciId","~/satici-profil?user={0}") %>'>Görüntüle</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Kullanıcı No</th>
                                    <th>Ad Soyad</th>
                                    <th>Email</th>
                                    <th>Son Giriş Tarihi</th>
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
