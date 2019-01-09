<%@ Page Title="Profilim - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="profil.aspx.cs" Inherits="PL.profil.profil" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-row-wrapper" id="storeWrapper" runat="server">
        <div class="container">
            <div>
                <div class="row">
                    <div class="col-md-3">
                        <button class="btn btn-block">
                            <%= storeName %>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 page-sidebar">
                    <aside>
                        <div class="inner-box">
                            <div class="user-panel-sidebar">
                                <div class="collapse-box">
                                    <h5 class="collapse-title no-border">ÜYELİK BİLGİLERİM<a href="#My"
                                        data-toggle="collapse"
                                        class="pull-right "><i
                                            class="fa fa-angle-down"></i></a></h5>

                                    <div class="panel-collapse collapse in" id="My">
                                        <ul class="acc-list">
                                            <li>
                                                <a href='/secure/benim-sayfam/'><i class="icon icon-home"></i>&nbsp;BENİM SAYFAM </a>
                                                <a href='/secure/kisisel-bilgilerim/'><i class="icon icon-user"></i>&nbsp;KİŞİSEL BİLGİLER </a>
                                                <a href='/secure/eposta-hesabim/'><i class="icon icon-mail"></i>&nbsp;E-POSTA </a>
                                                <a href='/secure/cep-telefonum'><i class="icon icon-mobile"></i>&nbsp;CEP TELEFONU </a>
                                                <a href='/secure/hesap-hareketlerim/'><i class="icon icon-credit-card"></i>&nbsp;HESAP HAREKETLERİM </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="collapse-box" runat="server" id="SectionMyClassified">
                                    <h5 class="collapse-title">İLANLARIM <a href="#MyAds" data-toggle="collapse"
                                        class="pull-right collapsed"><i
                                            class="fa fa-angle-down"></i></a></h5>
                                    <div class="panel-collapse collapse" id="MyAds">
                                        <ul class="acc-list">
                                            <li>
                                                <a href="/secure/ilanlarim/"><i class="icon icon-docs"></i>TÜM İLANLARIM <%--<span class="badge">42</span>--%>  </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="collapse-box" runat="server" id="SectionMyStore">
                                    <h5 class="collapse-title">İLAN YÖNETİMİ <a href="#MyStoreClassified" data-toggle="collapse"
                                        class="pull-right collapsed"><i
                                            class="fa fa-angle-down"></i></a></h5>
                                    <div class="panel-collapse collapse" id="MyStoreClassified">
                                        <ul class="acc-list">
                                            <li>
                                                <a href="/secure/durum-bilgisi/"><i class="icon icon-docs"></i>DURUM BİLGİSİ</a></li>
                                            <li>
                                                <a href="/secure/yayindaki-ilanlarim/"><i class="icon icon-docs"></i>YAYINDAKİ </a></li>
                                            <li>
                                                <a href="/secure/yayinda-olmayan-ilanlarim/"><i class="icon icon-docs"></i>YAYINDA OLMAYAN </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="collapse-box">
                                    <h5 class="collapse-title">BENİM SEÇTİKLERİM <a href="#MyFavori" data-toggle="collapse"
                                        class="pull-right collapsed"><i
                                            class="fa fa-angle-down"></i></a></h5>

                                    <div class="panel-collapse collapse" id="MyFavori">
                                        <ul class="acc-list">
                                            <li>
                                                <a href="/secure/favori-ilanlarim/"><i class="icon icon-heart"></i>FAVORİ İLANLARIM <%--<span class="badge">42</span>--%> </a></li>
                                            <li>
                                                <a href="/secure/takip-ettigim-saticilar/"><i class="icon icon-certificate"></i>SATICILARIM <%--<span class="badge">42</span>--%></a></li>
                                            <li>
                                                <a href="/secure/takip-ettigim-magazalar/"><i class="icon icon-certificate-1"></i>MAĞAZALARIM <%--<span class="badge">42</span>--%></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="collapse-box" runat="server" id="SectionStoreInfo">
                                    <h5 class="collapse-title">MAĞAZAM <a href="#MyStore" data-toggle="collapse"
                                        class="pull-right collapsed"><i
                                            class="fa fa-angle-down"></i></a></h5>

                                    <div class="panel-collapse collapse" id="MyStore">
                                        <ul class="acc-list">
                                            <li>
                                                <a href="/secure/magaza-bilgilerim/"><i class="icon icon-basket-1"></i>MAĞAZA BİLGİLERİM </a></li>
                                            <li>
                                                <a href="/secure/magaza-danismanlarim/"><i class="icon icon-users"></i>DANIŞMANLARIM</a></li>
                                            <li>
                                                <a href="/secure/magaza-odemelerim/"><i class="icon icon-credit-card"></i>MAĞAZA ÖDEMELERİM</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="collapse-box" runat="server" id="projectBox">
                                    <h5 class="collapse-title">PROJELERİM <a href="#MyProject" data-toggle="collapse"
                                        class="pull-right collapsed"><i
                                            class="fa fa-angle-down"></i></a></h5>
                                    <div class="panel-collapse collapse" id="MyProject">
                                        <ul class="acc-list">
                                            <li>
                                                <a href="/secure/projelerim/"><i class="icon icon-docs"></i>PROJE LİSTESİ </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/owl.carousel.min.js") %>'></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="/management/plugins/select2/select2.full.min.js"></script>
    <script>
        $(function () {
            //Money Euro
            $("[data-mask]").inputmask();
        });
</script>

    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(function () {
                $(".select2").select2();
                //Datemask dd/mm/yyyy
                $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
                //Datemask2 mm/dd/yyyy
                $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
                //Money Euro
                $("[data-mask]").inputmask();
            });
        });
</script>
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(document).on('click', '#close-preview', function () {
                $('.image-preview').popover('hide');
                // Hover befor close the preview
                $('.image-preview').hover(
                    function () {
                        $('.image-preview').popover('show');
                    },
                     function () {
                         $('.image-preview').popover('hide');
                     }
                );
            });

            $(function () {
                // Create the close button
                var closebtn = $('<button/>', {
                    type: "button",
                    text: 'x',
                    id: 'close-preview',
                    style: 'font-size: initial;',
                });
                closebtn.attr("class", "close pull-right");
                // Set the popover default content
                $('.image-preview').popover({
                    trigger: 'manual',
                    html: true,
                    title: "<strong>Önizleme</strong>" + $(closebtn)[0].outerHTML,
                    content: "Dosya seçilmedi",
                    placement: 'bottom'
                });
                // Clear event
                $('.image-preview-clear').click(function () {
                    $('.image-preview').attr("data-content", "").popover('hide');
                    $('.image-preview-filename').val("");
                    $('.image-preview-clear').hide();
                    $('.image-preview-input input:file').val("");
                    $(".image-preview-input-title").text("Resim Yükle");
                });
                // Create the preview image
                $(".image-preview-input input:file").change(function () {
                    var img = $('<img/>', {
                        id: 'dynamic',
                        width: 250,
                        height: 200
                    });
                    var file = this.files[0];
                    var reader = new FileReader();
                    // Set preview image into the popover data-content
                    reader.onload = function (e) {
                        $(".image-preview-input-title").text("Değiştir");
                        $(".image-preview-clear").show();
                        $(".image-preview-filename").val(file.name);
                        img.attr('src', e.target.result);
                        $(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
                    }
                    reader.readAsDataURL(file);
                });
            });
        });
</script>
</asp:Content>

