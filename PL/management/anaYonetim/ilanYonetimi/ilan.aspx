<%@ Page Title="İlan" Language="C#" MasterPageFile="~/management/admin.Master" AutoEventWireup="true" CodeBehind="ilan.aspx.cs" Inherits="PL.management.anaYonetim.ilanYonetimi.ilan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .table td {
            vertical-align: middle !important;
        }

            .table td h5 {
                padding-bottom: 0 !important;
            }

        table.dataTable thead th {
            position: relative;
            background-image: none !important;
        }

            table.dataTable thead th.sorting:after,
            table.dataTable thead th.sorting_asc:after,
            table.dataTable thead th.sorting_desc:after {
                position: absolute;
                top: 12px;
                right: 8px;
                display: block;
                font-family: FontAwesome;
            }

            table.dataTable thead th.sorting:after {
                content: "\f0dc";
                color: #ddd;
                font-size: 0.8em;
                padding-top: 0.12em;
            }

            table.dataTable thead th.sorting_asc:after {
                content: "\f0de";
            }

            table.dataTable thead th.sorting_desc:after {
                content: "\f0dd";
            }
    </style>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/jquery.dataTables.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/dataTables.bootstrap.min.js") %>'></script>
    <script>
        $(function () {
            var t = $("#example1").DataTable(
                 {
                     "columnDefs": [{
                         "searchable": false,
                         "orderable": false,
                         "targets": 0
                     }],
                     "order": [[1, 'asc']]
                 }
                 );
            t.on('order.dt search.dt', function () {
                t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            }).draw();
        });
    </script>
</asp:Content>
