<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="vitrin-tanitim.aspx.cs" Inherits="PL.vitrin_tanitim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .panel-title {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 41px;
    font-weight: bold;
    color: inherit;
}
        /*.ln-shadow-box {
            border-radius: 12px;
        }*/
    </style>
    <!-- /.main-container -->
    <div class="parallaxbox about-parallax-bottom" style="box-shadow: inset 250px 250px 250px 450px rgba(0, 0, 128, 0.54);">
        <div class="container">
            <div class="dtable hw100">
                <div class="dtable-cell hw100">
                    <div class="container text-center">

                        <h1 class="intro-title animated fadeInDown"><span class="ion ion-ribbon-b" style="margin-right: 15px;"></span>kralilan.com vitrin </h1>
                        <p>
                            kralilan.com vitrinleri, ilanlarınızı ön plana çıkartır, benzerlerinden ayrıştırır.
                       İlanlarınız çok daha fazla kişi tarafından görüntülenir ve alıcısına hızlıca ulaşır. Böylece siz de en kısa sürede satar veya kiralarsınız.
                        </p>

                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <div class="row text-center featuredbox">
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-bell-2 ln-shadow-box shape-6"></i></div>
                        <h3 class="title-4">ACİL ACİL VİTRİNİ</h3>

                        <p>
                            kralilan.com'da her kategoriden ilan vermek tamamen ücretsiz herşey senin elinden yayınla paylaş satış yap.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class=" icon-lamp ln-shadow-box shape-4"></i></div>
                        <h3 class="title-4">ANASAYFA VİTRİNİ</h3>

                        <p>
                            kralilan.com'a has özellikleri kullanarak ihtiyacına uygun ilanı hemen bul satıcıyla görüş anlaş.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-menu ln-shadow-box shape-2"></i></div>
                        <h3 class="title-4">KATEGORİ VİTRİNİ</h3>
                        <p>
                            kralilan.com geniş yayın ağıyla ilanının satıcıyla hemen buluşsun istersen hemen ilan ver.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--     <div class="intro-inner">
        <div class="about-intro" style="box-shadow: inset 250px 250px 250px 450px rgba(0, 0, 128, 0.54);background: url(../libraries/images/bg2.jpg) no-repeat center; background-size: cover;">

            <div class="dtable hw100">
                <div class="dtable-cell hw100">
                    <div class="container text-center">

                        <h1 class="intro-title animated fadeInDown"><span class="ion ion-help-circled" style="margin-right: 15px;"></span>Sıkça Sorulan Sorular </h1>


                    </div>
                </div>
            </div>
        </div>
        <!--/.about-intro -->
    </div>
    <!-- /.intro-inner -->--%>
    <div class="main-container inner-page">
        <div class="container">
            <div class="section-content">
                <div class="row ">
                    <h1 class="text-center ">kralilan.com <strong>Vitrinleri</strong></h1>
                    <hr class="center-block small text-hr">
                </div>
                <div class="faq-content">

                    <div aria-multiselectable="true" role="tablist" id="accordion" class="panel-group faq-panel">
                        <div class="panel">
                            <div id="headingOne" role="tab" class="panel-heading">
                                <h1 class="panel-title">
                                    <a aria-controls="collapseOne" aria-expanded="true" href="#collapseOne"
                                        data-parent="#accordion" data-toggle="collapse"><i class="icon-lamp ln-shadow-box shape-4"></i> Anasayfa Vitrini
                                    </a>
                                </h1>
                            </div>
                            <div aria-labelledby="headingOne" role="tabpanel" class="panel-collapse collapse in"
                                id="collapseOne">
                                <div class="panel-body">
                                    Ülkemizdeki Tüm Büyükşehir Belediyeleri, İlçe Belediyeleri, İl Özel İdareleri, Mal Müdürlükleri, Bankalar, 
                                    Özelleştirme İdaresi, İcra ve İzale-i Şuyu Daireleri, sahibinden, emlakçıdan, inşaat firmasından, 
                                    özetle tüm kamu kurumlarından gayrimenkullerin uydu üzerinden gerçek konumlarıyla 
                                    Türkiye’de ve diğer ülkelerdeki yatırımcılara sunan bir seri ilan sitesidir.  
                                    <br />
                                    <br />
                                    kralilan.com internet sitesi üzerinden ilanlarınızı daha geniş 
                                    kitlelere ve özellikle yabancı yatırımcılara ulaşmasını sağlayabilirsiniz.
                                </div>
                            </div>
                        </div>
                                             
                               <div class="panel">
                            <div id="headingTwo" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseTwo" aria-expanded="false" href="#collapseTwo"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed"><i class="icon-bell-2 ln-shadow-box shape-9"></i> Acil Acil Vitrini
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingTwo" role="tabpanel" class="panel-collapse collapse"
                                id="collapseTwo">
                                <div class="panel-body">
                                    Emlakçı değiliz. Satışı yapılan ilanlardan komisyon almıyoruz. 
                                    kralilan.com şu anda kullanmış olduğunuz seri ilan sitelerinin gelişmiş bir versiyonudur.  
                                </div>
                            </div>
                        </div>

                        <div class="panel">
                            <div id="headingThree" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseThree" aria-expanded="false" href="#collapseThree"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed"><i class="icon-menu ln-shadow-box shape-2"></i> Kategori Vitrini
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingThree" role="tabpanel" class="panel-collapse collapse"
                                id="collapseThree">
                                <div class="panel-body">
                                    Sitemize üyelik ücretsizdir.
                                </div>
                            </div>
                        </div>

                        <div class="panel">
                            <div id="heading_04" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_04" aria-expanded="false" href="#collapse_04"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed"><i class="icon-search ln-shadow-box shape-1"></i> Arama Sonuç Vitrini
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_04" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_04">
                                <div class="panel-body">
                                    İlan vermek adet sınırlaması olmaksızın ücretsizdir. İstediğiniz kadar ilanı sitemiz üzerinden yayınlayabilirsiniz. 
                                    Şayet elinizde çok sayıda ilanınız varsa editörlerimiz size yardım etmekten memnun olacaktır.                                
                                </div>
                            </div>
                        </div>

                        <div class="panel">
                            <div id="heading_05" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_05" aria-expanded="false" href="#collapse_05"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed"><i class="icon-down-hand ln-shadow-box shape-5"></i> Fiyatı Düşenler Vitrini
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_05" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_05">
                                <div class="panel-body">
                                kralilan.com sadece vitrin ilan veya fırsat ilanlarını facebook ve diğer sosyal medya kanalları üzerinden yayınlar. 
                                İlanların tamamına ancak site üzerinden ulaşabilirsiniz. İlinizdeki ilanları ve yatırım fırsatları kaçırmamak için facebook simgesine tıklayın.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.main-container -->
    <div class="parallaxbox about-parallax-bottom" style="box-shadow: inset 250px 250px 250px 450px rgba(0, 0, 128, 0.54);">
        <div class="container">
            <div class="row text-center featuredbox">
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-book-open ln-shadow-box shape-3"></i></div>
                        <h3 class="title-4">ÜCRETSİZ İLANLAR VER</h3>

                        <p>
                            kralilan.com'da her kategoriden ilan vermek tamamen ücretsiz herşey senin elinden yayınla paylaş satış yap.
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
                        <h3 class="title-4">İLANIN GENİŞ KİTLELERE YAYILSIN</h3>
                        <p>
                            kralilan.com geniş yayın ağıyla ilanının satıcıyla hemen buluşsun istersen hemen ilan ver.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
