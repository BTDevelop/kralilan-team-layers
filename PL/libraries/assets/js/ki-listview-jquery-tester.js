$(document).ready(function () {
    urlReader();
});

var incomeArr;
var editdataintext;
var staticMeta = "ilanları ile bankadan, belediyeden, icradan, hazineden kısacası tüm kamu kurumlarından emlak ilanları kral ilan' da";
var inGeneralArr = [-1, -1, -1, -1, -1, -1, -1, -1];
var whoId = -1;
var titleParams;
var pageIndex = 0, 
pageIsRefresh = true;

var whoFrom = -1;
var sorter = 5;
var sonistek = -1;
var dateRange = -1;

var provinceName = "", districtName = "", neighName = "";
var inGeneralText = new DataTypeIntext();
    inGeneralText.ListDrop = null;
    inGeneralText.ListText = null;
    inGeneralText.FiyatData = null;
            
var typeList = [
    { typeId: '1', type: 'Satılık' },
    { typeId: '2', type: 'Kiralık' },
    { typeId: '3', type: 'Günlük Kiralık' },
    { typeId: '4', type: 'Devren' },
    { typeId: '5', type: 'Devren Satılık' }
];

var whoList = [
    { typeId: '0', type: 'sahibinden' },
    { typeId: '2', type: 'icradan' },
    { typeId: '1', type: 'belediyeden' },
    { typeId: '5', type: 'bankadan' },
    { typeId: '3', type: 'izaley-i-suyudan' },
    { typeId: '8', type: 'insaat-firmasindan' },
    { typeId: '7', type: 'emlak-ofisinden' },
    { typeId: '4', type: 'milli-hazineden-satilamayan' },
    { typeId: '10', type: 'milli-hazineden-guncel' },
    { typeId: '9', type: 'ozellestirme-idaresinden' },
    { typeId: '6', type: 'kamu-kurumlarindan' },
    { typeId: '-1', type: 'tumu' },
];

function urlReader() {
    var pathUrl = window.location.pathname;
    if(pathUrl) {
        
        var category = pathUrl.split('/')[2];
        if(category) {
            categoryText = $('.hidden-category').text();
            typePart = categoryText.split('/')[0];
            categoryPart = categoryText.split('/')[1];
            
            for (var k = 0; k < typeList.length; k++) {
                if(typeList[k].type == typePart) {
                    inGeneralArr[1] = typeList[k].typeId;
                }
            }

            inGeneralArr[0] = 8;
        }

        var pathPart = pathUrl.split('/')[3];
        if (pathPart) {
            var cntrlWho = whoList.find(x => x.type == pathPart);
            if(cntrlWho) {
                whoId = cntrlWho.typeId;
                inGeneralArr[5] = whoId;
                $('#slctwho').val(whoId);

                $(".text-title").text($("#slctwho option:selected").text() + " " + $(".hidden-intro").text() + " İlanlar\u0131");
                getListFiltre();
                GetLocation(-1, -1, 1);
            }
            else {
                if(pathPart.includes('-')) {

                    locationPart = pathPart;
                    var locationArr = [];
                    locationArr = locationPart.split('-');

                    if(locationArr.length <= 2) {
                        provinceName = locationArr[0];
                        districtName = locationArr[1];

                        GetLocation(-1, -1, 1, function (e) {
                            if (e == "true") {
                                GetLocation($('#slctprovi').val(), -1, 2, function (e) {
                                    if (e == "true") {
                                       GetLocation(-1, $("#slctdist").val(), 3, function (e) {
                                            if (e == "true") {
                                                inGeneralArr[2] = $('#slctprovi').val();
                                                inGeneralArr[3] = $('#slctdist').val();
                                                getListFiltre();

                                                titleParams = $("#slctdist option:selected").text();                               
                                                $(".text-title").text($("#slctdist option:selected").text() + " " + $(".hidden-intro").text() + " İlanlar\u0131");
                                               
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                    else {
                        provinceName = locationArr[0];
                        districtName = locationArr[1];
                        neighName = locationArr[2];

                        GetLocation(-1, -1, 1, function (e) {
                            if (e == "true") {
                                GetLocation($('#slctprovi').val(), -1, 2, function (e) {
                                    if (e == "true") {
                                       GetLocation(-1, $("#slctdist").val(), 3, function (e) {
                                            if (e == "true") {

                                                inGeneralArr[2] = $('#slctprovi').val();
                                                inGeneralArr[3] = $('#slctdist').val();
                                                inGeneralArr[4] = $('#slctneig').val();
                                                getListFiltre();

                                                titleParams = $("#slctneig option:selected").text();          
                                                $(".text-title").text($("#slctneig option:selected").text() + " " + $(".hidden-intro").text() + " İlanlar\u0131");                              
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                }
                else {
                    if(pathPart) {
                        provinceName = pathPart;

                        GetLocation(-1, -1, 1, function (e) {
                            if (e == "true") {
                                GetLocation($('#slctprovi').val(), -1, 2, function (e) {
                                    if (e == "true") {

                                        inGeneralArr[2] = $('#slctprovi').val();
                                        getListFiltre();

                                        titleParams = $("#slctprovi option:selected").text();                       
                                        $(".text-title").text($("#slctprovi option:selected").text() + " " + $(".hidden-intro").text() + " İlanlar\u0131");
                                                      
                                    }
                                });
                            }
                        });
                    }
                }
            }       
        }

        var pathPartWho = pathUrl.split('/')[4];
        if(pathPartWho) {
            whoId = whoList.find(x => x.type == pathPartWho).typeId;
            inGeneralArr[5] = whoId;
            $('#slctwho').val(whoId);

            if (titleParams)
            {
                $(".text-title").text(titleParams + " " + $("#slctwho option:selected").text() + " " + $(".hidden-intro").text() + " ilanlar\u0131");
            }
            else
            {
                $(".text-title").text($("#slctwho option:selected").text() + " " + $(".hidden-intro").text() + " ilanlar\u0131");
            }
        }

        if(pathUrl.split('/').length == 3) {
            getListFiltre();
            GetLocation(-1, -1, 1);

            $(".text-title").text($(".hidden-intro").text() + " İlanlar\u0131");
        }
    }

}

function GetLocation(proid, distid, opt, callback) {
    jQuery.ajax({
        type: "POST",
        url: "/endpoint/locationservice.asmx/GetLocation",
        dataType: "json",
        data: "{ RegionId:'" + proid + "'" + ", CityId:'" + distid + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var d = JSON.parse(data.d);
            if (opt == 1) {
                $("#slctprovi").empty();
                $("#slctprovi").append("<option value='-1' selected='selected'>Se\u00e7iniz</option>");
                for (var i = 0; i < d.length; i++) {              
                    var appnd = "<option value='" + d[i].IlId + "'>" + d[i].IlAdi + "</option>";
                    $("#slctprovi").append(appnd);
                    if (provinceName) {
                        if (trConverter(d[i].ilAdi) == provinceName) {
                            $('#slctprovi').val(d[i].IlId);
                        } 
                    }
                }
            }
            if (opt == 2) {
                $("#slctdist").empty();
                $("#slctdist").append("<option value='-1' selected='selected'>Se\u00e7iniz</option>");
                for (var i = 0; i < d.length; i++) {
                    var appnd = "<option value='" + d[i].IlceId + "'>" + d[i].IlceAdi + "</option>";
                    $("#slctdist").append(appnd);

                    if (districtName) {
                        if (trConverter(d[i].IlceAdi) == districtName) {
                            $('#slctdist').val(d[i].IlceId);
                        } 
                    }

                }
            }
            if (opt == 3) {
                $("#slctneig").empty();
                $("#slctneig").append("<option value='-1' selected='selected'>Se\u00e7iniz</option>");
                for (var i = 0; i < d.length; i++) {
                    var appnd = "<option value='" + d[i].MahalleId + "'>" + d[i].MahalleAdi + "</option>";
                    $("#slctneig").append(appnd);

                    if (neighName) {
                        if (trConverter(d[i].MahalleAdi) == neighName) {
                            $('#slctneig').val(d[i].MahalleId);
                        } 
                    }

                }
            }

            if (callback != null) {
                callback("true");
            }
        },
        error: function (e) {
            console.log(e);
        }
    });
}

function tabRefresher(whoId) {
    pageIndex = 0;
    $("#slctwho").val(whoId);
    clickFilterButton();
}

function listRefresher() {
    pageIndex = 0;
    clickFilterButton();
}

function sortRefresher(increase, decrease) {
    if (sorter == increase) {
        sorter = decrease;
    }
    else {
        sorter = increase;
    }

    listRefresher();
}

function tabControlTrigger(indata) {
    $("#clallads").removeClass("active");
    $("#clemlakofisi").removeClass("active");
    $("#clbankadan").removeClass("active");
    $("#clizale").removeClass("active");
    $("#clbelediye").removeClass("active");
    $("#clicradan").removeClass("active");
    $("#clhazineden1").removeClass("active");
    $("#clhazineden2").removeClass("active");
    $("#clozelidare").removeClass("active");
    $("#clkamukurum").removeClass("active");
    $("#clsahibinden").removeClass("active");
    $("#clinsaatfir").removeClass("active");


    if (indata == 0) $("#clsahibinden").attr('class', 'active');
    else if (indata == 6) $("#clkamukurum").attr('class', 'active');
    else if (indata == 9) $("#clozelidare").attr('class', 'active');
    else if (indata == 10) $("#clhazineden2").attr('class', 'active');
    else if (indata == 4) $("#clhazineden1").attr('class', 'active');
    else if (indata == 2) $("#clicradan").attr('class', 'active');
    else if (indata == 1) $("#clbelediye").attr('class', 'active');
    else if (indata == 3) $("#clizale").attr('class', 'active');
    else if (indata == 5) $("#clbankadan").attr('class', 'active');
    else if (indata == 8) $("#clinsaatfir").attr('class', 'active');
    else if (indata == 7) $("#clemlakofisi").attr('class', 'active');
    else if (indata == -1) $("#clallads").attr('class', 'active');
}

$(window).on('scroll', function () {
    if ($(window).scrollTop() + $(window).height() > $("#category-list").height() - 1) {
        if (pageIsRefresh == true) {
            pageIndex++;
            getListFiltre();
        }
    }
});


$("#cl_price").on("click", function () {
    sortRefresher(2, 3);
})

$("#cl_date").on("click", function () {
    sortRefresher(4, 5);
})

$("#cl_provindist").on("click", function () {
    sortRefresher(6, 7);
})

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

function clickFilterButton() {

    pageIndex = 0;

    var urlLocationParams = null;
    var urlWhoParams = null;

    var proId = $('#slctprovi').val();
    var distId = $('#slctdist').val();
    var neigId = $('#slctneig').val();
    var whoId = $('#slctwho').val();
    
    if(proId) {
        if (proId != -1) {
            urlLocationParams = trConverter($("#slctprovi option:selected").text())     
        }
    }

    if(distId) {
        if (distId != -1) {
            urlLocationParams += "-" + trConverter($("#slctdist option:selected").text())    
        }
    }

    if(neigId) {
        if (neigId != -1) {
            urlLocationParams += "-" + trConverter($("#slctneig option:selected").text())
        }
    }

    if (whoId != -1) {
        urlWhoParams = trConverter($("#slctwho option:selected").text());
    }

    var pathParams = window.location.pathname;
    var params = [];
    params = pathParams.split('/');
    var categoryParams = params[2];
    if(params.length == 3) {
        var typeControl = typeList.find(x => x.type == params[3]);
        if (typeControl) {
            urlWhoParams = trConverter($("#slctwho option:selected").text());
            urlLocationParams = null;
        }
        if (params.length == 4) {
            urlWhoParams = trConverter($("#slctwho option:selected").text());
            if (!urlLocationParams) {
                urlLocationParams = params[3];
            }
        }
    }

    var priceParams = "";
    var selectParams = "";
    var textParams = "";

    var priceMin = $("#inminprice").val();
    var priceMax = $("#inmaxprice").val();
    
    if(priceMin) {
        priceParams += "price_min="+priceMin+"&";
    }

    if(priceMax) {
        priceParams += "price_max="+priceMax+"&";
    }

    /*var $radios = $('input:radio[name=daterange]');
    var dateParams = "";
    var dateVal = $radios.val();
    if(dateVal) {
        if(dateVal != -1)
        dateParams = "date_range="+$radios.val()+"&";
    }*/

    var droplist = $(".slct-values");
    for (var i = 0; i < droplist.length; i++) {
        var item = droplist[i];
        var selectVal = $(item).val();
        if(selectVal) {
            if(selectVal != -1) {
                selectParams += "k"+$(item).data("wid")+"="+$(item).val()+"&";
            }
        }
    }
    
    var textlist = $(".txt-values");
    for (var i = 0; i < textlist.length; i++) {
        var item = textlist[i];
        var textVal = $(item).val();
        if(textVal) {
            textParams += "k"+$(item).data("wid").split("_")[0]+"_"+$(item).data("wid").split("_")[1]+"="+$(item).val()+"&";
        }
    }

    var sorterParams = "";
    if(sorter != 5 ) {
        sorterParams = "sort="+ sorter +"&";
    } 

    var fullFilterParams = priceParams + sorterParams + selectParams + textParams;
    var newFilterUrl = window.location.origin + "/liste/";
    if(categoryParams) {
        newFilterUrl += categoryParams;
    }
    if(urlLocationParams) {
        newFilterUrl += "/" + urlLocationParams;
    }

    if(urlWhoParams) {
        newFilterUrl += "/" + urlWhoParams; 
    }

    if(fullFilterParams) {
        var newFilterUrl = newFilterUrl+"?"+fullFilterParams;
    }

    window.location.href = newFilterUrl;

}

function getListFiltre() {

    var defUrl = window.location.href;
    if (defUrl.indexOf('?') != -1) {
        var priceMin = getParameterByName("price_min");
        var priceMax = getParameterByName("price_max");
        var sortParam = getParameterByName("sort");

       
        if(priceMin) {
            $("#inminprice").val(priceMin)
        }
    
        if(priceMax) {
            $("#inmaxprice").val(priceMax)
        }

        //dateRange = getParameterByName("date_range");
    
        var droplist = $(".slct-values");
        for (var i = 0; i < droplist.length; i++) {
            var item = droplist[i];
            var parameter = getParameterByName("k"+$(item).data("wid"));
    
            if(parameter) {
                $(item).val(parameter);
            }
        }
        
        var textlist = $(".txt-values");
        for (var i = 0; i < textlist.length; i++) {
            var item = textlist[i];
            var parameter = getParameterByName("k"+$(item).data("wid").split("_")[0]+"_"+$(item).data("wid").split("_")[1]);

            if(parameter) {
                $(item).val(parameter);
            }
        }

        /*if(dateRange) {
            if(dateRange != -1) {
                var $radios = $('input:radio[name=daterange]');
                if($radios.is(':checked') === false) {
                    $radios.filter('[value='+dateRange+']').prop('checked', true);
                    inGeneralArr[6] = dateRange
                }  
            }
        }*/
    }
    

    fiyatMax = $("#inmaxprice").val();
    fiyatMin = $("#inminprice").val();

    var droplist = $(".slct-values");
    var listdrop = [];
    var drpCount = 0;
    for (var i = 0; i < droplist.length; i++) {
        var item = droplist[i];
        var _value = $(item).val();
        if (_value) {
            if (_value != -1) {
                var _id = $(item).data("wid");
                var drpitem = new ItemDataDrop();
                drpitem.id = _id;
                drpitem.value = _value;
                listdrop[drpCount] = drpitem;
                drpCount++;
            }
        }
    }

    var textlist = $(".txt-values");
    var listtext = [];
    for (var i = 0; i < textlist.length; i++) {
        var item = textlist[i];
        var _value = item.value;
        var _id = $(item).data("wid").split("_")[0];
        var tur = $(item).data("wid").split("_")[1];
        var txtitem = new ItemDataText();
        var bl = -1;
        for (var y = 0; y < listtext.length ; y++) {
            var slcdata = listtext[y];
            if (slcdata.id == _id) {
                if (tur == 1) {
                    slcdata.Min = _value;
                }
                if (tur == 2) {
                    slcdata.Max = _value;
                }
                bl = 0;
            }
        }

        if (bl == -1) {
            txtitem.id = _id;
            if (tur == 1) {
                txtitem.Min = _value;
            }

            if (tur == 2) {
                txtitem.Max = _value;

            }

            listtext[listtext.length] = txtitem;
        }
    }

    var itemfiyat = new ItemDataFiyat();
    itemfiyat.Max = fiyatMax;
    itemfiyat.Min = fiyatMin;

    var dataintext = new DataTypeIntext();
    dataintext.ListDrop = listdrop;
    dataintext.ListText = listtext;
    dataintext.FiyatData = itemfiyat;

    if(sortParam) {
        sorter = sortParam; 
    }

    inGeneralArr[7] = sorter;

    if (pageIndex == 0) {
        $("#tablebdy").empty();
        var whoTab = $('#slctwho').val(); 
        if(!whoTab) {
            whoTab = -1;
        }     
        tabControlTrigger(whoTab);
        getFilterCountAjax(inGeneralArr, dataintext, pageIndex, 10, 1, 3);
        getListFilterWithAjax(inGeneralArr, dataintext, pageIndex, 10, 1, 3, true, false);

        $('html, body').animate({ scrollTop: 0 }, 'fast');

    }
    else {
        getListFilterWithAjax(inGeneralArr, dataintext, pageIndex, 10, 1, 3, false, false);
    }
}

function trConverter(text) {

    text = text.replace(/\u00c7/g, 'c'); // �
    text = text.replace(/\u00e7/g, 'c'); // �
    text = text.replace(/\u011e/g, 'g'); // �
    text = text.replace(/\u011f/g, 'g'); // �
    text = text.replace(/\u0130/g, 'i'); // �
    text = text.replace(/\u0131/g, 'i'); // �
    text = text.replace(/\u015e/g, 's'); // �
    text = text.replace(/\u015f/g, 's'); // �
    text = text.replace(/\u00d6/g, 'o'); // �
    text = text.replace(/\u00f6/g, 'o'); // �
    text = text.replace(/\u00dc/g, 'u'); // �
    text = text.replace(/\u00fc/g, 'u'); // �
    text = text.replace(/\s/gi, "-");
    text = text.replace(/[-]+/gi, "-");

    return text.toLowerCase();
}

function DataTypeIntext() {
    this.ListDrop;
    this.ListText;
    this.FiyatData;
    this.isCoordinates = false;
}

function ItemDataDrop() {
    this.id;
    this.value;
}

function ItemDataText() {
    this.id;
    this.Max;
    this.Min;
}

function ItemDataFiyat() {
    this.Max;
    this.Min;
}

function ilanDataType() {
    this.ilanId,
    this.baslik,
    this.aciklama,
    this.ilId,
    this.ilAdi,
    this.ilceId,
    this.ilceAdi,
    this.mahalleId,
    this.mahalleAdi,
    this.magazaId,
    this.kullaniciId,
    this.onay,
    this.resim,
    this.girilenOzellik,
    this.secilenOzellik
    this.turAdi,
    this.turId,
    this.baslangicTarihi,
    this.satildi,
    this.kategoriAdi,
    this.kategoriId,
    this.koordinat
    this.satisTarihi1
    this.satisTarihi2
}

function getListFilterWithAjax(income, intext, index, count, opt, type, clear, istop) {
    pageIsRefresh = false;
    
    if (clear == false) {
        if (sonistek == index) return;
    }

    var _incomestr = JSON.stringify(income);
    var _intextstr = JSON.stringify(intext);

    sonistek = index;
    jQuery.ajax({
        type: "POST",
        url: "/endpoint/ilanservice.asmx/GetFaceted",
        dataType: "json",
        data: "{ Index:'" + index + "', GeneralFilter:'" + _incomestr + "'" + ", OtherFilter:'" + _intextstr + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            console.log(data);

            edata = data.d;

            var dataArr = JSON.parse(edata);
            result = "";
             for(var i = 0; i < dataArr.length; i++) {
                var text, parser, xmlDoc;

                text = dataArr[i].Resimler;
                parser = new DOMParser();
                xmlDoc = parser.parseFromString(text, "text/xml");
                var resim = "noImage.jpg";
                var str = "";
                if (xmlDoc.getElementsByTagName("resimDataType")[0]) {
                    resim = xmlDoc.getElementsByTagName("resim")[0].childNodes[0];
                }

                result += '<a target="_blank" href="/ilan/' + dataArr[i].Url + '-' +
                dataArr[i].IlanId + '/detay"><div class="list-r-b-div clearfix">\
                  <div class="list-r-b-d list-r-b-d-1">\
                      <img src="/upload/ilan/thmb_' + resim.data + '" alt=' + dataArr[i].Baslik + ' width="90" height="60">\
                  </div>\
                  <div class="list-r-b-d list-r-b-d-2">\
                      <h5 class="add-title"><strong>' + dataArr[i].Baslik + '</strong></h5>\
                  </div>\
                  <div class="list-r-b-d list-r-b-d-3">\
                      <h5 class="item-price">' + dataArr[i].FiyatTipi + ' ' +
                      dataArr[i].Fiyat + '</h5>\
                  </div>\
                  <div class="list-r-b-d list-r-b-d-4">\
                      <span class="date"><i class="icon-clock"></i>' + 
                      dataArr[i].BaslangicTarihi + '</span>\
                  </div>\
                  <div class="list-r-b-d list-r-b-d-5">\
                      <span class="item-location"><i class="fa fa-map-marker"></i>' + dataArr[i].IlAdi + '<br />/' + dataArr[i].IlceAdi + '</span>\
                  </div></div></a>';
            }


            if (istop == true) {
                $("#tablebdy").prepend(result);
            } else {
                $("#tablebdy").append(result);
            }

            pageIsRefresh = true;
        },
        error: function (e) {
            console.log(e);
            var s;
            s = e;
            pageIsRefresh = true;
        }
    });

    if (clear == true) {
        $("#tablebdy").empty();
    }
}

function getFilterCountAjax(_income, _intext, index, count, opt, type) {

    var _incomestr = JSON.stringify(_income);
    var _intextstr = JSON.stringify(_intext);

    sonistek = index;
    jQuery.ajax({
        type: "POST",
        url: "/services/ki_operation.asmx/getFilterCount",
        dataType: "json",
        data: "{ incomestr:'" + _incomestr + "'" + ", intextstr:'" + _intextstr + "'" + ", index:'" + index + "' , count:'" + count + "' , opt:'" + opt + "' , type:'" + type + "'}",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var counts = JSON.parse(data.d);
            $("#emlakcidan").text(counts[7]);
            $("#sahibinden").text(counts[11]);
            $("#insaat_firmasindan").text(counts[8]);
            $("#bankadan").text(counts[5]);
            $("#izaleyi_suyu").text(counts[3]);
            $("#belediyeden").text(counts[1]);
            $("#icradan").text(counts[2]);
            $("#milli_hazineden").text(counts[4]);
            $("#milli_hazineden1").text(counts[10]);
            $("#ozellestirme_dairesinden").text(counts[9]);
            $("#kamu_kurumlarindan").text(counts[6]);
            $("#tum_ilanlar").text(counts[0]);

        },
        error: function (e) {
            console.log(e);
        }
    });
}

$("#filter").click(function () {
    $("#filtre-btn").animate({ "left": "-251px" }, 250, "linear");

    $(".mobile-filter-sidebar").animate({ "left": "-251px" }, 250, "linear", function () {
        $(this).removeClass("open");
    });
    $('.menu-overly-mask').removeClass('is-visible');
    clickFilterButton();
});

$("#slctprovi").change(function () {
    $("#slctdist").empty();
    GetLocation($(this).val(), -1, 2);
    $("slctdist").val(0);

    $("#slctneig").empty();
    GetLocation(-1, $(this).val(), 3);
    $("slctneig").val(0);
});

$("#slctdist").change(function () {
    $("#slctneig").empty();
    GetLocation(-1, $(this).val(), 3);
    $("slctneig").val(0);
});

$(document).ajaxStart(function () {
    $("#wait").css("display", "block");
});

$(document).ajaxComplete(function () {
    $("#wait").css("display", "none");
});

$("#clsahibinden").on("click", function () {
    tabRefresher(0);
});

$("#clallads").on("click", function () {
    tabRefresher(-1);
});

$("#clemlakofisi").on("click", function () {
    tabRefresher(7);
});

$("#clinsaatfir").on("click", function () {
    tabRefresher(8);
});

$("#clbankadan").on("click", function () {
    tabRefresher(5);
});

$("#clizale").on("click", function () {
    tabRefresher(3);
});

$("#clbelediye").on("click", function () {
    tabRefresher(1);
});

$("#clicradan").on("click", function () {
    tabRefresher(2);
});

$("#clhazineden1").on("click", function () {
    tabRefresher(4);
});

$("#clhazineden2").on("click", function () {
    tabRefresher(10);
});

$("#clozelidare").on("click", function () {
    tabRefresher(9);
});

$("#clkamukurum").on("click", function () {
    tabRefresher(6);

});

