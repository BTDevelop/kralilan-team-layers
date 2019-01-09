<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="proje-detay.aspx.cs" Inherits="PL.proje_detay" %>
<asp:Content ID="Content3" ContentPlaceHolderID="styles" runat="server">
    <meta property="og:url" content="https://kralilan.com/proje/<%=_inprojeid %>/detay" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="<%= _inproname %>" />
    <meta property="og:image" content="https://kralilan.com/upload/ilan/<%= _inshowcaseimg %>" />
    <link rel="stylesheet" href="/libraries/assets/project-plugins/style.css" />
    <link rel="stylesheet" href="/libraries/assets/project-plugins/colors/main.css" id="colors" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/css/bootstrapValidator.min.css" rel="stylesheet" />
    <style rel="stylesheet">
        .tab-content{
            width:83%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="titlebar" class="property-titlebar margin-bottom-0">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <a href="/projeler/" class="back-to-listings"></a>
                        <div class="property-title">
                            <h2><%= _inproname %> <span class="property-badge">Proje</span></h2>
                            <span>
                                <a href="#location" class="listing-address">
                                    <i class="fa fa-map-marker"></i>
                                    <%= _inprovi %> / <%= _indist %>
						        </a>
                            </span>
                        </div>
                        <div class="property-pricing">
                            <div>
                                <%= "+90-"+ _infirtelefon.Substring(0,3)+"-"+_infirtelefon.Substring(3,7) %>
                            </div>
                            <div class="sub-price">Bize Ulaşın</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="fullwidth-property-slider margin-bottom-50">
            <asp:Repeater ID="rpgalery" runat="server">
                <ItemTemplate>
                    <a href="/upload/estate-projects/<%= _inprojeid %>/<%# ((BLL.ExternalClass.resimDataType)Container.DataItem).resim %>" data-background-image="/upload/estate-projects/<%= _inprojeid %>/<%# ((BLL.ExternalClass.resimDataType)Container.DataItem).resim %>" class="item mfp-gallery"></a>

                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-7">
                    <div class="property-description">
                        <ul class="property-main-features">
                            <li>Proje Alanı <span><%= _inprojealan %> m2</span></li>
                            <li>Konut Sayısı <span><%= _inkonutsayisi %></span></li>
                            <li>Teslim Tarihi <span><%= _inteslim %></span></li>
                        </ul>
                        <h3 class="desc-headline">Hakkında</h3>
                        <div class="show-more">
                            <p>
                                <%= _inabout %>
                            </p>
                            <a href="#" class="show-more-button">Daha fazla <i class="fa fa-angle-down"></i></a>
                        </div>
                        <div class="widget">
                            <h3 class="margin-bottom-35">Vaziyet Planı</h3>
                            <div class="listing-carousel outer">
                                <div class="item">
                                    <div class="listing-item compact">
                                        <a href="/upload/estate-projects/<%= _instplan %>" class="listing-img-container item mfp-gallery" data-background-image="/upload/estate-projects/<%= _instplan %>">
                                            <div class="listing-badges">
                                            </div>
                                            <img src="/upload/estate-projects/<%= _instplan %>" alt="" />
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="widget">
                            <h3 class="margin-bottom-35">Kat Planları</h3>
                            <div class="listing-carousel outer">
                                <asp:Repeater ID="rpplan" runat="server">
                                    <ItemTemplate>
                                        <div class="item">
                                            <div class="listing-item compact">
                                                <a href="/upload/estate-projects/<%# ((BLL.ExternalClass.pplanDT)Container.DataItem).image %>" class="listing-img-container item mfp-gallery" data-background-image="/upload/estate-projects/<%# ((BLL.ExternalClass.pplanDT)Container.DataItem).image %>">
                                                    <div class="listing-badges">
                                                    </div>
                                                    <div class="listing-img-content">
                                                        <ul class="listing-hidden-content">
                                                            <li>Oda Sayısı <span><%# ((BLL.ExternalClass.pplanDT)Container.DataItem).nofroom %></span></li>
                                                            <li>Daire Tipi<span><%# ((BLL.ExternalClass.pplanDT)Container.DataItem).housing %></span></li>
                                                            <li>m2 <span><%# ((BLL.ExternalClass.pplanDT)Container.DataItem).sqmeter %></span></li>
                                                        </ul>
                                                    </div>
                                                    <img src="/upload/estate-projects/<%# ((BLL.ExternalClass.pplanDT)Container.DataItem).image %>" alt="" />
                                                </a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <asp:PlaceHolder ID="plfeatures" runat="server"></asp:PlaceHolder>
                        <h3 class="">Konum</h3>
                        <div id="map" style=" border-radius: 15px; height: 500px;overflow: hidden;padding-bottom: 22.25%; padding-top: 30px;position: relative;"></div>
                        <h3 class="desc-headline no-border" id="contact">İletişim</h3>
                        <span><b>Adres:  </b><%= _inaddress %> </span>
                        <br />
                        <span><b>Telefon: </b><%= (!String.IsNullOrEmpty(_inphone))? "+90-"+ _inphone.Substring(0,3)+"-"+_inphone.Substring(3,7) : "-"   %> </span>
                        <br />
                        <span><b>Faks: </b><%= (!String.IsNullOrEmpty(_infaks))? "+90-"+ _infaks.Substring(0,3)+"-"+_infaks.Substring(3,7) : "-"   %> </span>
                        <br />
                        <span><b>Web Sitesi:  </b><a target="_blank" href="<%= _inwebsite %>"><%= _inwebsite %></a></span><br />
                        <span><b>E-Posta:  </b><a href="mailto:<%=_incompost %>"><%= _incompost %></a></span><br />
                    </div>
                </div>
                <div class="col-lg-4 col-md-5">
                    <div class="sidebar sticky right">
                        <div class="addthis_inline_share_toolbox"></div>
                        <br />
                        <br />
                       
                        <div class="widget">
                            <div class="agent-widget" id="contact_form">
                                <div class="agent-title">
                                    <div class="agent-photo">
                                        <img src="/upload/estate-company/<%= _infirlogo %>" alt="" />
                                    </div>
                                    <div class="agent-details">
                                        <h4><a href="/projeler/firma/<%= _infirmid %>/<%= BLL.PublicHelper.Tools.URLConverter(_infirmaadi) %>/"><%= _infirmaadi %></a></h4>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <input type="text" id="name" name="name" placeholder="Adınız">
                                <input type="text" id="surname" name="surname" placeholder="Soyadınız">
                                <input type="text" id="mail" name="mail" placeholder="E-posta Adresiniz" pattern="^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$">
                                <input type="text" id="phone" name="phone" placeholder="Numaranız">
                                <textarea name="message" placeholder="Mesajınız"></textarea>
                                <div class="g-recaptcha" style="transform: scale(0.77); -webkit-transform: scale(0.77); transform-origin: 0 0; -webkit-transform-origin: 0 0;" data-sitekey="6LcAzR8UAAAAAKX8tvRp5HjoOBx4Y5T9xf4Jj9VL"></div>
                                <button type="submit" class="button fullwidth margin-top-5" runat="server" onserverclick="Unnamed_ServerClick">Mesaj Gönder</button>
                                <button class="button fullwidth margin-top-5"><i class="fa fa-phone"></i><%= "+90-"+ _infirtelefon.Substring(0,3)+"-"+_infirtelefon.Substring(3,7) %></button>
                                <label runat="server" id="infomessage"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="margin-top-55"></div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scripts" runat="server">
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/chosen.min.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/magnific-popup.min.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/rangeSlider.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/sticky-kit.min.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/slick.min.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/jquery.jpanelmenu.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/tooltips.min.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/masonry.min.js"></script>
    <script type="text/javascript" src="/libraries/assets/project-plugins/scripts/custom.js"></script>
    <script src="/libraries/assets/project-plugins/scripts/switcher.js"></script>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-58c17f0bb3be1504"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js'></script>
    <script src='  https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/language/tr_TR.min.js'></script>
    <script>
        $(document).ready(function () {
            $('#contact_form').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        validators: {
                            stringLength: {
                                min: 2,
                                message: 'Lütfen 2 karakterden fazla giriniz'
                            },
                            notEmpty: {
                                message: 'Lütfen adınızı giriniz'
                            }
                        }
                    },
                    surname: {
                        validators: {
                            stringLength: {
                                min: 2,
                                message: 'Lütfen 2 karakterden fazla giriniz'
                            },
                            notEmpty: {
                                message: 'Lütfen soyadınızı giriniz'
                            }
                        }
                    },
                    password: {
                        validators: {
                            stringLength: {
                                min: 6,
                                message: 'Lütfen 6 karakterden fazla giriniz'
                            },
                            notEmpty: {
                                message: 'Lütfen şifrenizi giriniz'
                            }
                        }
                    },
                    mail: {
                        validators: {
                            notEmpty: {
                                message: 'Lütfen e-posta adresinizi giriniz'
                            },
                            emailAddress: {
                                message: 'Lütfen geçerli bir e-posta adresi giriniz'
                            }
                        }
                    },
                
                }
            });

        });

        var map;
        var color = "#FFFFFF";
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 6,
                center: { lat: 39, lng: 36 },
                mapTypeId: google.maps.MapTypeId.HYBRID
            });
            getCoords();
        }

        var icon = "";

        function getCoords() {

            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getProjectCoords",
                dataType: "json",
                data: "{ inproid:'" + <%= _inprojeid %> + "' }",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var poly = "";
                    var panorama = "";

                    if (data.d != null) {
                        var coordinates = [];
                        var coords = JSON.parse(data.d);


                        coords = coords["coordinates"][0][0];

                        for (var i = 0; i < coords.length; i++) {
                            coordinates.push({ lat: coords[i][1], lng: coords[i][0] });
                        }

                        color = "#2a0cae";
                        icon = '/libraries/images/marker/project.png'
                        poly = new google.maps.Polygon({
                            paths: coordinates,
                            strokeColor: color,
                            strokeOpacity: 0.8,
                            strokeWeight: 3,
                            fillColor: color,
                            fillOpacity: 0.35
                        });

                        poly.setMap(map);

                        var markerPosition = { lat: coordinates[0]["lat"], lng: coordinates[0]["lng"] };

                        var marker = new google.maps.Marker({
                            icon: icon,
                            position: markerPosition,
                            animation: google.maps.Animation.DROP,
                            map: map,
                            title: "konum"
                        });

                        map.setZoom(17);
                        map.setCenter({ lat: coordinates[0]["lat"], lng: coordinates[0]["lng"] });
                    }
                },
                error:
                    {

                    }
            });
        }
        </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS1wH5TdTQ8gbD5zB6Ghi2hN4BpkkbJ5M&callback=initMap" async="async" defer="defer"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</asp:Content>
