<%@ Page Title="Sıkça Sorulan Sorular - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="sikca-sorulan-sorular.aspx.cs" Inherits="PL.sikca_sorulan_sorular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
     <style>
        .color-palette {
            height: 35px;
            line-height: 35px;
            text-align: center;
        }

        .color-palette-set {
            margin-bottom: 15px;
        }

        .color-palette span {
            display: none;
            font-size: 12px;
        }

        .color-palette:hover span {
            display: block;
        }

        .color-palette-box h4 {
            position: absolute;
            top: 100%;
            left: 25px;
            margin-top: -40px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 12px;
            display: block;
            z-index: 7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <div class="intro-inner">
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
    <!-- /.intro-inner -->
    <div class="main-container inner-page">
        <div class="container">
            <div class="section-content">
                <div class="row ">
                    <h1 class="text-center ">kralilan.com <strong>SSS</strong></h1>
                    <hr class="center-block small text-hr" />
                </div>
                <div class="faq-content">
                    <div aria-multiselectable="true" role="tablist" id="accordion" class="panel-group faq-panel">
                        <div class="panel">
                            <div id="headingOne" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseOne" aria-expanded="true" href="#collapseOne"
                                        data-parent="#accordion" data-toggle="collapse">kralilan.com nedir ve ne işe yarar?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="headingOne" role="tabpanel" class="panel-collapse collapse in"
                                id="collapseOne">
                                <div class="panel-body">
                                    Ülkemizdeki Tüm Büyükşehir Belediyeleri, İlçe Belediyeleri, İl Özel İdareleri, Mal Müdürlükleri, Bankalar, 
                                    Özelleştirme İdaresi, İcra ve İzale-i Şuyu Daireleri, sahibinden, emlakçıdan, inşaat firmasından, 
                                    özetle tüm kamu kurumlarından gayrimenkullerin uydu üzerinden gerçek konumlarıyla 
                                    Türkiye’de ve diğer ülkelerdeki yatırımcılara sunan bir seri ilan sitesidir.  
                                    <br/>
                                    <br/>
                                    kralilan.com internet sitesi üzerinden ilanlarınızı daha geniş 
                                    kitlelere ve özellikle yabancı yatırımcılara ulaşmasını sağlayabilirsiniz.
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="headingTwo" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapseTwo" aria-expanded="false" href="#collapseTwo"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Emlakçı mısınız? Komisyon alıyor musunuz?
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
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Sitenize üye olmanın maliyeti nedir?
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
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Sitenize ilan vermenin maliyeti nedir?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_04" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_04">
                                <div class="panel-body">
                                    İlan vermek yıllık 3 adedi geçmemek koşuluyla ücretsizdir. İstediğiniz kadar ilanı sitemiz üzerinden yayınlayabilirsiniz. 
                                    Şayet elinizde çok sayıda ilanınız varsa editörlerimiz size yardım etmekten memnun olacaktır.                                
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_05" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_05" aria-expanded="false" href="#collapse_05"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Tüm ilanları sosyal medyadan takip edebilir miyim?
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
                        <div class="panel">
                            <div id="heading_06" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_06" aria-expanded="false" href="#collapse_06"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Hem üyelik hem de ilan vermek ücretsiz ise sizin kazancınız ne?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_06" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_06">
                                <div class="panel-body">
                                    Sitemizin gelir kaynağı emlakçı, inşaat firmaları ve konuyla alakalı diğer firmaların verdiği reklam ücretleri,
                                    mağaza ücretleri,  yatırımcıların aldıkları kontör ve vitrin ilan ücretleridir. 
                                    Yani alışılmışın dışında ilan verenden hiçbir şekilde ücret talep etmiyoruz.
                                </div>
                            </div>
                        </div>              
                        <div class="panel">
                            <div id="heading_08" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_08" aria-expanded="false" href="#collapse_08"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">kralilan.com kullanıcılarına ne vaat ediyor?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_08" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_08">
                                <div class="panel-body">
                                    Sınırsız ve ücretsiz ilan verebilirsiniz. Bu sayede sosyal medya ve site üzerinden ilanınızı dünyaya duyurma fırsatını yakalamış olursunuz.
                                    Gerçek uydu görünümleriyle ilanların lokasyonu hakkında doğru bilgi alırsınız. Bu sayede sadece sözel veri ile yetinmeyerek harita üzerinden sorgulamalar yaparak istediğiniz bilgilere daha kolay ulaşmış olursunuz.
                                    Tematik gösterim imkânı ile gayrimenkullerin detayına girmeden ekran üzerindeki renklerine bakarak malik bilgileri hakkında bilgi edinmiş olursunuz.                            
                                    Zamanınınız kıymetli ve biz bunun farkındayız. 
                                    Sizi binlerce siteyi aramaktan ve araştırma yapmaktan kurtarıyoruz. 
                                    Sadece bizim sitemizi takip ederek milyonlarca sahibinden, 11146 banka şubesinden, 980 sulh hukuk mahkemesinden, 985 icra dairesinden,
                                    satılamayan binlerce hazine ait ilanlardan, özelleştirme idaresinden, 
                                    30 büyükşehir belediyesi, 519 büyükşehir ilçe belediyesi, 400 ilçe belediyesi, 
                                    396 belde belediyesinden, 919 mal müdürlüğünden, on binlerce emlakçı ve inşaat firmasından ve daha onlarca kamu kurumundan ilanları sizin için bir araya getiriyoruz.

                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_09" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_09" aria-expanded="false" href="#collapse_09"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">emlakbilgisistemi.com ile nasıl bir bağınız var?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_09" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_09">
                                <div class="panel-body">
                                    www.emlakbilgisistemi.com ’un tüm hakları kralilan.com tarafından devir alınmıştır. www.emlakbilgisistemi.com dan kontör alan
                                     veya üye olan kullanıcılar, mail adresleri veya onaylı cep telefon numaralarını kullanarak kralilan.com üzerinden hiçbir hak kaybı olmaksızın faydalanmaya devam edeceklerdir. 
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_010" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_010" aria-expanded="false" href="#collapse_010"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Vitrin ilan ne demek?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_010" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_010">
                                <div class="panel-body">
                                  İlan veren ilanını ön plana çıkarmak ve daha fazla sayıda yatırımcıya ulaştırmak isterse veya ilanını daha hızlı 
                                  bir şekilde satmayı düşünüyorsa vitrin ilan alabilir.  Vitrin ilanın bir diğer özelliği ilan üzerine tıklanınca 
                                  ekranın uydu üzerinden ilana gitmesi yani odaklanmasıdır. Bu yatırımcıların ilanınızın 
                                  gerçek konumu ve şekliyle görmesini sağlar. Yaptığımız araştırmalar vitrin ilan alanların % 80 oranda daha hızlı ve daha iyi fiyatlara sattığını göstermiştir.
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_011" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_011" aria-expanded="false" href="#collapse_011"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Sitede ilan grafikleri farklı renklerde gözüküyor bunun bir anlamı var mı?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_011" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_011">
                                <div class="panel-body">
                                    Evet var. kralilan.com renk haritası aşağıda belirtilmiştir.
                    
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Diğer Kamu Kurumlarından</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#0080FF"><span>Diğer Kamu Kurumlarından</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">İzalei Şuyudan</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#FF00FF"><span>İzalei Şuyudan</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Hazineden (Satılamayan)</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#00FF00"><span>Hazineden (Satılamayan)</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Bankadan</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#FFFF00"><span>Bankadan</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Sahibinden</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#FF0000"><span>Sahibinden</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Hazineden (Satışı Devam Eden)</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#00FFFF"><span>Hazineden (Satışı Devam Eden)</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                        <div class="row">
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Emlak Ofisinden</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#0000FF"><span>Emlak Ofisinden</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Belediyeden</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#7F00FF"><span>Belediyeden</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">İcradan</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#FF8000"><span>İcradan</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">Özelleştirme İdaresinden</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#FF007F"><span>Özelleştirme İdaresinden</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 col-md-12">
                                                <p class="text-center">İnşaat Firmasından</p>
                                                <div class="color-palette-set">
                                                    <div class="color-palette" style="background-color:#00FF80"><span>İnşaat Firmasından</span></div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_012" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_012" aria-expanded="false" href="#collapse_012"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Üyelik bilgilerimi nasıl güncellerim?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_012" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_012">
                                <div class="panel-body">
                                    kralilan.com'a üye girişi yaptıktan sonra profilim kısmına tıklayarak istediğiniz güncellemeleri yapabilirsiniz.    
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_013" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_013" aria-expanded="false" href="#collapse_013"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Üyelik bilgilerimin güncel olması neden önemli?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_013" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_013">
                                <div class="panel-body">
                                    kralilan.com olarak sizinle iletişime geçebilmemiz ve yeniliklerden haberdar olabilmeniz için üyelik bilgilerinizin güncel olması önemlidir. 
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_014" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_014" aria-expanded="false" href="#collapse_014"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Vitrine sunulsun mu sorusu ne anlama gelmektedir?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_014" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_014">
                                <div class="panel-body">
                                    İlanınızı ön plana çıkarmak ve yatırımcıların dikkatini çekmek için harita sayfasında sağda yer almasını sağlayabilirsiniz. Ayrıca vitrin ilanlar editörlerimiz tarafından tekrar düzenlemeye tabi tutularak Facebook sayfaları üzerinde ve Google arama sonuçlarında da görüntülenmesi sağlanır. 
                               Diğer ilan sitelerinden farklı olarak kralilan.com da tüm ilanlar dikkat çeker ve sorgulanır.
                               Vitrindeki ilanların normal ilanlardan çok daha fazla sorgulandığı ve daha hızlı satıldığı görülmüştür.
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div id="heading_015" role="tab" class="panel-heading">
                                <h4 class="panel-title">
                                    <a aria-controls="collapse_015" aria-expanded="false" href="#collapse_015"
                                        data-parent="#accordion" data-toggle="collapse" class="collapsed">Sitenize üyelerine hangi bilgileri sunuyorsunuz. Sonuç ürününüz nedir?
                                    </a>
                                </h4>
                            </div>
                            <div aria-labelledby="heading_015" role="tabpanel" class="panel-collapse collapse"
                                id="collapse_015">
                                <div class="panel-body">
                                    Harita üzerinde parsele tıkladığınız anda detay gör sayfası açılır. Burada ilanla alakalı detaylı bilgiler sunuyoruz.
                                    <br />
                                    <br />
                                   <b> Uydu Görüntüsü:</b> Parseli içerisine alacak şekilde detaylı uydu görüntüsü.
                                    <br />
                                    <b>İlan Bilgileri:</b> Vurgulu başlık ve fiyatı 
                                    <br />
                         
                                    <b>Tapu Bilgileri:</b> İli -  İlçesi - Mah/Köy - Mah/Köy Eski Adı - Mevki - Niteliği - Tapu Alanı - Malik Durumu - Hisse Alanı Bilgileri
                                    <br />
                                    <b>İmar Bilgileri:</b> İmar Durumu - Niteliği  - Yapı Nizamı - Kat Adedi - TAKS - KAKS - Emsal - Kat Kaşılığı - Krediye Uygunluk Bilgileri
                                    <br />                        
                                    <b>İhaleli Parsel Bilgileri:</b> Taşınmaz No - Hazine Hissesi - Satılacak Alan - Geçici Teminat - Muammen Bedeli - İlgilisi - Satış Yeri - 1. Satış Tarihi - 2. Satış Tarihi 
                                    Önceki İhale Tarihi - Hisse Oranı ve varsa İhale Sonucu ve İhale Açıklaması
                                    <br />                           
                                    <b>Açıklamalar:</b> Sahibinden emlakçıdan ve inşaat firmalarından olan parsellerde ilan sahibi tarafından diğer satılık 
                                    parsellerde bilirkişiler exper gayrimenkul değerleme uzmanları vb tarafından kaleme alınan ve editörlerimiz tarafından 
                                    gerekli düzeltmeler yapılan parselle alakalı merak edilen bilgilerin sunulduğu alan             
                                    <br />
                                    <b>İlan Sahibi İle İlgili Bilgiler:</b> Kimden - İlan Sahibi - Telefon - E-Mail Adresi - Adres - İlçe ve İl Bilgileri
                                    <br />
                                    <b>Sistem Bilgileri:</b> İlan No - İlan Tarihi bilgileri
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
