<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,
    net.tencent.tickets.entity.Province,
    java.util.Iterator,
    net.tencent.tickets.entity.Users"%>
         <!-- 使用jstl:java standard tag library(单词缩写)
 1.需要先导入jstl.jar包 2.页面通过指令引入标签  3.使用标签 -->   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户信息</title>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="<%=request.getContextPath()%>/AddUserServlet" method="post" target="_top">
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30"></td>
    </tr>
  </table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="64" height="30"  ></td>
    <td width="771" height="30" valign="top"  class="text_blod_title">新增用户信息</td>
  </tr>
  <tr>
    <td height="15" colspan="2" >
    	<img src="<%=request.getContextPath() %>/images/line1.jpg" width="835" height="6">
    </td>
    </tr>
  <tr>
    <td colspan="2" >
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64"></td>
        <td width="771" height="25" align="left" class="text_cray">注：标有
        	<span class="text_red"> *</span> 处，均为必填项
        </td>
      </tr>
      <tr>
        <td></td>
        <td height="15"></td>
      </tr>
    </table>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="3" align="left" class="text_title">登录信息</td>
            
          </tr>
          <tr>
          	<td height="15" colspan="3" align="left">
          		<span id="mess" 
          		style="color:red;font-weight:bloder;font-size:13px;">
          		${message}</span>
          	</td>
          </tr>
          <tr>
            <td height="10" colspan="3"></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
            <td class="text_cray">
              <input type="text" name="username" id="textfield2" />
            由字母、数字或“_”组成，长度不少于6位，不多于30位
          </td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">登录密码：</td>
            <td class="text_cray">
              <input type="password" name="password"/>
          	</td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">确认密码：</td>
            <td class="text_cray">
              <input type="password" name="confirm_password"/>
          	</td>
          </tr>
        </table>
      <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="3" ></td>
          </tr>
          <tr>
            <td height="15" colspan="3" align="left" class="text_title">权限设置</td>
          </tr>
          <tr>
            <td height="10" colspan="3" align="left" class="text_red1"></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">用户权限：</td>
            <td><label>
              <select name="rule" class="text_cray">
                <option value="1">管理员</option>
                <option value="2">普通用户</option>
              </select>
            </label></td>
          </tr>
        </table>
      <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="6" ></td>
          </tr>
          <tr>
            <td height="15" colspan="6" align="left" class="text_title">详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="6" ></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
            <td width="14"></td>
            <td colspan="3" align="left">
              <input name="realName" type="text" class="text_cray" />
            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">性 别：</td>
            <td></td>
            <td colspan="3" align="left" class="text_cray1">
              <input name="sex" type="radio" value="1" checked />
              <span class="text_cray">
              <label>男</label>
              <input name="sex" type="radio"  value="2" />
                <label>女</label>
                <label></label>
              </span> </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省 份：</td>
            <td>&nbsp;</td>
            <td align="left" class="text_cray">
              <!-- <select name="province" class="text_cray" id="province">
                <option value="省份" selected="selected">省份</option>
              </select>  -->
              
              
        <%--       <%  Users user=(Users)request.getAttribute("userinfo");
     	
              %>       
           <select name="provinceid" class="text_cray">
             <%
             List<Province> provinces =(List<Province>)request.getAttribute("provinces");
             Iterator it=provinces.iterator();
             while(it.hasNext())
             {
               Province p=(Province)it.next();
               %>
               <option value="<%=p.getProvinceId()%>" 
               <%=p.getProvinceId().equals(user.getCity().getProvince().getProvinceId())?"selected":"" %>>
               <%=p.getProvinceName() %></option>
               <% 
             }
             %>
           
           </select>  --%>
           
           
            <select name="province" class="text_cray" id="province" onchange="getCity()">
              	<option selected="selected">--请选择省份--</option>
              		<c:forEach items="${provinces}" var="p">
           				<option value="${p.provinceId}">${p.provinceName}</option>
              		</c:forEach>
            </select>
             
            </td>
            <td width="48" align="left" class="text_cray">城市：</td>
            <td width="343" align="left" class="text_cray">
                <select name="city" class="text_cray" id="city">
                    <option value="城市" selected="selected">市县</option>
                </select>            
                
                
     <%--            <select name="city" class="text_cray">
                    <c:forEach items="${cities}" var="c">
                    <option value="${c.id}" ${c.id.equals(userinfo.city.id)?"selected":""}>${c.cityName}</option>
                    </c:forEach>
                </select> --%>
                
                
            </td>
          </tr>
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
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
            <td>&nbsp;</td>
            <td colspan="3" align="left">
              <select class="text_cray" name="certtype" id="cardType">
                <option value="1">二代身份证</option>
                <option value="2">港澳通行证</option>
                <option value="3">台湾通行证</option>
                <option value="4">护照</option>
              </select>            
          </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">证件号码：</td>
            <td></td>
            <td colspan="3" align="left" class="text_cray">
              <input type="text" name="cert" id="textfield6" />
            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
            <td></td>
            <td width="175" align="left" class="text_cray">
              <input type="date" name="birthday" id="textfield7" />
            </td>
            <td colspan="2" align="left"></td>
          </tr>
          <tr>
            <td align="center"></td>
            <td width="100" height="40" align="left" class="text_cray1">旅客类型：</td>
            <td></td>
            <td width="175" align="left" class="text_cray">
              <select class="text_cray" id="passengerType" name="user_type">
              <option value="1" selected="selected">成人</option>
                <option value="2">儿童</option>
                <option value="3">学生</option>
                <option value="4">残疾军人、伤残人民警察</option>
            </select>            </td>
            <td colspan="2" align="left"></td>
          </tr>
          <tr>
            <td height="10" colspan="6"></td>
          </tr>
          <tr>
            <td align="center"></td>
            <td height="15" align="left" class="text_cray1">备注：</td>
            <td></td>
            <td height="15" colspan="3" align="left">
              <textarea name="content" style="width:100%" rows="8"></textarea>
            </td>
          </tr>
        </table>
</table><br>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="164"></td>
    <td width="99" height="30" align="center">
    	<input name="button" type="submit" class="buttj" id="button"value="">
    </td>
    <td width="98" ></td>
    <td width="97" align="center">
    	<input name="button2" type="reset" class="butcz" id="button2"value="">
    </td>
    <td width="92" ></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
<tr>
    <td height="2" background="<%=request.getContextPath()%>/images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" background="<%=request.getContextPath()%>/images/bottom_ny_bg.gif" class="text_cray">copyright@12306 购票网</td>
  </tr>
</table>
</form>
</body>
</html>
