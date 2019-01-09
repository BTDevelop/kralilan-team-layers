<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="odemeler.ascx.cs" Inherits="PL.management.genelAyarlar.odemeler" %>

<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>' />
<script src='<%= Page.ResolveUrl("~/management/plugins/datatables/jquery.dataTables.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/datatables/dataTables.bootstrap.min.js") %>'></script>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Ödemeler
            <small>bu alandan ödeme bilgilerine ulaşabilirisiniz.</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
                <script type="text/javascript" class="init">

            var data = getParameterByName("user");
            $(document).ready(function () {
                $('#example').DataTable({
                    columns: [
                 { "data": "id" },
                 { "data": "paytype" },
                 { "data": "paytotal" },
                 { "data": "date" },
                 { "data": "username" },
                 { "data": "cardno" },
                 { "data": "operation" },
                 { "data": "success" },
                 { "data": "exp" }
                    ],
                    processing: true,
                    serverSide: true,
                    sAjaxSource: "/services/ki_ai.ashx?data=paymentdata",
                    fnServerParams: function (aoData) {

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
                        <h3 class="box-title">Ödeme Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Ödeme No</th>
                                    <th>Ödeme Tipi</th>
                                    <th>Tutar</th>
                                    <th>Tarih</th>
                                    <th>Ödeme Yapan</th>
                                    <th>Kart No(varsa)</th>
                                    <th>İşlem Tipi</th>
                                    <th>Durumu</th>
                                    <th>İşlem</th>
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
