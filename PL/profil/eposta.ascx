<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eposta.ascx.cs" Inherits="PL.profil.eposta" %>
<style>
    .btn-success {
        background-color: #16A085;
        color: #FFFFFF;
        width: 110px;
        font-weight: bold;
    }

    .form-control {
        border-radius: 6px;
    }

        .form-control:focus {
            border-color: #16A085;
            border: 2px solid #16A085;
        }
</style>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <div id="accordion" class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="#collapseB1" data-toggle="collapse">E-Posta </a></h4>
                </div>
                <div class="panel-collapse collapse in" id="collapseB1">
                    <div class="panel-body">
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Kayıtlı e-posta adresiniz</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" runat="server" id="txtMail">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9"></div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <asp:Button ID="Degistir" runat="server" CssClass="btn btn-success" Text="Değiştir" OnClick="Degistir_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
