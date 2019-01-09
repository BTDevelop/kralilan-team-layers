<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="magaza-ilan-durum.ascx.cs" Inherits="PL.profil.magaza_ilan_durum" %>
<style>
    .userImg {
        width: 120px;
    }

    .hdata {
        width: 40px;
    }
</style>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h4>Performans Raporu</h4>
        <div class="row">
            <div class="col-md-4">
                <div class="header-data pull-left">
                    <div class="hdata">
                        <div class="mcol-left">
                            <i class="icon-eye ln-shadow"></i>
                        </div>
                        <div class="mcol-right">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <p><strong>Görüntülenme</strong></p>
                <h3 id="text-views">0</h3>
            </div>
            <div class="col-md-4">
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
                    <strong>Favoriye Eklenme</strong>
                </p>
                <h3 id="text-favorites">0</h3>
            </div>
            <div class="col-md-4">
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
                <p>
                    <strong>Yayındaki İlanlar</strong>
                </p>
                <h3 id="text-broadcast">0</h3>
            </div>
        </div>
    </div>
    <div class="inner-box">
        <div class="row">
            <div class="col-md-12" style="position:center; align-items:center;">
                <div id="canvas-holder" style="width: 80%; position:center; align-items:center;">
                    <canvas id="chart-area"></canvas>
                </div>
                <br />
                <p>yayında ya da yayında olmayan ilanların raporu</p>
            </div>
        </div>
    </div>
    <div class="inner-box">
        <div class="row">
            <div class="col-md-12">
                <div class="col-sm-3" style="align-self: flex-end">
                    <select name="category-group" id="category-group" class="form-control">
                        <option value="7" selected="selected">Son 7 Gün</option>
                        <option value="14">Son 14 Gün</option>
                    </select>
                </div>
                <canvas id="myChart" width="400" height="200"></canvas>
                <br />
                <p id="text-chart-info">yükleniyor... tarihleri arasında yayında olan ilanların raporu</p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script>
    $(document).ready(function () {
        GetViewsByStore();
        GetReportByStore();
    });

    var ctx = document.getElementById("myChart");
    var ctxPie = document.getElementById('chart-area').getContext('2d');

    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labelArr,
            datasets: [{
                label: 'Görüntülenme Sayısı',
                data: dataArr,
                backgroundColor: [
                    'rgba(0, 0, 0, 0.2)',

                ],
                borderColor: [
                    'rgba(0,0,0,1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    $('#category-group').on('change', function () {
        labelArr = []
        dataArr = [];
        GetViewsByStore();
    });

    var labelArr = []
    var dataArr = [];

    function GetViewsByStore() {
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_operation.asmx/getViewsClassifiedByStore",
            dataType: "json",
            data: "{storeId:'" + <%= storeid %> + "'" + ", dataRange:'" + $('#category-group').val() + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var edata = JSON.parse(data.d);

                for(var i = 0; i < edata.length; i++)
                {
                    dataArr[i] = edata[i].viewsCount;
                    labelArr[i] = edata[i].viewsDate;
                }

                $("#text-chart-info").text(edata[0].viewsRange + " tarihleri arasında yayında olan ilanların raporu");

                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labelArr,
                        datasets: [{
                            label: 'Görüntülenme Sayısı',
                            data: dataArr,
                            backgroundColor: [
                                'rgba(0, 0, 0, 0.2)',
                            ],
                            borderColor: [
                                'rgba(0,0,0,1)',
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function GetReportByStore() {
        jQuery.ajax({
            type: "POST",
            url: "/services/ki_operation.asmx/getReportClassifiedByStore",
            dataType: "json",
            data: "{storeId:'" + <%= storeid %> + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                console.log(data.d);
                var edata = JSON.parse(data.d);   
                $("#text-views").text(edata.viewsCount);
                $("#text-favorites").text(edata.favoriteAddCount);
                $("#text-broadcast").text(edata.broadcastAdsCount);
                var config = {
                    type: 'pie',
                    data: {
                        datasets: [{
                            data: [
                                edata.nonBroadcastAdsCount,
                                edata.broadcastAdsCount,
                            ],
                            backgroundColor: [
                                'rgba(0, 0, 0, 0.5)',
                                'rgb(110, 212, 206)',
                            ],
                            label: 'Dataset 1'
                        }],
                        labels: [
                            'Yayında Olmayan İlanlarım',
                            'Yayındaki İlanlarım',
                        ]
                    },
                    options: {
                        responsive: true
                    }
                };
                window.myPie = new Chart(ctxPie, config);
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
</script>

