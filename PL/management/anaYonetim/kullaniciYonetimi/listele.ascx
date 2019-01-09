<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listele.ascx.cs" Inherits="PL.management.anaYonetim.kullaniciYonetimi.listele1" %>
<!-- Content Wrapper. Contains page content -->
   <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/jquery.dataTables.min.js") %>'></script>
   <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/dataTables.bootstrap.min.js") %>'></script>

<%--<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>--%>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Kullanıcılar
            <small>kullanıcılar burada listelenir.</small>
        </h1>

    </section>
    <!-- Main content -->
    <section class="content">
        <script type="text/javascript" class="init">

            var data = getParameterByName("user");
            $(document).ready(function () {
                $('#example').DataTable({
                    columns: [
                 { "data": "kullaniciId" },
                 { "data": "kullaniciAdSoyad" },
                 { "data": "profilResim" },
                 { "data": "email" },
                 { "data": "sonGirisTarihi" },
                 { "data": "sifre" }
                    ],
                    processing: true,
                    serverSide: true,
                    sAjaxSource: "/services/ki_ai.ashx?data=userdata",
                    fnServerParams: function (aoData) {
                        aoData.push({ "name": "_income", "value": data });
                    },
                    sServerMethod: "post"

                });
            });

            function getParameterByName(name, url) {
                if (!url) {
                    url = window.location.href;
                }
                name = name.replace(/[\[\]]/g, "\\$&");
                var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                    results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, " "));
            }
        </script>
        <%--        <script type="text/javascript">
            function Confirm() {
                alert("dsfasdf");
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                if (confirm("Silmek üzeresiniz !")) {
                    confirm_value.value = "Devam Et";
                } else {
                    confirm_value.value = "Vazgeç";
                }
                document.forms[0].appendChild(confirm_value);
            }
        </script>--%>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Kullanıcı Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Kullanıcı No</th>
                                    <th>Ad Soyad</th>
                                    <th>Cep Telefonu</th>
                                    <th>Email</th>
                                    <th>Son Giriş Tarihi</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                            <%--                            <tbody>
                                <asp:Repeater ID="kullaniciRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("kullaniciId") %></td>
                                            <td><%# Eval("kullaniciAdSoyad") %></td>
                                            <td><%# Eval("telefon") %></td>
                                            <td><%# Eval("email") %></td>
                                            <td><%# Eval("sonGirisTarihi","{0:dd MM yyyy}") %></td>
                                            <td>
                                                <asp:HyperLink ID="detay" NavigateUrl='<%# Eval("kullaniciId","~/satici-profil.aspx?user={0}") %>' CssClass="btn btn-primary btn-xs" runat="server">Görüntüle</asp:HyperLink>
                                                <asp:HyperLink ID="duzenle" NavigateUrl='<%# Eval("kullaniciId","~/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=duzenle&user={0}") %>' CssClass="btn btn-warning btn-xs" runat="server">Düzenle</asp:HyperLink>
                                                <asp:HyperLink ID="sil" NavigateUrl='<%# Eval("kullaniciId","~/management/anaYonetim/kullaniciYonetimi/kullanici.aspx?page=listele&user={0}") %>' CssClass="btn btn-danger btn-xs" runat="server">Sil</asp:HyperLink>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>--%>
                            <%--                            <tfoot>
                                <tr>
                                    <th>Kullanıcı No</th>
                                    <th>Ad Soyad</th>
                                    <th>Cep Telefonu</th>
                                    <th>Email</th>
                                    <th>Yetki</th>
                                    <th>Son Giriş Tarihi</th>
                                </tr>
                            </tfoot>--%>
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
