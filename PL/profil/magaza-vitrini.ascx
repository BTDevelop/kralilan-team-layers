<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="magaza-vitrini.ascx.cs" Inherits="PL.profil.magaza_vitrini" %>

<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-users"></i>Mağazamın Vitrini </h2>
        <div id="accordion" class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="#collapseB1" data-toggle="collapse">Vitrine Ekle</a></h4>
                </div>
                <div class="panel-collapse collapse in" id="collapseB1">
                    <div class="panel-body">
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">İlan No</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control">
                                </div>
                            </div>

                            <%--<div class="form-group">
                                <label class="col-md-3 control-label"></label>

                                <div class="col-md-8">
                                    <asp:Button ID="btnKaydet" CssClass="btn btn-success btn-lg" runat="server" OnClick="btnKaydet_Click" Text="Bilgilerimi Güncelle" />
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <div class="table-action">
            </div>
            <table id="addManageTable"
                class="table table-striped table-bordered add-manage-table table demo"
                data-filter="#filter" data-filter-text-only="true">
                <thead>
                    <tr>
                        <th>İlan No</th>
                        <th>Başlık</th>
                        <th>İlan Tarihi</th>
                        <th>İşlemler</th>
                    </tr>
                </thead>
                <tbody id="addswrap">
                </tbody>
            </table>
        </div>
    </div>
</div>