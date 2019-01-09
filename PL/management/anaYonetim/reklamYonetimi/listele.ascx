<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listele.ascx.cs" Inherits="PL.management.anaYonetim.reklamYonetimi.listele" %>
<script src='<%= Page.ResolveUrl("~/management/plugins/datatables/jquery.dataTables.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/datatables/dataTables.bootstrap.min.js") %>'></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Reklamlar
            <small>tüm reklamlar bu alanda listelenir.</small>
        </h1>
      
    </section>
    <!-- Main content -->
    <section class="content">
            <script type="text/javascript" class="init">
            var data = getParameterByName("ads");
            $(document).ready(function () {
                $('#example').DataTable({
                    columns: [
                 { "data": "verilenReklamId" },
                 { "data": "reklamAdi" },
                 { "data": "baslangicTarihi" },
                 { "data": "bitisTarihi" },
                 { "data": "reklamLink" },
                 { "data": "reklamResim" }
                    ],
                    processing: true,
                    serverSide: true,
                    sAjaxSource: "/services/ki_ai.ashx?data=adsdata",
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
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Reklam Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Reklam No</th>
                                    <th>Reklam Adı</th>
                                    <th>Başlangıç Tarihi</th>
                                    <th>Bitiş Tarihi</th>
                                    <th>Reklam Türü</th>
                                    <th>İşlemler</th>       
                                </tr>
                            </thead>
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

<script>
    $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>
