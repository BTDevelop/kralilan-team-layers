<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mesaj-oku.ascx.cs" Inherits="PL.profil.mesaj_oku" %>
<link rel="stylesheet" href="../libraries/assets/plugins/messages/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>

<div class="col-sm-9 page-content">

    <div class="col-md-12 ui" style="border-radius:4px;" >
        <div class="left-menu" id="leftmenu" style="margin-left: -14px;background :#2d3e50;">
            <div action="#" class="search">
                <input placeholder="ara..." type="search" name="" id="" style="background-color:#415972;">
                <input type="submit" value="&#xf002;">
            </div>
            <menu class="list-friends" id="userswrap">
      <%--          <li>
                    <img width="50" height="50" src="http://cs625730.vk.me/v625730358/1126a/qEjM1AnybRA.jpg">
                    <div class="info">
                        <div class="user">Юния Гапонович</div>
                        <div class="status on">online</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/1">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status on">online</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/2">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status off">left 3 min age</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/3">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status on">online</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/4">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status off">left 4 min age</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/5">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status off">left 12 min age</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/6">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status off">left 13 min age</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/7">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status on">online</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/8">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status off">left 6 min age</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/9">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status on">online</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/10">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status off">left 1 min age</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/0">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status on">online</div>
                    </div>
                </li>
                <li>
                    <img width="50" height="50" src="http://lorempixel.com/50/50/people/99">
                    <div class="info">
                        <div class="user">Name Fam</div>
                        <div class="status off">left 23 min age</div>
                    </div>
                </li>--%>
            </menu>
        </div>
        <div class="chat">
            <div class="top">
                <div class="avatar">
                    <img width="50" height="50" src="../upload/profil/<%= pic %>">
                    <span style="margin-right: 40px;"><%= name %></span>
                    <img width="50" height="50" src="../upload/ilan/<%= classifiedPic %>">
                    <span><%= header %></span>

                </div>
                <%--        <div class="info">
                    <div class="name">Юния Гапонович</div>
                    <div class="count">already 1 902 messages</div>
                </div>--%>
                <%-- <div class="avatar">
                    <img width="50" height="50" src="http://cs625730.vk.me/v625730358/1126a/qEjM1AnybRA.jpg">
                </div>
                <div class="info">
                    <div class="name">Юния Гапонович</div>
                    <div class="count">already 1 902 messages</div>
                </div>--%>
            </div>

            <ul class="messages" id="messagewrap">
            </ul>
            <div class="write-form" id="pagecontent">
                <textarea placeholder="Mesajını yaz..." name="e" id="texxt" rows="2"></textarea>

                <span class="send" id="send">Gönder</span>
            </div>
        </div>
    </div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/nicescroll/3.5.4/jquery.nicescroll.js'></script>
    <script src="../libraries/assets/plugins/messages/js/index.js"></script>
    <script type="text/javascript">
        var pageIndex = 0, pageIsRefresh = true;
        var sonistek = -1;
        var opt = 1;
        var userid = getParameterByName("user");
        var adsid = getParameterByName("ads");
        function GetIlan(oneid, twoid, adsid, index, count, opt, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListMessage",
                dataType: "json",
                data: "{oneid:'" + oneid + "', twoid:'" + twoid + "'" + " , index:'" + index + "'" + ", count:'" + count + "'" + ", adsid:'" + adsid + "'" + ", opt:'" + 1 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    edata = data.d;
                    if (istop == true) {
                        $("#messagewrap").prepend(edata);
                    } else {
                        $("#messagewrap").append(edata);
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

        $("#texxt").keypress(function(e) {
            if (e.keyCode === 13) {
                addMessage();
                GetIlan(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
                $("#userswrap").empty();
                 getUsers(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
            }
            $("#send").on("click", function () {
            addMessage();
            GetIlan(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
            $("#userswrap").empty();
            getUsers(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
        })
        });
      

        jQuery(document).ready(function () {
            GetIlan(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
            $("#userswrap").empty();
            getUsers(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
            readMessage();
        })

        $(window).on('scroll', function () {
            if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
                if (pageIsRefresh == true) {
                    pageIndex++;
                    GetIlan(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, false);
                }

        })

        $(window).on('scroll', function () {
            if ($(window).scrollTop() + $(window).height() > $("#leftmenu").height() - 50)
                if (pageIsRefresh == true) {
                    pageIndex++;
                    $("#userswrap").empty();
                    getUsers(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, false);
                }

        })

        function liste_sifirlama() {
            pageIndex = 0;
            GetIlan(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
            $("#userswrap").empty();
            getUsers(<%= userid %>, userid, adsid, pageIndex, 10, opt, false, true);
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

        function addMessage()
        {
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/ctrlMessage",
                dataType: "json",
                data: "{oneid:'" + <%= userid %> + "', twoid:'" + userid + "'" + ", adsid:'" + adsid + "'" + ", message:'" + $('#texxt').val() + "'" + ", opt:'" + 1 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                   
            
                },
                error: function (e) {
                    var s;
                    s = e;
                   
                }
            });
        }

        function readMessage()
        {
             jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/ctrlMessage",
                dataType: "json",
                data: "{oneid:'" + <%= userid %> + "', twoid:'" + userid + "'" + ", adsid:'" + adsid + "'" + ", message:'" + $('#texxt').val() + "'" + ", opt:'" + 2 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                   
            
                },
                error: function (e) {
                    var s;
                    s = e;
                   
                }
            });
        }


        var pgindex = 0, refresh = true;
        var istek = -1;
        var opt = 1;

        function getUsers(oneid, twoid, adsid, index, count, opt, istop, clear) {
            refresh = false;
            if (clear == false) {
                if (istek == index) return;
            }

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListMessage",
                dataType: "json",
                data: "{oneid:'" + oneid + "', twoid:'" + twoid + "'" + " , index:'" + index + "'" + ", count:'" + count + "'" + ", adsid:'" + adsid + "'" + ", opt:'" + 2 + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    edata = data.d;
                    if (istop == true) {
                        $("#userswrap").prepend(edata);
                    } else {
                        $("#userswrap").append(edata);
                    }
                    refresh = true;
                },
                error: function (e) {
                    var s;
                    s = e;
                    refresh = true;
                }
            });
            if (clear == true) {
                $("#userswrap").empty();
            }
        }
    </script>

</div>

