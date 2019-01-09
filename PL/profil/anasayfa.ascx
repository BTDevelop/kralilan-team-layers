<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="anasayfa.ascx.cs" Inherits="PL.profil.anasayfa" %>
<style>
    .userImg {
        width: 120px;
    }
</style>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <div class="row">
            <div class="col-md-5 col-xs-4 col-xxs-12">
                <h3 class="no-padding text-center-480 useradmin"><a href="">
                    <img class="userImg" title="<%= userName %>"
                        src='/upload/profil/<%= userProfilePic %>'
                        alt="<%= userName %>">
                    <%= userName %>
                </a></h3>
            </div>
            <div class="col-md-7 col-xs-8 col-xxs-12">
                <div class="header-data text-center-xs">
                    <div class="hdata" style="width: 282px;">
                        <div class="mcol-left">
                            <i class="fa fa-eye ln-shadow"></i>
                        </div>
                        <div class="mcol-right">
                            <p><a href="#"><%= userFollowerStore %></a> <em>Takip Ettiğim Mağazalar</em></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="hdata" style="width: 282px;">
                        <div class="mcol-left">
                            <i class="icon-docs ln-shadow"></i>
                        </div>
                        <div class="mcol-right">
                            <p><a href="#"><%= userClassified %></a><em>İlanlarım</em></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="hdata" style="width: 282px;">
                        <div class="mcol-left">
                            <i class="fa fa-heart ln-shadow"></i>
                        </div>
                        <div class="mcol-right">
                            <p><a href="#"><%= userClassifiedFavorite %></a> <em>Favori İlanlarım</em></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="inner-box">
        <div class="row">
            <div class="col-md-12">
                <div class="header-data pull-left">
                    <div class="hdata">
                        <div class="mcol-left">
                            <i class="icon-docs ln-shadow"></i>
                        </div>
                        <div class="mcol-right">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <p><strong>Hemen İlan Ver</strong></p>
                <p>Siz de ilan verin, ilanınızın milyonlarca kullanıcı tarafından görüntülenmesini sağlayarak kısa sürede sonuca ulaşın. </p>
            </div>
        </div>
    </div>
    <div class="inner-box">
        <div class="row">
            <div class="col-md-12">
                <div class="header-data pull-left">
                    <div class="hdata">
                        <div class="mcol-left">
                            <i class="fa fa-heart ln-shadow"></i>
                        </div>
                        <div class="mcol-right">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <p>
                    <strong>Favori İlanlar</strong>
                </p>
                <p>İlgilendiğiniz ilanları favorilere ekleyin, fiyat değişikliği olduğunda size e-posta ile haber verelim.</p>
            </div>
        </div>
    </div>
    <div class="inner-box" runat="server" id="enSonİlan" visible="false">
        <div class="welcome-msg">
            <h4 class="page-sub-header2 clearfix no-padding">En Son Yayına Aldığım İlan </h4>
            <br />
            <div class="item-list">
                <div class="col-sm-2 no-padding photobox">
                    <div class="add-image">
                        <a href='<%= String.Format("/ilan/{0}-{1}/detay", BLL.PublicHelper.Tools.URLConverter(classifiedTitle),classifiedId)%>'>
                            <img
                                class="thumbnail no-margin" src='/upload/ilan/<%= classifiedPic %>'
                                alt="<%= classifiedTitle %>"></a>
                    </div>
                </div>
                <div class="col-sm-5 add-desc-box">
                    <div class="add-details">
                        <h5 class="add-title">
                            <a href='<%= String.Format("/ilan/{0}-{1}/detay", BLL.PublicHelper.Tools.URLConverter(classifiedTitle),classifiedId)%>' title='<%= classifiedTitle %>'>
                                <%= classifiedTitle %>
                            </a>
                        </h5>
                        <span class='info-row'><span
                            class='date'><i class=' icon-clock'></i><%= classifiedDate %></span>- <span
                                class='category'><%= classifiedType %>  <%= classifiedCategori %> </span>- <span
                                    class='item-location'><i class='icon-location-2'></i>&nbsp; <%= classifiedCity %> /  <%= classifiedDist %> /  <%= classifiedNeig %> </span>
                        </span>
                    </div>
                </div>
                <div class="col-sm-5 text-right  price-box">
                    <h2 class="item-price">
                        <%= classifiedPriceKind %> <%= classifiedPrice %> </h2>
                </div>
            </div>
        </div>
    </div>
</div>

