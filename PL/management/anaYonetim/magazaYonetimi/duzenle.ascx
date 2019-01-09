<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="duzenle.ascx.cs" Inherits="PL.management.anaYonetim.magazaYonetimi.duzenle" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mağaza Düzenle
            <small>buradan mağaza düzenleyebilirsiniz.</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <section>
                <div role="form">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="step1">
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
                                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gelenkutusu" runat="server"><i class="fa fa-inbox"></i>Gelen Kutusu </asp:HyperLink></li>
                                            <li>
                                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gonderilen-kutusu" runat="server"><i class="fa fa-envelope-o"></i>Gönderilen Kutusu</asp:HyperLink></li>
                                        </ul>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /. box -->

                                <!-- /.box -->
                            </div>
                            <!-- left column -->
                            <div class="col-md-9">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Mağaza Bilgileri</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <asp:ScriptManager runat="server" />
                                    <div role="form">
                                        <div class="box-body">
                                            <div>
                                                <div class="form-group">
                                                    <label for="txtMagazaAdi">Mağaza Adı</label>
                                                    <input type="text" class="form-control" id="txtMagazaAdi" runat="server">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Hesap Tipi</label>
                                                    <div class="col-md-9">
                                                        <asp:UpdatePanel runat="server">
                                                            <ContentTemplate>
                                                                <asp:RadioButtonList ID="rdKurumsal" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdKurumsal_SelectedIndexChanged" AutoPostBack="true" Height="29px" Width="267px">
                                                                    <asp:ListItem Value="False"> Bireysel</asp:ListItem>
                                                                    <asp:ListItem Value="True"> Kurumsal</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>İş Telefonu</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                        <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server" id="txtIsTlf">
                                                    </div>
                                                    <!-- /.input group -->
                                                </div>
                                                <div class="form-group">
                                                    <label>İş Telefonu 2</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-phone"></i>
                                                        </div>
                                                        <input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server" id="txtIsTlf2">
                                                    </div>
                                                    <!-- /.input group -->
                                                </div>
                                                <!-- /input-group image-preview [TO HERE]-->
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <div class="form-group">
                                                            <label>İl</label>
                                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>İlce</label>
                                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIlce" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIlce_SelectedIndexChanged"></asp:DropDownList>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Mahalle</label>
                                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpMahalle" runat="server"></asp:DropDownList>
                                                        </div>
                                                        <!-- /.form-group -->
                                                        <div class="form-group">
                                                            <label id="lblTc" runat="server">TC Kimlik No</label>
                                                            <input type="text" class="form-control" id="txtTcNo" runat="server">
                                                        </div>
                                                        <!-- /.form-group -->
                                                        <div class="form-group" id="vergiPnl" runat="server">
                                                            <label>Vergi Dairesi</label>
                                                            <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpVergi" runat="server"></asp:DropDownList>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
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
                            <!--/.col (left) -->
                            <!-- right column -->
                            <!--/.col (right) -->
                            <%--                                <ul class="list-inline pull-right">
                                    <li>
                                        <button type="button" class="btn btn-primary next-step">Kaydet ve Devam Et</button></li>
                                </ul>--%>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="step2">

                            <%--                                <ul class="list-inline pull-right">
                                    <li>
                                        <button type="button" class="btn btn-default prev-step">Geri</button></li>
                                    <li>
                                        <button type="button" class="btn btn-primary next-step">Kaydet ve Devam Et</button></li>
                                </ul>--%>
                        </div>
                        <div class="tab-pane" role="tabpanel" id="complete">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </section>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
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
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            //Initialize Select2 Elements
            $(".select2").select2();
        });

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
</script>
