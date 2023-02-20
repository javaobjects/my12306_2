<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册信息</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script>
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
	}else {
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
</script>
<script>
//实例化ajax引擎对象，定义全局变量
var xhr;
function getCity()
{
	//1.获取省份id
	var pid=document.getElementById("province").value;
	
	//2.实例化ajax引擎对象，定义全局变量
	xhr = null;
		if (window.XMLHttpRequest) {// code for all new browsers
			xhr = new XMLHttpRequest();
		} else if (window.ActiveXObject) {// code for IE5 and IE6
			xhr= new ActiveXObject("Microsoft.XMLHTTP");
		}else {
			//alert("Your browser does not support XMLHTTP.");
		}
	//3.调用open方法创建连接
	xhr.open("get","GetCityServlet?pid="+pid,true);
	//4.指定回调函数
	xhr.onreadystatechange=displayCity;
	//5.发送请求
	xhr.send();
	}
	
	//获取服务端响应的信息，把数据取出来放入城市下拉框
	function displayCity()
	{
		 if(xhr.readyState==4)
			{
				if(xhr.status==200)
				{
					//alert("ok");
					//获取响应的xml文档
				  var doc=xhr.responseXML;
					var city_all=doc.getElementsByTagName("city");//这是一个存放所有city的数组
					
					var city_object=document.getElementById("city");//拿到城市下拉框
					city_object.options.length=0;//将城市下拉框清零
					//alert("ok");
					for(var i=0;i<city_all.length;i++)
					{
							var city=city_all[i];//拿到数组中的city对象
							var id=city.childNodes[0].firstChild.nodeValue;
							var name=city.childNodes[1].firstChild.nodeValue;
							//alert(id+"---"+name);
							//给城市下拉框添加选项，其实就是拿到选项然后给选项赋值
							city_object.options[city_object.options.length]=new Option(name,id);
					}  
				}	
			} 
		
	}
	

</script>
</head>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="<%=request.getContextPath()%>/UserServlet" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" background="images/ny_top_img_bg.gif"><img src="images/ny_top_img.gif" width="650" height="108"></td>
    </tr>
  <tr>
    <td width="75" height="23" bgcolor="#deedf8">&nbsp;</td>
    <td width="958" align="left" bgcolor="#deedf8" class="text_cray1">当前位置:注册信息　</td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/bg_point_write.gif"><table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" align="center">&nbsp;</td>
        </tr>
      <tr>
        <td width="41" height="7" align="center">&nbsp;</td>
        <td width="794" height="30" align="left" valign="top"><span class="text_blod_title">注册信息</span></td>
      </tr>
      <tr>
        <td height="15" colspan="2" align="center"><img src="images/line1.jpg" width="835" height="6"></td>
      </tr>
      <tr>
        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5%">&nbsp;</td>
            <td width="95%" align="left" class="text_cray">注：标有 <span class="text_red">*</span> 处，均为必填项</td>
          </tr>
          <tr>
            <td height="15" colspan="2">&nbsp;</td>
            </tr>
          
        </table>
          <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" colspan="4" align="left" class="text_red1"><span class="text_title">登录信息</span></td>
                </tr>
          
          <tr>
            <td width="19" align="center" class="text_red">*</td>
                  <td width="98" height="40" align="left" class="text_cray1">登录名：</td>
                  <td width="160" align="left" class="text_cray1">
                  <input name="username" type="text" class="text_cray" id="username"/>  <!-- onblur="checkUsername()" -->
                  <span id="mess"></span>
                  <%=request.getAttribute("message") == null ? "" : request.getAttribute("message")%>
                  </td>
                  <td width="423" height="35" align="left" class="text_cray">由字母、数字或“_”组成，长度不少于6位，不多于30位</td>
                </tr>
          <tr>
            <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">密码：</td>
                  <td align="left" class="text_cray1"><input name="password" type="text" class="text_cray" id="textfield3" /></td>
                  <td height="35" align="left" class="text_cray">不少于6位字符</td>
                </tr>
          <tr>
            <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">确认密码：</td>
                  <td align="left" class="text_cray1"><input name="confirm_password" type="password" class="text_cray" id="textfield4" /></td>
                  <td height="35" align="left" class="text_cray">请再次输入密码</td>
                </tr>
        </table>
          <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="35" colspan="5" align="left" class="text_red1"><span class="text_title">详细信息</span></td>
                </tr>
            
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">真实姓名：</td>
                  <td height="35" colspan="3" align="left">
                  <input name="real_name" type="text" class="text_cray" id="textfield2" />
                  </td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">性 别：</td>
                  <td height="35" colspan="3" align="left" class="text_cray1">
                    <span class="mr25">
                    <input type="radio" name="sex" value="1" checked="checked" />
                    </span>
                    <span class="text_cray">
                    <label>男</label>
                    <input type="radio" name="sex" value="2" />
                    <label>女</label>
                    </span>
                    <label></label>
                    <span><label></label>
                  </span>				</td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">省份：</td>
                  <td width="104" height="35" align="left"><label>
                    <select name="province" class="text_cray" id="province" onchange="getCity()">
                      <option selected="selected">--请选择省份--</option>
                      <c:forEach items="${provinces}" var="p">
                      	<option value="${p.provinceNum}">${p.provinceName}</option>
                      </c:forEach>
                    </select>
                  </label></td>
                  <td width="43" height="35" align="left"  class="text_cray">城市：</td>
                  <td width="436" height="35" align="left" class="text_cray"><label>
                    <select name="city" class="text_cray" id="city">
                      <option value="城市" selected="selected">市县</option>
                    </select>
                  </label></td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">证件类型：</td>
                  <td height="35" colspan="3" align="left">
                    <select class="text_cray" name="cert_type" id="cardType">
                      <option value="1"><span>二代身份证</span>				</option>
                      <option value="2"><span>港澳通行证</span>				</option>
                      <option value="3"><span>台湾通行证</span>				</option>
                      <option value="4"><span>护照</span>				</option>
                  </select>				</td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">证件号码：</td>
                  <td height="35" colspan="3" align="left">
                  <input name="cert" type="text" class="text_cray" id="textfield6" />
                  </td>
                </tr>
            <tr>
              <td width="19" align="center" class="text_red1"><span class="text_red">*</span></td>
                  <td width="98" height="40" align="left" class="text_cray1">出生日期：</td>
                  <td height="35" colspan="3" align="left">
                  <input name="birthday" type="date" class="text_cray" id="textfield7" /></td>
                </tr>
            
            <tr>
              <td width="19" align="center">&nbsp;</td>
                  <td width="98" height="40" align="left" class="text_cray1">旅客类型：</td>
                  <td height="35" colspan="3" align="left">
                    <select class="text_cray" id="passengerType" name="usertype">
                      <option value="1">成人</option>
                      <option value="2">儿童</option>
                      <option value="3">学生</option>
                      <option value="4">残疾军人、伤残人民警察</option>
                  </select>				</td>
                </tr>
            <tr>
              <td height="10" colspan="5" align="center">	</td>
	            </tr>
            
            
            
            
            
            
            <tr>
              <td width="19" align="center">&nbsp;</td>
                  <td width="98" height="30" align="left" class="text_cray1">备注：</td>
                  <td colspan="3" align="left" height="80">
                  <textarea name="content" rows="8" class="text_cray" style="width:100%"></textarea>				</td>
                </tr>
            <tr>
              <td align="center">&nbsp;</td>
                  <td height="30" align="left" class="text_cray1"></td>
                  <td height="50" colspan="3" align="left" valign="middle" class="text_cray1">
                  <input type="checkbox" class="check" id="checkAgree" name="agree"/> 
                  我已阅读并同意遵守				
                  <a href="https://www.taobao.com" class="ft14" target="_blank" shape="rect"> 《中国铁路客户服务中心网站服务条款》</a></td>
                </tr>
          </table> <br>        
          <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="234">&nbsp;</td>
                  <td width="147" height="30" align="center"><input name="button3" type="submit" class="buttj" id="button3" value=""></td>
                  <td width="141" align="center">&nbsp;</td>
                  <td width="147" align="center"><input name="button4" type="submit" class="butcz" id="button4" value=""></td>
                  <td width="166" align="center">&nbsp;</td>
                </tr>
              </table></td>
      </tr>
      </table></td>
  </tr>
</table><br>

<table width="100%" border="0" cellspacing="0">
<tr>
    <td height="2" background="images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>
</form>
<script src="js/jquery-3.4.1.js"></script>
<script>
$(function(){
 /* 	$("#username").blur(function(){
		var username = $("#username").val();
		console.info(username);
		$.ajax({
		       url:"UserServlet?operator=checkUsername&username="+ username,
		       method:"POST",
		       data:{},
		       dataType:"text",
		       beforeSend:function (XMLHttpRequest) {},
		       success:function (data,textStatus,XMLHttpRequest) {
		    	   console.log(data);
		    	   $("#mess").text(data);
		       },
		       error:function (XMLHttpRequest,textStatus,errorThorwn) {
		              console.error(XMLHttpRequest);
		              console.error(textStatus);
		              console.error(errorThorwn)
		       },
		       complete:function (XMLHttpRequest,textStatus) {}
		       })
	});  */
})
</script>
<!-- <script type="text/JavaScript" src="js/common.js"></script> -->
</body>
</html>
