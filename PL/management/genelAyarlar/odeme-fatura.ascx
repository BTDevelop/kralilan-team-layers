<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="odeme-fatura.ascx.cs" Inherits="PL.management.genelAyarlar.odeme_fatura" %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Fatura Bilgileri
            <small>#<%= odemeId %></small>
        </h1>

    </section>
    <div class="pad margin no-print">
        <div class="callout callout-info" style="margin-bottom: 0!important;">
            <h4><i class="fa fa-info"></i>Not:</h4>
            Bu fatura sanal ortamda hazırlanmıştır. Faturayı yazdırmak için aşağıdaki butonu kullanın. 
        </div>
    </div>

    <!-- Main content -->
    <section class="invoice">
        <!-- title row -->
        <div class="row">
            <div class="col-xs-12">
                <h2 class="page-header">
                    <i class="fa fa-globe"></i>kralilan.com
                <small class="pull-right">Tarih: <%= tarih %></small>
                </h2>
            </div>
            <!-- /.col -->
        </div>
        <!-- info row -->
        <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
                <address>
                    <strong>kralilan.com</strong><br>
                    Atatürk Üniversitesi<br />
                    ATA Teknokent Teknoloji Geliştirme Bölgesi<br />
                    A Blok 102-103-104 Ofisler Yakutiye/Erzurum Türkiye<br>
                    Telefon: +90-850-8085725<br>
                    Email: info@kralilan.com
                </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-4 invoice-col">
                <address>
                    <strong><%= ad %></strong><br>

                    <%= telefon %><br>
                    <%= mail %>
                </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-4 invoice-col">
                <b>Fatura #<%= odemeId %></b><br>
                <br>
                <b>Tarih:</b> <%= tarih %><br>
                <b>Hesap:</b> 28981107-5002<br />
                ZİRAAT BANKASI CUMHURİYET ŞUBESİ<br />
                Şube Kodu: 1239<br /> 
                IBAN: TR-9100-0100-1239-2898-1107-5002
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- Table row -->
        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Ödeme No</th>
                            <th>Ürün</th>
                            <th>Kart No</th>
                            <th>Ödeme Metodu</th>
                            <th>Tutar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rppay" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# ((BLL.ExternalClass.PaymentCS)Container.DataItem).id %></td>
                                    <td><%# ((BLL.ExternalClass.PaymentCS)Container.DataItem).operation %></td>
                                    <td><%# ((BLL.ExternalClass.PaymentCS)Container.DataItem).cardno %></td>
                                    <td><%# ((BLL.ExternalClass.PaymentCS)Container.DataItem).paytype %></td>
                                    <td>&#x20BA; <%# ((BLL.ExternalClass.PaymentCS)Container.DataItem).paytotal %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--  <tr>
                    <td><%= odemeId %></td>
                    <td><%= islemtip %></td>
                    <td>*********************</td>
                    <td><%= odemetip %></td>
                    <td> &#x20BA; <%= tutar %></td>
                  </tr>--%>
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <div class="row">
            <!-- accepted payments column -->
            <div class="col-xs-6">
                <p class="lead">Ödeme Metotları:</p>
                <img src="../dist/img/credit/visa.png" alt="Visa">
                <img src="../dist/img/credit/mastercard.png" alt="Mastercard">
                <img src="../dist/img/credit/american-express.png" alt="American Express">
                <img src="../dist/img/credit/paypal2.png" alt="Paypal">
                <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                    Kimlik No : 21754838930<br />
                    Esnaf Sicil : 25 / 49446<br />
                    Vergi Dairesi : Kazım Karabekir<br />
                    Vergi No : 6580322148<br />
                    Mersis NO : 1818118026
                </p>
            </div>
            <!-- /.col -->
            <div class="col-xs-6">
                <p class="lead"> <%= tarih %></p>
                <div class="table-responsive">
                    <table class="table">
  
                        <tr>
                            <th>Toplam:</th>
                            <td>&#x20BA; <%= tutar %></td>
                        </tr>
                    </table>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- this row will not appear when printing -->
        <div class="row no-print">
            <div class="col-xs-12">
                <a href="odeme-fatura-yazdir.aspx?payment=<%= odemeId %>" target="_blank" class="btn btn-default"><i class="fa fa-print"></i>Yazdır</a>
                <button class="btn btn-success pull-right" runat="server" onserverclick="Unnamed_ServerClick" id="paymentok"><i class="fa fa-credit-card"></i>Ödeme Onayla</button>
                <%= durum %>
            </div>
        </div>
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
</div>
<!-- /.content-wrapper -->
