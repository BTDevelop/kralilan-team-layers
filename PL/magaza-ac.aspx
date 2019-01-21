<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="magaza-ac.aspx.cs" Inherits="PL.magaza_ac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/libraries/assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="/libraries/assets/css/owl.theme.css" rel="stylesheet" />
    <style>
        .image-preview-input {
            position: relative;
            overflow: hidden;
            margin: 0px;
            color: #333;
            background-color: #fff;
            border-color: #ccc;
        }

            .image-preview-input input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }

        .image-preview-input-title {
            margin-left: 2px;
        }
    </style>
    <div class="parallaxbox about-parallax-bottom">
        <div class="container">
            <div class="row text-center featuredbox">
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-basket ln-shadow-box shape-3"></i></div>
                        <h3 class="title-4">MAĞAZA BİLGİLERİNİ DOLDUR</h3>
                        <p>
                            kralilan.com'un mağaza arayüzünü kullanmak için firmana ait bilgileri eksiksiz doldur.                 
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class=" icon-credit-card-1 ln-shadow-box shape-6"></i></div>
                        <h3 class="title-4">MAĞAZA PAKET ÖDEMENİ GERÇEKLEŞTİR.</h3>
                        <p>
                            kralilan.com'da mağazanın onay sürecine geçmesi için öncelikle seçilen paketin ödemesini gerçekleştir.           
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-ok-1 ln-shadow-box shape-5"></i></div>
                        <h3 class="title-4">MAĞAZAN ONAYDAN SONRA HEMEN YAYINDA.</h3>
                        <p>
                            kralilan.com mağazanı onayladıktan sonra satışları gerçekleştirebilirsin.                   
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-md-9 page-content">
                    <div class="inner-box category-content">
                        <h2 class="title-2 uppercase"><strong><i class="icon-basket"></i>MAĞAZA BİLGİLERİ</strong></h2>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-horizontal">
                                    <fieldset>
                                        <!-- Multiple Radios (inline) -->
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Mağaza Tipi</label>
                                            <div class="col-md-8">
                                                <label class="radio-inline" for="radios-0">
                                                    <input name="corpote" id="radios-0" value="0" checked="checked"
                                                        type="radio" />
                                                    Bireysel                            
                                                </label>
                                                <label class="radio-inline" for="radios-1">
                                                    <input name="corpote" id="radios-1" value="1" type="radio" />
                                                    Kurumsal                           
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="Adtitle">Mağaza Adı</label>
                                            <div class="col-md-8">
                                                <input id="storename" runat="server" name="storename" placeholder="Mağaza Adı"
                                                    class="form-control input-md" required="required" type="text" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="textarea">Mağaza Hakkında</label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" id="storetextarea" runat="server" required="required" placeholder="Mağaza Hakkında" name="storetextarea"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">İl</label>
                                            <div class="col-md-8">
                                                <select class="form-control slctprovi" required="required" name="location1" id="location1">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">İlçe</label>
                                            <div class="col-md-8">
                                                <select class="form-control slctdist" required="required" name="location2" id="location2">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Mahalle</label>
                                            <div class="col-md-8">
                                                <select class="form-control slctneig" required="required" name="location3" id="location3">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="Adtitle">TC Kimlik No / Vergi No</label>
                                            <div class="col-md-8">
                                                <input id="identityno" name="identityno" placeholder="TC Kimlik No / Vergi No"
                                                    class="form-control input-md" required="required" type="text" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Vergi Dairesi</label>
                                            <div class="col-md-8">
                                                <select class="form-control slcttax" required="required" name="location4" id="location4">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Mağaza Türü</label>
                                            <div class="col-md-8">
                                                <select class="form-control" required="required" name="storekind" runat="server" id="location8">
                                                    <option selected="selected" value="-1">Seçiniz</option>
                                                    <option value="8">Emlak Ofisi</option>
                                                    <option value="9">İnşaat Firması</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Sabit Telefon</label>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-phone"></i></span>
                                                    <input id="no1" name="no1" class="form-control"
                                                        placeholder="" required="required" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Cep Telefonu</label>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-phone"></i></span>
                                                    <input id="no2" name="no2" class="form-control"
                                                        placeholder="" data-inputmask='"mask": "(999) 999-9999"' data-mask runat="server" />
                                                    <%--<input id="phone" name="phone" class="form-control input-md" required="required" data-inputmask='"mask": "(999) 999-9999"' data-mask />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Logo Ekle</label>
                                            <div class="col-md-4">
                                                <div class="input-group image-preview">
                                                    <input type="text" class="form-control image-preview-filename" disabled="disabled" />
                                                    <!-- don't give a name === doesn't send on POST/GET -->
                                                    <div class="input-group-btn">
                                                        <!-- image-preview-clear button -->
                                                        <button type="button" class="btn btn-default image-preview-clear" style="display: none;">
                                                            <span class="glyphicon glyphicon-remove"></span>Sil
                                                       
                                                        </button>
                                                        <!-- image-preview-input -->
                                                        <div class="btn btn-default image-preview-input">
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                            <span class="image-preview-input-title">Logo Yükle</span>
                                                            <asp:FileUpload ID="FileUpload1" CssClass="resimSec" accept="image/png, image/jpeg, image/gif" runat="server" />
                                                            <!-- rename it -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Vergi Levhası</label>
                                            <div class="col-md-4">
                                                <div>
                                                    <%--                                                    <input type="text" class="form-control image-preview-filename" disabled="disabled" />--%>
                                                    <!-- don't give a name === doesn't send on POST/GET -->
                                                    <div class="input-group-btn">
                                                        <!-- image-preview-clear button -->
                                                        <%--  <button type="button" class="btn btn-default image-preview-clear" style="display: none;">
                                                            <span class="glyphicon glyphicon-remove"></span>Sil
                                                       
                                                        </button>--%>
                                                        <!-- image-preview-input -->
                                                        <div class="btn btn-default">
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                            <span class="image-preview-input-title">Vergi Levhası</span>
                                                            <asp:FileUpload ID="FileUpload2" CssClass="resimSec" accept="file/pdf, file/doc" runat="server" />
                                                            <!-- rename it -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Telefon Fatura Bilgisi</label>
                                            <div class="col-md-4">
                                                <div>
                                                    <%--                                                    <input type="text" class="form-control image-preview-filename" disabled="disabled" />--%>
                                                    <!-- don't give a name === doesn't send on POST/GET -->
                                                    <div class="input-group-btn">
                                                        <!-- image-preview-clear button -->
                                                        <%--     <button type="button" class="btn btn-default image-preview-clear" style="display: none;">
                                                            <span class="glyphicon glyphicon-remove"></span>Sil
                                                       
                                                        </button>--%>
                                                        <!-- image-preview-input -->
                                                        <div class="btn btn-default">
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                            <span class="image-preview-input-title">Telefon Fatura Bilgisi</span>
                                                            <asp:FileUpload ID="FileUpload3" CssClass="resimSec" accept="file/pdf, file/doc" runat="server" />
                                                            <!-- rename it -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Hizmet Politikası</label>
                                            <div class="col-md-8">
                                                <label class="checkbox-inline" for="checkboxes-0">
                                                    <input name="chcServicePolicy" id="checkboxes-0"
                                                        value="Remember above contact information." type="checkbox" required="required" />
                                                         kralilan.com<a target="_blank" href="/kurumsal-uyelik-sozlesme/"> kurumsal üyelik sözleşmesi</a>'ni kabul ediyorum.                              
                                                </label>
                                            </div>
                                        </div>
                                        <div class="content-subheading">
                                            <i class="icon-inbox fa"></i><strong>MAĞAZA PAKET SEÇİMİ
                                            </strong>
                                        </div>
                                        <div class="well">
                                            <h3><i class=" icon-certificate icon-color-1"></i>Standart Mağaza
                                            </h3>
                                         <%--   <p>
                                                Standart Mağaza'nın artıları görmek için <a href="/neden-magaza/" target="_blank">tıkla
                                                </a>
                                            </p>--%>
                                            <div class="form-group">
                                                <table class="table table-hover checkboxtable">
                                                    <tr>
                                                        <td>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" name="optionsRadios"
                                                                        id="optionsRadios0" value="1" checked="checked" />
                                                                    <strong>3 Aylık</strong>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="stdone"><%= stdThreePriceText %> &#x20BA;</p>
                                                        </td>
                                                    </tr>
                                                      <tr>
                                                        <td>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" name="optionsRadios"
                                                                        id="optionsRadios1" value="2" />
                                                                    <strong>6 Aylık</strong>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="stdtwo"><%= stdSixPriceText %> &#x20BA;</p>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" name="optionsRadios"
                                                                        id="optionsRadios2" value="3" />
                                                                    <strong>12 Aylık</strong>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="stdthree"><%= stdTwelvePriceText %> &#x20BA;</p>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <%--<div class="well">
                                            <h3><i class=" icon-certificate icon-color-3"></i>Premium Mağaza
                                            </h3>

                                            <p>
                                                Premium Mağaza'nın artıları görmek için <a href="/neden-magaza/" target="_blank">tıkla
                                                </a>
                                            </p>

                                            <div class="form-group">
                                                <table class="table table-hover checkboxtable">
                                                    <tr>
                                                        <td>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" name="optionsRadios"
                                                                        id="optionsRadios2" value="3" />
                                                                    <strong>6 Aylık </strong>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="prmone"><%= prmHalfPrice %> &#x20BA;</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" name="optionsRadios"
                                                                        id="optionsRadios3" value="4" />
                                                                    <strong>12 Aylık </strong>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="prmtwo"><%= prmFullPrice %> &#x20BA;</p>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </div>--%>
                                        <div class="well">
                                            <h3><i class="icon-credit-card "></i>Ödeme Metotları
                                            </h3>
                                            <p>
                                                Mağaza paket ödemesi için yöntem seçin.                                        
                                            </p>
                                            <div class="form-group">
                                                <table class="table table-hover checkboxtable">
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                kralilan.com havale & EFT üzerinden işlemini gerçekleştirmek için:                                                  
                                                                <br />
                                                                <b>Hesap:</b> 28981107-5002                                                                     
                                                                <br />
                                                                <b>Şube:</b> ZİRAAT BANKASI CUMHURİYET ŞUBESİ                                                                                     
                                                                <br />
                                                                <b>Şube Kodu:</b> 1239                                                                                       
                                                                <br />
                                                                <b>IBAN:</b> TR-9100-0100-1239-2898-1107-5002                                                          
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-group">
                                                                <div class="col-md-8">
                                                                    <select class="form-control" name="PaymentMethod" disabled="disabled"
                                                                        id="PaymentMethod" required="required">
                                                                        <option value="-1">Ödeme Metodu Seçiniz</option>
                                                                        <option value="1" selected="selected">Kredi Kartı</option>
                                                                        <option value="2">Havale & EFT</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p><strong class="total"></strong></p>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="well">
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
                                        <div class="form-group">
                                            <label class="col-md-3 control-label"></label>
                                            <div class="col-md-8">
                                                <button type="submit" id="sbmbtn"
                                                    class="btn btn-success btn-lg" runat="server" onserverclick="button1id_ServerClick">
                                                    Devam Et</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 reg-sidebar">
                    <div class="reg-sidebar-inner text-center">
                        <div class="promo-text-box">
                            <i class="icon-basket fa fa-4x icon-color-2"></i>
                            <h3><strong>Mağazanı Hemen Aç</strong></h3>
                            <p>
                                Daha fazla alıcıya ulaş satışının keyfini çıkar.                      
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.main-container -->
    <%--<div class="page-info hasOverly"
        style="background-image: url(../libraries/images/jobs/cbg.jpg); background-position: center center; background-size: cover">
        <div class="bg-overly">
            <div class="container text-center section-promo">
                <div class="row">
                    <div class="col-sm-3 col-xs-6 col-xxs-12">
                        <div class="iconbox-wrap">
                            <div class="iconbox">
                                <div class="iconbox-wrap-icon">
                                    <i class="icon  icon-doc"></i>
                                </div>
                                <div class="iconbox-wrap-content">
                                    <h5><span>155000+</span></h5>

                                    <div class="iconbox-wrap-text">İlan</div>
                                </div>
                            </div>
                            <!-- /..iconbox -->
                        </div>
                        <!--/.iconbox-wrap-->
                    </div>
                    <div class="col-sm-3 col-xs-6 col-xxs-12">
                        <div class="iconbox-wrap">
                            <div class="iconbox">
                                <div class="iconbox-wrap-icon">
                                    <i class="icon icon-user"></i>
                                </div>
                                <div class="iconbox-wrap-content">
                                    <h5><span>100900+</span></h5>

                                    <div class="iconbox-wrap-text">Kullanıcı</div>
                                </div>
                            </div>
                            <!-- /..iconbox -->
                        </div>
                        <!--/.iconbox-wrap-->
                    </div>
                    <div class="col-sm-3 col-xs-6  col-xxs-12">
                        <div class="iconbox-wrap">
                            <div class="iconbox">
                                <div class="iconbox-wrap-icon">
                                    <i class="icon  icon-eye"></i>
                                </div>
                                <div class="iconbox-wrap-content">
                                    <h5><span>41000+</span></h5>

                                    <div class="iconbox-wrap-text">Takip</div>
                                </div>
                            </div>
                            <!-- /..iconbox -->
                        </div>
                        <!--/.iconbox-wrap-->
                    </div>
                    <div class="col-sm-3 col-xs-6 col-xxs-12">
                        <div class="iconbox-wrap">
                            <div class="iconbox">
                                <div class="iconbox-wrap-icon">
                                    <i class="icon icon-basket"></i>
                                </div>
                                <div class="iconbox-wrap-content">
                                    <h5><span>300+</span></h5>

                                    <div class="iconbox-wrap-text">Mağaza</div>
                                </div>
                            </div>
                            <!-- /..iconbox -->
                        </div>
                        <!--/.iconbox-wrap-->
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- /.page-info -->
    <div class="page-bottom-info">
        <div class="page-bottom-info-inner">
            <div class="page-bottom-info-content text-center">
                <h1>Mağaza hakkında daha fazla bilgi almak için bize ulaşın</h1>
                <a class="btn  btn-lg btn-primary-dark" href="tel:+08508085725">
                    <i class="icon-mobile"></i><span class="hide-xs color50">Şimdi Ara:</span>(850) 808-5725</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="/libraries/assets/js/fileinput.min.js" type="text/javascript"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script>
        $(document).on('click', '#close-preview', function () {
            $('.image-preview').popover('hide');
            $('.image-preview').hover(
                function () {
                    $('.image-preview').popover('show');
                },
                 function () {
                     $('.image-preview').popover('hide');
                 }
            );
        });

        $(function () {
            $("[data-mask]").inputmask();
        });

        $(function () {
            var closebtn = $('<button/>', {
                type: "button",
                text: 'x',
                id: 'close-preview',
                style: 'font-size: initial;',
            });
            closebtn.attr("class", "close pull-right");
            $('.image-preview').popover({
                trigger: 'manual',
                html: true,
                title: "<strong>Önizleme</strong>" + $(closebtn)[0].outerHTML,
                content: "Logo Bulunamadı.",
                placement: 'bottom'
            });
            $('.image-preview-clear').click(function () {
                $('.image-preview').attr("data-content", "").popover('hide');
                $('.image-preview-filename').val("");
                $('.image-preview-clear').hide();
                $('.image-preview-input input:file').val("");
                $(".image-preview-input-title").text("Logo Yükle");
            });
            $(".image-preview-input input:file").change(function () {
                var img = $('<img/>', {
                    id: 'dynamic',
                    width: 250,
                    height: 200
                });
                var file = this.files[0];
                var reader = new FileReader();
                reader.onload = function (e) {
                    $(".image-preview-input-title").text("Değiştir");
                    $(".image-preview-clear").show();
                    $(".image-preview-filename").val(file.name);
                    img.attr('src', e.target.result);
                    $(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
                }
                reader.readAsDataURL(file);
            });
        });

        $(document).ready(function () {
            try {
                GetLocation(-1, -1, 1);

            } catch (e) {
                console.log(e);
            } 
            $('.nav-tabs > li a[title]').tooltip();
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


        $(document).ready(function () {
            $(".total").html("Ödenecek Tutar : &#x20BA; " + $(".stdone").text().toString().split(' ')[0]);

            $('input[type=radio][name=optionsRadios]').change(function () {
                if (this.value == '1') {

                    $(".total").html("Ödenecek Tutar : &#x20BA; " + $(".stdone").text().toString().split(' ')[0]);
                }
                else if (this.value == '2') {
                    $(".total").html("Ödenecek Tutar : &#x20BA; " + $(".stdtwo").text().toString().split(' ')[0]);
                }
                else if (this.value == '3') {
                    $(".total").html("Ödenecek Tutar : &#x20BA; " + $(".stdthree").text().toString().split(' ')[0]);
                }

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
                url: "/endpoint/locationservice.asmx/GetLocation",
                dataType: "json",
                data: "{ RegionId:'" + proid + "'" + ", CityId:'" + distid + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var d = JSON.parse(data.d);
                    if (opt == 1) {
                        $(".slctprovi").append("<option value='-1' selected='selected'>Seçiniz</option>");
                        for (var i = 0; i < d.length; i++) {
                            var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                            $(".slctprovi").append(appnd);

                        }

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
                    console.log(data);
                    $(".slcttax").append("<option value='-1' selected='selected'>Seçiniz</option>");
                    for (var i = 0; i < d.length; i++) {
                        var appnd = "<option value='" + d[i].VergiDaireId + "'>" + d[i].VergiDaireAdi + "</option>";
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
            $(".slctdist").val(-1);
            $(".slcttax").empty();
            GetTax($(this).val());
            $(".slcttax").val(-1);
        });

        $(".slctdist").change(function () {
            $(".slctneig").empty();
            GetLocation(-1, $(this).val(), 3);
            $(".slctneig").val(-1);

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
</asp:Content>
