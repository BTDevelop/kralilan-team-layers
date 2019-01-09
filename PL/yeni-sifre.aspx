<%@ Page Title="Yeni Şifre Oluştur - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="yeni-sifre.aspx.cs" Inherits="PL.yeni_sifre" %>
<asp:Content ID="Content3" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-sm-5 login-box">
                    <div class="panel panel-default">
                        <div class="panel-intro text-center">
                            <h2 class="logo-title">
                                <img style="padding-left: 15px; padding-top: 9px;" src="/upload/default-images/apple-touch-icon-57-precomposed.png" />
                            </h2>
                        </div>
                        <div class="panel-body">
                            <div role="form">
                                <div class="form-group">
                                    <label for="sender-email" class="control-label">Yeni Şifre</label>
                                    <div class="input-icon">
                                        <i class="icon-lock fa"></i>
                                        <input id="txtSifre" type="password" runat="server"
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
                            <a href="/kayit"><strong>Ana Sayfaya git</strong></a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
    <script type="text/javascript">
        function showmodalpopup() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Şifre değiştirme işlemi başarılı',
                theme: 'supervan'
            });
        };
        function showmodalpopup1() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Şifre değiştirme işlemi başarısız',
                theme: 'supervan'
            });
        };
        function showmodalpopup2() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Aktivasyon linki gönderme işlemi gerçekleşmedi.',
                theme: 'supervan'
            });
        };
    </script>
</asp:Content>
