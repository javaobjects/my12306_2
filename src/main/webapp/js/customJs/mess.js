
// 3. 原user_register.jsp页面 放在script标签内的第一段js代码


//定义XMLHttpRequest对象
var xmlHttpRequest;

function checkUsername() {

    //alert();
    //把ajax引擎对象XMLHttpRequest实例化
    xmlHttpRequest = null;
    if (window.XMLHttpRequest) {// code for all new browsers
        xmlHttpRequest = new XMLHttpRequest();
    } else if (window.ActiveXObject) {// code for IE5 and IE6
        xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        //alert("Your browser does not support XMLHTTP.");
    }
    //alert(xmlHttpRequest==null);

    //创建ajax引擎对象之后需要做什么？

    //2.需要获取用户名
    var username = document.getElementById("username").value;
    //alert(username);
    //1.需要创建一个请求url
    //alert("发送之前："+xmlHttpRequest.readyState);
    xmlHttpRequest
        .open("get", "UserServlet?operator=checkUsername&username="
            + username, true);

    //3.需要指定回调函数

    xmlHttpRequest.onreadystatechange = getResult;//刚开始readyState是0
    //4.发送请求

    xmlHttpRequest.send();
}

//获取校验结果的回调函数
function getResult() {
    //alert("发送之后："+xmlHttpRequest.readyState);//1,2,3,4
    console.info(xmlHttpRequest.readyState);
    console.info(xmlHttpRequest.status);
    console.info(xmlHttpRequest.responseText);
    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
        //alert("ok");
        //alert(xmlHttpRequest.responseText);
        document.getElementById("mess").innerText = xmlHttpRequest.responseText;
    }

}





