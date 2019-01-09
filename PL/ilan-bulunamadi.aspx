<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ilan-bulunamadi.aspx.cs" Inherits="PL.ilan_bulunamadi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        p {
            font-size: 12px;
            color: #373737;
            font-family: Arial, Helvetica, sans-serif;
            line-height: 18px;
        }

            p a {
                color: #16A085;
                font-size: 12px;
                text-decoration: none;
            }

        a {
            outline: none;
        }

        .f-left {
            float: left;
        }

        .f-right {
            float: right;
        }

        .clear {
            clear: both;
            overflow: hidden;
        }

        #block_error {

            border: 1px solid #cccccc;
            margin: 72px auto 0;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            background: #fff url(http://www.ebpaidrev.com/systemerror/block.gif) no-repeat 0 51px;
        }

            #block_error div {
                padding: 100px 40px 0 186px;
            }

                #block_error div h2 {
                    color: #16A085;
                    font-size: 24px;
                    display: block;
                    padding: 0 0 14px 0;
                    border-bottom: 1px solid #cccccc;
                    margin-bottom: 12px;
                    font-weight: normal;
                }
    </style>
    <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div id="block_error">
                        <div>
                            <h2>Bu ilan yayında değil.</h2>
                            <p>
                                It apperrs that Either something went wrong or the page doesn't exist anymore..<br />
                                This website is temporarily unable to service your request as it has exceeded it’s resource limit. Please check back shortly.
                            </p>
                            <p>
                                If you are the owner of the account and are regularly seeing this error, please read more about it in our <a href="http://www.namecheap.com/support/knowledgebase/article.aspx/1128/103/what-happens-when-my-account-reaches-lve-limits-diagnosing-and-resolving">knowledgebase</a>.
        If you have any questions, please contact our Technical Support department.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="col-lg-12 content-box ">
                <div class="row row-featured row-featured-category">
                    <div class="col-lg-12  box-title no-border">
                        <div class="inner">
                            <h2><span>BENZER </span>
                                İLANLAR <a href="category.html" class="sell-your-item">TÜMÜNÜ GÖSTER <i
                                    class="  icon-th-list"></i></a></h2>
                        </div>
                    </div>
                    <asp:Repeater ID="anaVitrinRepeater" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 f-category">
                                <a href="category.html">
                                    <img src="libraries/images/category/car-2.jpg" class="img-responsive" alt="img" />
                                    <asp:HyperLink ID="hypBaslik" runat="server" NavigateUrl='<%# Eval("ilanId","~/ilan-detay.aspx?ilan={0}") %>'><h6><%# Eval("baslik") %> </h6></asp:HyperLink>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <script src='<%= Page.ResolveUrl("~/libraries/assets/js/owl.carousel.min.js") %>'></script>
</asp:Content>
