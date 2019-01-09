<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="favori-magaza.ascx.cs" Inherits="PL.profil.favori_magaza" %>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-heart-1"></i>Takip Ettiğim Mağazalar</h2>
        <div class="section-block">
            <div class="row">
                <div class="page-content ">

                    <div class="category-list" id="pagecontent">
                        <div class="tab-box ">
                        </div>
                        <!--/.tab-box-->

                        <div class="listing-filter">
                            <div class="pull-left col-xs-6">
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <!--/.listing-filter-->

                        <div class="adds-wrapper" id="addswrap">
                <%--            <asp:Repeater ID="rpfavoritestore" runat="server">
                                <ItemTemplate>--%>
                                    <%--<div class="item-list">
                                        <div class="col-sm-2 no-padding photobox">
                                            <div class="add-image">
                                                <span class="photo-count"><i
                                                    class="fa fa-camera"></i>2 </span><a href="ads-details.html">
                                                        <img
                                                           src="../upload/magaza/noStore.png"
                                                            alt="<%# Eval("magazaAdi")  %>"></a>
                                            </div>
                                        </div>
                                        <!--/.photobox-->
                                        <div class="col-sm-5 add-desc-box">
                                            <div class="add-details">
                                                <h5 class="add-title"><a href="ads-details.html"><%# Eval("magazaAdi") %> </a></h5>
                                                <span class="info-row"><span
                                                    class="date"><i class=" icon-clock"></i><%# Eval("baslangicTarihi" ,"{0:d-MMMM-yyyy}") %> </span>- <span
                                                        class="category"><%# Eval("kategoriAdi") %> </span>- <span
                                                            class="item-location"><i class="fa fa-map-marker"></i>&nbsp;<%# Eval("ilAdi") %> </span></span>
                                            </div>
                                        </div>
                                        <!--/.add-desc-box-->
                                        <div class="col-sm-5 text-right  price-box">
                                            <h2 class="item-price"></h2>
                                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger  btn-sm make-favorite" NavigateUrl='<%# String.Format("~/profil/profil.aspx?control=favori-magaza&like={0}",Eval("magazaId"))%>'><i
                                                class="fa fa-heartbeat"></i><span> Takibi Bırak</span></asp:HyperLink>
                                        </div>
                                        <!--/.add-desc-box-->
                                    </div>--%>
                                    <!--/.item-list-->
          <%--                      </ItemTemplate>

                            </asp:Repeater>--%>

                        </div>
                        <!--/.adds-wrapper-->

          <%--              <div class="tab-box  save-search-bar text-center">
                            <a href=""><i class=" icon-plus"></i>
                                Takip Ettiğiniz Mağaza Bulunmamaktadır.</a>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var pageIndex = 0, pageIsRefresh = true;
    var sonistek = -1;
    var opt = 2;

    function GetIlan(inuserid, index, count, opt, istop, clear) {
        pageIsRefresh = false;
        if (clear == false) {
            if (sonistek == index) return;
        }

        sonistek = index;
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_operation.asmx/getListUserAds",
            dataType: "json",
            data: "{inuserid:'" + inuserid + "' , index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                edata = data.d;

                    var dataArr = JSON.parse(edata);
                    result = "";
                    for(var i = 0; i < dataArr.length; i++) {
           
                      result += '<div class="item-list">\
                                    <div class="col-sm-2 no-padding photobox">\
                                        <div>          \    
                                            <a href="/magaza/' + item.magazaId + '/' + item.magazaFormat + '/"
                                                title="' + item.magazaAdi + '">\
                                                    <img\
                                                        class="thumbnail no-margin" src="/upload/magaza/' + 'noStore.png' + '"\
                                                        alt="' + item.magazaAdi + '" style="width:125px;"></a>\
                                        </div>\
                                    </div>\
                                    <div class="col-sm-7 add-desc-box">\
                                        <div class="add-details">\
                                            <h5 class="add-title">\
                                            <a href="/magaza/' + item.magazaId + '/' + item.magazaFormat + '/"\
                                                    title="' + item.magazaAdi + '">' + item.magazaAdi + ' </a></h5>\
                                            <span class="info-row"><span\
                                                    class="date"><i class="icon-clock"></i>' + item.baslangicFormat + ' </span>\
                                            </span>\
                                        </div>\
                                    </div>\
                                    <div class="col-sm-3 text-right price-box">\
                                    </div>\
                                </div>';
   
                    }

                if (istop == true) {
                    $("#addswrap").prepend(result);
                } else {
                    $("#addswrap").append(result);
                }
                pageIsRefresh = true;
            },
            error: function (e) {
                var s;
                s = e;
                pageIsRefresh = true;
            }
        });
        if (clear == true) {
            $("#addswrap").empty();
        }
    }

    jQuery(document).ready(function () {
        GetIlan(<%= kullaniciId%>, pageIndex, 10, opt, false, true);
    })

    $(window).on('scroll', function () {
        if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
            if (pageIsRefresh == true) {
                pageIndex++;
                GetIlan(<%= kullaniciId%>, pageIndex, 10, opt, false, false);
            }

    })

    function liste_sifirlama() {
        pageIndex = 0;
        GetIlan(<%= kullaniciId%>, pageIndex, 10, opt, false, true);
    }

    function getParameterByName(name, url) {
        if (!url) {
            url = window.location.href;
        }
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
</script>
