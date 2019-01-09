<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kurumsal-yazdir.aspx.cs" Inherits="PL.kurumsal_yazdir" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>kralilan: Yazdır</title>
    <link href="/libraries/assets/css/printAdsStyle.css" media="screen, print" rel="stylesheet" type="text/css" />
    <meta name="robots" content="noindex" />
    <meta name="googlebot" content="noindex" />
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
                    <%= adsType  %>
                </div>
                <div class="left" style="margin-bottom: -115px;">
                    <img src="/upload/ilan/<%= resimler[0].resim %>" style="border-radius: 10px; width: 490px;" />
                    <div id="qrcode" style="width: 150px; height: 150px; margin-top: 105px; margin-left: 17px"></div>
                    <br />
                </div>
                <div class="right" style="margin-left: 520px;margin-bottom: -115px;">
                    <div class="user-contact-info" style="border-radius: 10px; width: 410px;">
                        <div class="sub-title" style="font-size: xx-large;text-align: center;">
                            <%= location %>
                        </div>
                    </div>
                    <br />
                    <div class="user-contact-info" style="border-radius: 10px; width: 410px;">
                        <div class="sub-title" style="font-size: xx-large;text-align: center;">
                            <span style="color:cornflowerblue">Metrekare</span><br />
                            130
                        </div>
                        <div class="sub-title" style="font-size: xx-large;text-align: center;">
                             <span style="color:cornflowerblue">Oda Sayısı</span><br />
                            1+1
                        </div>
                    </div>
                </div>
                   <div class="sub-title" style="font-size: 60px;text-align: center;">
                          <%= price %>
                    </div>
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
    </form>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/qrcode.js") %>'></script>
    <script type="text/javascript">
        var qrcode = new QRCode(document.getElementById("qrcode"), {
            width: 150,
            height: 150
        });

        function makeCode() {
            var data="<%= qrlink%>";

            qrcode.makeCode("http://kralilan.com/ilan/<%= qrlink %>-<%= adsNumber%>/detay");
            qrcode.makeCode(window.location.href);
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
