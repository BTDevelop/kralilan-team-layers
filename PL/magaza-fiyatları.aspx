<%@ Page Title="kralilan: Neden Mağaza Açmalıyım?" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="magaza-fiyatları.aspx.cs" Inherits="PL.magaza_fiyatları" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .toggle-header {
            padding: 10px 0;
            margin: 10px 0;
            background-color: black;
            color: white;
        }

        .txt-green {
            color: green;
        }

        .txt-red {
            color: red;
        }
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
    <style>
        .coupon {
            border: 3px dashed #bcbcbc;
            border-radius: 10px;
            font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
            font-weight: 300;
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
            font-weight: 700;
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
            font-weight: 700;
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
    <div class="intro-inner">
        <div class="about-intro" style="background: url(../libraries/images/bg2.jpg) no-repeat center; background-size: cover;">
            <div class="dtable hw100">
                <div class="dtable-cell hw100">
                    <div class="container text-center">
                        <h1 class="intro-title animated fadeInDown"><span class="ion ion-briefcase" style="margin-right: 15px;"></span>Neden Mağaza Açmalıyım? </h1>
                    </div>
                </div>
            </div>
        </div>
        <!--/.about-intro -->
    </div>
    <%--        <div class="main-container inner-page">
        <div class="container">
            
        </div>
    </div>--%>
    <div class="main-container">
        <div class="container">
            <div class="section-content">
                <div class="row ">
                    <h1 class="text-center ">kralilan.com <strong>Neden Mağaza Açmalıyım?</strong></h1>
                    <hr class="center-block small text-hr">
                </div>
                <div class="faq-content">
                    <div aria-multiselectable="true" role="tablist" id="accordion" class="panel-group faq-panel">
                        <div class="panel">
                            <div id="headingOne" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseOne" aria-expanded="true" href="#collapseOne"
                                        data-parent="#accordion" data-toggle="collapse">Neden Mağaza Açmalıyım?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingOne" role="tabpanel" class="panel-collapse collapse in"
                                id="collapseOne">
                                <div class="panel-body">
                                    <div class="row form-group">
                                        <div class="col-xs-12">
                                            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                                <li class="active"><a href="#step-1">
                                                    <h4 class="list-group-item-heading"><i class="fa fa-home fa-3x"></i></h4>
                                                    <p class="list-group-item-text">Emlak</p>
                                                </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row setup-content" id="step-1">
                                        <%--  <div class="col-xs-12">--%>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="panel panel-default coupon">
                                                    <div class="panel-heading" id="head">
                                                        <div class="panel-title" id="title">
                                                            <img src="#">
                                                            <span class="hidden-xs">Standart Mağaza</span>
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <img src="#" class="coupon-img img-rounded">
                                                        <div class="col-md-4">
                                                            <ul class="items">
                                                                <li>İlanlarda 10 adet fotoğraf</li>
                                                                <li>Mağazanıza ait 5 kullanıcı hesabı</li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="offer">
                                                                <span class="usd"><sup>6 Aylık Fiyat</sup></span>
                                                                <span class="number">
                                                                    <asp:Label ID="altiStn" runat="server"></asp:Label></span>
                                                                <span class="usd"><sup>TL/Ay</sup></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="offer">
                                                                <span class="usd"><sup>12 Aylık Fiyat</sup></span>
                                                                <span class="number">
                                                                    <asp:Label ID="onIkiStn" runat="server"></asp:Label></span>
                                                                <span class="usd"><sup>TL/Ay</sup></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <p class="disclosure">
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="panel-footer">
                                                        <div class="form-group" style="padding: 5px;">
                                                            <div class="form-group" id="rddaterange">
                                                                <label>
                                                                    6 Aylık Mağaza = <%= stdHalfPrice %> TL
                                                                </label>
                                                                <br />
                                                                <label>
                                                                    12 Aylık Mağaza = <%= stdFullPrice %> TL
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="panel panel-default coupon">
                                                    <div class="panel-heading" id="head">
                                                        <div class="panel-title" id="title">
                                                            <img src="#">
                                                            <span class="hidden-xs">Premium Mağaza</span>
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <img src="#" class="coupon-img img-rounded">
                                                        <div class="col-md-4">
                                                            <ul class="items">
                                                                <li>İlanlarda 10 adet fotoğraf</li>
                                                                <li>Mağazanıza ait 5 kullanıcı hesabı</li>
                                                                <li>Kategori Vitrin %50 indirimli!</li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="offer">
                                                                <span class="usd"><sup>6 Aylık Fiyat</sup></span>
                                                                <span class="number">
                                                                    <asp:Label ID="altiPre" runat="server" /></span>
                                                                <span class="usd"><sup>TL/Ay</sup></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="offer">
                                                                <span class="usd"><sup>12 Aylık Fiyat</sup></span>
                                                                <span class="number">
                                                                    <asp:Label ID="onIkiPre" runat="server" /></span>
                                                                <span class="usd"><sup>TL/Ay</sup></span>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <p class="disclosure">
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="panel-footer">
                                                        <div class="form-group" style="padding: 5px;">
                                                            <div class="form-group" id="rddaterange1">
                                                                <label>
                                                                    6 Aylık Mağaza = <%= prmHalfPrice %> TL
                                                                </label>
                                                                <br />
                                                                <label>
                                                                    12 Aylık Mağaza = <%= prmFullPrice %> TL
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--</div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="parallaxbox about-parallax-bottom">
        <div class="container">
            <div class="row text-center featuredbox">
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-book-open ln-shadow-box shape-3"></i></div>
                        <h3 class="title-4">Ücretsiz İlanlar Ver</h3>
                        <p>
                            kralilan.com'da her kategoriden ilan vermek tamamen ücretsiz herşey senin elinden yayınla paylaş satış yap.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class=" icon-lightbulb ln-shadow-box shape-2"></i></div>
                        <h3 class="title-4">Aklındaki ilanı hemen bul</h3>
                        <p>
                            kralilan.com'a has özellikleri kullanarak ihtiyacına uygun ilanı hemen bul satıcıyla görüş anlaş.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-megaphone ln-shadow-box shape-7"></i></div>
                        <h3 class="title-4">İlanların Geniş Kitleye Yayılsın.</h3>
                        <p>
                            kralilan.com geniş yayın ağıyla ilanının satıcıyla hemen buluşsun istersen hemen ilan ver.
                        </p>
                    </div>
                </div>
            </div>
        </div>
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
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/owl.carousel.min.js") %>'></script>

</asp:Content>
