﻿<%@ Page Title="kralilan: Jeton Al" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="kurus-al.aspx.cs" Inherits="PL.kurus_al" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        <style > .checkbox label {
            padding-left: 0.5em !important;
        }

        .form-control {
            border-radius: 6px;
        }

            .form-control:focus {
                border-color: #16A085;
                border: 2px solid #16A085;
            }

        .btn-success {
            background-color: #16A085;
            color: #FFFFFF;
            width: 110px;
            font-weight: bold;
        }

        .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
            border-radius: 6px;
        }

        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #16A085;
            color: white;
        }
    </style>
    <div class="intro-inner">
        <div class="about-intro" style="background: url(../libraries/images/bg2.jpg) no-repeat center; background-size: cover;">
            <div class="dtable hw100">
                <div class="dtable-cell hw100">
                    <div class="container text-center">
                        <h1 class="intro-title animated fadeInDown"><span class="ion ion-ios-circle-filled" style="margin-right: 15px;"></span>Jeton Al </h1>
                    </div>
                </div>
            </div>
        </div>
        <!--/.about-intro -->
    </div>
    <!-- /.intro-inner -->
    <div class="main-container inner-page">
        <div class="container">
            <div class="section-content">
                <div class="row ">
                    <h1 class="text-center ">kralilan.com <strong>Jeton Al</strong></h1>
                    <hr class="center-block small text-hr">
                </div>
                <div class="faq-content">
                    <div aria-multiselectable="true" role="tablist" id="accordion" class="panel-group faq-panel">
                        <div class="panel">
                            <div id="headingOne" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseOne" aria-expanded="true" href="#collapseOne"
                                        data-parent="#accordion" data-toggle="collapse">Neden Jeton Almalıyım?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingOne" role="tabpanel" class="panel-collapse collapse in"
                                id="collapseOne">
                                <div class="panel-body">
                                    <b>Neden Jeton Almalıyım?</b>
                                    <br />
                                    Satılan kategorisindeki İcradan, İzalei Şuyudan, Kamu Kurumlarından, Özelleştirme İdaresinden, Hazineden, Bankadan, Belediyeden olan ilanların
                                    detaylarını görüntüleyebilmek için Jeton almanız gereklidir. Her bir ilan detayı için 1 Jeton kullanılmaktadır.
                                    Jeton miktarı bilgileriniz sisteme giriş yaptıktan sonra üst menüde gösterilmektedir.
                                    Kredinizin bulunmadığı durumunda ilan detaylarını görüntülemeyecek ve sadece harita ve listelerde ilanları görebileceksiniz.
                                    
                                   <br />
                                    <%-- <br />
                                    Havale / EFT için hesap numarası:
                                    <br />
                                    YATIRIMCI BİLGİ MERKEZİ
                                    Bilişim Ar-Ge Reklam Kırtasiye  
                                    Gayrimenkul Yatırım Danışmanlığı Hizmetleri
                                    ZİRAAT BANKASI CUMHURİYET ŞUBESİ
                                    <br />
                                    Şube Kodu : 1239
                                    <br />
                                    Hesap No : 28981107-5002
                                    <br />
                                    IBAN No: TR-9100-0100-1239-2898-1107-5002
                                    <br />--%>
                                    <br />

                                    <div class="well">
                                        <h3><i class=" icon-certificate icon-color-1"></i>Jeton Almaya Başla?
                                        </h3>

                               <%--         <p>
                                            Premium ads help sellers promote their product or service by getting
                                                their ads more visibility with more
                                                buyers and sell what they want faster. <a href="help.html">Learn
                                                    more</a>
                                        </p>--%>

                                        <div class="form-group">
                                            <table class="table table-hover checkboxtable">
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>2 Adet Jeton </strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 5</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>10 Adet Jeton </strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 25</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>25 Adet Jeton (Kazanç %20)</strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 50</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>50 Adet Jeton (Kazanç %36) </strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 80</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>100 Adet Jeton (Kazanç %44) </strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 140</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>250 Adet Jeton (Kazanç %48) </strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 325</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>500 Adet Jeton (Kazanç %52) </strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 600</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="radio">
                                                            <label>

                                                                <strong>1000 Adet Jeton (Kazanç %60) </strong>
                                                            </label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p>&#x20BA; 1000</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group">
                                                            <div class="col-md-8">
                                                                <select class="form-control selectpicker" name="method"
                                                                    id="myselect">
                                                                    <option value="-1">Seçiniz</option>
                                                                    <option value="1">2 Adet Jeton</option>
                                                                    <option value="2">10 Adet Jeton</option>
                                                                    <option value="3">25 Adet Jeton</option>
                                                                    <option value="4">50 Adet Jeton</option>
                                                                    <option value="5">100 Adet Jeton</option>
                                                                    <option value="6">250 Adet Jeton</option>
                                                                    <option value="7">500 Adet Jeton</option>
                                                                    <option value="8">1000 Adet Jeton</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p><strong id="totalvalue"></strong></p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                    </div>
                                    <div>
                                        <h3><i class="icon-credit-card "></i>Fatura Bilgileri
                                        </h3>
                                        <p>
                                            Fatura işlemleri için alanlar doldurulması gereklidir.                                        
                                        </p>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="reportName">İsim</label>
                                            <div class="col-md-8">
                                                <input id="reportName" name="reportName" placeholder="İsim"
                                                    class="form-control input-md" required="required" type="text" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="reportSurname">Soyisim</label>
                                            <div class="col-md-8">
                                                <input id="reportSurname" name="reportSurname" placeholder="Soyisim"
                                                    class="form-control input-md" required="required" type="text" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="reportIdentityNum">TC Kimlik Numarası</label>
                                            <div class="col-md-8">
                                                <input id="reportIdentityNum" name="reportIdentityNum" placeholder="TC Kimlik Numarası"
                                                    class="form-control input-md" required="required" type="text" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">İl</label>
                                            <div class="col-md-8">
                                                <select class="form-control slctprovireport" required="required" name="location5" id="location5">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="reportZipCode">Posta Kodu</label>
                                            <div class="col-md-8">
                                                <input id="reportZipCode" name="reportZipCode" placeholder="Posta Kodu"
                                                    class="form-control input-md" required="required" type="text" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="textarea">Adres</label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" id="billingAddress" required="required" placeholder="Adres" name="billingAddress" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Button ID="devam" runat="server" CssClass="btn btn-success" Text="Devam Et" OnClick="Button1_Click" Style="float: right; margin-top: 15px;" />

                                </div>
                            </div>
                            <div class="panel-footer">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.main-container -->
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
        <script>
        $(document).ready(function () {

            GetLocation();
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

        $(".selectpicker").change(function () {
            if ($("#myselect").val() == -1) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 0");
            }

            if ($("#myselect").val() == 1) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 5");
            }

            if ($("#myselect").val() == 2) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 25");
            }

            if ($("#myselect").val() == 3) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 50");
            }

            if ($("#myselect").val() == 4) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 80");
            }

            if ($("#myselect").val() == 5) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 140");
            }

            if ($("#myselect").val() == 6) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 325");
            }

            if ($("#myselect").val() == 7) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 600");
            }

            if ($("#myselect").val() == 8) {
                $("#totalvalue").html("Toplam Tutar: &#x20BA; 1000");
            }
        });

        function GetLocation() {
            jQuery.ajax({
                type: "POST",
                url: "/endpoint/locationservice.asmx/GetLocation",
                dataType: "json",
                data: "{ RegionId:'" + -1 + "'" + ", CityId:'" + -1 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                       var d = JSON.parse(data.d);
                    
                        $(".slctprovireport").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                            $(".slctprovireport").append(appnd);

                        }
                    },
                    error: function (e) {

                    }
                });
        }

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }
        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }
    </script>
    <!-- include carousel slider plugin  -->
    <script src="libraries/assets/js/owl.carousel.min.js"></script>
    <script src="management/dist/js/app.min.js"></script>
</asp:Content>
