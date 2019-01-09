<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="magaza-kullanicilar.ascx.cs" Inherits="PL.profil.magaza_kullanıcılar" %>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
<script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
<script type="text/javascript">
    function showmodalpopup() {
        $.dialog({
            title: 'Bilgilendirme',
            content: 'Danışman ekleme işlemi başarılı şekilde tamamlandı.',
        });
    };

    function showmodalpopup1() {
        $.dialog({
            title: 'Bilgilendirme',
            content: 'Mağazanızdan danışman kaldırma işlemi tamamlandı.',
        });
    };

    function showmodalpopup2() {
        $.dialog({
            title: 'Bilgilendirme',
            content: 'Mağazanızın danışman sayısı sınırı aşılmıştır.',
        });
    };
    </script>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-users"></i>Danışmanlarım</h2>
        <div id="accordion" class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title"><a href="#collapseB1" data-toggle="collapse">Danışman Davet Et</a></h4>
                </div>
                <div class="panel-collapse collapse in" id="collapseB1">
                    <div class="panel-body">
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">E-Posta</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="adminmail" name="adminmail">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Danışman Adı(otomatik)</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled="disabled" id="adminname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>

                                <div class="col-md-8">
                                    <button type="submit" class="btn btn-success-ki btn-lg" runat="server" onserverclick="Unnamed_ServerClick">Davet Et</button>
                                </div>
                            </div>
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
                        <th>Ad Soyad</th>
                        <th>E-Posta</th>
                        <th>Durumu</th>
                        <th>İşlemler</th>
                    </tr>
                </thead>
                <tbody id="addswrap">
                    <asp:Repeater ID="rpstoreusers" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# ((BLL.magazaKullaniciBll.StoreConsultantType)Container.DataItem).kullaniciAdSoyad %></td>
                                <td><%# ((BLL.magazaKullaniciBll.StoreConsultantType)Container.DataItem).email %></td>
                                <td><%# ((BLL.magazaKullaniciBll.StoreConsultantType)Container.DataItem).rol %></td>
                                <td><%# ((BLL.magazaKullaniciBll.StoreConsultantType)Container.DataItem).aksiyon %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery('#adminmail').focusout(function () {
        var mail = $("#adminmail").val();

        if (mail != "") {
            ctrlUser(mail);
        }
    });

    function ctrlUser(_inmail) {
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_api.asmx/giveMeUserInfo",
            dataType: "json",
            data: "{ mail:'" + _inmail + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data != null) {
                    var d = JSON.parse(data.d);
                    $("#adminname").val(d.kullaniciAdSoyad);
                }
            },
            error: function (e) {
                var s;
                s = e;
            }
        });
    }
</script>
