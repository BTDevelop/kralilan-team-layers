<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listele.ascx.cs" Inherits="PL.management.anaYonetim.ilanYonetimi.listele" %>
<!-- Content Wrapper. Contains page content -->
   <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/jquery.dataTables.min.js") %>'></script>
   <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/dataTables.bootstrap.min.js") %>'></script>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>İlan Listesi
            <small>bu alanda ilanlar listelenir.</small>
        </h1>

    </section>
    <!-- Main content -->
    <section class="content">
       <script type="text/javascript" class="init">
            var data = getParameterByName("type");
            $(document).ready(function () {
                $('#example').DataTable({
                    columns: [

                 { "data": "ilanId" },
                 { "data": "resim" },
                 { "data": "ilAdi" },
                 { "data": "baslik" },
                 { "data": "baslangicTarihi" },
                 { "data": "aciklama" }
                    ],
                    processing: true,
                    serverSide: true,
                    sAjaxSource: "/services/ki_ai.ashx?data=classifiedlist",
                    fnServerParams: function (aoData) {
                        aoData.push({ "name": "_income", "value": data });
                    },
                    sServerMethod: "post"
                    //columnDefs: [{
                    //     "searchable": false,
                    //     "orderable": false,
                    //     "targets": 0
                    // }],
                    // order: [[1, 'asc']]

               });
               //t.on('order.dt search.dt', function () {
               //    t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
               //        cell.innerHTML = i + 1;
               //    });
               //}).draw();
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
                        <h3 class="box-title">İlan Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>İlan No</th>
                                    <th>İlanı Ekleyen</th>
                                    <th>İl</th>
                                    <th>Fiyat</th>
                                    <th>Kayıt Tarihi</th>
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

