<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="kategori-secimi.ascx.cs" Inherits="PL.management.anaYonetim.magazaYonetimi.ekle_detay" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>'>

<style>
    .coupon {
        border: 3px dashed #bcbcbc;
        border-radius: 10px;
       
    }

        .coupon #head {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            min-height: 56px;
        }

        .coupon #footer {
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

    #title .visible-xs {
        font-size: 12px;
    }

    .coupon #title img {
        font-size: 30px;
        height: 30px;
        margin-top: 5px;
    }

    @media screen and (max-width: 500px) {
        .coupon #title img {
            height: 15px;
        }
    }

    .coupon #title span {
        float: right;
        margin-top: 5px;
        text-transform: uppercase;
    }

    .coupon-img {
        width: 100%;
        margin-bottom: 15px;
        padding: 0;
    }

    .items {
        margin: 15px 0;
    }

    .usd, .cents {
        font-size: 20px;
    }

    .number {
        font-size: 40px;
    }

    sup {
        top: -15px;
    }

    #business-info ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
        text-align: center;
    }

        #business-info ul li {
            display: inline;
            text-align: center;
        }

            #business-info ul li span {
                text-decoration: none;
                padding: .2em 1em;
            }

                #business-info ul li span i {
                    padding-right: 5px;
                }

    .disclosure {
        padding-top: 15px;
        font-size: 11px;
        color: #bcbcbc;
        text-align: center;
    }

    .coupon-code {
        color: #333333;
        font-size: 11px;
    }

    .exp {
        color: #f34235;
    }

    .print {
        font-size: 14px;
        float: right;
    }

    /*------------------dont copy these lines----------------------*/

    .row {
        margin: 30px 0;
    }

    #quicknav ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
        text-align: center;
    }

        #quicknav ul li {
            display: inline;
        }

            #quicknav ul li a {
                text-decoration: none;
                padding: .2em 1em;
            }

    .btn-danger,
    .btn-success,
    .btn-info,
    .btn-warning,
    .btn-primary {
        width: 105px;
    }

    .btn-default {
        margin-bottom: 40px;
    }
    /*-------------------------------------------------------------*/
</style>
<style>
    .pricing-table .plan {
        margin-left: 0px;
        border-radius: 5px;
        text-align: center;
        background-color: #f3f3f3;
        -moz-box-shadow: 0 0 6px 2px #b0b2ab;
        -webkit-box-shadow: 0 0 6px 2px #b0b2ab;
        box-shadow: 0 0 6px 2px #b0b2ab;
    }

    .plan:hover {
        background-color: #fff;
        -moz-box-shadow: 0 0 12px 3px #b0b2ab;
        -webkit-box-shadow: 0 0 12px 3px #b0b2ab;
        box-shadow: 0 0 12px 3px #b0b2ab;
    }

    .plan {
        padding: 20px;
        margin-left: 0px;
        color: #ff;
        background-color: #5e5f59;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .plan-name-bronze {
        padding: 20px;
        color: #fff;
        background-color: #665D1E;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .plan-name-silver {
        padding: 20px;
        color: #fff;
        background-color: #C0C0C0;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .plan-name-gold {
        padding: 20px;
        color: #fff;
        background-color: #FFD700;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .pricing-table-bronze {
        padding: 20px;
        color: #fff;
        background-color: #f89406;
        -moz-border-radius: 5px 5px 0 0;
        -webkit-border-radius: 5px 5px 0 0;
        border-radius: 5px 5px 0 0;
    }

    .pricing-table .plan .plan-name span {
        font-size: 20px;
    }

    .pricing-table .plan ul {
        list-style: none;
        margin: 0;
        -moz-border-radius: 0 0 5px 5px;
        -webkit-border-radius: 0 0 5px 5px;
        border-radius: 0 0 5px 5px;
    }

        .pricing-table .plan ul li.plan-feature {
            padding: 15px 10px;
            border-top: 1px solid #c5c8c0;
            margin-right: 35px;
        }

    .pricing-three-column {
        margin: 0 auto;
        width: 80%;
    }

    .pricing-variable-height .plan {
        float: none;
        margin-left: 2%;
        vertical-align: bottom;
        display: inline-block;
        zoom: 1;
        *display: inline;
    }

    .plan-mouseover .plan-name {
        background-color: #4e9a06 !important;
    }

    .btn-plan-select {
        padding: 8px 25px;
        font-size: 18px;
    }
</style>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Mağaza Detay Ekle
            <small>bu alandan detay ekleyebilirsiniz.</small>
        </h1>
<%--        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
        </ol>--%>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="main-container">
                <div class="container">
                    <div class="row form-group">
                        <div class="col-xs-12">
                            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                <li class="active"><a href="#step-1">
                                    <h4 class="list-group-item-heading"><i class="fa fa-archive fa-2x"></i></h4>
                                    <p class="list-group-item-text">Mağaza Seçimi</p>
                                </a></li>
                                <li class="disabled"><a href="#step-2">
                                    <h4 class="list-group-item-heading"><i class="fa fa-ticket fa-2x"></i></h4>
                                    <p class="list-group-item-text">Mağaza Tipi</p>
                                </a></li>
                                <li class="disabled"><a href="#step-3">
                                    <h4 class="list-group-item-heading"><i class="fa fa-object-group fa-2x"></i></h4>
                                    <p class="list-group-item-text">İçerik</p>
                                </a></li>
                                <li class="disabled"><a href="#step-4">
                                    <h4 class="list-group-item-heading"><i class="fa fa-credit-card fa-2x"></i></h4>
                                    <p class="list-group-item-text">Ödeme</p>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-1">
                        <div class="col-xs-12">
                            <div class="panel panel-primary coupon">
                                <div class="panel-footer">
  <%--                                  <asp:RadioButtonList ID="rdKategori" runat="server" Height="59px" Width="922px">
                                    </asp:RadioButtonList>--%>
                               <div class="form-group" style="padding: 5px;">
                                    <div class="form-group" id="rddaterange">
                                        <label>
                                            <input value="1" type="radio" name="daterange" class="daterangecls" />
                                            Emlak</label><br />
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="col-xs-1 col-xs-offset-11">
                                <asp:Button ID="devam" runat="server" CssClass="btn btn-success" Text="Devam Et" OnClick="devam_Click" Style="float: right; margin-top: 15px;" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
<!-- /.row -->
</section>
    <!-- /.content -->
</div>
<script>
    $(document).ready(function () {

        var navListItems = $('ul.setup-panel li a'),
            allWells = $('.setup-content');

        allWells.hide();

        navListItems.click(function (e) {
            e.preventDefault();
            var $target = $($(this).attr('href')),
                $item = $(this).closest('li');

            if (!$item.hasClass('disabled')) {
                navListItems.closest('li').removeClass('active');
                $item.addClass('active');
                allWells.hide();
                $target.show();
            }
        });

        $('ul.setup-panel li.active a').trigger('click');

        // DEMO ONLY //
        $('#activate-step-2').on('click', function (e) {
            $('ul.setup-panel li:eq(1)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-2"]').trigger('click');
            $(this).remove();
        })
        $('#activate-step-3').on('click', function (e) {
            $('ul.setup-panel li:eq(1)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-3"]').trigger('click');
            $(this).remove();
        })
    });


</script>
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
<script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
<script>
    $(function () {
        $('input').iCheck({
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>