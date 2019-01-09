<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listele.ascx.cs" Inherits="PL.management.anaYonetim.kategoriYonetimi.listele" %>
 <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Kategoriler
            <small>tüm kategoriler burada listelenir.</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
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
                  <h3 class="box-title">Kategori Listesi</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>Kategori No</th>
                        <th>Adı</th>
                        <th>İşlemler</th>
                      </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="kategoriRepeater" runat="server">
                            <ItemTemplate>
                              <tr>
                                <td><%# Eval("kategoriId") %></td>
                                <td><%# Eval("kategoriAdi") %></td>
                                <td>
                                    <asp:HyperLink ID="hypGoruntule" runat="server" CssClass="btn btn-primary btn-xs" NavigateUrl='<%# Eval("kategoriId","~/management/anaYonetim/kategoriYonetimi/kategoriler.aspx?page=listele&kategoriId={0}") %>'>Alt Kategorileri Görüntüle</asp:HyperLink>
                                    <asp:HyperLink ID="hypEkle" runat="server" CssClass="btn btn-info btn-xs" NavigateUrl='<%# Eval("kategoriId","~/management/anaYonetim/kategoriYonetimi/kategoriler.aspx?page=ekle&kategoriId={0}") %>'>Alt Kategori Ekle</asp:HyperLink>
                                    <asp:HyperLink ID="hypDuzenle" runat="server" CssClass="btn btn-warning btn-xs" NavigateUrl='<%# Eval("kategoriId","~/management/anaYonetim/kategoriYonetimi/kategoriler.aspx?page=duzenle&kategoriId={0}") %>'>Düzenle</asp:HyperLink>
                              </tr>
                         </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                    <tfoot>
                       <tr>
                        <th>Kategori No</th>
                        <th>Adı</th>
                        <th>İşlemler</th>
                      </tr>
                    </tfoot>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

