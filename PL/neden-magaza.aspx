<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="neden-magaza.aspx.cs" Inherits="PL.neden_magaza" %>
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
                        <h1 class="intro-title animated fadeInDown"><span class="icon-basket" style="margin-right: 15px;"></span>Neden Mağaza?</h1>
                        <h1 class="intro-title animated fadeInDown">Mağaza Bizden Satış Sizden!</h1>

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
                    <h1 class="text-center ">kralilan.com <strong>Mağazam</strong></h1>
                    <hr class="center-block small text-hr">
                </div>
                <div class="faq-content">
                    <div aria-multiselectable="true" role="tablist" id="accordion" class="panel-group faq-panel">
                        <div class="panel">
                            <div id="headingOne" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseOne" aria-expanded="true" href="#collapseOne"
                                        data-parent="#accordion" data-toggle="collapse">Nasıl Mağaza Açabilirim?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingOne" role="tabpanel" class="panel-collapse collapse in"
                                id="collapseOne">
                                <div class="panel-body">
                                    kralilan.com’da mağaza açmak için üye olmak gereklidir. Eğer kralilan.com üyesi değilsen, hemen üye olmak için tıkla.
                                    kralilan.com’a üye girişi yaptıktan sonra ilk olarak Mağazalar Anasayfasına gidip, bu sayfadaki "Mağaza Açmak İstiyorum" linkine tıklayınız.
                                    Gelen sayfada, mağaza açarak yararlanabileceğiniz avantajları içeren bir tanıtım sayfası göreceksiniz. Sizin için faydalı olacağını düşündüğümüz bu bilgileri okuduktan sonra. “Devam” butonuyla bir sonraki sayfaya geçtiğinizde, “Paket Seçimi” sayfası gelecektir.
                                    Paket seçimi sayfasında, mağazanızda satışa sunacağınız ürünlerle ilgili kategoriyi seçmeniz gerekmektedir. Seçtiğiniz kategorinin bulunduğu paketi işaretleyerek “Devam” butonuna tıklayınız.
                                    Bir sonraki adımda mağaza türünü belirleyeceğiniz “Mağaza Tipi” sayfasına yönlendirileceksiniz.
                                    “Ardından gelen sayfada “İçerik” bölümü yer alacaktır. Bu bölüme;
                                    Mağazanızın adını,
                                    Mağaza tanıtım yazısını,
                                    İletişim bilgilerinizi,
                                    girebilir, varsa mağazanızın logosunu yükleyebilirsiniz. Ziyaretçilere olumlu bir etki bırakabilmek için, bu bölüme gireceğiniz bilgilerin doğruluğu ve niteliği önemlidir. Gerekli bilgileri girdikten sonra “Devam” tuşunu tıklayınız.                        
                                    Ödeme sayfasına gelindiğinde sipariş özetinde ürün adı ve geçerlilik süresi gösterilmektedir. Size uygun olan ödeme seçeneği ile (Kredi Kartı, Havale/EFT, Posta Çeki), ödemenizi gerçekleştirebilirsiniz.
                                    Tüm bu aşamaları tamamladığınızda, mağazanız işlem yapmaya hazır duruma gelecektir. Mağazanızla ilgili verdiğiniz bilgilerin doğruluğu ve mağaza içeriğinizin uygunluğu kralilan.com tarafından kontrol edilip onaylandıktan hemen sonra mağazanız aktif duruma gelecektir.
                                    
                                    Aylık Ödemeli Mağaza:
                                    Aylık ödemeli mağaza açmak isteyen kullanıcılar mağaza açmak istiyorum sayfasından açmak istedikleri mağaza kategorisini seçerek (Emlak, Vasıta, Kiralık Araç, Motosiklet) talep bırakabilirler. Kurumsal Satış ekibinin kullanıcıyı araması ile istenilen paket seçimi yapılır ve kurumsal üyenin onayına gönderilir.
                                    Seçilen paket bilgileri ve sözleşme onaylanarak kredi kartı ekleme işlemi yapılır.
                                    Kredi kartı eklendikten sonra mağaza moderasyona düşer.Mağazanızla ilgili verdiğiniz bilgilerin doğruluğu ve mağaza içeriğinizin uygunluğu kralilan.com tarafından kontrol edilip onaylandıktan hemen sonra mağazanız aktif duruma gelecektir.
                                    Aylık çıkacak olan faturalar doğrulanan mağaza bilgilerine göre kesilecektir.
                                    Kredi kartı eklenmeden önce kabul edilen Mağaza kuralları mağaza sahibine, mağaza bilgileri doğrulandıktan sonra e-posta ile gönderilir.  Mağaza sahibi e-posta adresinden istediği zaman ulaşabilecektir. Mağaza için kabul edilen kurallara elektronik ortamda erişim olmayacaktır.
                                    Mağaza sahibi e-posta adresinden istediği zaman sözleşmesine ulaşabilecektir.
                                    Onay işleminden itibaren, tüm sahibinden.com ziyaretçilerinin gezebileceği, güvenle satış yapabileceğiniz bir mağazaya sahip olacaksınız.
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="headingTwo" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseTwo" aria-expanded="false" href="#collapseTwo"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Mağaza Açmak Avantajlı Mı?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingTwo" role="tabpanel" class="panel-collapse collapse"
                                id="collapseTwo">
                                <div class="panel-body">
                                    kralilan.com'da satmak istediğiniz tüm ürünleri, size özel bir mağaza sayfası yaratarak tüm kullanıcılara tanıtma imkanı bulabilirsiniz. Geniş bir kitleye ulaşan kralilan.com’da yer alarak marka bilinirliğinize de olumlu katkı sağlarsın.
                                   Herhangi bir ilanınına ulaşan bir alıcı, bu ikona tıklayarak mağazana girebilir, tek bir ilanınla mağazandaki tüm ürünlere daha hızlı ve kolay bir şekilde ulaşabilir.
                                   Bu özel alanda firmanına ait kurumsal bilgilerine ve logona yer verebilir, Bu sayede alıcıların ilgisini çekip, firmanı tercih ederek ilanlarını satmayı sağlayabilirsin.
                                    Mağaza sahibi olman alıcıların sana olan güvenini arttıracaktır. Mağazanızın sağladığı bu güvenle satışlarını artırabilirsin.
                                    Firmanda görevli diğer çalışanlarını da mağazana kullanıcı olarak atayabilirsin. Böylece her çalışan kendisine tanınan yetkiler ile senin iş yükünüzü hafifletebilir. 
                                <div class="table-responsive">
                                    <div class="table-action">
                                    </div>
                                    <table id="addManageTable"
                                        class="table table-striped table-bordered add-manage-table table demo"
                                        data-filter="#filter" data-filter-text-only="true">
                                        <thead>
                                            <tr>
                                                <th>Mağazanın Artısı</th>
                                                <th>Standart Mağaza</th>
                                                <th>Premium Mağaza</th>
                                            </tr>
                                        </thead>
                                        <tbody id="addswrap">

                                            <tr>
                                                <td>Portföyündeki kategoriden ilan eklendiğinde onay beklemeden ilan yayınlama</td>
                                                <td><i class="icon-lock fa-2x text-center">Yok</i></td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                            </tr>
                                            <tr>
                                                <td>Mağazana web adresinden erişilebilme</td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                            </tr>
                                             <tr>
                                                <td>Mağaza sayfana logo ekleyebilme</td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                            </tr>
                                             <tr>
                                                <td>Mağazaya özel çağrı merkezi hizmeti</td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                            </tr>
                                            <tr>
                                                <td>İnternet tarayıcısı başlığında mağazanızın adı</td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                                <td><i class="icon-lock-open fa-2x text-center">Var</i></td>
                                            </tr>
                                            <tr>
                                                <td>Mağazana danışman ekleme</td>
                                                <td><i class="icon-lock-open fa-2x text-center">3 Danışman</i></td>
                                                <td><i class="icon-lock-open fa-2x text-center">5 Danışman</i></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="headingThree" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseThree" aria-expanded="false" href="#collapseThree"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Mağaza Arayüzü Bana Ne Sağlıyor?

                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingThree" role="tabpanel" class="panel-collapse collapse"
                                id="collapseThree">
                                <div class="panel-body">
                                    Mağazandaki tüm işlemleri “Benim Sayfam” bölümündeki “Mağazam” seçeneğinden yapabilirsin.
                                    Bu seçeneğin altında yer alan aşağıdaki bölümleri kullanabilirsin.
                                    Mağazamın Görseli
                                    Mağazamın İçeriği
                                    Sözleşmemin Süresi
                                    Mağazamın Danışmanları
                                    Mağazamın Vitrini
                                    Mağazamı Göster
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_04" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_04" aria-expanded="false" href="#collapse_04"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Mağazamı Kapatmak İstiyorsam?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_04" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_04">
                                <div class="panel-body">
                                    0 850 808 5725 numaralı telefondan da talebinizi iletebilirsiniz.                          
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_05" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_05" aria-expanded="false" href="#collapse_05"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Mağazam İçin Ödemem Gereken Fiyatlar Nedir?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_05" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_05">
                                <div class="panel-body">
                                    <div class="row form-group">
                                        <div class="col-xs-12">
                                            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                                <li class="active"><a href="#step-1">
                                                    <h4 class="list-group-item-heading"><i class="fa fa-home fa-3x"></i></h4>
                                                    <p class="list-group-item-text">Emlak</p>
                                                </a></li>
                                                <li><a href="#step-2">
                                                    <h4 class="list-group-item-heading"><i class="fa fa-battery-full fa-2x"></i></h4>
                                                    <p class="list-group-item-text">Diğer</p>
                                                </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row setup-content" id="step-1">
                                        <%--  <div class="col-xs-12">--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="panel panel-default coupon">
                                                    <div class="panel-heading" id="head">
                                                        <div class="panel-title" id="title">
                                                            <%--                                                             <img src="/libraries/images/heaphones.png" />--%>

                                                            <span class="hidden-xs">Kurumsal Çağrı Merkezi</span>
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <%--                                                        <img src="/libraries/images/phone.png">--%>
                                                        <div class="col-md-12">
                                                            <h1 class="text-center">KURUMSAL ÇAĞRI MERKEZİ</h1>

                                                            <h3 class="text-center">kralilan.com'un daha iyi hizmet ve ayrıcalıklarıyla tanışmak ve mağazanı açmak için bizi hemen arayın.</h3>
                                                            <h3 class="text-center">0 850 808 5725</h3>


                                                            <ul class="items">
                                                            </ul>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <p class="disclosure">
                                                            </p>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>

                                        </div>
                                        <%--</div>--%>
                                    </div>
                                    <div class="row setup-content" id="step-2">
                                        <div class="col-xs-12">
                                        </div>
                                    </div>
                                </div>
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
                        <div class="icon-box-wrap"><i class="icon-basket ln-shadow-box shape-3"></i></div>
                        <h3 class="title-4">MAĞAZANI İLANLARLA DOLDUR</h3>
                        <p>
                            kralilan.com'da mağaza kategorinden ilan vermek tamamen ücretsiz herşey senin elinden yayınla paylaş satış yap.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class=" icon-lightbulb ln-shadow-box shape-6"></i></div>
                        <h3 class="title-4">AKLINDAKİ İLANI HEMEN BUL</h3>
                        <p>
                            kralilan.com'a has özellikleri kullanarak ihtiyacına uygun ilanı hemen bul satıcıyla görüş anlaş.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-megaphone ln-shadow-box shape-5"></i></div>
                        <h3 class="title-4">MAĞAZA İLANLARIN GENİŞ KİTLEYE YAYILSIN</h3>
                        <p>
                            kralilan.com geniş yayın ağıyla ilanının alıcıyla hemen buluşsun istersen hemen ilan ver.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
