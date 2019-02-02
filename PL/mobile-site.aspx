<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mobile-site.aspx.cs" Inherits="PL.mobile_site" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="tr" xml:lang="tr">
<head runat="server">
    <title>Sahibinden Satılık Daire Kiralık Ev Arsa Emlak - Kral İlan</title>
    <meta http-equiv="Content-Language" content="tr" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Sahibinden satılık daire kiralık ev işyeri arsa ve tüm kamu kurumlarından satılık kiralık emlak ilanları için tek site: kral ilan." />
    <meta name="keywords" content="sahibinden,satılık,daire,kiralık,ev,arsa,işyeri,emlak,ücretsiz,bedava,ilan,ver,ekle,kral,ilan" />
    <meta name="author" content="kralian.com development" />
    <meta name="google-site-verification" content="gbU4UNxHbBsUcELtHVxxjVlXoYJ9zneG8BWQqOsPHoI" />
    <meta name="robots" content="index, follow" />
    <meta name="copyright" content="© 2015 kralilan.com" />
    <meta name="robots" content="all" />
    <meta charset="utf-8" />
    <!-- Chrome, Firefox OS and Opera -->
    <meta name="theme-color" content="#16A085" />
    <!-- Windows Phone -->
    <meta name="msapplication-navbutton-color" content="#16A085" />
    <!-- iOS Safari -->
    <link rel="manifest" href="/manifest.json" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/upload/default-images/apple-touch-icon-144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/upload/default-images/apple-touch-icon-114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/upload/default-images/apple-touch-icon-72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="/upload/default-images/apple-touch-icon-57-precomposed.png" />
    <link rel="shortcut icon" href="/libraries/assets/ico/favicon.png" />
    <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
    <script>
        var OneSignal = window.OneSignal || [];
        OneSignal.push(
        ["init", {
            appId: "d30b7b05-a644-4aa3-ac59-534eca6fcfac",
            welcomeNotification: {
                "title": "Kral İlan",
                "message": "Teşekkürler!"
            },
            autoRegister: false,
            notifyButton: {
                enable: false,
            }
        }],
        function () {
            OneSignal.registerForPushNotifications()
        }
        );
    </script>
    <!-- Global site tag (gtag.js) - AdWords: 781913905 -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=AW-781913905"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'AW-781913905');
    </script>
    <!-- Facebook Pixel Code -->
    <script>
        !function (f, b, e, v, n, t, s) {
            if (f.fbq) return; n = f.fbq = function () {
                n.callMethod ?
                n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
            n.queue = []; t = b.createElement(e); t.async = !0;
            t.src = v; s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script',
        'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '1930191430395114');
        fbq('track', 'PageView');
    </script>
</head>

<body>
    <div class="header">
        <header class="w3-bar w3-card w3-theme" style="height: 70px;">
            <a href="/" title="kralilan.com">
                <img class="logo" src="/upload/default-images/apple-touch-icon-57-precomposed.png" alt="kralilan.com logo" />
            </a>
        </header>
    </div>
    <div class="w3-container">
        <div class="w3-cell-row">
            <div class="w3-theme-header">
                <h1>Satılık Daire İşyeri Arsa Kiralık Ev ve Emlak İlanları</h1>
            </div>
        </div>
        <asp:Repeater ID="rpcategories" runat="server">
            <ItemTemplate>
                <a href="<%# String.Format("/kategori/emlak-{0}", BLL.PublicHelper.Tools.URLConverter(Eval("Adi"))) %>">
                    <div class="w3-cell-row">
                        <div class="w3-cell w3-cell-icon">
                            <i class="<%#  Icons[Index++] %>"></i>
                        </div>
                        <div class="w3-cell w3-container w3-cell-title">
                            <h2><%# Eval("Adi") %></h2>
                            <h3>&nbsp;(<%# String.Format("{0:N0}", Eval("Sayi")) %>)</h3>
                            <h4><%# _kategoriTurManager.GetByCategoriIdStr(Convert.ToInt32(Eval("Id"))) %></h4>
                        </div>
                        <div class="w3-cell w3-cell-icon">
                            <i class="icon-right-open-big"></i>
                        </div>
                    </div>
                </a>
                <hr>
            </ItemTemplate>
        </asp:Repeater>
        <a href="/projeler/">
            <div class="w3-cell-row">
                <div class="w3-cell w3-cell-icon">
                    <i class="icon-pencil-circled"></i>
                </div>
                <div class="w3-cell w3-container w3-cell-title">
                    <h2>Projeler </h2>
                    <h3>&nbsp;(51)</h3>
                    <h4>Yatırımlık Konut Projeleri</h4>
                </div>
                <div class="w3-cell">
                    <i class="icon-right-open-big"></i>
                </div>
            </div>
        </a>
		<hr>
	    <a href="/haritada-ara/">
		    <div class="w3-cell-row">
			    <div class="w3-cell w3-cell-icon">
				    <i class="icon-map"></i>
			    </div>
			    <div class="w3-cell w3-container w3-cell-title">
				    <h2>Haritada Ara</h2>
				    <h3>&nbsp;(Tüm İlanlar)</h3>
				    <h4>Haritada Gerçek Konumlarıyla Ara</h4>
			    </div>
			    <div class="w3-cell">
				    <i class="icon-right-open-big"></i>
			    </div>
		    </div>
	    </a>
		<hr>
     <div style="
    text-align: center;
    margin-left: 10%;
    margin-right: 10%;
    font-weight: bold;
">
    <h2>Sahibinden Emlakçıdan İnşaat Firmasından</h2>
    <h2>Belediyeden Bankadan Hazineden İcradan</h2>
<h2>Ve Diğer Kurumlardan Uygun Emlak ilanları</h2>
            </div>
    </div>
    <div class="footer">
        <div class="w3-cell-footer" runat="server" id="login">
            <a href="/giris-yap">
                <i class="icon-login"></i>
                <h4>Giriş Yap</h4>
            </a>
        </div>
        <div class="w3-cell-footer" runat="server" id="signup">
            <a href="/kayit">
                <i class="icon-user-add"></i>
                <h4>Üye Ol</h4>
            </a>
        </div>
        <div class="w3-cell-footer">
            <a class="logoff" href="/secure/benim-sayfam" runat="server" id="profile">
                <i class="icon-user"></i>
                <h4>Profilim</h4>
            </a>
        </div>
        <div class="w3-cell-footer" id="logout" onclick="Cikis_Click" runat="server">
            <a class="login" href="#">
                <i class="icon-logout"></i>
                <h4>Çıkış Yap</h4>
            </a>
        </div>
        <div class="w3-cell-footer">
            <a href="/kategori-secimini-yap">
                <i class="icon-plus"></i>
                <h4>Ücretsiz İlan Ver</h4>
            </a>
        </div>
        <div class="w3-cell-footer">
            <a href="/kurumsal/iletisim">
                <i class="icon-phone-1"></i>
                <h4>İletişim</h4>
            </a>
        </div>
    </div>
    <style>
        body {
            margin: 0;
        }

        a:link {
            color: #000;
            text-decoration: none;
        }

        a:visited {
            color: #000;
            text-decoration: none;
        }

        a:hover {
            color: #000;
        }

        .header {
            margin-bottom: 10px;
            text-align: center;
        }

        .logo {
            margin: 10px;
        }

        html, body {
            font-family: Verdana,sans-serif;
            font-size: 15px;
            line-height: 1.5;
        }

        html {
            overflow-x: hidden;
        }

        h1 {
            font-size: 30px;
        }

        h2 {
            font-size: 12px;
            float: left;
        }

        h3 {
            font-size: 12px;
        }

        h4 {
            font-size: 9px;
            color: #717171;
        }

        h5 {
            font-size: 18px;
        }

        h6 {
            font-size: 16px;
        }

        .w3-serif {
            font-family: serif;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: "Segoe UI",Arial,sans-serif;
            font-weight: 400;
            margin: 0;
        }

        .w3-wide {
            letter-spacing: 4px;
        }

        hr {
            border: 0;
            border-top: 1px solid #eee;
        }

        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background: -webkit-linear-gradient(292deg, #16A085 44%, #2ECC71 85%) no-repeat 0 0 #16A085;
            /*background-color: #16A085;*/
            color: #fff;
            text-align: center;
            padding: 5px;
        }

            .footer a {
                color: #fff;
            }

            .footer h4 {
                color: #fff;
            }

        .w3-cell-footer {
            display: table-cell;
            width: 4%;
        }

        .w3-cell-icon {
            width: 10%;
        }

        .w3-cell-title {
            width: 80%;
        }

        .w3-container:after, .w3-container:before, .w3-panel:after, .w3-panel:before, .w3-row:after, .w3-row:before, .w3-row-padding:after, .w3-row-padding:before, .w3-cell-row:before, .w3-cell-row:after, .w3-clear:after, .w3-clear:before, .w3-bar:before, .w3-bar:after {
            content: "";
            display: table;
            clear: both;
        }

        .w3-col, .w3-half, .w3-third, .w3-twothird, .w3-threequarter, .w3-quarter {
            float: left;
            width: 100%;
        }

            .w3-col.s1 {
                width: 8.33333%;
            }

            .w3-col.s2 {
                width: 16.66666%;
            }

            .w3-col.s3 {
                width: 24.99999%;
            }

            .w3-col.s4 {
                width: 33.33333%;
            }

            .w3-col.s5 {
                width: 41.66666%;
            }

            .w3-col.s6 {
                width: 49.99999%;
            }

            .w3-col.s7 {
                width: 58.33333%;
            }

            .w3-col.s8 {
                width: 66.66666%;
            }

            .w3-col.s9 {
                width: 74.99999%;
            }

            .w3-col.s10 {
                width: 83.33333%;
            }

            .w3-col.s11 {
                width: 91.66666%;
            }

            .w3-col.s12 {
                width: 99.99999%;
            }

        @media (min-width:601px) {
            .w3-col.m1 {
                width: 8.33333%;
            }

            .w3-col.m2 {
                width: 16.66666%;
            }

            .w3-col.m3, .w3-quarter {
                width: 24.99999%;
            }

            .w3-col.m4, .w3-third {
                width: 33.33333%;
            }

            .w3-col.m5 {
                width: 41.66666%;
            }

            .w3-col.m6, .w3-half {
                width: 49.99999%;
            }

            .w3-col.m7 {
                width: 58.33333%;
            }

            .w3-col.m8, .w3-twothird {
                width: 66.66666%;
            }

            .w3-col.m9, .w3-threequarter {
                width: 74.99999%;
            }

            .w3-col.m10 {
                width: 83.33333%;
            }

            .w3-col.m11 {
                width: 91.66666%;
            }

            .w3-col.m12 {
                width: 99.99999%;
            }
        }

        @media (min-width:993px) {
            .w3-col.l1 {
                width: 8.33333%;
            }

            .w3-col.l2 {
                width: 16.66666%;
            }

            .w3-col.l3 {
                width: 24.99999%;
            }

            .w3-col.l4 {
                width: 33.33333%;
            }

            .w3-col.l5 {
                width: 41.66666%;
            }

            .w3-col.l6 {
                width: 49.99999%;
            }

            .w3-col.l7 {
                width: 58.33333%;
            }

            .w3-col.l8 {
                width: 66.66666%;
            }

            .w3-col.l9 {
                width: 74.99999%;
            }

            .w3-col.l10 {
                width: 83.33333%;
            }

            .w3-col.l11 {
                width: 91.66666%;
            }

            .w3-col.l12 {
                width: 99.99999%;
            }
        }

        .w3-content {
            margin-left: auto;
            margin-right: auto;
            max-width: 980px;
        }

        .w3-auto {
            max-width: 1140px;
        }

        .w3-cell-row {
            display: table;
            width: 100%;
        }

        .w3-cell {
            display: table-cell;
        }

        @media (max-width:1205px) {
            .w3-auto {
                max-width: 95%;
            }
        }

        @media (max-width:600px) {
            .w3-modal-content {
                margin: 0 10px;
                width: auto !important;
            }

            .w3-modal {
                padding-top: 30px;
            }
        }

        @media (max-width:768px) {
            .w3-modal-content {
                width: 500px;
            }

            .w3-modal {
                padding-top: 50px;
            }
        }

        @media (min-width:993px) {
            .w3-modal-content {
                width: 900px;
            }

            .w3-hide-large {
                display: none !important;
            }

            .w3-sidebar.w3-collapse {
                display: block !important;
            }
        }

        @media (max-width:992px) and (min-width:601px) {
            .w3-hide-medium {
                display: none !important;
            }
        }

        @media (max-width:992px) {
            .w3-sidebar.w3-collapse {
                display: none;
            }

            .w3-main {
                margin-left: 0 !important;
                margin-right: 0 !important;
            }

            .w3-auto {
                max-width: 100%;
            }
        }

        .w3-container {
            padding: .01em 16px;
        }

        .w3-card {
            box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
        }

        .w3-theme {
            color: #000 !important;
            background-color: #fff !important;
        }

        .w3-theme-foot {
            color: #fff !important;
            background-color: #16A085 !important;
            padding-top: 1px;
        }

            .w3-theme-foot h1 {
                font-size: 17px;
                text-align: center;
            }

        .w3-theme-header {
            color: #fff !important;
            background: -webkit-linear-gradient(292deg, #16A085 44%, #2ECC71 85%) no-repeat 0 0 #16A085;
            margin-bottom: 10px;
            padding: 10px 5px;
        }

            .w3-theme-header h1 {
                font-size: 12px !important;
                font-weight: 700;
                text-align: center;
            }

        @font-face {
            font-family: fontello;
            src: url(libraries/assets/fonts/fontello/fontello.eot?4089732);
            src: url(libraries/assets/fonts/fontello/fontello.eot?4089732#iefix) format("embedded-opentype"),url(libraries/assets/fonts/fontello/fontello.woff?4089732) format("woff"),url(libraries/assets/fonts/fontello/fontello.ttf?4089732) format("truetype"),url(libraries/assets/fonts/fontello/fontello.svg?4089732#fontello) format("svg");
            font-weight: 400;
            font-style: normal;
        }

        [class*=" icon-"]:before, [class^=icon-]:before {
            font-family: fontello;
            font-style: normal;
            font-weight: 400;
            speak: none;
            display: inline-block;
            text-decoration: inherit;
            width: 1em;
            margin-right: .2em;
            text-align: center;
            font-variant: normal;
            text-transform: none;
            line-height: 1em;
            margin-left: .2em;
        }

        .icon-user-add:before {
            content: '\e808';
        }

        .icon-home:before {
            content: '\e815';
            font-size: 25px;
            color: #16A085;
        }

        .icon-right-open-big:before {
            content: '\e83c';
        }

        .icon-login:before {
            content: '\e841';
        }

        .icon-user:before {
            content: '\e806';
        }

        .icon-logout:before {
            content: '\e842';
        }

        .icon-calendar-1:before {
            content: '\e887';
            font-size: 25px;
            color: #16A085;
        }

        .icon-shop:before {
            content: '\e88d';
            font-size: 25px;
            color: #16A085;
        }

        .icon-pencil-circled:before {
            content: '\e8c2';
            font-size: 25px;
            color: #16A085;
        }

        .icon-phone-1:before {
            content: '\e8c8';
        }

        .icon-prison:before {
            content: '\e91c';
            font-size: 25px;
            color: #16A085;
        }

        .icon-plus:before {
            content: '\e94d';
        }

        .icon-building-filled:before {
            content: '\e982';
            font-size: 25px;
            color: #16A085;
        }

        .icon-home-1:before {
            content: '\e98b';
            font-size: 25px;
            color: #16A085;
        }
		.icon-map:before{
			content:'\e832';
			font-size: 25px;
            color: #16A085;
		}
    </style>
    <script>
        if (navigator.userAgent.indexOf("Speed Insights") == -1) {

            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-83917838-1', 'auto');
            ga('send', 'pageview', { 'page': location.pathname + location.search + location.hash });
        }
    </script>
</body>
</html>
