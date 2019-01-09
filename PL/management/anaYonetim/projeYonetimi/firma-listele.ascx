<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="firma-listele.ascx.cs" Inherits="PL.management.anaYonetim.projeYonetimi.firma_listele" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Firmalar
            <small>tüm firmalar burada listelenir.</small>
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
                 { "data": "satisTarihi1" },
                 { "data": "aciklama" }
                    ],
                    processing: true,
                    serverSide: true,
                    sAjaxSource: "/services/ki_ai.ashx?data=companylist",
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
                        <h3 class="box-title">Firma Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Firma No</th>
                                    <th>Adı</th>
                                    <th>Telefon</th>
                                    <th>E-Posta</th>
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

<!-- page script -->
