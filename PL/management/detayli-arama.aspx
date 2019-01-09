<%@ Page Title="" Language="C#" MasterPageFile="~/management/admin.Master" AutoEventWireup="true" CodeBehind="detayli-arama.aspx.cs" Inherits="PL.management.detayli_arama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/select2/select2.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/datepicker/datepicker3.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/daterangepicker-bs3.css") %>'/>
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/skins/_all-skins.min.css") %>'/>
    <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/jquery.dataTables.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/datatables/dataTables.bootstrap.min.js") %>'></script>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Detaylı İlan Arama
            <small>bu alandan detaylı arama yapabilirsin.</small>
            </h1>

        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-3">
                    <div class="box box-default">
                        <div class="box-body" runat="server" id="box_body">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Kimden</label>
                                    <select class="form-control select2" style="width: 100%;" id="slctwho">
                                        <option value="-1">Seçiniz</option>
                                        <option value="0">Sahibinden</option>
                                        <option value="7">Emlakçıdan</option>
                                        <option value="1">Belediyeden</option>
                                        <option value="5">Bankadan</option>
                                        <option value="3">İzaley-i Şuyudan</option>
                                        <option value="2">İcradan</option>
                                        <option value="10">Milli Hazineden (Satışı Devam Eden)</option>
                                        <option value="4">Milli Hazineden (Satılamayan)</option>
                                        <option value="9">Özelleştirme İdaresinden</option>
                                        <option value="8">İnşaat Firmasından</option>
                                        <option value="6">Diğer Kamu Kurumlarından</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>İl</label>
                                    <select class="form-control select2" style="width: 100%;" id="slctprovi"></select>
                                </div>
                                <div class="form-group">
                                    <label>İlçe</label>
                                    <select class="form-control select2" style="width: 100%;" id="slctdist"></select>
                                </div>
                                <div class="form-group">
                                    <label>Mahalle</label>
                                    <select class="form-control select2" style="width: 100%;" id="slctneig"></select>
                                </div>
                                <div>
                                    <label>Fiyat</label>
                                    <div class="clearfix"></div>
                                    <div class="form-group col-xs-6" style="padding-left: 0">
                                        <input class="form-control" placeholder="min. fiyat" id="inminprice" />
                                    </div>
                                    <div class="form-group col-xs-6" style="padding-right: 0">
                                        <input class="form-control" placeholder="max. fiyat" id="inmaxprice" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Tarih Aralığı</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="reservation" />
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->
                                <div class="form-group">
                                    <label>İlan Tarihi</label>
                                    <div class="form-group" id="rddaterange" style="border: dashed; border-radius: 25px; border-color: #1bc0a3; padding: 8px;">
                                        <label>
                                            <input value="1" type="radio" name="daterange" class="daterangecls" />
                                            Son 1 Gün</label><br />
                                        <label>
                                            <input value="3" type="radio" name="daterange" class="daterangecls" />
                                            Son 3 Gün
                                        </label>
                                        <br />
                                        <label>
                                            <input value="7" type="radio" name="daterange" class="daterangecls" />
                                            Son 1 Hafta</label><br />
                                        <label>
                                            <input value="15" type="radio" name="daterange" class="daterangecls" />
                                            Son 15 Gün
                                        </label>
                                        <br />
                                        <label>
                                            <input value="30" type="radio" name="daterange" class="daterangecls" />
                                            Son 1 Ay</label><br />
                                        <label>
                                            <input value="-1" type="radio" name="daterange" class="daterangecls" />
                                            Seçim Yok</label><br />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input value="1" type="checkbox" name="daterange" class="checkbox_check1" />
                                        İlan resmi olmayanlar</label><br />
                                </div>
                                <div class="form-group">
                                    <label>
                                        <input value="1" type="checkbox" name="daterange" class="checkbox_check2" />
                                        İlan koordinatı olmayanlar</label><br />
                                </div>
                                <label>İlan No</label>
                                <div class="clearfix"></div>
                                <div class="form-group" style="padding-left: 0">
                                    <input class="form-control" placeholder="İlan no" id="adsno" />
                                </div>
                                <input type="button" class="form control btn btn-success btn-block" id="filter" value="Filtrele" />

                                <%--<asp:Button ID="Filter" runat="server" CssClass="btn btn-success" Text="Filtrele" />--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
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
                                        <th>İl</th>
                                        <th>İlanı Ekleyen</th>
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
            </div>
        </section>
    </div>
    <script src='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/moment.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/daterangepicker.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/select2/select2.full.min.js")%>'></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>

    <script type="text/javascript">
        $(function () {
            //Initialize Select2 Elements
            $(".select2").select2();

            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });

            $('#reservation').daterangepicker();

            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });
        });

        $(document).ready(function () {
            GetLocation(-1, -1, 1);
            $("#slctprovi").val("1");
        });

        function GetLocation(proid, distid, opt) {
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListLocation",
                dataType: "json",
                data: "{ provid:'" + proid + "'" + ", distid:'" + distid + "'" + ", opt:'" + opt + "' }",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var d = JSON.parse(data.d);

                    if (opt == 1) {
                        $("#slctprovi").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].ilId + "'>" + d[i].ilAdi + "</option>";
                            $("#slctprovi").append(appnd);

                        }
                    }
                    if (opt == 2) {
                        $("#slctdist").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].ilceId + "'>" + d[i].ilceAdi + "</option>";
                            $("#slctdist").append(appnd);

                        }
                    }
                    if (opt == 3) {
                        $("#slctneig").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].mahalleId + "'>" + d[i].mahalleAdi + "</option>";
                            $("#slctneig").append(appnd);

                        }
                    }

                },
                error: function (e) {

                }

            });
        }

        $("#slctprovi").change(function () {
            $("#slctdist").empty();
            GetLocation($(this).val(), -1, 2);
            $("slctdist").val(0);

        });

        $("#slctdist").change(function () {
            $("#slctneig").empty();
            GetLocation(-1, $(this).val(), 3);
            $("slctneig").val(0);

        });

        $("#filter").click(function () {
            getListFiltre();

            //var table = $('#example').DataTable();

            //table
            //    .clear()
            //    .draw();

        });
        var adsno;
        var _income;
        var _intext;
        var gelismisTarih;

        function getListFiltre() {
            //var itemilId = $("#slctprovi :selected").text();
            ilId = $("#slctprovi").val();
            if (ilId == null) {
                ilId = -1;
            }
            ilceId = $("#slctdist").val();
            if (ilceId == null) {
                ilceId = -1;
            }
            mahalleId = $("#slctneig").val();
            if (mahalleId == null) {
                mahalleId = -1;
            }
            kimdenId = $("#slctwho").val();
            if (kimdenId == null) {
                kimdenId = -1;
            }
            fiyatMax = $("#inmaxprice").val();
            fiyatMin = $("#inminprice").val();
            tarihAralik = $('.daterangecls:checked').val();
            if (tarihAralik == null) {
                tarihAralik = -1;
            }

            gelismisTarih = $("#reservation").val();

            var data1 = -1;
            var data2 = -1;
            if ($('input.checkbox_check1').is(':checked')) {
                data1 = 1;
            }
            else {
                data1 = -1;
            }

            if ($('input.checkbox_check2').is(':checked')) {
                data2 = 1;
            }
            else {
                data2 = -1;
            }

            var catId = -1;
            var turId = -1;
            if (catId == null) {
                catId = -1;
            }
            if (turId == null) {
                turId = -1;
            }


            var itemfiyat = new ItemDataFiyat();
            itemfiyat.Max = fiyatMax;
            itemfiyat.Min = fiyatMin;

            var dataintext = new DataTypeIntext();

            dataintext.FiyatData = itemfiyat;


            adsno = $("#adsno").val();
            _income = [catId, turId, ilId, ilceId, mahalleId, kimdenId, tarihAralik, -1, data1, data2];
            _intext = [itemfiyat];


            getListFilteWithAjax(_income, dataintext);

        }

        function ItemDataFiyat() {
            this.Max;
            this.Min;
        }

        function DataTypeIntext() {
            this.ListDrop;
            this.ListText;
            this.FiyatData;
            this.isCoordinates = false;


        }
        //var table = $('#example').DataTable();

        function getListFilteWithAjax(_income, _intext) {
            //$('#example').clear();
            var _incomestr = JSON.stringify(_income);
            //var table = $('#example').DataTable();

            var _intextstr = JSON.stringify(_intext);

            $('#example').DataTable({
                columns: [
             { "data": "ilanId" },
             { "data": "ilAdi" },
             { "data": "resim" },
             { "data": "fiyat" },
             { "data": "baslangicTarihi" },
             { "data": "aciklama" }
                ],
                processing: true,
                serverSide: true,
                sAjaxSource: "/services/ki_ai.ashx?data=filterdata",
                fnServerParams: function (aoData) {
                    aoData.push({ "name": "_incomestr", "value": _incomestr });
                    aoData.push({ "name": "_intextstr", "value": _intextstr });
                    aoData.push({ "name": "_inadsno", "value": adsno });
                    aoData.push({ "name": "_indaterange", "value": gelismisTarih });


                },
                sServerMethod: "post",
                bDestroy: true,
                oLanguage: {
                    sProcessing: "<img src='../libraries/images/loading.gif'>"
                }
            });
        }
    </script>
</asp:Content>
