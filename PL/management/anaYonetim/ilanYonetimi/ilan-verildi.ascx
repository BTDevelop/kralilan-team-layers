<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ilan-verildi.ascx.cs" Inherits="PL.management.anaYonetim.ilanYonetimi.ilan_verildi" %>
<link rel="stylesheet" href='<%= Page.ResolveUrl("~/management/dist/css/AdminLTE.min.css") %>'>

<style>
    .example-modal .modal {
        position: relative;
        top: auto;
        bottom: auto;
        right: auto;
        left: auto;
        display: block;
        z-index: 1;
    }

    .example-modal .modal {
        background: transparent !important;
    }
</style>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="example-modal">
                <div class="modal modal-success">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">İlan Yayına Gönderildi.</h4>
                            </div>
                            <div class="modal-body">
                                <p><%= adsid %> nolu ilan başarıyla yayına gönderildi.</p>
                            </div>
                            <div class="modal-footer">
                                <a href="/management/anaYonetim/ilanYonetimi/ilan.aspx?page=ilan-kategori" class="btn btn-outline pull-left" data-dismiss="modal">Yeni İlan</a>
                                <a href="https://kralilan.com/" class="btn btn-outline">kralilan.com Devam Et</a>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>
            <!-- /.example-modal -->

            <div class="col-md-12">
                <!-- The time line -->
                <ul class="timeline">
                    <!-- timeline time label -->
                    <!-- END timeline item -->
                    <!-- timeline item -->
                    <li>
                        <i class="fa fa-video-camera bg-maroon"></i>
                        <div class="timeline-item">
                            <span class="time"><i class="fa fa-clock-o"></i><%= DateTime.Now %></span>
                            <h3 class="timeline-header"> <%= adsid %> nolu ilanın önizlemesi </h3>
                            <div class="timeline-body">
                                <div class="embed-responsive embed-responsive-16by9">
                                    <iframe class="embed-responsive-item" src="https://www.kralilan.com/ilan/detay- <%= adsid  %>/detay" frameborder="0" allowfullscreen></iframe>
                                </div>
                            </div>
                 
                        </div>
                    </li>
                    <!-- END timeline item -->
                    <li>
                        <i class="fa fa-clock-o bg-gray"></i>
                    </li>
                </ul>
            </div>
            <!-- /.col -->
        </div>
    </section>
</div>
