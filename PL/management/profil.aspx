<%@ Page Title="" Language="C#" MasterPageFile="~/management/admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="profil.aspx.cs" Inherits="PL.management.profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>' />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Profilim
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-3">
                    <!-- Profile Image -->
                    <div class="box box-default">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle" src="../../../management/dist/img/user.jpg" alt="User profile picture">
                            <h3 class="profile-username text-center"><%= name %></h3>
                            <p class="text-muted text-center"><%= rank %></p>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#activity" data-toggle="tab">Payıma Düşen İlanlar</a></li>
                            <li><a href="#timeline" data-toggle="tab">Zaman Tüneli</a></li>
                            <%--  <li><a href="#settings" data-toggle="tab">Settings</a></li>--%>
                        </ul>
                        <div class="tab-content" id="pagecontent">
                            <div class="active tab-pane" id="activity">
                                <!-- Post -->
                                <div class="post">
                                    <div class='user-block'>
                                        <img class='img-circle img-bordered-sm' src='../../../management/dist/img/user.jpg' alt='user image' />
                                        <span class='username'>
                                            <a href="#"><%= name %></a>
                                            <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>
                                        </span>
                                        <span class='description'><%= DateTime.Now %></span>
                                    </div>
                                    <div class="box-body no-padding">
                                        <ul class="users-list clearfix" id="addswrap">
                                        </ul>
                                        <!-- /.users-list -->
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.post -->
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="timeline">
                                <!-- The timeline -->
                                <ul class="timeline timeline-inverse">
                                    <!-- timeline time label -->
                                    <li class="time-label">
                                        <span class="bg-red"><%= DateTime.Now %>
                                        </span>
                                    </li>
                                    <!-- /.timeline-label -->
                                    <!-- timeline item -->
                                    <li>
                                        <i class="fa fa-envelope bg-blue"></i>
                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i><%= DateTime.Now %></span>
                                            <h3 class="timeline-header"><a href="#">kralilan.com Team</a> </h3>
                                            <div class="timeline-body">
                                                  Kayıt Bulunamadı.
                                            </div>
                                            <div class="timeline-footer">
                                               <%-- <a class="btn btn-primary btn-xs">Read more</a>
                                                <a class="btn btn-danger btn-xs">Delete</a>--%>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- END timeline item -->
                                    <!-- timeline item -->
                                  <%--  <li>
                                        <i class="fa fa-user bg-aqua"></i>
                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i>5 mins ago</span>
                                            <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3>
                                        </div>
                                    </li>--%>
                                    <!-- END timeline item -->
                                    <!-- timeline item -->
                                    <%--<li>
                                        <i class="fa fa-comments bg-yellow"></i>
                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i>27 mins ago</span>
                                            <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>
                                            <div class="timeline-body">
                                                Take me to your leader!
                            Switzerland is small and neutral!
                            We are more like Germany, ambitious and misunderstood!
                                            </div>
                                            <div class="timeline-footer">
                                                <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                                            </div>
                                        </div>
                                    </li>--%>
                                    <!-- END timeline item -->
                                    <!-- timeline time label -->
                                   <%-- <li class="time-label">
                                        <span class="bg-green">3 Jan. 2014
                                        </span>
                                    </li>--%>
                                    <!-- /.timeline-label -->
                                    <!-- timeline item -->
                                   <%-- <li>
                                        <i class="fa fa-camera bg-purple"></i>
                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i>2 days ago</span>
                                            <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>
                                            <div class="timeline-body">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                            </div>
                                        </div>
                                    </li>--%>
                                    <!-- END timeline item -->
                                   <%-- <li>
                                        <i class="fa fa-clock-o bg-gray"></i>
                                    </li>--%>
                                </ul>
                            </div>
                            <!-- /.tab-pane -->

                            <div class="tab-pane" id="settings">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputExperience" class="col-sm-2 control-label">Experience</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSkills" class="col-sm-2 control-label">Skills</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox">
                                                    I agree to the <a href="#">terms and conditions</a>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-danger">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>
                <!-- /.col -->
                <!-- /.col -->
            </div>
            <!-- /.row -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <script src="plugins/select2/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="plugins/input-mask/jquery.inputmask.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>

    <script>
        $(function () {
            //Initialize Select2 Elements
            $(".select2").select2();

            //Datemask dd/mm/yyyy
            $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
            //Datemask2 mm/dd/yyyy
            $("#datemask2").inputmask("mm/dd/yyyy", { "placeholder": "mm/dd/yyyy" });
            //Money Euro
            $("[data-mask]").inputmask();


        });

       
        var pageIndex = 0, pageIsRefresh = true;
        var sonistek = -1;
        var opt = 1;

        function GetIlan(inuserid, index, count, opt, istop, clear) {
            pageIsRefresh = false;
            if (clear == false) {
                if (sonistek == index) return;
            }

            sonistek = index;
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getListEditorAds",
                dataType: "json",
                data: "{inuserid:'" + inuserid + "' , index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    cdata = data.d;
                    if (istop == true) {
                        $("#addswrap").prepend(cdata);
                    } else {
                        $("#addswrap").append(cdata);
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
            GetIlan(<%= id %>, pageIndex, 20, opt, false, true);
        })

            $(window).on('scroll', function () {
                if ($(window).scrollTop() + $(window).height() > $("#pagecontent").height() - 50)
                    if (pageIsRefresh == true) {
                        pageIndex++;
                        GetIlan(<%= id %>, pageIndex, 20, opt, false, false);
                    }

            })

            function liste_sifirlama() {
                pageIndex = 0;
                GetIlan(<%= id %>, pageIndex, 20, opt, false, true);
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
</asp:Content>
