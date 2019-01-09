<%@ Page Title="Kullanıcı" Language="C#" MasterPageFile="~/management/admin.Master" AutoEventWireup="true" CodeBehind="kullanici.aspx.cs" Inherits="PL.management.anaYonetim.kullaniciYonetimi.listele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
    
    <script>
        $(function () {
            $("#example1").DataTable();
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
        });
    </script>
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
    <!-- DataTables -->

</asp:Content>
