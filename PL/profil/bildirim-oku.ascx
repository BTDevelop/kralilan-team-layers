<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="bildirim-oku.ascx.cs" Inherits="PL.profil.bildirim_oku" %>
<link rel="stylesheet" href="/libraries/assets/plugins/messages/css/style.css">

<div class="col-sm-9 page-content">
    <div class="col-md-12 ui" style="border-radius: 4px;">
        <div class="left-menu" id="leftmenu" style="margin-left: -14px; background: #2d3e50;">
            <div action="#" class="search">
                <input placeholder="ara..." type="search" name="" id="" style="background-color: #415972;">
                <input type="submit" value="&#xf002;">
            </div>
            <menu class="list-friends" id="userswrap">
                <li>
                    <img width='50' height='50' src='/upload/profil/noUser.jpg'>
                    <div class='info'>
                        <div class='user'>Bildirim Merkezi</div>
                        <div class='status on'>online</div>
                    </div>
                </li>
            </menu>
        </div>
        <div class="chat">
            <div class="top">
                <div class="avatar">
                    <img width="50" height="50" src="/upload/profil/<%= pic %>">
                    <span style="margin-right: 40px;"><%= name %></span>
                </div>
            </div>
            <ul class="messages" id="messagewrap">
            </ul>
        </div>
    </div>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="scripts" runat="server">--%>
<script src='http://cdnjs.cloudflare.com/ajax/libs/nicescroll/3.5.4/jquery.nicescroll.js'></script>
<script src="/libraries/assets/plugins/messages/js/index.js"></script>
<script type="text/javascript">
    var pageIndex = 0, pageIsRefresh = true;
    var sonistek = -1;
    var opt = 1;
    var userid = getParameterByName("user");
    var adsid = getParameterByName("ads");
    function GetIlan(oneid, index, count, opt, istop, clear) {
        pageIsRefresh = false;
        if (clear == false) {
            if (sonistek == index) return;
        }

        sonistek = index;
        jQuery.ajax({
            type: "POST",
            url: "/endpoint/bildirimservice.asmx/GetByUserId",
            dataType: "json",
            data: "{Index:'" + index + "'" + ", UserId:'" + oneid + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                edata = data.d;
                var dataArr = JSON.parse(edata);
                result = "";
                for(var i = 0; i < dataArr.length; i++) {

                   
                    result += '<li class="friend-with-a-SVAGina">\
                            <div class="head">\
                                <span class="name">Bildirim Merkezi</span>\
                                <span class="time">' + dataArr[i].BaslangicTarihi + '</span>\
                            </div>\
                            <div class="message">' + dataArr[i].Mesaj + '</div>\
                        </li>';


                }

                if (istop == true) {
                    $("#messagewrap").prepend(result);
                } else {
                    $("#messagewrap").append(result);
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
            $("#messagewrap").empty();
        }
    }


      

    jQuery(document).ready(function () {
        GetIlan(<%= userid %>, pageIndex, 10, opt, false, true);

        })

            $(window).on('scroll', function () {
                if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
                    if (pageIsRefresh == true) {
                        pageIndex++;
                        GetIlan(<%= userid %>, pageIndex, 10, opt, false, false);
                }

        })

      
        function liste_sifirlama() {
            pageIndex = 0;
            GetIlan(<%= userid %>, pageIndex, 10, opt, false, true);
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

<%--</asp:Content>--%>

