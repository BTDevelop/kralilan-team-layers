<%@ Page Title="Sipariş Onayla - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="proje-sepet.aspx.cs" Inherits="PL.proje_sepet" %>

<asp:Content ID="Content3" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
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
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <section>
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="disabled">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Projeni Bilgilerle Doldur">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-play"></i>
                                        </span>
                                    </a>
                                </li>
                                <%--  <li role="presentation" class="active">
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Projeni Önizle">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-forward"></i>
                                        </span>
                                    </a>
                                </li>--%>
                                <li role="presentation" class="active">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Projenin Satışını Yap">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-pause"></i>
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
                                    <div class="main-container">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12 page-content">
                                                    <div class="inner-box category-content">
                                                        <h2 class="title-2 uppercase"><strong><i class="icon-basket fa"></i>SİPARİŞ SEPETİM</strong></h2>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-horizontal">

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

                                                                    <!-- Main content -->
                                                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                                    <asp:UpdatePanel runat="server">
                                                                        <ContentTemplate>
                                                                            <section class="content" style="background: #fff; padding-bottom: 15px;">

                                                                                <table id="example1" class="table table-responsive table-hover">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th class="col-md-4" style="font-size: 16px;">Sipariş</th>
                                                                                            <th class="col-md-4" style="font-size: 16px;">Tutar(&#x20BA;)</th>
                                                                                            <th class="col-md-4" style="font-size: 16px;">Tarih</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <asp:Repeater ID="odemeRepeater" runat="server">
                                                                                            <ItemTemplate>
                                                                                                <asp:HyperLink NavigateUrl="#" runat="server">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <span style="font-size: 16px;"><%# Eval("siparis") %></span>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <span style="font-size: 16px;" class="tutar"><%# Eval("tutar") %></span>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <span style="font-size: 16px;"><%# DateTime.Now.ToShortDateString() %></span>
                                                                                                        </td>                                               
                                                                                                    </tr>
                                                                                                </asp:HyperLink>
                                                                                            </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                    </tbody>
                                                                                </table>
                                                                                <div class="clearfix"></div>

                                                                            </section>
                                                                            <a class="clickMe" data-toggle="modal" data-target="#myModal" hidden="hidden"></a>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    <div id="myModal" class="modal fade in">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <a class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></a>
                                                                                    <h4 class="modal-title">Bildirim</h4>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <h4>Siparişini Onayla</h4>
                                                                                    <p style="font-size: 16px;">Ödemeni onaylayıp devam etmek istiyor musun?</p>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <div class="btn-group">
                                                                                        <asp:Button ID="Button1" runat="server" Text="Onayla ve Devam Et" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                            <!-- /.modal-content -->
                                                                        </div>
                                                                        <!-- /.modal-dalog -->
                                                                    </div>
                                                                </div>
                                                                <div class="well">
                                                                    <h3><i class=" icon-certificate icon-color-2"></i>Hangi Ödeme Metodunu Kullanmak İstiyorsun?
                                                                    </h3>
                                                                    <p>
                                                                        Siparişini tamamlamak için ödeme metotlarından sana uygunu seç ve devam et.
                                                                   
                                                                    </p>

                                                                    <div class="form-group">
                                                                        <table class="table table-hover checkboxtable">
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="radio">
                                                                                        <label>
                                                                                            <input type="radio" name="optionsRadios"
                                                                                                id="optionsRadios0" value="1" checked />
                                                                                            <strong>Kredi Kartı</strong>
                                                                                        </label>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <p>kralilan.com sanal posu üzerinden işlemini gerçekleştir.</p>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="radio">
                                                                                        <label>
                                                                                            <input type="radio" name="optionsRadios"
                                                                                                id="optionsRadios2" value="3" checked />
                                                                                            <strong>Havale / EFT</strong>
                                                                                        </label>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <p>
                                                                                        kralilan.com havale & EFT üzerinden işlemini gerçekleştir.                                                                                    
                                                                                        <br />
                                                                                        <b>Hesap:</b> 28981107-5002                                                                                     
                                                                                        <br />
                                                                                        <b>Şube:</b> ZİRAAT BANKASI CUMHURİYET ŞUBESİ                                                                                      
                                                                                        <br />
                                                                                        <b>Şube Kodu:</b> 1239                                                                                      
                                                                                        <br />
                                                                                        <b>IBAN:</b> TR-9100-0100-1239-2898-1107-5002                                                                                       
                                                                                        <br />
                                                                                        <b>Alıcı:</b> Yatırımcı Bilgi Merkezi - Özcan ÖNER adına                                                                                     
                                                                                        <br />
                                                                                        <b>Açıklama:</b> Program Bedeli                                                                                       
                                                                                        <br />
                                                                                        <b>IBAN:</b> TR910001001239289811075002                                                                                   
                                                                                    </p>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <%--                                                                <div class="well">--%>
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
                                                                <%--                                                                </div>--%>
                                                                <div class="col-xs-3 col-xs-offset-9">
                                                                    <br/>
                                                                    <br/>
                                                                    <label style="float: right; font-size: 15px;">Toplam Tutar: <span id="toplamTutar" style="font-size: 16px; font-weight: bold; margin-left: 10px;"></span></label>
                                                                </div>
                                                                <script type="text/javascript">
                                                                    function hesapla() {

                                                                        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                                                                            var tutar = 0;
                                                                            $('.tutar').each(function (i) {
                                                                                tutar += parseFloat($(this).text().replace(',', '.'));
                                                                            });
                                                                            $("#toplamTutar").html(" &#x20BA; " + tutar);
                                                                        });
                                                                    }
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-1 col-xs-offset-11">
                            <a class="btn btn-success" style="float: right; margin-top: 15px;" href="#myModal" data-toggle="modal">Devam Et</a>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
    <script type="text/javascript">
        function showmodalpopup() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Sizinle iletişim kısa sürede sağlanacaktır.',
                theme: 'supervan'
            });
        };

        function showmodalpopup1() {
            $('#myModal').dialog('open');
        };

        function GetLocation(proid, distid, opt) {
            jQuery.ajax({
                type: "POST",
                url: "/endpoint/locationservice.asmx/GetLocation",
                dataType: "json",
                data: "{ RegionId:'" + proid + "'" + ", CityId:'" + distid + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var d = JSON.parse(data.d);
                    if (opt == 1) {

                        $(".slctprovireport").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                            $(".slctprovireport").append(appnd);

                        }
                    }

                    if (opt == 2) {
                        $(".slctdist").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlceId + "'>" + d[i].IlceAdi + "</option>";
                            $(".slctdist").append(appnd);

                        }
                    }
                },
                error: function (e) {

                }
            });
        }


        $(document).ready(function () {
            try {
                GetLocation(-1, -1, 1);
            } catch (e) {
                console.log(e);
            } 

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
