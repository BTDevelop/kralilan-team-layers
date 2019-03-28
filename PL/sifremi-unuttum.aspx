<%@ Page Title="Şifremi Unuttum - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="sifremi-unuttum.aspx.cs" Inherits="PL.sifremi_unuttum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row"> 
                <div class="col-sm-5 login-box">
                    <div class="panel panel-default">
                         <!--<div class="panel-intro text-center">                            <h2 class="logo-title" style="text-transform: lowercase">                                Original Logo will be placed here                                  <img style="padding-left: 15px; padding-top: 9px;" src="/upload/default-images/apple-touch-icon-57-precomposed.png" />                            </h2>                        </div>-->	                    <div class="panel-intro text-center">		                    <h1 class="footer-text" style="font-size: 19px;margin-top: -40px;margin-bottom: 20px;padding-top: 20px;background-color: #16A085;color: white;">Yeni Şifre Al</h1>	                    </div>
                        <div class="panel-body">
                            <div role="form">
                                <div class="form-group">
                                    <label for="sender-email" class="control-label">Kayıtlı E-Posta Adresi</label>
                                    <div class="input-icon">
                                        <i class="icon-user fa"></i>
                                        <input id="txtMail" type="text" runat="server" placeholder="Email"
                                            class="form-control email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="Gonder" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Devam" OnClick="Gonder_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <p class="text-center ">
                                <a href="/"><strong>Ana Sayfaya git</strong></a>
                            </p>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="login-box-btm text-center">
                        <p>
                            Üye değil misiniz?                   
                            <br />
                            <a title="Üye Ol" href="/kayit/"><strong>Hemen Üye Ol</strong></a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="libraries/assets/js/form-validation.js"></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
    <script type="text/javascript">
        function showmodalpopup() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Kayıtlı eposta adresine aktivasyon linki başarıyla gönderilmiştir.',
            });
        };

        function showmodalpopup1() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Bu eposta adresi kayıtlarda bulunamadı.',
            });
        };

        function showmodalpopup2() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Aktivasyon linki gönderme işlemi gerçekleşmedi.',
            });
        };
    </script>
</asp:Content>

