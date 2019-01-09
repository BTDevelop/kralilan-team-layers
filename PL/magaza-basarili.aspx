<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="magaza-basarili.aspx.cs" Inherits="PL.magaza_basarili" %>

<asp:Content ID="Content6" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/libraries/assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="/libraries/assets/css/owl.theme.css" rel="stylesheet" />
    <div class="parallaxbox about-parallax-bottom">
        <div class="container">
            <div class="row text-center featuredbox">
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-basket ln-shadow-box shape-3"></i></div>
                        <h3 class="title-4">MAĞAZA BİLGİLERİNİ DOĞRULAMA AŞAMASINDA</h3>
                      <%--  <p>
                            kralilan.com'un uzman elemanları bilgilerini inceleyip sana geri dönüş yapacaktır.                 
                        </p>--%>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class=" icon-credit-card-1 ln-shadow-box shape-6"></i></div>
                        <h3 class="title-4">MAĞAZA PAKET ÖDEMEN BAŞARILI</h3>
                     <%--   <p>
                            kralilan.com'da mağazanın onay sürecine geçmesi için öncelikle seçilen paketin ödemesini gerçekleştir.           
                        </p>--%>
                    </div>
                </div>
                <div class="col-sm-4 xs-gap">
                    <div class="inner">
                        <div class="icon-box-wrap"><i class="icon-ok-1 ln-shadow-box shape-5"></i></div>
                        <h3 class="title-4">MAĞAZAN ONAYDAN SONRA HEMEN YAYINDA</h3>
                      <%--  <p>
                            kralilan.com mağazanı onayladıktan sonra satışları gerçekleştirebilirsin.                   
                        </p>--%>
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
<%--                        <h2 class="title-2 uppercase"><strong><i class="icon-basket"></i>MAĞAZA BİLGİLERİ</strong></h2>--%>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-horizontal">
                                    <fieldset>
                                        <!-- Multiple Radios (inline) -->                             
                           <%--             <div class="content-subheading">
                                            <i class="icon-inbox fa"></i><strong>ÖDEME BAŞARILI
                                            </strong>
                                        </div>--%>
                                        <div class="well">
                                            <h3><i class="icon-basket ">Ödeme işlemin başarılı</i>
                                            </h3>
                                            <%--<p>
                                                Mağaza paket ödemesi için yöntem seçin.                                        
                                            </p>--%>
                                            <div class="form-group">
                                                <table class="table table-hover checkboxtable">
                                                    <tr>

                                                        <td>
                                                            <p>
                                                                Ödeme başarılı bir şekilde gerçekleşti. Gerekli onay kontrolerinin ardından mağazanız üzerinden
                                                                satış gerçekleştirebilirsiniz. Sizinle kısa süre içerisinde iletişime geçilecektir.                                                                                                                                                          
                                                           </p>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.page-content -->
                <div class="col-md-3 reg-sidebar">
                    <div class="reg-sidebar-inner text-center">
                        <div class="promo-text-box">
                            <i class="icon-home fa fa-4x icon-color-2"></i>
                            <h3><strong>Anasayfaya devam et</strong></h3>
                            <p>
                                Daha fazla alıcıya ulaş satışının keyfini çıkar.                      
                            </p>
                        </div>
                    </div>
                </div>
                <!--/.reg-sidebar-->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </div>
    <!-- /.main-container -->
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
<asp:Content ID="Content8" ContentPlaceHolderID="scripts" runat="server">
    <script src="/libraries/assets/js/fileinput.min.js" type="text/javascript"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>
</asp:Content>

<%--
<asp:Content ID="Content1" ContentPlaceHolderID="metalog" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="styles" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
