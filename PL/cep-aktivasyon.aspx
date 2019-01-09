<%@ Page Title="Cep Aktivasyon - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="cep-aktivasyon.aspx.cs" Inherits="PL.cep_aktivasyon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
    <style>
        .btn-success-ki {
            background-color: #2D3E50;
            color: #FFFFFF;
            width: 110px;
            font-weight: bold;
        }

            .btn-success-ki:hover {
                background-color: #2D3E50;
                color: #FFFFFF;
                width: 110px;
                font-weight: bold;
            }

        .form-control {
            border-radius: 6px;
        }

            .form-control:focus {
                border-color: #16A085;
                border: 1px solid #16A085;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-md-9 page-content">
                    <div class="inner-box category-content">
                        <h2 class="title-2"><i class="icon-alert"></i>Cep Telefonunu Doğrula</h2>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group required">
                                    <label class="control-label">Onay Kodu </label>
                                    <input id="validator" class="form-control" name="validator" />
                                </div>
                                <div class="form-group">
                                    <button id="validasyon" runat="server" class="btn btn-success-ki" onserverclick="dogrula_Click">Doğrula</button>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="faq-content">
                        <div aria-multiselectable="true" role="tablist" id="accordion" class="panel-group faq-panel">
                            <div class="panel">
                                <div id="headingOne" role="tab" class="panel-heading">
                                    <h4 class="panel-title">
                                        <a aria-controls="collapseOne" aria-expanded="true" href="#collapseOne"
                                            data-parent="#accordion" data-toggle="collapse">Referans Kodu Doğrulama
                                        </a>
                                    </h4>
                                </div>
                                <div aria-labelledby="headingOne" role="tabpanel" class="panel-collapse collapse in"
                                    id="collapseOne">
                                    <div class="panel-body">
                                        Cep telefonunuza kralilan.com üzerinden gelen mesajda bulunan kodu girerek hesabınızı doğrulayın.
                                   
                                        <br />
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.page-content -->
                <div class="col-md-3 reg-sidebar">
                    <div class="reg-sidebar-inner text-center">
                        <div class="promo-text-box">
                            <i class=" icon-picture fa fa-4x icon-color-2"></i>
                            <h3><strong>İlanlarını Ücretsiz Yayınla</strong></h3>
                            <p>
                                kralilan.com'da her kategoriden ilan vermek tamamen ücretsiz herşey senin elinden yayınla paylaş satış yap.
                           
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="contactAdvertiser" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 ml-auto">
                                <div class="reg-sidebar-inner text-center">
                                    <div class="promo-text-box">
                                        <i class=" icon-home fa fa-4x icon-color-2"></i>
                                        <h3><strong>Anasayfaya Devam Et</strong></h3>
                                        <p>
                                            kralilan.com'da her kategoriden sahibinden olarak ilan verebilirsin. Yayınla, Paylaş, Satış yap.                          
                                        </p>
                                        <a href="/" type="button" class="btn btn-default"><i class=" icon-home">Devam Et</i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 ml-auto">
                                <div class="reg-sidebar-inner text-center">
                                    <div class="promo-text-box">
                                        <i class=" icon-basket fa fa-4x icon-color-1"></i>
                                        <h3><strong>Mağaza Açmak İstiyorum</strong></h3>
                                        <p>
                                            kralilan.com'da firmanıza ait ilanlarınızı, mağaza açarak onay beklemeden yayınlayıp satışınızı yapabilirsiniz.
                           
                                        </p>
                                        <a href="/yeni-magaza/" type="button" class="btn btn-success"><i class=" icon-basket">Devam Et</i></a>
                                    </div>
                                </div>
                            </div>
                        </div>                   
                    </div>              
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
    <script type="text/javascript">

        function ShowUserAds() {
            $('#contactAdvertiser').modal({
                backdrop: 'static',
                keyboard: false
            })
        }

        function showmodalpopup() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Onay kodunuz doğrulanmadı.',
            });
        };

        function showmodalpopup1() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Onay kodunuz doğrulandı giriş yapmak için yönlendiriliyorsunuz.',
            });
        };

        function showmodalpopup2() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Onay kodu gönderme işlemi gerçekleşmedi.',
            });
        };
    </script>
</asp:Content>

