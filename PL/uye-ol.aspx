<%@ Page Title="Ücretsiz Üye Ol İlan Ver - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="uye-ol.aspx.cs" Inherits="PL.uye_ol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/css/bootstrapValidator.min.css" rel="stylesheet" />
    <style>
        .checkbox label {
            padding-left: 0.5em !important;
        }

        #success_message {
            display: none;
        }

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-md-8 page-content">
                    <div class="inner-box category-content">
                        <h2 class="title-2"><i class="icon-user-add"></i>Üye Ol</h2>
                        <div class="row">
                            <div class="col-sm-12" id="contact_form">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="control-label">Ad</label>
                                    <input id="name" name="name" required="required" class="form-control input-md" />
                                </div>
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="control-label">Soyad</label>
                                    <input id="surname" name="surname" required="required" class="form-control input-md" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Cep Telefonu</label>
                                    <div class="input-icon">
                                        <i class="icon-phone fa"></i>
                                        <input id="phone" name="phone" class="form-control input-md" required="required" data-inputmask='"mask": "(999) 999-9999"' data-mask />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="control-label">E-Posta Adresi</label>
                                    <input id="mail" name="mail" required="required" type="email" class="form-control input-md" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Şifre</label>
                                    <div class="input-icon">
                                        <i class="icon-eye-3 fa" id="showPass"></i>
                                        <input id="password" name="password" required="required" type="password" class="form-control input-md" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" required="required" name="requ" id="requ" />
                                    <a href="/uyelik-sozlesmesi/" target="_blank">Üyelik Sözleşmesi</a>'ni ile <a href="/sartlar-ve-kosullar/" target="_blank">Şartlar ve Koşulları</a>'ı okudum kabul ediyorum.                                       
                                </div>
                                <div class="g-recaptcha" data-sitekey="6LcAzR8UAAAAAKX8tvRp5HjoOBx4Y5T9xf4Jj9VL"></div>
                                <div style="clear: both"></div>
                                <button id="UyeOl" type="submit" class="btn btn-success-ki" runat="server" onserverclick="UyeOl_Click" style="margin: 20px 0;">Üye Ol</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.page-content -->
                <div class="col-md-4 reg-sidebar">
                    <div class="reg-sidebar-inner text-center">
                        <div class="promo-text-box">
                            <i class=" icon-picture fa fa-4x icon-color-2"></i>
                            <h1><strong>Ücretsiz ilan ver</strong></h1>
                            <p>kralilan da uygun fiyata istediğin kadar ilan ver satışını gerçekleştir. İlk üç ilanınız ücretsiz.</p>
                        </div>
                        <div class="promo-text-box">
                            <i class=" icon-pencil-circled fa fa-4x icon-color-1"></i>
                            <h2><strong>İlanlarını düzenle ve yönet</strong></h2>
                            <p>Profilinden tüm ilanlarını yönet istediğini yayınla, düzenle herşey senin elinde.</p>
                        </div>
                        <div class="promo-text-box">
                            <i class="  icon-heart-2 fa fa-4x icon-color-3"></i>
                            <h3><strong>İlanların favori listelere alınsın</strong></h3>
                            <p>İlanların ilgili satıcılara ulaşsın sen satışının keyfini çıkar.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <div id="popupdiv" title="Basic modal dialog" style="display: none"></div>
        <!-- /.container -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/fileinput.min.js") %>'></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/language/tr_TR.min.js'></script>
    <script type="text/javascript">
        function showmodalpopup() {
            $.dialog({
                title: 'Bilgilendirme',
                content: 'Lütfen Üyelik Sözleşmesi ile Şartlar ve Koşulları okuyup işaretle.',
            });
        };
        function showmodalpopup1() {
            $.dialog({
                title: 'Bilgilendirme',
                content: 'Girilen email veya telefonu kayıtlarımızda bulduk. Lütfen farklı bilgiler giriniz.',
            });
        };
        function showmodalpopup2() {
            $.dialog({
                title: 'Bilgilendirme',
                content: 'Onay kodu gönderme işlemi gerçekleşmedi.',
            });
        };
        function showmodalpopup3() {
            $.dialog({
                title: 'Bilgilendirme',
                content: 'Güvenlik doğrulanmadı.',
            });
        };
        $(function () {
            $("[data-mask]").inputmask();
        });
        $("#showPass")
        .mouseup(function () {
            $("#password").attr('type', 'password');
        })
        .mousedown(function () {
            $("#password").attr('type', 'text');
        });
        $(document).ready(function () {
            $('#contact_form').bootstrapValidator({
                // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        validators: {
                            stringLength: {
                                min: 2,
                                message: 'Lütfen 2 karakterden fazla giriniz'
                            },
                            notEmpty: {
                                message: 'Lütfen adınızı giriniz'
                            }
                        }
                    },
                    surname: {
                        validators: {
                            stringLength: {
                                min: 2,
                                message: 'Lütfen 2 karakterden fazla giriniz'
                            },
                            notEmpty: {
                                message: 'Lütfen soyadınızı giriniz'
                            }
                        }
                    },
                    password: {
                        validators: {
                            stringLength: {
                                min: 6,
                                message: 'Lütfen 6 karakterden fazla giriniz'

                            },
                            notEmpty: {
                                message: 'Lütfen şifrenizi giriniz'
                            }
                        }
                    },
                    mail: {
                        validators: {
                            notEmpty: {
                                message: 'Lütfen e-posta adresinizi giriniz'
                            },
                            emailAddress: {
                                message: 'Lütfen geçerli bir e-posta adresi giriniz'
                            }
                        }
                    },
                    phone: {
                        validators: {
                            notEmpty: {
                                message: 'Lütfen cep telefonunuzu giriniz'
                            },
                            phone: {
                                country: 'US',
                                message: 'Lütfen geçerli bir cep telefonu giriniz'
                            }
                        }
                    },
                }
            });
        });
    </script>
</asp:Content>
