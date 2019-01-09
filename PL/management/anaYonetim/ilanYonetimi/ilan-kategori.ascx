<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ilan-kategori.ascx.cs" Inherits="PL.management.anaYonetim.ilanYonetimi.ilan_kategori" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Kategori Seçimi
            <small>İlan verebilmek için ilk önce kategori seçmelisiniz</small>
        </h1>

    </section>
    <style>
        .cat-list {
            width: 100%;
            min-height: 200px;
            background-color: #f2f2f2;
            outline: none;
            border: 1px solid #a9a9a9;
            margin: 14px 0;
            overflow-y: auto;
            cursor: pointer;
        }

            .cat-list:focus {
                outline: none;
            }

        .kategoriler {
            background: white;
            min-height: 243px;
        }

        .tamam {
            font-size: 20px;
            line-height: 28px;
            padding-top: 86px;
            height: 200px;
            margin-top: 14px;
            border: 1px solid #a9a9a9;
            color: #a9a9a9;
            text-align: center;
            display: block;
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>

    <!-- Main content -->
    <section class="content">
        <div>
            <div class="box box-default">
                <div class="box-body" runat="server" id="box_body">
                    <asp:Panel ID="cats" runat="server" CssClass="kategoriler">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="cat_1" runat="server" CssClass="col-sm-2 col-xs-12">
                                    <asp:ListBox ID="ListBox1" AutoPostBack="true" runat="server" CssClass="cat-list"></asp:ListBox>
                                </asp:Panel>
                                <asp:Panel ID="cat_2" runat="server" CssClass="col-sm-2 col-xs-12">
                                    <asp:ListBox ID="ListBox2" AutoPostBack="true" runat="server" CssClass="cat-list"></asp:ListBox>
                                </asp:Panel>
                                <asp:Panel ID="cat_3" runat="server" CssClass="col-sm-2 col-xs-12">
                                    <asp:ListBox ID="ListBox3" AutoPostBack="true" runat="server" CssClass="cat-list"></asp:ListBox>
                                </asp:Panel>
                                <asp:Panel ID="cat_4" runat="server" CssClass="col-sm-2 col-xs-12">
                                    <asp:ListBox ID="ListBox4" AutoPostBack="true" runat="server" CssClass="cat-list"></asp:ListBox>
                                </asp:Panel>
                                <asp:Panel ID="cat_5" runat="server" CssClass="col-sm-2 col-xs-12">
                                    <asp:ListBox ID="ListBox5" AutoPostBack="true" runat="server" CssClass="cat-list"></asp:ListBox>
                                </asp:Panel>
                                <div class="col-xs-1 col-xs-offset-11">
                                    <asp:Button ID="devam" runat="server" CssClass="btn btn-success" Text="Devam Et" OnClick="devam_Click1" Style="float: right; margin-top: 15px;" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <!-- /.content -->
    </section>
</div>

