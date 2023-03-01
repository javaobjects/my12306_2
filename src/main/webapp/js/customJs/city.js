
// 2. 原user_register.jsp页面 放在script标签内的第二段js代码


//实例化ajax引擎对象，定义全局变量
var xhr;

function getCity() {
    //1.获取省份id
    var pid = document.getElementById("province").value;

    //2.实例化ajax引擎对象，定义全局变量
    xhr = null;
    if (window.XMLHttpRequest) {// code for all new browsers
        xhr = new XMLHttpRequest();
    } else if (window.ActiveXObject) {// code for IE5 and IE6
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        //alert("Your browser does not support XMLHTTP.");
    }
    //3.调用open方法创建连接
    xhr.open("get", "GetCityServlet?pid=" + pid, true);
    //4.指定回调函数
    xhr.onreadystatechange = displayCity;
    //5.发送请求
    xhr.send();
}

//获取服务端响应的信息，把数据取出来放入城市下拉框
function displayCity() {
    if (xhr.readyState == 4) {
        if (xhr.status == 200) {
            //alert("ok");
            //获取响应的xml文档
            var doc = xhr.responseXML;
            var city_all = document.getElementsByTagName("city");//这是一个存放所有city的数组

            var city_object = document.getElementById("city");//拿到城市下拉框
            city_object.options.length = 0;//将城市下拉框清零
            //alert("ok");
            for (var i = 0; i < city_all.length; i++) {
                var city = city_all[i];//拿到数组中的city对象
                var id = city.childNodes[0].firstChild.nodeValue;
                var name = city.childNodes[1].firstChild.nodeValue;
                //alert(id+"---"+name);
                //给城市下拉框添加选项，其实就是拿到选项然后给选项赋值
                city_object.options[city_object.options.length] = new Option(name, id);
            }
        }
    }

}