<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sifre-degistir.ascx.cs" Inherits="PL.profil.sifre_degistir" %>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title"><a href="#collapseB2" data-toggle="collapse">Şifre Değiştir</a>
                </h4>
            </div>
            <div class="panel-collapse collapse" id="collapseB2">
                <div class="panel-body">
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Eski Şifre</label>

                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="txtEskiSifre" runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Yeni Şifre</label>

                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="txtYeniSifre" runat="server">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <asp:Button ID="Guncelle_Sifre" type="submit" CssClass="btn btn-default" runat="server" Text="Güncelle" OnClick="Guncelle_Sifre_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
