<%@ Page Title="İlan Başarılı - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ilan-tamam.aspx.cs" Inherits="PL.ilan_tamam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <style>
        .modal .modal-header {
            border-bottom: none;
            position: relative;
        }

            .modal .modal-header .btn {
                position: absolute;
                top: 0;
                right: 0;
                margin-top: 0;
                border-top-left-radius: 0;
                border-bottom-right-radius: 0;
            }

        .modal .modal-footer {
            border-top: none;
            padding: 0;
        }

            .modal .modal-footer .btn-group > .btn:first-child {
                border-bottom-left-radius: 0;
            }

            .modal .modal-footer .btn-group > .btn:last-child {
                border-top-right-radius: 0;
                border-bottom-right-radius: 0;
            }

        .pricing-table .plan {
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

        .wizard {
        }

            .wizard .nav-tabs {
                position: relative;
                margin: 40px auto;
                margin-bottom: 0;
                border-bottom-color: #e0e0e0;
            }

            .wizard > div.wizard-inner {
                position: relative;
            }

        .connecting-line {
            height: 2px;
            background: #e0e0e0;
            position: absolute;
            width: 80%;
            margin: 0 auto;
            left: 0;
            right: 0;
            top: 50%;
            z-index: 1;
        }

        .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
            color: #555555;
            cursor: default;
            border: 0;
            border-bottom-color: transparent;
        }

        span.round-tab {
            width: 70px;
            height: 70px;
            line-height: 70px;
            display: inline-block;
            border-radius: 100px;
            background: #fff;
            border: 2px solid #e0e0e0;
            z-index: 2;
            position: absolute;
            left: 0;
            text-align: center;
            font-size: 25px;
        }

            span.round-tab i {
                color: #555555;
            }

        .wizard li.active span.round-tab {
            background: #fff;
            border: 2px solid #16A085;
        }

            .wizard li.active span.round-tab i {
                color: #16A085;
            }

        span.round-tab:hover {
            color: #333;
            border: 2px solid #333;
        }

        .wizard .nav-tabs > li {
            width: 20%;
        }

        .wizard li:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 0;
            margin: 0 auto;
            bottom: 0px;
            border: 5px solid transparent;
            border-bottom-color: #16A085;
            transition: 0.1s ease-in-out;
        }

        .wizard li.active:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 1;
            margin: 0 auto;
            bottom: 0px;
            border: 10px solid transparent;
            border-bottom-color: #16A085;
        }

        .wizard .nav-tabs > li a {
            width: 70px;
            height: 70px;
            margin: 20px auto;
            border-radius: 100%;
            padding: 0;
        }

            .wizard .nav-tabs > li a:hover {
                background: transparent;
            }

        .wizard .tab-pane {
            position: relative;
            padding-top: 50px;
        }

        .wizard h3 {
            margin-top: 0;
        }

        @media( max-width : 585px ) {

            .wizard {
                width: 90%;
                height: auto !important;
            }

            span.round-tab {
                font-size: 16px;
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard .nav-tabs > li a {
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard li.active:after {
                content: " ";
                position: absolute;
                left: 35%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <section>
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="disabled">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="En Uygun Kategoriyi Seç">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-play"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="İlanını Bilgilerle Doldur">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-forward"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Hızlı Satışı Gör">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-pause"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab" title="Satışının Karşılığını Gör">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-fast-forward"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="active">
                                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Artık kralilan.com'da Yayındasın">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-ok"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div role="form">
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="step1">
                                    <div class="intro-inner">
                                        <div class="about-intro" style="box-shadow: inset 250px 250px 250px 450px rgba(0, 0, 128, 0.54); background-size: cover;">
                                            <div class="dtable hw100">
                                                <div class="dtable-cell hw100">
                                                    <div class="container text-center">
                                                        <h1 class="intro-title animated fadeInDown"><span class="ion ion-speakerphone" style="margin-right: 15px;"></span>kralilan.com'da yayındasın... </h1>
                                                        <h2><%= ilanNo %> numaralı ilanında gerekli onay kontrolleri yapıldıktan sonra ilanının birçok alıcının favori listelerine alınacaktır.</h2>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/.about-intro -->
                                    </div>
                                    <!-- /.intro-inner -->
                                    <!-- /.intro-inner -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script>
        $("#devam").click(function () {

            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                $(".clickMe").click();
                $("#odeme_tutar").text($("#toplamTutar").text());
            });
        });
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
</asp:Content>
