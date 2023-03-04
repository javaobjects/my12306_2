/**
 * 前端条件 引入jquery
 * 参数：
 * @param 涎份下拉框 id province
 * @param 城市下垃框 id city
 * @param
 * @param
 * @param
 */


;$(function (){
    $("#province").change(function () {
        //1. 清空city下拉框的值
        $("#city").empty();
        let provinceNum = $("#province").val();
        $.ajax({
            url: "/tickets/GetCityServlet",
            method: "POST",
            data: {
                provinceNum: provinceNum
            },
            dataType: "json",
            beforeSend: function (XMLHttpRequest) {
            },
            success: function (data, textStatus, XMLHttpRequest) {
                //1. 获取值
                let citys = data;
                //2. 为city下拉框赋值
                for (let i = 0; i < data.length; i++) {
                    let cityValue = data[i].cityNum;
                    let cityName = data[i].cityName;
                    let option = '<option value="' + cityValue + '">' + cityName + '</option>';

                    $("#city").append(option);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThorwn) {
                console.error(XMLHttpRequest);
                console.error(textStatus);
                console.error(errorThorwn)
            },
            complete: function (XMLHttpRequest, textStatus) {
            }
        })
    });
})