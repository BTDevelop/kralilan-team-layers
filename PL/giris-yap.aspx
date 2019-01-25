<%@ Page Title="Ücretsiz İlan Vermek için Hemen Giriş Yap - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="giris-yap.aspx.cs" Inherits="PL.giris_yap" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-sm-5 login-box">
                    <div class="panel panel-default">
                        <div class="panel-intro text-center">
                             <h1 class="footer-text" style="font-size: 19px;margin-top: -40px;margin-bottom: 20px;padding-top: 20px;background-color: #16A085;color: white;">
								Ücretsiz İlan Vermek için Giriş Yap
                            </h1>
                        </div>
                        <div class="panel-body">
                            <div role="form">
                                <div class="form-group">
                                    <label for="sender-email" class="control-label">E-Posta Adresi</label>

                                    <div class="input-icon">
                                        <i class="icon-user fa"></i>
                                        <input id="txtMail" type="text" runat="server" placeholder="E-Posta Adresi"
                                            class="form-control email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="user-pass" class="control-label">Şifre</label>
                                    <div class="input-icon">
                                        <i class="icon-lock fa"></i>
                                        <input type="password" class="form-control" runat="server" placeholder="Şifre"
                                            id="txtSifre" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="Button1" CssClass="btn btn-primary  btn-block" runat="server" OnClick="Giris_Click" Text="Giriş Yap" />
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="checkbox pull-left">
                                <label>
                                    <asp:CheckBox ID="chcBeniHatirla" type="checkbox" runat="server" AutoPostBack="true" OnCheckedChanged="chcBeniHatirla_CheckedChanged" />
                                    Beni Hatırla</label>
                            </div>
                            <p class="text-center pull-right">
                                <a href="/sifremi-unuttum/">Şifremi Unuttum</a>
                            </p>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="login-box-btm text-center">
                        <p>
                            Üye değil misiniz?                         
                            <br/>
                            <a href="/kayit/"><strong>Hemen Üye Ol</strong></a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.main-container -->
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/form-validation.js") %>'></script>
</asp:Content>
