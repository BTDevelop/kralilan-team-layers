<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yonlendir.aspx.cs" Inherits="PL.sysLogin.yonlendir" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>kralilan Admin | Lockscreen</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../../../management/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../management/dist/css/AdminLTE.min.css">
    <style>
        .lockscreen .lockscreen-name {
            text-align: center;
            font-weight: 600;
            position: relative;
            left: 20px;
        }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition lockscreen">
    <form runat="server" id="form1">
        <!-- Automatic element centering -->
        <div class="lockscreen-wrapper">
            <div class="lockscreen-logo">
                <a href="../../index2.html"><b>Admin</b>&nbsp;kralilan.com</a>
            </div>
            <!-- User name -->
            <div class="lockscreen-name" runat="server" id="txtMail"></div>

            <!-- START LOCK SCREEN ITEM -->
            <div class="lockscreen-item">
                <!-- lockscreen image -->
                <div class="lockscreen-image">
                    <img src="../../../management/dist/img/user.jpg" alt="User Image">
                </div>
                <!-- /.lockscreen-image -->

                <!-- lockscreen credentials (contains the form) -->
                <div class="lockscreen-credentials">
                    <div class="input-group">
                        <input type="password" class="form-control" placeholder="şifre" runat="server" id="txtSifre">
                        <div class="input-group-btn">
                            <asp:LinkButton CssClass="btn" ID="Giris" runat="server" ><i class="fa fa-arrow-right text-muted"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>


                <!-- /.lockscreen credentials -->

            </div>
                        <div class="lockscreen-item">
                <!-- lockscreen image -->
                <div class="lockscreen-image" style="left:215px;">
                    <img src="../../../management/dist/img/user.jpg" alt="User Image">
                </div>
                <!-- /.lockscreen-image -->

                <!-- lockscreen credentials (contains the form) -->
                <div class="lockscreen-credentials">
                    <div class="input-group">
                        <input type="password" class="form-control" placeholder="şifre" runat="server" id="Password1">
                        <div class="input-group-btn" style="right:255px;">
                            <asp:LinkButton CssClass="btn" ID="LinkButton1" runat="server" ><i class="fa fa-arrow-left text-muted"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>


                <!-- /.lockscreen credentials -->

            </div>
            <!-- /.lockscreen-item -->
            <div class="help-block text-center">
                Şifreni girerek oturumunu açabilirsin.
            </div>
            <div class="text-center">
            </div>
            <div class="lockscreen-footer text-center">
                Copyright &copy; 2015-2016 <b><a href="" class="text-black">T Software</a></b><br>
                Tüm hakları saklıdır.
            </div>
        </div>
        <!-- /.center -->

        <!-- jQuery 2.1.4 -->
        <script src="../../../management/plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <!-- Bootstrap 3.3.5 -->
        <script src="../../../management/bootstrap/js/bootstrap.min.js"></script>

    </form>
</body>
</html>

