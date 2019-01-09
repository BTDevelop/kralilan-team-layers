<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="kategori-test.aspx.cs" Inherits="PL.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .category {
            border-radius: 10px;
            width: 300px;
            height: 300px;
            text-align: center;
            overflow-y: scroll;
            position: absolute;
            left: 50%;
            margin-left: -102.5px;
            background: #d2f3ed;
            border:dashed;
            opacity: 0;
            -webkit-transform: scale(1, 0);
            -ms-transform: scale(1, 0);
            -o-transform: scale(1, 0);
            transform: scale(1, 0);
            -webkit-transform-origin: center left;
            -moz-transform-origin: center left;
            -ms-transform-origin: center left;
            -o-transform-origin: center left;
            transform-origin: center left;
            -webkit-transition: all 0.6s cubic-bezier(.17,.67,0,1.34);
            -o-transition: all 0.6s cubic-bezier(.17,.67,0,1.34);
            transition: all 0.6s cubic-bezier(.17,.67,0,1.34);
        }

            .category::-webkit-scrollbar {
                display: none;
            }

            .category.active {
                opacity: 1;
                -webkit-transform: scale(1, 1);
                -ms-transform: scale(1, 1);
                -o-transform: scale(1, 1);
                transform: scale(1, 1);
                -webkit-transition-delay: 0.1s; /* Safari */
                transition-delay: 0.1s;
            }

            .category.last {
                background: none;
                padding-top: 15px;
            }

            .category .glyphicon {
                width: 70px;
                height: 70px;
                border-radius: 150px;
                background: #00a65a;
                font-size: 25px;
                color: #fff;
                position: relative;
                margin-bottom: 10px;
            }

            .category input[type="submit"] {
                background: #00a65a;
                font-family: "roboto",sans-serif;
                font-size: 14px;
                color: #fff;
                line-height: 1.4;
                display: inline-block;
                border: 1px solid #008d4c;
                padding: 10px 20px;
                border-radius: 5px;
                transition: all 0.25s linear 0s;
                -webkit-transition: all 0.25s linear 0s;
                -moz-transition: all 0.25s linear 0s;
                -ms-transition: all 0.25s linear 0s;
                -o-transition: all 0.25s linear 0s;
            }

                .category input[type="submit"]:hover {
                    background: #2ECC71;
                    transition: all 0.25s linear 0s;
                    -webkit-transition: all 0.25s linear 0s;
                    -moz-transition: all 0.25s linear 0s;
                    -ms-transition: all 0.25s linear 0s;
                    -o-transition: all 0.25s linear 0s;
                }

            .category .glyphicon:before {
                display: inline-block;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%);
            }

            .category a {
                display: block;
                font-family: "roboto",sans-serif;
                font-size: 20px;
                font-weight: 500;
                color: #333;
                line-height: 40px;
                padding-left: 5px;
                text-align: left;
            }

            .category span {
                display: block;
                font-family: "roboto",sans-serif;
                font-size: 18px;
                color: #000;
                line-height: 25px;
                margin-bottom: 13px;
            }

            .category a:hover, .category a:active, .category a:focus {
                background: #999;
                color: #fff;
            }

        .categoryWrapper {
            float: left;
            width: 100%;
            position: relative;
            min-height: 220px;
            margin-bottom: 20px;
        }

        .ab-prev {
            display: inline-block;
            position: absolute;
            display: none;
            left: 240px;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0;
            transition: all 0.25s linear 0s;
            -webkit-transition: all 0.25s linear 0s;
            -moz-transition: all 0.25s linear 0s;
            -ms-transition: all 0.25s linear 0s;
            -o-transition: all 0.25s linear 0s;
        }

            .ab-prev .glyphicon {
                display: inline-block;
                font-size: 40px;
                color: #666;
            }

            .ab-prev:hover .glyphicon {
                color: #2ECC71;
            }

            .ab-prev.active {
                opacity: 1;
                display: inline-block;
                transition: all 0.25s linear 0s;
                -webkit-transition: all 0.25s linear 0s;
                -moz-transition: all 0.25s linear 0s;
                -ms-transition: all 0.25s linear 0s;
                -o-transition: all 0.25s linear 0s;
            }

        .categoryTitle {
            display: block;
            font-family: 'roboto',sans-serif;
            font-size: 15px;
            color: #89000e;
            line-height: 20px;
            text-align: center;
            padding-bottom: 25px;
        }

        @media screen and (max-width: 767px) {
            .ab-prev {
                left: -27px;
            }
        }

        @media only screen and (min-width: 767px) and (max-width: 992px) {
            .ab-prev {
                left: 170px;
            }
        }

        .categoryContentWrapper {
            position: relative;
            float: left;
            width: 100%;
        }
    </style>
            <div class="main-container">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
    <div id="ContentPlaceHolder1_panel">
        <div id="ContentPlaceHolder1_cats">
            <div class="categoryContentWrapper">
                <div class="categoryWrapper">
                    <div class="category active" data-type="category1">
                        <a data-id="1" href="#">Emlak</a>

                    </div>
                    <!-- category -->
                </div>
                <a href="#" class="ab-prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
            </div>
        </div>
    </div>
                    <br />
                    </div>
                </div>
            </div>
                </div>
    
    <script type="text/javascript">
        $(document).ready(function () {
            clickListen();
        });

        $('.ab-prev').click(function () {
            var prev = $(this);

            var index = prev.closest('.categoryWrapper').find(".category.active").index();



            $('.categoryWrapper .category.active').removeClass('active')
            setTimeout(function () {
                $('.categoryWrapper .category:last-child').remove();
                $('.categoryWrapper .category:last').addClass('active');
                if ($('.category.active').index() == 0) {
                    prev.removeClass('active');
                }
            }, 15);

        });


        var dataId;
        var datam;

        function clickListen() {

            $('.category a').off().on('click', function (e) {
                e.preventDefault();

                var category = $(this);

                if (typeof category.attr('data-id') === "undefined") {
                    //datam = -1;
                }
                else
                {
                    dataId = category.attr('data-id');
                }

                datam = category.attr('data-wid');

                var categoryType = category.closest('.category').attr('data-type');

                $('.category.active').removeClass('active');

                if (typeof datam === "undefined") {
                    datam = -1;
                }

                //if (typeof dataId === "undefined") {
                //    dataId = -1;
                //}

                getirICerik(
                    categoryType,
                    dataId,
                    datam,
                    function () {

                        setTimeout(function () {
                            $('.category.effectBefore').removeClass('effectBefore').addClass('active');
                        }, 10)

                    }
                )

                clickListen();
            });
        }






        function getirICerik(categoryType, dataId, datam , callback) {

            var DOM = '';

 
            var str = "";
            jQuery.ajax({
                type: "POST",
                url: "/services/ki_operation.asmx/getCat",
                dataType: "json",
                data: "{catid:'" + dataId + "' , typeid:'" + datam + "'}",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    edata = data.d;
                    str = edata;
                    DOM += str;

                    $('.ab-prev').addClass('active');

                    if (DOM === "bitti") {
                        var DOM2 = '';
                        DOM2 += '<i class="glyphicon glyphicon-ok"></i>';
                        DOM2 += '<span>Kategori seçimi tamamlanmıştır.</span>';
                        DOM2 += '<input type="submit" value="Devam"/>';

                        $('.categoryWrapper').append(

                            $('<div/>').addClass('category last').html(DOM2).addClass('effectBefore')

                        );

                    } else {

                        //Acilacak Kategori geliyorsa
                        $('.categoryWrapper').append(

                            $('<div/>').addClass('category').html(DOM).addClass('effectBefore')

                        );
                    }

                    clickListen();
                   
                    typeof callback === 'function' && callback.call(this);


                },
                error: function (e) {
                    var s;
                    s = e;
                }

            });

           

           


            //DOM += '<a data-id="2" href="#">Alt Menu 1</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 2</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 3</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 4</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 5</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 6</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 1</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 2</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 3</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 4</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 5</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 6</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 1</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 2</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 3</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 4</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 5</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 6</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 1</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 2</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 3</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 4</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 5</a>';
            //DOM += '<a data-id="2" href="#">Alt Menu 6</a>';

          
            /*Typeof post içine eklenecek*/
           //typeof callback === 'function' && callback.call(this);


        }
    </script>
</asp:Content>
