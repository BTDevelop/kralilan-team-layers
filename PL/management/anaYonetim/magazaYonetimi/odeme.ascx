<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="odeme.ascx.cs" Inherits="PL.management.anaYonetim.magazaYonetimi.ödeme" %>
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
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
            <small>buradan mağaza detay ekleyebilirsiniz.</small>
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
                                <li class="disabled"><a href="#step-1">
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
                                <li class="active"><a href="#step-4">
                                    <h4 class="list-group-item-heading"><i class="fa fa-credit-card fa-2x"></i></h4>
                                    <p class="list-group-item-text">Ödeme</p>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <div class="row setup-content" id="step-1">
                        </div>
                    </div>
                    <div class="row setup-content" id="step-2">
                        <div class="col-xs-12">
                            <div class="row">
                            </div>

                        </div>
                    </div>
                    <div class="row setup-content" id="step-3">
                        <div class="col-xs-12">
                        </div>
                    </div>
                    <div class="row setup-content" id="step-4">
<div role="form">
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="step1">
                                    <style>
                                        .cat-list {
                                            width: 100%;
                                            min-height: 200px;
                                            background-color: #f2f2f2;
                                            outline: none;
                                            border: 1px solid #a9a9a9;
                                            margin: 14px 0;
                                            overflow-y: auto;
                                            cursor: pointer;
                                        }

                                            .cat-list:focus {
                                                outline: none;
                                            }

                                        .kategoriler {
                                            background: white;
                                            height: 245px;
                                            overflow: scroll;
                                            overflow-y: hidden;
                                        }

                                        .tamam {
                                            font-size: 20px;
                                            line-height: 28px;
                                            padding-top: 86px;
                                            height: 200px;
                                            margin-top: 14px;
                                            border: 1px solid #a9a9a9;
                                            color: #a9a9a9;
                                            text-align: center;
                                            display: block;
                                            background-color: #f2f2f2;
                                            font-weight: bold;
                                        }

                                        .categories {
                                            width: 200px;
                                            height: 200px;
                                            float: left;
                                            margin-left: 15px;
                                            margin-right: 15px;
                                        }

                                        .input-remove-row span {
                                            cursor: pointer;
                                        }
                                    </style>
                                    <section class="content" style="background: #fff; padding-bottom: 15px; min-height:500px;">
                                        <div class="alert alert-success">
                                            <p style="font-size:20px;"><%= Request.QueryString["sto"].ToString() %> numaralı mağaza başarıyla kaydedilmiştir.</p>
                                        </div>
                                        <div class="col-xs-4 center-block" style="float:none">
                                            <label style="text-align:center; font-size:24px;"><%= magazaPaket %> Mağaza Paket Ücreti <br /><br /> <span style="color:#b51818; background:#e0e0e0; padding:0 10px;"> &#x20BA; <%= magazaFiyat %> </span><br /><br />
                                            </label>
                                        </div>
                                    </section>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row setup-content" id="step-5">
                        <div class="col-xs-12">
                        </div>
                    </div>
                    <div class="row setup-content" id="step-6">
                        <div class="col-xs-12">
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
    function calc_total() {
        var sum = 0;
        $('.input-amount').each(function () {
            sum += parseFloat($(this).text());
        });
        $(".preview-total").text(sum);
    }
    $(document).on('click', '.input-remove-row', function () {
        var tr = $(this).closest('tr');
        tr.fadeOut(200, function () {
            tr.remove();
            calc_total()
        });
    });

    $(function () {
        $('.preview-add-button').click(function () {
            var form_data = {};
            form_data["concept"] = $('.payment-form input[name="concept"]').val();
            form_data["description"] = $('.payment-form input[name="description"]').val();
            form_data["amount"] = parseFloat($('.payment-form input[name="amount"]').val()).toFixed(2);
            form_data["status"] = $('.payment-form #status option:selected').text();
            form_data["date"] = $('.payment-form input[name="date"]').val();
            form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
            var row = $('<tr></tr>');
            $.each(form_data, function (type, value) {
                $('<td class="input-' + type + '"></td>').html(value).appendTo(row);
            });
            $('.preview-table > tbody:last').append(row);
            calc_total();
        });
    });
</script>
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
