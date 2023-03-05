<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.util.List,
         net.tencent.tickets.entity.Province,
         java.util.Iterator,
         net.tencent.tickets.entity.Users,
         net.tencent.tickets.entity.Province,
         net.tencent.tickets.entity.City"%>
<!-- 使用jstl:java standard tag library(单词缩写) 1.需要先导入jstl.jar包 2.页面通过指令引入标签
3.使用标签 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
        用户信息修改
    </title>
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"
          type="text/css">
</head>
<body class="write_bg">
<form name="form1" method="post" action="<%=request.getContextPath()%>/UpdateUserServlet"    id="edit_form">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="30">
                <br>
                <br></td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="20" colspan="2" align="center"></td>
        </tr>
        <tr>
            <td width="64" height="11" class="text_blod_title"></td>
            <td width="786" height="30" align="left" class="text_blod_title">
                修改个人信息
            </td>
        </tr>
        <tr>
            <td height="15" colspan="2">
                <img src="<%=request.getContextPath() %>/images/line1.jpg" width="835"
                     height="6">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="64"></td>
                        <td width="772" height="25" align="left" class="text_cray">
                            注：标有
                            <span class="text_red">
												*
											</span>
                            处，均为必填项
                        </td>
                    </tr>
                    <tr>
                        <td height="20" colspan="2"></td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="15" colspan="4" align="left" class="text_title">
                            详细信息
                        </td>
                    </tr>
                    <tr>
                        <td height="10" colspan="4">
                            <span class="text_red" id="tip_text"></span>
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red1">
                            <input type="hidden" value="${userinfo.id}" name="id"/></td>
                        <td width="100" height="40" align="left" class="text_cray1">
                            登录名：
                        </td>
                        <td width="350" align="left" class="text_cray1">
                            <input name="userName" type="text" disabled="true" class="text_cray" id="inp_userName"
                                   value="${userinfo.userName}" readonly="readonly"/>
                        </td>
                        <td width="230" colspan="-1" rowspan="7" align="center"
                            background="<%=request.getContextPath()%>/images/bg_point_write.gif"
                            class="text_cray1">
                            <img src="<%=request.getContextPath()%>/photos/${userinfo.userImagePath}" width="120" id="user_head_img">
                            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="15"></td>
                                </tr>
                                <tr>
                                    <td height="7" align="center" class="text_cray">
                                        上传照片
                                    </td>
                                </tr>
                                <tr>
                                    <td height="8"></td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <input name="uploadFile" type="file" class="text_cray" size="20" id="txt_uploadFile"/>
                                        <input type="button" value="上传" id="btn_uploadFile"
                                               style="position: relative;top: -21px;left: 70px;" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="20"></td>
                        <td width="100" height="40" align="left" class="text_cray1">
                            真实姓名：
                        </td>
                        <td align="left" class="text_cray1">
                            <input name="realname" type="text" class="text_cray" id="inp_userRealName"
                                   value="${userinfo.userRealName}"
                            />
                        </td>
                    </tr>
                    <tr>
                        <td width="20"></td>
                        <td width="100" height="30" align="left" class="text_cray1">
                            性 别：
                        </td>
                        <td align="left" class="text_cray1">
                            <input type="radio" name="sex" value="1" ${userinfo.userSex==49?
                                    "checked": ""} />
                            <span class="text_cray">
												<label>
													男
												</label>
												<input type="radio" name="sex" value="2" ${userinfo.userSex==50?
                                                        "checked": ""} />
												<label>
													女
												</label>
											</span>
                            <label></label>
                            <span>
												<label></label>
											</span>
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">
                            *
                        </td>
                        <td width="100" height="40" align="left">
                            省份：
                        </td>
                        <td align="left" class="text_cray1">

<%--                            第一种写法--%>

<%--    <select name="provinceid" class="text_cray" id="province">--%>
<%--        <c:forEach items="${provinces}" var="p">--%>
<%--            <option value="${p.provinceNum}"--%>
<%--                ${p.provinceNum.equals(userinfo.city.province.provinceNum)?'selected="selected"':""}>--%>
<%--                    ${p.provinceName}--%>
<%--            </option>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>




<%--                            第二种写法 --%>

                            <% Users user = (Users) request.getAttribute("userinfo"); %>
                            <select name="provinceNum" class="text_cray"  id="province">


                                <%
                                    List<Province> provinces = (List<Province>) request.getAttribute("provinces");
                                    Iterator it = provinces.iterator();
                                    while (it.hasNext()) {
                                        Province p = (Province) it.next();
                                %>



                                <option value="<%=p.getProvinceNum()%>"
                                        <%=p.getProvinceNum().equals(user.getCity().getProvince().getProvinceNum())
                                        ? "selected" : "" %>
                                >
                                    <%=p.getProvinceName() %>
                                </option>
                                <% } %>
                            </select>




                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">
                            *
                        </td>
                        <td width="100" height="40" align="left" class="text_cray1">
                            城市：
                        </td>
                        <td align="left" class="text_cray1">



                            <select name="city" class="text_cray" id="city">
                                <c:forEach items="${cities}" var="c">
                                    <option value="${c.cityNum}" ${c.cityNum.equals(userinfo.city.cityNum)?"selected":""}>${c.cityName}</option>
                                </c:forEach>
                            </select>




                        </td>
                    </tr>
                    <script></script>
                    <tr>
                        <td width="20" align="center" class="text_red">
                            *
                        </td>
                        <td width="100" height="40" align="left" class="text_cray1">
                            证件类型：
                        </td>
                        <td align="left" class="text_cray1">
                            <select class="text_cray" name="certType" id="cardType">
                                <option value="1" ${userinfo.certType.id==1? "selected": ""}>
													<span>
														二代身份证
													</span>
                                </option>
                                <option value="2" ${userinfo.certType.id==2? "selected": ""}>
													<span>
														港澳通行证
													</span>
                                </option>
                                <option value="3" ${userinfo.certType.id==3? "selected": ""}>
													<span>
														台湾通行证
													</span>
                                </option>
                                <option value="4" ${userinfo.certType.id==4? "selected": ""}>
													<span>
														护照
													</span>
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">
                            *
                        </td>
                        <td width="100" height="40" align="left" class="text_cray1">
                            证件号码：
                        </td>
                        <td align="left" class="text_cray1">
                            <input name="cert" type="text" class="text_cray" id="inp_userCert"
                                   value="${userinfo.userCert}"
                            />
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">
                            *
                        </td>
                        <td width="100" height="40" align="left" class="text_cray1">
                            出生日期：
                        </td>
                        <td colspan="2" align="left" class="text_cray1">
                            <input name="birthday" type="text" class="text_cray" id="inp_userBirthday"
                                   value="${userinfo.userBirthday}"
                            />
                        </td>
                    </tr>
                    <tr>
                        <td width="20" height="35"></td>
                        <td width="100" height="40" align="left" class="text_cray1">
                            旅客类型：
                        </td>
                        <td height="35" colspan="2" align="left" class="text_cray1">
                            <select class="text_cray" id="userType" name="userType">
                                <option value="1" ${userinfo.userType.id==1? "selected": ""}>
                                    成人
                                </option>
                                <option value="2" ${userinfo.userType.id==2? "selected": ""}>
                                    儿童
                                </option>
                                <option value="3" ${userinfo.userType.id==3? "selected": ""}>
                                    学生
                                </option>
                                <option value="4" ${userinfo.userType.id==4? "selected": ""}>
                                    残疾军人、伤残人民警察
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td height="10" colspan="4" align="center"></td>
                    </tr>
                    <tr>
                        <td width="20"></td>
                        <td width="100" height="80" align="left" class="text_cray1">
                            备注：
                        </td>
                        <td height="80" colspan="2" align="left" class="text_cray1">
                        <textarea name="userContent" rows="8" class="text_cray" style="width:100%" id="userContent">${userinfo.userContent}</textarea>
                        </td>
                    </tr>
                </table>
                <br>
                <table width="100%" border="0" cellspacing="0">
                    <tr>
                        <td></td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="164"></td>
                        <td width="99" height="30" align="center">
                            <input name="button" type="button" class="buttj" id="btn_submit" value=""></td>
                        <td width="98"></td>
                        <td width="97" align="center">
                            <input name="button2" type="reset" class="butcz" id="btn_rest" value=""></td>
                        <td width="92"></td>
                    </tr>
                </table>
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
            <td height="25" align="center" background="<%=request.getContextPath()%>/images/bottom_ny_bg.gif"
                class="text_cray">
                copyright@12306 购票网
            </td>
        </tr>
    </table>
    </td>
    </tr>
    </table>
</form>
<script src="<%=request.getContextPath()%>/js/customJs/uploadPhoto.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/customJs/getCitysByProvinceNum.js"></script>
<script>
    $(function (){
        //1. 获取保个输入框的值
        let inp_userRealName = $("#inp_userRealName").val();
        let sex = $('input[name="sex"]:checked').val();
        let provinceNum = $("#province").val();
        let cityNum = $("#city").val();
        let cardType = $("#cardType").val();
        let inp_userCert = $("#inp_userCert").val();
        let inp_userBirthday = $("#inp_userBirthday").val();
        let userType = $("#userType").val();
        let userContent = $("#userContent").val();

        // console.log("inp_userRealName: " +inp_userRealName);
        // console.log("sex: " + sex);
        // console.log("provinceNum: " + provinceNum);
        // console.log("cityNum: " + cityNum);
        // console.log("cardType: " + cardType);
        // console.log("inp_userCert: " + inp_userCert);
        // console.log("inp_userBirthday: " + inp_userBirthday);
        // console.log("usertype: " + userType);
        // console.log("userContent: " + userContent);

        $("#btn_submit").click(function (){

            //2. 非空判断, 必填非空不让提交
            if(
                !$.trim(inp_userRealName) ||
                !$.trim(sex)||
                !$.trim(provinceNum)||
                !$.trim(cityNum)||
                !$.trim(cardType)||
                !$.trim(inp_userCert)||
                !$.trim(inp_userBirthday)||
                !$.trim(userType)
            ){
                $("#tip_text").text("必填项不能为空!");
                return;
            }

            //3. 一些字符特殊判断

            //4. 提交
            $("#edit_form").submit()
        })

    })
</script>
</body>
</html>