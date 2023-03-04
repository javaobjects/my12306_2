<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>所有用户管理</title>
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
</head>
<body class="write_bg">
<form name="form1" method="post" id="form1"
      action="<%=request.getContextPath()%>/AdminManageUserServlet?operator=queryUser">

    <table width="1107" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="30"></td>
        </tr>
    </table>
    <table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="20" colspan="2"></td>
        </tr>
        <tr>
            <td width="13" height="30" align="left" valign="top"></td>
            <td width="822" align="left" valign="top" class="text_blod_title">用户管理</td>
        </tr>
        <tr>
            <td height="15" colspan="2" align="center">
                <img src="<%=request.getContextPath()%>/images/line.jpg" width="850" height="6">
            </td>
        </tr>
        <tr>
            <td height="15" colspan="2"></td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="835">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="5"></td>
                        <td width="4%" height="25" align="left" class="text_cray1">姓名</td>
                        <td width="11%" align="left" class="text_cray1"><label>
                            <input name="userName" type="text" class="text_cray" style="width:80px" value="${username}">
                        </label></td>
                        <td width="6%" align="center" class="text_cray1">性别</td>
                        <td width="6%" align="left" class="text_cray1"><label>
                            <select name="sex" class="text_cray">
                                <option value="1" ${sex.equals("1")?"selected":"" }>男</option>
                                <option value="2" ${sex.equals("2")?"selected":"" }>女</option>
                            </select>
                        </label></td>
                        <td width="9%" align="center" class="text_cray1">证件类型</td>
                        <td width="13%" align="left" class="text_cray1"><label>
                            <select class="text_cray" name="cert_type" id="cardType">
                                <option value="1" ${cert_type.equals("1")?"selected":"" }>二代身份证</option>
                                <option value="2" ${cert_type.equals("2")?"selected":"" }>港澳通行证</option>
                                <option value="3" ${cert_type.equals("3")?"selected":"" }>台湾通行证</option>
                                <option value="4" ${cert_type.equals("4")?"selected":"" }>护照</option>
                            </select>
                        </label></td>
                        <td width="8%" align="center" class="text_cray1">证件号码</td>
                        <td width="13%" align="left" class="text_cray1"><label>
                            <input name="cert" type="text" class="text_cray" style="width:100px" value="${cert}">
                        </label></td>
                        <td width="8%" align="center" class="text_cray1">旅客类型</td>
                        <td width="13%" align="left" class="text_blod"><label>
                            <select class="text_cray" id="passengerType" name="user_type" style="width:100px">
                                <option value="1" ${user_type.equals("1")?"selected":"" }>成人</option>
                                <option value="2" ${user_type.equals("2")?"selected":"" }>儿童</option>
                                <option value="3" ${user_type.equals("3")?"selected":"" }>学生</option>
                                <option value="4" ${user_type.equals("4")?"selected":"" }>残疾军人、伤残人民警察</option>
                            </select>
                        </label></td>
                        <td width="8%" align="center" valign="middle" class="text_craybold"><label>
                            <input name="Submit" type="submit" class="butcx" value="" id="btn_query">
                        </label></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td height="20" colspan="11" align="center">&nbsp;</td>
                    </tr>
                </table>
                <table width="553" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada"
                       bgcolor="#FFFFFF">
                    <tr align="center">
                        <td width="44" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"
                            class="text_cray1">选择
                        </td>
                        <td width="98" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"
                            class="text_cray1">姓名
                        </td>
                        <td width="80" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"
                            class="text_cray1">性别
                        </td>
                        <td width="132" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"
                            class="text_cray1">证件类型
                        </td>
                        <td width="247" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"
                            class="text_cray1">证件号码
                        </td>
                        <td width="82" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"
                            class="text_cray1">旅客类型
                        </td>
                        <td width="89" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"
                            class="text_cray1">操作
                        </td>
                    </tr>
                    <tr align="center">
                        <td height="15" colspan="7" bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="text_cray1">
                            <img src="<%=request.getContextPath() %>/images/line1.jpg" width="790" height="6">
                        </td>
                    </tr>
                    <c:forEach items="${userList}" var="u" varStatus="status">

                        <tr align="center">
                            <td bordercolor="#FFFFFF" class="text_cray1"><input type="checkbox" name="checkbox"
                                                                                value="${u.id}"></td>
                            <td width="98" bordercolor="#FFFFFF" class="text_cray1">${u.userName}</td>
                            <td width="80" bordercolor="#FFFFFF" class="text_cray1">${u.userSex==49?"男":"女"}</td>
                            <td width="132" bordercolor="#FFFFFF" class="text_cray1">${u.certType.content}</td>
                            <td width="247" bordercolor="#FFFFFF" class="text_cray1">${u.userCert}</td>
                            <td width="82" bordercolor="#FFFFFF" class="text_cray1">${u.userType.content}</td>
                            <td width="89" bordercolor="#FFFFFF" class="text_cray1">
                                <span class="text_red" style="cursor:pointer;">编辑</span>
                            </td>
                        </tr>

                    </c:forEach>
                    <!--
                    <tr align="center" bgcolor="#F5F5F5">
                      <td bordercolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="2"></td>
                      <td width="98" bordercolor="#FFFFFF"  class="text_cray1">用户2</td>
                      <td width="80" bordercolor="#FFFFFF"  class="text_cray1">男</td>
                      <td width="132" bordercolor="#FFFFFF"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF"  class="text_cray1">23621519701208101x</td>
                      <td width="82" bordercolor="#FFFFFF"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center" bgcolor="#FFFFFF">
                      <td bordercolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="3"></td>
                      <td width="98" bordercolor="#FFFFFF"  class="text_cray1">用户3</td>
                      <td width="80" bordercolor="#FFFFFF"  class="text_cray1">男</td>
                      <td width="132" bordercolor="#FFFFFF"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF"  class="text_cray1">221251197112081021</td>
                      <td width="82" bordercolor="#FFFFFF"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center">
                      <td bordercolor="#FFFFFF" bgcolor="#F5F5F5"   class="text_cray1"><input type="checkbox" name="checkbox" value="4"></td>
                      <td width="98" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">用户4</td>
                      <td width="80" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">女</td>
                      <td width="132" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">210211197012081019</td>
                      <td width="82" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center">
                      <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="5"></td>
                      <td width="98" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">用户5</td>
                      <td width="80" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">女</td>
                      <td width="132" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">210211197012081019</td>
                      <td width="82" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center">
                      <td bordercolor="#FFFFFF" bgcolor="#F5F5F5"   class="text_cray1"><input type="checkbox" name="checkbox" value="6"></td>
                      <td width="98" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">用户6</td>
                      <td width="80" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">男</td>
                      <td width="132" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">210211197012081019</td>
                      <td width="82" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center">
                      <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="7"></td>
                      <td width="98" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">用户7</td>
                      <td width="80" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">女</td>
                      <td width="132" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">210211197012081019</td>
                      <td width="82" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center">
                      <td bordercolor="#FFFFFF" bgcolor="#F5F5F5"   class="text_cray1"><input type="checkbox" name="checkbox" value="8"></td>
                      <td width="98" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">用户8</td>
                      <td width="80" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">女</td>
                      <td width="132" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">210211197012081019</td>
                      <td width="82" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center">
                      <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"><input type="checkbox" name="checkbox" value="9"></td>
                      <td width="98" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">用户9</td>
                      <td width="80" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">男</td>
                      <td width="132" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">210211197012081019</td>
                      <td width="82" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr>
                    <tr align="center">
                      <td bordercolor="#FFFFFF" bgcolor="#F5F5F5"   class="text_cray1"><input type="checkbox" name="checkbox" value="10"></td>
                      <td width="98" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">用户10</td>
                      <td width="80" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">女</td>
                      <td width="132" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">二代身份证</td>
                      <td width="247" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">210211197012081019</td>
                      <td width="82" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1">成人</td>
                      <td width="89" bordercolor="#FFFFFF" bgcolor="#F5F5F5"  class="text_cray1"><a href="UserManageInfo_Amind_Edit.html" class="text_red">编辑</a></td>
                    </tr> -->
                </table>
                <br>
                <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr align="center">
                        <td width="102" align="left" class="text_cray1">
                            <a href="#">
                                <label></label>
                                <label></label>
                                <label>
                                    <input type="checkbox" name="selectAllorSelectNone" value="11" id="inp_selectAllorSelectNone">
                                    <span class="text_blue">全选</span>
                                </label>
                            </a>
                        </td>
                        <td width="525" align="right" class="text_cray1"><a href="#">
                            <!--<input type="button" name="Submit23" value="新增" onClick="UserAdd()"> -->
                        </a></td>
                        <td width="55" align="right" class="text_cray1"><a href="#">
                            <input name="Submit22" type="button" class="butsc" value="">
                        </a></td>
                        <td width="91" align="right" class="text_cray1"><label>
                            <input name="exportExcel" type="button" class="butdc" value=""  id="btn_exportExcel">
                        </label></td>
                    </tr>
                </table>
                <br>
                <table width="773" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr align="center" style="width:60%">
                        <td width="335" align="center" class="text_cray">&nbsp;</td>
                        <td width="284" align="center" class="text_cray">>>


                            <% Integer pagesum = (Integer) request.getAttribute("pagesum");
                                Integer pageNumber = (Integer) request.getAttribute("pageNumber");
                                if (pagesum != null && pagesum != 0) {
                                    for (int i = 1; i <= pagesum; i++) {
                                        if (i == pageNumber) {
                            %>
                            <a href="#" style="text-decoration: underline"><%=i%>&nbsp;&nbsp;</a>
                            <%} else { %>
                            <a href="#" onclick="queryUserByPage(<%=i%>)" style="text-decoration:none;"><%=i%>&nbsp;&nbsp;</a>
                            <%
                                        }
                                    }
                                }
                            %>

                            <script>
                                function queryUserByPage(i) {
                                    // alert(1);
                                    var form = document.getElementById("form1");
                                    form.action = "AdminManageUserServlet?operator=queryUserByPage&pageNumber=" + i;
                                    form.submit();
                                    form.action = "AdminManageUserServlet?operator=queryUser";//请还原，否则点击查询按钮会分页查询
                                }


                            </script>
                            &lt;&lt;
                        </td>
                        <td width="154" align="right" class="text_cray1" style="width:20%"><label class="text_cray">
                            每页显示
                            <select name="pageCount">
                                <option value="10" ${pageCount.equals("10")?"selected":""}>10</option>
                                <option value="20" ${pageCount.equals("20")?"selected":""}>20</option>
                                <option value="30" ${pageCount.equals("30")?"selected":""}>30</option>
                            </select>
                            条信息</label></td>
                    </tr>
                </table>
                <br></td>
        </tr>
        <tr>
            <td height="20"></td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td height="2" background="<%=request.getContextPath()%>/images/bottom_point.gif"></td>
        </tr>
        <tr>
            <td height="25" align="center" background="<%=request.getContextPath()%>/images/bottom_ny_bg.gif"
                class="text_cray">copyright@12306 购票网
            </td>
        </tr>
    </table>
</form>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script>
    $(function (){
        let objMethod = {
            selectAllNullorReserve:function (order){
                let checkboxArray = $('input[type="checkbox"]');
                switch (order){
                    case "全选":
                        for (let i = 0; i < checkboxArray.length; i++) {
                            if(!checkboxArray.eq(i).attr("checked")){
                                checkboxArray.eq(i).attr("checked",true);
                            }
                        }
                        break;
                    case "全不选":
                        for (let i = 0; i < checkboxArray.length; i++) {
                            if(checkboxArray.eq(i).attr("checked")){
                                checkboxArray.eq(i).attr("checked",false);
                            }
                        }
                        break;
                    case "反选":
                        for (let i = 0; i < checkboxArray.length; i++) {
                            if(checkboxArray.eq(i).attr("checked")){
                                checkboxArray.eq(i).attr("checked",false);
                            }else {
                                checkboxArray.eq(i).attr("checked",true);
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
        }
        //点击导出EXCEL
        $("#btn_exportExcel").click(function (){
            window.location.href = "AdminManageUserServlet?operator=exportExcel";
        })
        //全选 反选
        $("#inp_selectAllorSelectNone").click(function (){
            objMethod.selectAllNullorReserve("反选");
        })
    })
</script>
</body>
</html>