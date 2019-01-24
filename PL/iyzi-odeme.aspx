<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="iyzi-odeme.aspx.cs" Inherits="PL.iyzi_odeme" %>

<asp:Content ID="Content6" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/libraries/assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="/libraries/assets/css/owl.theme.css" rel="stylesheet" />
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-md-9 page-content">
                    <div class="inner-box category-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-horizontal">
                                    <fieldset>
                                        <div id="iyzipay-checkout-form" class="reponsive"></div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.page-content -->
                <div class="col-md-3 reg-sidebar">
                    <div class="reg-sidebar-inner text-center">
                        <div class="promo-text-box">
                            <i class="icon-basket fa fa-4x icon-color-2"></i>
                            <h3><strong>İlanını Hemen Yayınla</strong></h3>
                            <p>
                                Daha fazla alıcıya ulaş satışının keyfini çıkar.                      
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="scripts" runat="server">
    <script src="/libraries/assets/js/fileinput.min.js" type="text/javascript"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/management/plugins/input-mask/jquery.inputmask.extensions.js"></script>
</asp:Content>
