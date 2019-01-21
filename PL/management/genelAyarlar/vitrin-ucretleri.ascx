<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="vitrin-ucretleri.ascx.cs" Inherits="PL.management.genelAyarlar.vitrin_ucretleri" %>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>' />
<script src='<%= Page.ResolveUrl("~/management/plugins/datatables/jquery.dataTables.min.js") %>'></script>
<script src='<%= Page.ResolveUrl("~/management/plugins/datatables/dataTables.bootstrap.min.js") %>'></script>

<div class="content-wrapper">
    <section class="content-header">
        <h1>İlan Vitrin Fiyatları       
            <small>tüm vitrin fiyatları bu alanda listelenir.</small>
        </h1>
    </section>
    <section class="content">
        <script type="text/javascript" class="init">

            $(document).ready(function () {
                $('#example').DataTable({
                    columns: [
                 { "data": "KategoriAdi" },
                 { "data": "DopingAdi" },
                 { "data": "Sure" },
                 { "data": "FiyatNumeric" },
                        {
                            mRender: function (data, type, row) {
                                return '<a class="btn btn-success btn-xs" href="/management/genelAyarlar/genelayarlar.aspx?page=vitrinucretayar&showcase=' + row.Id + '">Düzenle</a>'
                            }
                        }
                    ],
                    processing: true,
                    serverSide: true,
                    sAjaxSource: "/managerpoint/dopingkategorihandler.ashx?data=GetDopingCategories",
                    sServerMethod: "post"
                });
            });
        </script>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Vitrin Ücret Listesi</h3>
                    </div>
                    <div class="box-body">
                        <table id="example" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Kategori</th>
                                    <th>Vitrin Adı</th>
                                    <th>Vitrin Süre</th>
                                    <th>Ücret</th>
                                    <th>İşlemler</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
