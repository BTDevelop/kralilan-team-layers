<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="PL.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/iCheck/square/blue.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>' />
    <style type="text/css">
        .checkbox label {
            padding-left: 0.5em !important;
        }

        .form-control {
            border-radius: 6px !important;
        }

            .form-control:focus {
                border-color: #16A085 !important;
                border: 2px solid #16A085 !important;
            }

        .btn-success {
            background-color: #16A085;
            color: #FFFFFF;
            width: 110px;
            font-weight: bold;
        }

        .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
            border-radius: 6px !important;
        }

        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: #16A085 !important;
            color: white !important;
        }
    </style>
    <style>

        * {
            box-sizing: border-box;
        }

        .row > .column {
            padding: 0 8px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .column {
            float: left;
            width: 25%;
        }

        /* The Modal (background) */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: black;
        }

        /* Modal Content */
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            width: 90%;
            max-width: 1200px;
        }

        /* The Close Button */
        .close {
            color: white;
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 35px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #999;
                text-decoration: none;
                cursor: pointer;
            }

        .mySlides {
            display: none;
        }

        .cursor {
            cursor: pointer;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover,
            .next:hover {
                background-color: rgba(0, 0, 0, 0.8);
            }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        img {
            margin-bottom: -4px;
        }

        .caption-container {
            text-align: center;
            background-color: black;
            padding: 2px 16px;
            color: white;
        }

        .demo {
            opacity: 0.6;
        }

            .active,
            .demo:hover {
                opacity: 1;
            }

        img.hover-shadow {
            transition: 0.3s;
        }

        .hover-shadow:hover {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
        <h2 style="text-align: center">Lightbox</h2>

        <div class="row">
            <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(1)" class="hover-shadow cursor">
            </div>
            <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(2)" class="hover-shadow cursor">
            </div>
            <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(3)" class="hover-shadow cursor">
            </div>
            <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(4)" class="hover-shadow cursor">
            </div>
              <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(5)" class="hover-shadow cursor">
            </div>
              <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(6)" class="hover-shadow cursor">
            </div>
              <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(7)" class="hover-shadow cursor">
            </div>
              <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(8)" class="hover-shadow cursor">
            </div>
              <div class="column">
                <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="openModal();currentSlide(9)" class="hover-shadow cursor">
            </div>
        </div>

        <div id="myModal" class="modal">
            <span class="close cursor" onclick="closeModal()">&times;</span>
            <div class="modal-content">

                <div class="mySlides">
                    <div class="numbertext">1 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>

                <div class="mySlides">
                    <div class="numbertext">2 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>

                <div class="mySlides">
                    <div class="numbertext">3 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>

                <div class="mySlides">
                    <div class="numbertext">4 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>
                           <div class="mySlides">
                    <div class="numbertext">4 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>           <div class="mySlides">
                    <div class="numbertext">4 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>           <div class="mySlides">
                    <div class="numbertext">4 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>           <div class="mySlides">
                    <div class="numbertext">4 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>           <div class="mySlides">
                    <div class="numbertext">4 / 4</div>
                    <img src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%">
                </div>
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

                <div class="caption-container">
                    <p id="caption"></p>
                </div>


                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(1)" alt="Nature and sunrise">
                </div>
                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(2)" alt="Trolltunga, Norway">
                </div>
                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(3)" alt="Mountains and fjords">
                </div>
                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(4)" alt="Northern Lights">
                </div>
                                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(5)" alt="Northern Lights">
                </div>
                                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(6)" alt="Northern Lights">
                </div>
                                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(7)" alt="Northern Lights">
                </div>
                                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(8)" alt="Northern Lights">
                </div>
                                <div class="column">
                    <img class="demo cursor" src="libraries/images/projeler/ozgur_residence_03.jpg" style="width: 100%" onclick="currentSlide(9)" alt="Northern Lights">
                </div>
            </div>
        </div>

        <script>
            function openModal() {
                document.getElementById('myModal').style.display = "block";
            }

            function closeModal() {
                document.getElementById('myModal').style.display = "none";
            }

            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("demo");
                var captionText = document.getElementById("caption");
                if (n > slides.length) { slideIndex = 1 }
                if (n < 1) { slideIndex = slides.length }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                captionText.innerHTML = dots[slideIndex - 1].alt;
            }
        </script>

        <div class="main-container">
            <div class="container">
                <div class="row">
                    <!-- this (.mobile-filter-sidebar) part will be position fixed in mobile version -->
                    <div class="col-sm-3 page-sidebar mobile-filter-sidebar">
                        <aside>
                            <div class="inner-box">
                                <div class="categories-list  list-filter">
                                    <h5 class="list-title"><strong>
                                        <a href="/"><i class="fa fa-angle-left"></i>
                                            TÜM KATEGORİLER</a></strong></h5>
                                    <%--                                <ul class=" list-unstyled">
                                    <li><a href="#"><span class="title"><strong runat="server" id="ustStr"></strong></span><span
                                        class="count">&nbsp;</span></a>
                                        <a href="#"><span class="title">&nbsp;<strong runat="server" id="altStr"></strong></span><span
                                            class="count">&nbsp;</span></a>
                                        <asp:HyperLink ID="HyperLink2" runat="server" Visible='<%# catKind(Eval("kategoriId"))==true?true:false %>'><span class="title">&nbsp;&nbsp;<strong runat="server"> <%= DAL.toolkit.AdsType(RouteData.Values["TurNo"])  %></strong></span><span
                                        class="count">&nbsp;</span></asp:HyperLink>
                                        <ul class=" list-unstyled long-list">
                                            <asp:Repeater ID="rpcategories" runat="server">
                                                <ItemTemplate>
                                                    <li>
                                                        <a href='<%# String.Format("/liste/{0}/{1}/{2}/{3}/", DAL.toolkit.URLConverter(DAL.toolkit.AdsType(RouteData.Values["TurNo"])),RouteData.Values["TurNo"], DAL.toolkit.URLConverter(Eval("kategoriAdi")), Eval("kategoriId")) %>'><%# Eval("kategoriAdi") %><span class="count"><%# count(Eval("kategoriId"),RouteData.Values["TurNo"].ToString()) %></span></a></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </li>
                                </ul>--%>
                                </div>
                                <div class="locations-list  list-filter">
                                    <div id="filtre">
                                        <h5 class="list-title"><strong><a href="#">İl</a></strong></h5>
                                        <div class="form-group">
                                            <select class="form-control" style="width: 100%;" id="slctprovi"></select>
                                        </div>
                                        <h5 class="list-title"><strong><a href="#">İlçe</a></strong></h5>
                                        <div class="form-group">
                                            <select class="form-control" style="width: 100%;" id="slctdist"></select>
                                        </div>
                                        <h5 class="list-title"><strong><a href="#">Mahalle</a></strong></h5>
                                        <div class="form-group">
                                            <select class="form-control" style="width: 100%;" id="slctneig"></select>
                                        </div>
                                        <h5 class="list-title"><strong><a href="#">Fiyat</a></strong></h5>
                                        <div class="clearfix"></div>
                                        <div class="form-group col-xs-6" style="padding-left: 0">
                                            <input class="form-control" placeholder="min." id="inminprice" />
                                        </div>
                                        <div class="form-group col-xs-6" style="padding-right: 0">
                                            <input class="form-control" placeholder="max." id="inmaxprice" />
                                        </div>
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                        <h5 class="list-title"><strong><a href="#">Kimden</a></strong></h5>
                                        <div class="form-group">
                                            <select multiple="multiple" class="form-control" style="width: 100%;" id="slctwho">
                                                <option value="-1">Seçiniz</option>
                                                <option value="0">Sahibinden</option>
                                                <option value="7">Emlakçıdan</option>
                                                <option value="1">Belediyeden</option>
                                                <option value="5">Bankadan</option>
                                                <option value="3">İzaley-i Şuyudan</option>
                                                <option value="2">İcradan</option>
                                                <option value="10">Milli Hazineden (Satışı Devam Eden)</option>
                                                <option value="4">Milli Hazineden (Satılamayan)</option>
                                                <option value="9">Özelleştirme İdaresinden</option>
                                                <option value="8">İnşaat Firmasından</option>
                                                <option value="6">Diğer Kamu Kurumlarından</option>
                                            </select>
                                        </div>
                                        <h5 class="list-title"><strong><a href="#">İlan Tarihi</a></strong></h5>
                                        <div class="form-group" style="background-color: #fdfdfd; padding: 5px;">
                                            <div class="form-group" id="rddaterange">
                                                <label>
                                                    <input value="1" type="radio" name="daterange" class="daterangecls" />
                                                    Son 1 Gün</label><br />
                                                <label>
                                                    <input value="3" type="radio" name="daterange" class="daterangecls" />

                                                    Son 3 Gün
                                                </label>
                                                <br />
                                                <label>
                                                    <input value="7" type="radio" name="daterange" class="daterangecls" />
                                                    Son 1 Hafta</label><br />
                                                <label>
                                                    <input value="15" type="radio" name="daterange" class="daterangecls" />
                                                    Son 15 Gün
                                                </label>
                                                <br />
                                                <label>
                                                    <input value="30" type="radio" name="daterange" class="daterangecls" />
                                                    Son 1 Ay</label><br />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="button" class="form control btn btn-success btn-block" id="filter" value="Filtrele" />
                                        </div>
                                        <a class="clickMe" data-toggle="modal" data-target="#myModal" hidden="hidden"></a>
                                    </div>
                                </div>
                                <div style="clear: both"></div>
                            </div>
                        </aside>
                    </div>
                    <div class="col-md-9 page-content col-thin-left">
                        <%--Buraya reklam eklendi--%>
                        <%--                 <div class="inner-box has-aff relative">
                        <a class="dummy-aff-img" href="#">
                            <asp:Image ID="dkdrtgnRklm" runat="server" Style="width: 100%; height: 90px;" />
                        </a>
                    </div>--%>
                        <%--                    <div class="post-promo text-center" id="listviewdiv">
                        <h2>Listeleme Yapmak İstemiyorsan?</h2>
                        <h5>Harita ile devam et ve ilanları birebir konumlarıyla gör</h5>

                        <a href='<%= String.Format("/haritada-ara/{0}/{1}/{2}/{3}/", DAL.toolkit.URLConverter(DAL.toolkit.AdsType(RouteData.Values["TurNo"])),RouteData.Values["TurNo"], DAL.toolkit.URLConverter(RouteData.Values["Kategori"]), RouteData.Values["KategoriNo"]) %>' class="btn btn-lg btn-border btn-post btn-danger">Haritaya Git </a>
                    </div>--%>
                        <br />

                        <div class="category-list">
                            <div class="tab-box " id="tab">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs add-tabs" role="tablist">
                                    <li class="active" id="clallads"><a href="#" role="tab">Tüm İlanlar <span class="badge" runat="server" id="tum_ilanlar"></span></a>
                                    </li>
                                    <li id="clsahibinden"><a href="#" role="tab">Sahibinden
                                    <span class="badge" runat="server" id="sahibinden"></span></a></li>
                                    <li id="clemlakofisi"><a href="#" role="tab">Emlak Ofisi
                                    <span class="badge" runat="server" id="emlakcidan"></span></a></li>
                                    <li id="clinsaatfir"><a href="#" role="tab">İnşaat Firması
                                    <span class="badge" runat="server" id="insaat_firmasindan"></span></a></li>
                                    <li id="clbankadan"><a href="#" role="tab">Bankadan
                                    <span class="badge" runat="server" id="bankadan"></span></a></li>
                                    <li role="presentation" class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Diğer Mağazalar<span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li id="clizale"><a href="#" role="tab">İzale-i Şuyudan
                                    <span class="badge" runat="server" id="izaleyi_suyu"></span></a></li>
                                            <li id="clbelediye"><a href="#" role="tab">Belediyeden
                                    <span class="badge" runat="server" id="belediyeden"></span></a></li>
                                            <li id="clicradan"><a href="#" role="tab">İcradan
                                    <span class="badge" runat="server" id="icradan"></span></a></li>
                                            <li id="clhazineden1"><a href="#" role="tab">Hazineden (Satılamayan)
                                    <span class="badge" runat="server" id="milli_hazineden"></span></a></li>
                                            <li id="clhazineden2"><a href="#" role="tab">Hazineden (Güncel)
                                    <span class="badge" runat="server" id="milli_hazineden1"></span></a></li>
                                            <li id="clozelidare"><a href="#" role="tab">Özelleştirme İdaresiden
                                    <span class="badge" runat="server" id="ozellestirme_dairesinden"></span></a></li>
                                            <li id="clkamukurum"><a href="#" role="tab">Diğer Kamu Kurumlarından
                                    <span class="badge" runat="server" id="kamu_kurumlarindan"></span></a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="tab-filter">
                                </div>
                            </div>
                            <!--/.tab-box-->
                            <!--/.listing-filter-->
                            <!-- Mobile Filter bar-->
                            <div class="mobile-filter-bar col-lg-12  ">
                                <ul class="list-unstyled list-inline no-margin no-padding">
                                    <li class="filter-toggle">
                                        <a class="">
                                            <i class="fa fa-filter"></i>
                                            FİLTRE
                                        </a>
                                    </li>

                                </ul>
                            </div>

                            <div class="menu-overly-mask"></div>
                            <!-- Mobile Filter bar End-->
                            <div class="adds-wrapper">
                                <div class="tab-content">
                                    <div id="example1" class="list-responsive">
                                        <div class="list-responsive-header">
                                            <div class="list-r-header list-r-header-1"></div>
                                            <div class="list-r-header list-r-header-2">İlan Başlığı</div>
                                            <div class="list-r-header list-r-header-3" id="cl_price">Fiyat</div>
                                            <div class="list-r-header list-r-header-4" id="cl_date">İlan Tarihi</div>
                                            <div class="list-r-header list-r-header-5" id="cl_provindist">İl/İlçe</div>
                                        </div>
                                        <div id="tablebdy" class="list-responsive-body">
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <%--<div class="menu-overly-mask"></div>
                        <!-- Mobile Filter bar End-->
                        <div class="adds-wrapper">
                            <div class="tab-content">
                     
                                <br />
                                <br />
                                <table id="example1" class="table table-responsive table-hover">
                                    <thead>
                                        <tr>
                                            <th class="col-md-1"></th>
                                            <th class="col-md-3" id="cl_header">İlan Başlığı</th>
                                            <th class="col-md-1" id="cl_price">Fiyat</th>
                                            <th class="col-md-2" id="cl_date">İlan Tarihi</th>
                                            <th class="col-md-1" id="cl_provindist">İl/İlçe</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablebdy">
                                    </tbody>
                                </table>
                            </div>
                        </div>--%>
                            <!--/.adds-wrapper-->
                            <div id="wait" style="display: none; position: relative; top: 50%; left: 50%; padding: 2px;">
                                <img src='/libraries/images/loading.gif' />
                            </div>
                            <br />
                            <div class="tab-box  save-search-bar text-center">
                                <a href="#"><i class=" icon-star-empty"></i>
                                    Aramayı Kaydet </a>
                            </div>
                        </div>


                    </div>
                    <!--/.page-content-->
                    <div class="col-md-12 page-content">
                        <div class="inner-box category-content">
                            <h2 class="title-2 uppercase"><strong><i class="icon-docs"></i>İlan Detayları</strong></h2>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-horizontal">
                                        <fieldset>
                                            <div class="col-md-12" runat="server" id="boxertransport">
                                                <asp:PlaceHolder ID="placeholder" runat="server"></asp:PlaceHolder>

                                            </div>
                                        </fieldset>
                                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                                    </div>
                                    <div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="/libraries/assets/js/ki-listview-jquery.js" type="text/javascript"></script>

        <script src="/libraries/assets/js/owl.carousel.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
        <script src="/management/dist/js/app.min.js"></script>
        <script src='<%= Page.ResolveUrl("~/management/plugins/iCheck/icheck.min.js") %>'></script>
        <script src='<%= Page.ResolveUrl("~/management/plugins/select2/select2.full.min.js") %>'></script>

        <script type="text/javascript">
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });

            });

            $('.double').keypress(function (event) {
                if ((event.which != 44 || $(this).val().indexOf(',') != -1) && (event.which < 48 || event.which > 57)) {
                    event.preventDefault();
                }
            });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
