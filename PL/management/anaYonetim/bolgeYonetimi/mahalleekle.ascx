<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mahalleekle.ascx.cs" Inherits="PL.management.anaYonetim.bolgeYonetimi.mahalleekle" %>

<link rel="stylesheet" href="../../plugins/select2/select2.min.css">
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<div class="content-wrapper">
    <section class="content-header">
        <h1>Mahalle Ekle
            <small>buradan mahalle ekleyebilirsiniz.</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Bana özel</h3>
                        <div class="box-tools">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gelenkutusu" runat="server"><i class="fa fa-inbox"></i>Gelen Kutusu </asp:HyperLink></li>
                            <li>
                                <asp:HyperLink NavigateUrl="~/management/araclar/araclar.aspx?page=gonderilen-kutusu" runat="server"><i class="fa fa-envelope-o"></i>Gönderilen Kutusu</asp:HyperLink></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Mahalle Bilgileri</h3>
                    </div>
                    <div role="form">
                        <div class="box-body">
                            <div>
                                <div class="form-group">
                                    <label>İl</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpIl_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>İlçe</label>
                                    <asp:DropDownList CssClass="form-control select2" Style="width: 100%;" ID="drpIlce" runat="server"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="txtMahalle">Mahalle Adı</label>
                                    <input type="text" class="form-control" id="txtMahalle" placeholder="Cumhuriyet" runat="server"/>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <asp:Button ID="Kaydet" runat="server" CssClass="btn btn-success" Text="Kaydet" OnClick="Kaydet_Click" />
                            <asp:Button ID="Vazgeç" runat="server" CssClass="btn btn-danger" Text="Vazgeç" OnClick="Vazgeç_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="../../plugins/select2/select2.full.min.js"></script>

<script>
    $(function () {
        $(".select2").select2();
    });
</script>
