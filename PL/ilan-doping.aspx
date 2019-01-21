<%@ Page Title="Vitrin Seç - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ilan-doping.aspx.cs" Inherits="PL.ilan_doping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
      <style>
          .btn-success {
              background-color: #16A085;
              color: #FFFFFF;
              width: 110px;
              font-weight: bold;
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
  <div class="intro" style="background: url('../libraries/images/bg_king.png') repeat left top;">
        <div class="dtable hw100">
            <div class="dtable-cell hw100">
                <div class="container text-center">
                    <h1 class="intro-title animated fadeInDown">Vitrin Seçmek İstiyor Musun?</h1>
                    <p style="font-weight: bold;" class="sub animateme fittext3 animated fadeIn">
                       Vitrinde ilanın bulunursa daha çok alıcıya ulaşır.
                    </p>
                </div>
            </div>
        </div>
    </div>
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
                                <li role="presentation" class="active">
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

                                <li role="presentation" class="disabled">
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
                                    <style>
                                        .dopingler {
                                            border: 2px solid #2c8371;
                                            border-radius: 25px;
                                            background-color: #dbf5eb;
                                            padding-bottom: 15px;
                                            margin-bottom: 30px;
                                        }

                                            .dopingler h2 {
                                                float: left;
                                                line-height: 48px;
                                                font-size: 18px;
                                                margin: 0;
                                                font-weight: bold;
                                                color: #2c8371;
                                            }

                                            .dopingler p {
                                                font-size: 13px;
                                                color: #2c8371;
                                            }
                                    </style>
                                    <!-- Main content -->
                                    <section class="content" style="padding: 0;">
                                        <div class="col-xs-6" style="padding-left:0;">
                                            <div class="dopingler col-xs-12"">
                                                <h2>Anasayfa Vitrini</h2>
                                                <div class="clearfix"></div>
                                                <p>
                                                Anasayfa vitrininde ilanın yer alsın alıcılar anasayfada ilanını görsün vitrin ilan avantajından yararlan. 
                                                </p>
                                                <select class="form-control" style="width: 100%;" name="slcthomeshowcase" id="slcthomeshowcase"></select>
                                            </div>
                                        </div>
                                        <div class="col-xs-6" style="padding-right:0;">
                                            <div class="dopingler col-xs-12">
                                                <h2>Arama Sonuç Vitrini</h2>
                                                <div class="clearfix"></div>
                                                <p>
                                                Arama sonuç vitrinde ilanının yer alsın, alıcılar ilan aradıkça senin ilanın gözüksün. 
                                                </p>
                                                <select class="form-control" style="width: 100%;" name="slctsearchshowcase" id="slctsearchshowcase"></select>
                                            </div>
                                        </div>
                                        <div class="col-xs-6" style="padding-left:0;">
                                            <div class="dopingler col-xs-12">
                                                <h2>Kategori Vitrini</h2>
                                                <div class="clearfix"></div>
                                                <p>
                                                Alıcılar kategorilerde gezindikçe senin ilanına baksın istiyorsan kategori vitrini al. 
                                                </p>
                                                <select class="form-control" style="width: 100%;" name="slctcatshowcase" id="slctcatshowcase"></select>
                                            </div>
                                        </div>
                                        <div class="col-xs-6" style="padding-right:0;">
                                            <div class="dopingler col-xs-12">
                                                <h2>Acil Acil Vitrini</h2>
                                                <div class="clearfix"></div>
                                                <p>
                                                Satışın acilse ise acil acil vitrinine ilanını koy satışını hemen gerçekleşsin.  
                                                </p>
                                                <select class="form-control" style="width: 100%;" name="slctemergencyshowcase" id="slctemergencyshowcase"></select>
                                            </div>
                                        </div>
                                        <div class="col-xs-6" style="padding-left:0;">
                                            <div class="dopingler col-xs-12">
                                                <h2>Fiyatı Düştü Vitrini</h2>
                                                <div class="clearfix"></div>
                                                <p>
                                                Alıcılara ilanın fiyatının düştüğünü ve daha çok satıcıya ulaşmak için ilanını hemen fiyatı düştü vitrinine al.
                                                </p>
                                                <select class="form-control" style="width: 100%;" name="slctdiscountshowcase" id="slctdiscountshowcase"></select>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-1 col-xs-offset-11">
                                            <asp:Button ID="devam" runat="server" CssClass="btn btn-success" Text="Devam Et" Style="float: right; margin-top: 15px;" OnClick="devam_Click"/>
                                        </div>
                                    </section>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">  
    <script src='<%= Page.ResolveUrl("~/management/plugins/select2/select2.full.min.js") %>'></script>
    <script>

        $(".select2").select2();
        function uyariVer() {
            $(".clickMe").click();
        }
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


    <!-- include carousel slider plugin  -->
    <script src="libraries/assets/js/owl.carousel.min.js"></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
    <script>
        $(document).ready(function () {
            getDoping(1, 1, 1);
            getDoping(1, 3, 2);
            getDoping(1, 5, 3);
            getDoping(1, 2, 4);
            getDoping(1, 8, 5);

            $("#slcthomeshowcase").val("-1");
        });

        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });

        function getDoping(catid, dopingid, opt) {
            jQuery.ajax({
                type: "POST",
                url: "/endpoint/dopingkategoriservice.asmx/GetByDopingKategoriId",
                dataType: "json",
                data: "{ DopingId:'" + dopingid + "'" + ", CategoriId:'" + catid + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var d = JSON.parse(data.d);

                    if (opt == 1) {
                        $("#slcthomeshowcase").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].Id + "'>" + d[i].Fiyat + "</option>";
                            $("#slcthomeshowcase").append(appnd);

                        }
                    }
                    if (opt == 2) {
                        $("#slctcatshowcase").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].Id + "'>" + d[i].Fiyat + "</option>";
                            $("#slctcatshowcase").append(appnd);

                        }
                    }
                    if (opt == 3) {
                        $("#slctemergencyshowcase").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].Id + "'>" + d[i].Fiyat + "</option>";
                            $("#slctemergencyshowcase").append(appnd);

                        }
                    }
                    if (opt == 4) {
                        $("#slctsearchshowcase").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].Id + "'>" + d[i].Fiyat + "</option>";
                            $("#slctsearchshowcase").append(appnd);

                        }
                    }
                    if (opt == 5) {
                        $("#slctdiscountshowcase").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].Id + "'>" + d[i].Fiyat + "</option>";
                            $("#slctdiscountshowcase").append(appnd);

                        }
                    }

                },
                error: function (e) {

                }

            });
        }


    </script>
    </asp:Content>
