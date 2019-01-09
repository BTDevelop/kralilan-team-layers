<%@ Page Title="Anasayfa" Language="C#" MasterPageFile="~/Management/admin.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PL.Management.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/jvectormap/jquery-jvectormap-1.2.2.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/datepicker/datepicker3.css") %>' />
    <link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/daterangepicker-bs3.css") %>'/>
    <script src='<%= Page.ResolveUrl("~/managementplugins/fastclick/fastclick.min.js") %>'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Anasayfa
            <small>genel raporlama ve zamanlama diyagramları</small>
            </h1>

        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3><%= adscount %></h3>
                            <p>Yayında Olan İlan Sayısı</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-calendar"></i>
                        </div>
                        <a href="#" class="small-box-footer">Daha fazlası<i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3><%= usercount %></h3>
                            <p>Aktif Kullanıcı Sayısı</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                        <a href="#" class="small-box-footer">Daha fazlası <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3><%= storecount %></h3>
                            <p>Aktif Mağaza Sayısı</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-ios-cart"></i>
                        </div>
                        <a href="#" class="small-box-footer">Daha fazlası <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3><%= visitorcount %></h3>
                            <p>Aktif Ziyaretçi Sayısı</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-happy"></i>
                        </div>
                        <a href="#" class="small-box-footer">Daha fazlası <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
            </div>
            <!-- /.row -->
            <!-- /.row -->
            <div class="row">
                <!-- Left col -->
                <section class="col-lg-7 connectedSortable">
                    <!-- Custom tabs (Charts with tabs)-->
                    <div class="nav-tabs-custom">
                        <!-- Tabs within a box -->
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>
                            <li><a href="#sales-chart" data-toggle="tab">Tarayıcı</a></li>
                            <li class="pull-left header"><i class="fa fa-inbox"></i>Yapılan Yayın Raporu</li>
                        </ul>
                        <div class="tab-content no-padding">
                            <!-- Morris chart - Sales -->
                            <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
                            <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
                        </div>
                    </div>
                    <!-- /.nav-tabs-custom -->

                    <!-- TO DO List -->
                    <div class="box box-primary">
                        <div class="box-header">
                            <i class="ion ion-clipboard"></i>
                            <h3 class="box-title">Son Üyeler</h3>
              <%--              <div class="box-tools pull-right">
                                <ul class="pagination pagination-sm inline">
                                    <li><a href="#">&laquo;</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </div>--%>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <ul class="todo-list" id="userwrap">
                               
                                
                            </ul>
                        </div>
                        <!-- /.box-body -->
              
                    </div>
                    <!-- /.box -->
                </section>
                <!-- /.Left col -->
                <!-- right col (We are only adding the ID to make the widgets sortable)-->
                <section class="col-lg-5 connectedSortable">

                    <!-- Map box -->
                    <div class="box box-solid bg-light-blue-gradient">
                        <div class="box-header">
                            <!-- tools box -->
                            <div class="pull-right box-tools">
<%--                                <button class="btn btn-primary btn-sm daterange pull-right" data-toggle="tooltip" title="Date range"><i class="fa fa-calendar"></i></button>--%>
                                <button class="btn btn-primary btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                            </div>
                            <!-- /. tools -->

                            <i class="fa fa-map-marker"></i>
                            <h3 class="box-title">Ziyaretçi Haritası
                            </h3>
                        </div>
                        <div class="box-body">
                            <div id="world-map" style="height: 250px; width: 100%;"></div>
                        </div>
                        <!-- /.box-body-->
                        <div class="box-footer no-border">
                            <div class="row">
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <div id="sparkline-1"></div>
                                    <div class="knob-label">Visitors</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <div id="sparkline-2"></div>
                                    <div class="knob-label">Online</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center">
                                    <div id="sparkline-3"></div>
                                    <div class="knob-label">Exists</div>
                                </div>
                                <!-- ./col -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->

                    <!-- solid sales graph -->
                    <div class="box box-solid bg-teal-gradient">
                        <div class="box-header">
                            <i class="fa fa-th"></i>
                            <h3 class="box-title">Site Sayfa Raporu</h3>
                            <div class="box-tools pull-right">
                                <button class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
<%--                                <button class="btn bg-teal btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>--%>
                            </div>
                        </div>
                        <div class="box-body border-radius-none">
                            <div class="chart" id="line-chart" style="height: 250px;"></div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer no-border">
                            <div class="row">
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60" data-fgcolor="#39CCCC"/>
                                    <div class="knob-label">Mail</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                                    <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60" data-fgcolor="#39CCCC"/>
                                    <div class="knob-label">Online</div>
                                </div>
                                <!-- ./col -->
                                <div class="col-xs-4 text-center">
                                    <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60" data-fgcolor="#39CCCC"/>
                                    <div class="knob-label">Ziyaretçi</div>
                                </div>
                                <!-- ./col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                    <!-- Calendar -->
                    <div class="box box-solid bg-green-gradient">
                        <div class="box-header">
                            <i class="fa fa-calendar"></i>
                            <h3 class="box-title">Takvim</h3>
                            <!-- tools box -->
                            <div class="pull-right box-tools">
                                <!-- button with a dropdown -->
                   <%--             <div class="btn-group">
                                    <button class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">Add new event</a></li>
                                        <li><a href="#">Clear events</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">View calendar</a></li>
                                    </ul>
                                </div>--%>
                                <button class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
<%--                                <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>--%>
                            </div>
                            <!-- /. tools -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <!--The calendar -->
                            <div id="calendar" style="width: 100%"></div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-black">
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- Progress bars -->
                                    <div class="clearfix">
                                        <span class="pull-left">Görev #1</span>
                                        <small class="pull-right">90%</small>
                                    </div>
                                    <div class="progress xs">
                                        <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                                    </div>

                                    <div class="clearfix">
                                        <span class="pull-left">Görev #2</span>
                                        <small class="pull-right">70%</small>
                                    </div>
                                    <div class="progress xs">
                                        <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                                    </div>
                                </div>
                                <!-- /.col -->
                                <div class="col-sm-6">
                                    <div class="clearfix">
                                        <span class="pull-left">Görev #3</span>
                                        <small class="pull-right">60%</small>
                                    </div>
                                    <div class="progress xs">
                                        <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                                    </div>

                                    <div class="clearfix">
                                        <span class="pull-left">Görev #4</span>
                                        <small class="pull-right">40%</small>
                                    </div>
                                    <div class="progress xs">
                                        <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                                    </div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                    </div>
                    <!-- /.box -->

                </section>
                <!-- right col -->
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="plugins/morris/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="plugins/knob/jquery.knob.js"></script>
    <!-- daterangepicker -->
    <script src='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/moment.min.js") %>'></script>
    <script src='<%= Page.ResolveUrl("~/management/plugins/daterangepicker/daterangepicker.js") %>'></script>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="plugins/daterangepickerdemo/daterangepicker.js"></script>--%>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard.js"></script>
    <script type="text/javascript">
    var pageIndex = 0, pageIsRefresh = true;
    var sonistek = -1;
    var opt = 1;

    function getUsers(index, count, opt, istop, clear) {
        //pageIsRefresh = false;
        //if (clear == false) {
        //    if (sonistek == index) return;
        //}

        //sonistek = index;
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_operation.asmx/getLastetsUser",
            dataType: "json",
            data: "{index:'" + index + "'" + ", count:'" + count + "'" + ", opt:'" + opt + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                edata = data.d;
                    
                    var dataArr = JSON.parse(edata);
                    result = "";
                    for(var i = 0; i < dataArr.length; i++) {
                       

                         result += '<li>\
                                    <span class="handle">\
                                        <i class="fa fa-ellipsis-v"></i>\
                                        <i class="fa fa-ellipsis-v"></i>\
                                    </span>\
                                    <span class="text">' + dataArr[i].kullaniciAdSoyad + '</span>\
                                    <small class="label label-danger"><i class="fa fa-clock-o"></i>' + dataArr[i].tarihFormat + '</small>\
                                    <div class="tools">\
                                        <i class="fa fa-edit"></i>\
                                        <i class="fa fa-trash-o"></i>\
                                    </div>\
                                </li>';

                    }

                $("#userwrap").append(result);
           
            },
            error: function (e) {
                var s;
                s = e;
            }
        });

    }

    jQuery(document).ready(function () {
        getUsers(pageIndex, 10, opt, false, true);
    })
</script>
</asp:Content>
