/*jslint  browser: true, white: true, plusplus: true */
/*global $, usastates */

$(function () {
    'use strict';
     var states = {
      
        "1": "Adana",
        "2": "Adıyaman",
        "3": "Afyonkarahisar",
        "4": "Ağrı",
        "5": "Aksaray",
        "6": "Amasya",
        "7": "Ankara",
        "8": "Antalya",
        "9": "Ardahan",
        "10": "Artvin",
        "11": "Aydın",
        "12": "Balıkesir",
        "13": "Bartın",
        "14": "Batman",
        "15": "Bayburt",
        "16": "Bilecik",
        "17": "Bingöl",
        "18": "Bitlis",
        "19": "Bolu",
        "20": "Burdur",
        "21": "Bursa",
        "22": "Çanakkale",
        "23": "Çankırı",
        "24": "Çorum",
        "25": "Denizli",
        "26": "Diyarbakır",
        "27": "Düzce",
        "28": "Edirne",
        "29": "Elazığ",
        "30": "Erzincan",
        "31": "Erzurum",
        "32": "Eskişehir",
        "33": "Gaziantep",
        "34": "Giresun",
        "35": "Gümüşhane",
        "36": "Hakkari",
        "37": "Hatay",
        "38": "Iğdır",
        "39": "Isparta",
        "40": "İstanbul",
        "41": "İzmir",
        "42": "Kahramanmaraş",
        "43": "Karabük",
        "44": "Karaman",
        "45": "Kars",
        "46": "Kastamonu",
        "47": "Kayseri",
        "48": "Kırıkkale",
        "49": "Kırklareeli",
        "50": "Kırşehir",
        "51": "Kilis",
        "52": "Kocaeli",
        "53": "Konya",
        "54": "Kütahya",
        "55": "Malayta",
        "56": "Manisa",
        "57": "Mardin",
        "58": "Mersin",
        "59": "Muğla",
        "60": "Muş",
        "61": "Nevşehir",
        "62": "Niğde",
        "63": "Ordu",
        "64": "Osmaniye",
        "65": "Rize",
        "66": "Sakarya",
        "67": "Samsun",
        "68": "Siirt",
        "69": "Sinop",
        "70": "Sivas",
        "71": "Şanlıurfa",
        "72": "Şırnak",
        "73": "Tekirdağ",
        "74": "Tokat",
        "75": "Trabzon",
        "76": "Tunceli",
        "77": "Uşak",
        "78": "Van",
        "79": "Yalova",
        "80": "Yozgat",
        "81": "Zonguldak"
       
    };

    var statesArray = $.map(states, function (value, key) { return { value: value, data: key }; });

    // Setup jQuery ajax mock:
    $.mockjax({
        url: '*',
        responseTime: 2000,
        response: function (settings) {
            var query = settings.data.query,
                queryLowerCase = query.toLowerCase(),
                re = new RegExp('\\b' + $.Autocomplete.utils.escapeRegExChars(queryLowerCase), 'gi'),
                suggestions = $.grep(statesArray, function (country) {
                     // return country.value.toLowerCase().indexOf(queryLowerCase) === 0;
                    return re.test(country.value);
                }),
                response = {
                    query: query,
                    suggestions: suggestions
                };

            this.responseText = JSON.stringify(response);
        }
    });
	

    // Initialize ajax autocomplete:
    $('#autocomplete-ajax').autocomplete({
        // serviceUrl: '/autosuggest/service/url',
        lookup: statesArray
       
    });


});