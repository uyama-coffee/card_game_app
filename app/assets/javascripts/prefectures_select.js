//GEO Apiを使って都道府県と市区町村を取得し、セレクトボックスを連動させる
var geoapi_url = "http://geoapi.heartrails.com/api/json?jsonp=?";
var selected_prefecture;
var selected_city;

$("body").ready(geoApiInitialize);
function geoApiInitialize() {
    if ($("#geoapi-prefectures").length > 0) {
        geoApiInitializePrefectures();
    }
    geoApiInitializeCities();
    $("#geoapi-prefectures").change(geoApiChangePrefecture);
    $("#geoapi-cities").change(geoApiChangeCity);
}
function geoApiSetPrefectures (json) {
    var prefectures = json.response.prefecture;
    for (var index = 0; index < prefectures.length; index++) {
        var option = $(document.createElement('option'));
        option.text(prefectures[index]);
        option.val(prefectures[index]);
        $('#geoapi-prefectures').append(option);
    }
}

function geoApiChangePrefecture () {
  selected_prefecture = $("#geoapi-prefectures option:selected");
    geoApiInitializeCities();
    $.getJSON(geoapi_url, { "method": "getCities", "prefecture": selected_prefecture.text() }, setCities);
}

function setCities (json) {
    var cities = json.response['location'];
    for (var index = 0; index < cities.length; index++) {
        var option = $(document.createElement('option'));
        option.text(cities[index].city);
        option.val(cities[index].city);
        $('#geoapi-cities').append(option);
    }
}

function geoApiChangeCity () {
  selected_city = $("#geoapi-cities option:selected");
}

function geoApiInitializePrefectures() {
    $.getJSON(geoapi_url, { "method": "getPrefectures" }, geoApiSetPrefectures);
}

function geoApiInitializeCities() {
    $("#geoapi-cities").html('<option value="">すべて</option>');
}