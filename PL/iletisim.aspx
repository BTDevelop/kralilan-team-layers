<%@ Page Title="İletişim - kralilan.com" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="PL.iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="styles" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.css") %>' />
    <style>
        .btn-success-ki {
            background-color: #2d3e50;
            color: #FFFFFF;
            width: 110px;
            font-weight: bold;
        }

            .btn-success-ki:hover {
                background-color: #2d3e50;
                color: #FFFFFF;
                width: 110px;
                font-weight: bold;
            }

        .form-control {
            border-radius: 6px;
        }

            .form-control:focus {
                border-color: #16A085;
                border: 1px solid #16A085;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="intro-inner">
        <div class="contact-intro">
            <div class="w100 map">
                <div id="map"
                    style="border: 0; width: 100%; height: 350px;">
                </div>
            </div>
        </div>
        <!--/.contact-intro || map end-->
    </div>
    <!-- /.intro-inner -->
    <div class="main-container">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-6">
                    <div class="contact_info">
                        <h1 class="list-title gray"><strong>İLETİŞİM</strong></h1>
                        <div class="contact-info ">
                            <div class="address">
                                <p class="p1"><strong>Ünvan:</strong> Yatırımcı Bilgi Merkezi - YABİMER</p>
                                <p class="p1"><strong>Yetkili Kişi:</strong> Özcan Öner</p>
                                <p class="p1">
                                    <strong>Vergi Dairesi:</strong> Kazım Karabekir
                                </p>
                                <p class="p1">
                                    <strong>Vergi Numarası:</strong> 6580322148
                                </p>
                                <br />
                                <p class="p1">
                                    <strong>Adresler</strong>
                                </p>
                                <p class="p1">
                                    <strong>Adres 1: </strong>Barbaros Mah. Halk Cad. No:47/2 TEB Girişim Evi, 34746 Ataşehir / İSTANBUL
                                </p>
                                <p class="p1">
                                    <strong>Adres 2: </strong>Atatürk Üniversitesi ATA Teknokent Teknoloji Geliştirme Bölgesi
                                     A Blok 102-103-104 Ofisler Yakutiye/Erzurum
                                </p>
                                <p class="p1">
                                    <strong>Mernis Adres No: </strong>1818118026
                                </p>
                                <br />
                                <p class="p1">
                                    <strong>Çağrı Merkezi: </strong>0 850 808 57 25 
                                </p>
                                <br />
                                <p class="p1">
                                    <strong>Whatsapp Hatları</strong>
                                </p>
                                <p class="p1">
                                    0 554 161 57 25
                                </p>
                                <p class="p1">
                                    0 554 162 57 25
                                </p>
                                <p class="p1">
                                    0 554 163 57 25
                                </p>
                                <p class="p1">
                                    0 554 164 57 25
                                </p>
                                <p class="p1">
                                    0 554 165 57 25
                                </p>
                                <p class="p1">
                                    0 554 166 57 25
                                </p>
                                <p class="p1">
                                    0 554 167 57 25
                                </p>
                                <br />
                                <p class="p1">
                                    <strong>E-Posta Adresleri</strong>
                                </p>
                                <p>info@kralilan.com</p>
                                <p>destek@kralilan.com</p>
                                <p>&nbsp;</p>
                            </div>
                        </div>
                        <div class="social-list">
                            <a target="_blank" href="https://www.facebook.com/"><i
                                class="fa fa-facebook fa-lg "></i></a>
                            <a target="_blank" href="https://twitter.com/kralilancom?lang=tr"><i
                                class="fa fa-twitter fa-lg "></i></a>
                            <a target="_blank" href="https://www.instagram.com/kralilancom/?hl=tr"><i
                                class="fa fa-instagram fa-lg "></i></a>
                            <a target="_blank" href="https://www.youtube.com/channel/UCgqKlGl5M2KAQxk_B8Ay-cQ/featured"><i class="fa fa-youtube-play fa-lg "></i></a>
                            <a target="_blank" href="https://www.linkedin.com/company-beta/17912042/"><i class="fa fa-linkedin fa-lg "></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="contact-form">
                        <h2 class="list-title gray"><strong>Bİze Yazın</strong></h2>
                        <div class="form-horizontal" method="post">
                            <fieldset>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <input id="firstname" name="name" required="required" type="text" placeholder="Ad"
                                                class="form-control" />
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="form-group">
                                            <input id="lastname" name="surname" required="required" type="text" placeholder="Soyad"
                                                class="form-control" />
                                        </div>

                                        <div class="form-group">
                                            <input id="email" name="email" required="required" type="email" placeholder="Eposta Adresi"
                                                class="form-control" />
                                        </div>

                                        <div class="form-group">
                                            <textarea class="form-control" required="required" id="message" name="message"
                                                placeholder="Mesaj"
                                                rows="7"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success-ki btn-lg" runat="server" onserverclick="Unnamed_ServerClick">Gönder</button>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.main-container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src='<%= Page.ResolveUrl("~/libraries/assets/plugins/jquery.confirm/jquery-confirm.min.js") %>'></script>
    <script type="text/javascript">
        function showmodalpopup() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'Sizinle iletişim kısa sürede sağlanacaktır.',
                theme: 'supervan'
            });
        };

        function showmodalpopup1() {
            $.dialog({
                title: 'Merhaba Kullanıcı',
                content: 'İletişim bilgileri alınmadı, daha sonra tekrar deneyiniz.',
                theme: 'supervan'
            });
        };
    </script>
    <script src="/libraries/assets/js/form-validation.js"></script>
    <script>
        var map;
        var color = "#FFFFFF";
        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 6,
                center: { lat: 39, lng: 36 },
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            directionsDisplay.setMap(map);
            getCoords();
        }

        function getCoords() {
            var markerPosition = { lat: 40.986564, lng: 29.099096 };

            var marker = new google.maps.Marker({
                icon: '/libraries/assets/ico/apple-touch-icon-72-precomposed.png',
                position: markerPosition,
                animation: google.maps.Animation.DROP,
                map: map,
                title: "buradayız"
            });
            map.setZoom(17);
            map.setCenter({ lat: 40.986564, lng: 29.099096 });

        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFMOi-Vi2hXZROzNxUjmg9keIYxvsyuxM&callback=initMap" async="async" defer="defer"></script>
</asp:Content>
