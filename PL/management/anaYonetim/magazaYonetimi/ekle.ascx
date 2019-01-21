<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ekle.ascx.cs" Inherits="PL.management.anaYonetim.magazaYonetimi.ekle" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mağaza Ekle
            <small>bu alandan mağaza ekleyebilirsin.</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Bana özel</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <a href="/management/araclar/araclar.aspx?page=gelenkutusu" ><i class="fa fa-inbox"></i>Gelen Kutusu </a></li>
                                <a href="/management/araclar/araclar.aspx?page=gonderilen-kutusu"><i class="fa fa-envelope-o"></i>Gönderilen Kutusu</a></li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Online Kullanıcılar</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
<%--                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <asp:Repeater ID="onlineRepeater" runat="server">
                                <ItemTemplate>
                                    <li><a href="#"><i class="fa fa-circle text-success"></i><%# Eval("kullaniciAdSoyad") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>--%>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- left column -->
            <div class="col-md-9">
                <!-- general form elements -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">Mağaza Bilgileri</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label for="adminmail">Mağaza Yönetici E-postası</label>
                                    <input type="text" class="form-control"name="adminmail" id="adminmail">
                                </div>
                                <div class="form-group">
                                    <label for="adminname">Yönetici Ad Soyad</label>
                                    <input type="text" class="form-control" name="adminname" id="adminname" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="storename">Mağaza Adı</label>
                                    <input type="text" class="form-control" name="storename" id="storename">
                                </div>
                                <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                    <div class="form-group" id="rddaterange">
                                        <label>
                                            <input value="0" type="radio" name="daterange" class="daterangecls" />
                                            Bireysel</label><br />
                                        <label>
                                            <input value="1" type="radio" name="daterange" class="daterangecls" />
                                            Kurumsal
                                        </label>
                                    </div>
                                </div>

                                <%--                                <div class="form-group">
                                    <label class="col-md-3 control-label">Hesap Tipi</label>
                                    <div class="col-md-9">
                                        <asp:RadioButtonList ID="rdKurumsal" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdKurumsal_SelectedIndexChanged" AutoPostBack="true" Height="29px" Width="267px">
                                            <asp:ListItem Value="False" Selected> Bireysel</asp:ListItem>
                                            <asp:ListItem Value="True"> Kurumsal</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>--%>
                                <div class="form-group">
                                    <label>Cep Telefonu</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' name="phone1" data-mask id="phone1">
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <div class="form-group">
                                    <label>İş Telefonu</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' name="phone2" data-mask id="phone2">
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <div class="form-group">
                                    <label>İl</label>
                                    <select class="form-control select2 slctprovi" name="slctprovi" style="width: 100%;" id="slctprovi"></select>
                                </div>
                                <div class="form-group">
                                    <label>İlçe</label>
                                    <select class="form-control select2 slctdist" style="width: 100%;" name="slctdist" id="slctdist"></select>
                                </div>
                                <div class="form-group">
                                    <label>Mahalle</label>
                                    <select class="form-control select2 slctneig" style="width: 100%;" name="slctneig" id="slctneig"></select>
                                </div>
                                <div class="form-group">
                                    <label>TC Kimlik No / Vergi No</label>
                                    <input type="text" class="form-control" id="uniquekey" name="uniquekey">
                                </div>
                                <div class="form-group">
                                    <label>Vergi Dairesi</label>
                                    <select class="form-control select2 slcttax" style="width: 100%;" id="slcttax" name="slcttax"></select>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet ve Devam Et" OnClick="Kaydet_Click" />
                            <asp:Button ID="Vazgec" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgec_Click" />
                        </div>
                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</div>

<!-- Select2 -->
<script src="../../plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
        //Money Euro
        $("[data-mask]").inputmask();
    });
</script>
<script>
    $(document).ready(function () {
        GetLocation(-1, -1, 1);
        $(".slctprovi").val("1");
        //Initialize tooltips
        $('.nav-tabs > li a[title]').tooltip();

        //Wizard
        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

            var $target = $(e.target);

            if ($target.parent().hasClass('disabled')) {
                return false;
            }
        });

        $(".next-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);

        });
        $(".prev-step").click(function (e) {

            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);

        });
    });

    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
    }
    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }


    function GetLocation(proid, distid, opt) {
        jQuery.ajax({
            type: "POST",
            url: "/enpoint/locationservice.asmx/GetLocation",
            dataType: "json",
            data: "{ RegionId:'" + proid + "'" + ", CityId:'" + distid + "' }",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var d = JSON.parse(data.d);

                if (opt == 1) {
                    $(".slctprovi").append("<option value='-1' selected='selected'>Seçiniz</option>");
                    for (var i = 0; i < d.length; i++) {
                        var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                        $(".slctprovi").append(appnd);

                    }
                }
                if (opt == 2) {
                    $(".slctdist").append("<option value='-1' selected='selected'>Seçiniz</option>");
                    for (var i = 0; i < d.length; i++) {
                        var appnd = "<option value='" + d[i].IlceId + "'>" + d[i].IlceAdi + "</option>";
                        $(".slctdist").append(appnd);

                    }
                }
                if (opt == 3) {
                    $(".slctneig").append("<option value='-1' selected='selected'>Seçiniz</option>");
                    for (var i = 0; i < d.length; i++) {
                        var appnd = "<option value='" + d[i].MahalleId + "'>" + d[i].MahalleAdi + "</option>";
                        $(".slctneig").append(appnd);

                    }
                }

            },
            error: function (e) {

            }

        });
    }

    function GetTax(proid) {
        jQuery.ajax({
            type: "POST",
            url: "/endpoint/vergidaireservice.asmx/GetByRegionId",
            dataType: "json",
            data: "{ RegionId:'" + proid + "' }",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var d = JSON.parse(data.d);
                $(".slcttax").append("<option value='-1' selected='selected'>Seçiniz</option>");
                for (var i = 0; i < d.length; i++) {
                    var appnd = "<option value='" + d[i].VergiDaireId + "'>" + d[i].VergiDairesi + "</option>";
                    $(".slcttax").append(appnd);

                }
            },
            error: function (e) {

            }

        });
    }

    $(".slctprovi").change(function () {
        $(".slctdist").empty();
        GetLocation($(this).val(), -1, 2);
        $(".slctdist").val(0);
        $(".slcttax").empty();
        GetTax($(this).val());
        $(".slcttax").val(0);
    });

    $(".slctdist").change(function () {
        $(".slctneig").empty();
        GetLocation(-1, $(this).val(), 3);
        $(".slctneig").val(0);

    });


    jQuery('#adminmail').focusout(function () {
        var mail = $("#adminmail").val();

        if (mail != "") {
            ctrlUser(mail);
        }
    });

    function ctrlUser(_inmail) {
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_api.asmx/giveMeUserInfo",
            dataType: "json",
            data: "{ mail:'" + _inmail + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data != null) {
                    var d = JSON.parse(data.d);
                    $("#adminname").val(d.kullaniciAdSoyad);
                }
            },
            error: function (e) {
                var s;
                s = e;
            }
        });
    }
</script>




<%--<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
<script>
    $(function () {
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $('input').iCheck({
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });

        });
    });
</script>--%>

