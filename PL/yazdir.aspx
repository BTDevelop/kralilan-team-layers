<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yazdir.aspx.cs" Inherits="PL.yazdir" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>kralilan: Yazdır</title>
    <meta name="robots" content="noindex" />
    <meta name="googlebot" content="noindex" />
    <link href="/libraries/assets/css/printAdsStyle.css" media="screen, print" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <style>
        -webkit-print-color-adjust: exact;
    </style>
</head>
<body class="no-width">
    <form id="form1" runat="server">
        <div class="print-preview">
            <div class="archive residential">

                <div class="title" style="color: #ffffff">
                    <%=adsType %>
                </div>
                <div class="sub-title">
                    <%= heading %><div class="address">
                        <%= location %>
                    </div>
                </div>
                <div style="float: right; margin-top: -70px;">
                    <img src="/libraries/images/krailan_site_logo_4.png" style="border-radius: 10px; border: 0px;" />
                </div>
                <hr />
                <div>
                    <div class="left">
                        <table class="attributes">
                            <tbody>
                                <tr>
                                    <td><strong>İlan No</strong></td>
                                    <td><%= adsNumber %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>İlan Tarihi</strong>
                                    </td>
                                    <td>
                                        <span><%= date %></span>
                                    </td>
                                </tr>

                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                <tr>
                                    <td>
                                        <strong>Kimden</strong>
                                    </td>
                                    <td>
                                        <span class=""><%= fromWho %></span>
                                    </td>
                                </tr>
                                <tr class="price">
                                    <td>Fiyat</td>
                                    <td><%= price %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="right">
                        <img src="/upload/ilan/<%= adsimage  %>" style="border-radius: 10px" />
                        <div class="user-contact-info" style="border-radius: 10px">
                            <p><%=sellername %></p>
                            <hr />
                            <table>
                                <tbody>
                                    <asp:Repeater ID="rpuserphone" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><strong><%# DAL.toolkit.PhoneType(Eval("telefonTur")) %></strong></td>
                                                <td><span><%# "+90-"+Eval("telefon").ToString().Substring(0,3)+"-"+Eval("telefon").ToString().Substring(3,7) %></span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div id="qrcode" style="width: 150px; height: 150px; margin-top: 15px; margin-left: 17px"></div>
                    <br />
                    <div>
                        İlana Gitmek İçin Tarat!
                   
                    </div>
                    <br />
                </div>
                <div class="description" style="border-radius: 10px">
                    <%= explanation %>
                </div>
                <div class="footer" style="color: #ffffff">
                    <p style="margin-top: 0px;">
                        <%= sellername %>
                    </p>
                    kralilan.com
               
                </div>
            </div>
        </div>
    </form>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/qrcode.js") %>'></script>
    <script type="text/javascript">
        var qrcode = new QRCode(document.getElementById("qrcode"), {
            width: 150,
            height: 150
        });
        function makeCode() {
            // var data=<%= qrlink%> ;

            qrcode.makeCode("http://kralilan.com/ilan/<%= qrlink %>-<%= adsNumber%>/detay");
            //qrcode.makeCode(window.location.href);
        }

        makeCode();
        $("#text").
            on("blur", function () {
                makeCode();
            }).
            on("keydown", function (e) {
                if (e.keyCode == 13) {
                    makeCode();
                }
            });
</script>
</body>
</html>
