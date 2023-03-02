<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.List,
                                      net.tencent.tickets.entity.Province,
                                      java.util.Iterator,
                                      net.tencent.tickets.entity.Users" %>
<!-- 使用jstl:java standard tag library(单词缩写)
1.需要先导入jstl.jar包 2.页面通过指令引入标签 3.使用标签 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增用户信息</title>
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form action="<%=request.getContextPath()%>/AddUserServlet" method="post" target="_top" id="form_addUser">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td height="30"></td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="20" colspan="2"></td>
        </tr>
        <tr>
            <td width="64" height="30"></td>
            <td width="771" height="30" valign="top" class="text_blod_title">新增用户信息</td>
        </tr>
        <tr>
            <td height="15" colspan="2">
                <img src="<%=request.getContextPath()%>/images/line1.jpg" width="835" height="6">
            </td>
        </tr>
        <tr>
            <td colspan="2">
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
                            <span id="mess" style="color:red;font-weight:bloder;font-size:13px;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="10" colspan="3"></td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">登录名：</td>
                        <td class="text_cray">
                            <input type="text" name="userName" id="inp_userName"/>
                            由字母、数字或“_”组成，长度不少于6位，不多于30位
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">登录密码：</td>
                        <td class="text_cray">
                            <input type="password" name="passWord" id="inp_passWord"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">确认密码：</td>
                        <td class="text_cray">
                            <input type="password" name="confirm_passWord" id="inp_confirm_passWord"/>
                        </td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="20" colspan="3"></td>
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
                            <select name="rule" class="text_cray" id="select_qx">
                                <option value="1">管理员</option>
                                <option value="2">普通用户</option>
                            </select>
                        </label></td>
                    </tr>
                </table>
                <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="20" colspan="6"></td>
                    </tr>
                    <tr>
                        <td height="15" colspan="6" align="left" class="text_title">详细信息</td>
                    </tr>
                    <tr>
                        <td height="10" colspan="6"></td>
                    </tr>
                    <tr>
                        <td width="20" align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">真实姓名：</td>
                        <td width="14"></td>
                        <td colspan="3" align="left">
                            <input name="realName" type="text" class="text_cray" id="inp_realName"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">性 别：</td>
                        <td></td>
                        <td colspan="3" align="left" class="text_cray1">
                            <input name="sex" type="radio" value="1" checked/>
                            <span class="text_cray">
                              <label>男</label>
                              <input name="sex" type="radio" value="2"/>
                                <label>女</label>
                                <label></label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">省 份：</td>
                        <td>&nbsp;</td>
                        <td align="left" class="text_cray">
                            <select name="province" class="text_cray" id="province">
                                <option selected="selected">--请选择省份--</option>
                                <c:forEach items="${provinces}" var="p">
                                    <option value="${p.provinceNum}">${p.provinceName}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td width="48" align="left" class="text_cray">城市：</td>
                        <td width="343" align="left" class="text_cray">
                            <select name="city" class="text_cray" id="city">
                                <option value="城市" selected="selected">市县</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">证件类型：</td>
                        <td>&nbsp;</td>
                        <td colspan="3" align="left">
                            <select class="text_cray" name="certType" id="certType">
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
                            <input type="text" name="cert" id="inp_certNum"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="text_red">*</td>
                        <td width="100" height="40" align="left" class="text_cray1">出生日期：</td>
                        <td></td>
                        <td width="175" align="left" class="text_cray">
                            <input type="date" name="birthday" id="inp_birthday"/>
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
                            </select></td>
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
                            <textarea name="content" style="width:100%" rows="8" id="txtarea_txt"></textarea>
                        </td>
                    </tr>
                </table>
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
                <input name="button" type="button" class="buttj" id="btn_submit" value="">
            </td>
            <td width="98"></td>
            <td width="97" align="center">
                <input name="button2" type="reset" class="butcz" id="button2" value="">
            </td>
            <td width="92"></td>
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
            <td height="25" align="center" background="<%=request.getContextPath()%>/images/bottom_ny_bg.gif"
                class="text_cray">copyright@12306
                购票网
            </td>
        </tr>
    </table>
</form>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script>
    $(function () {
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


        $("#btn_submit").click(function (){

            let inp_userName = $("#inp_userName").val();
            let inp_passWord = $("#inp_passWord").val();
            let inp_confirm_passWord = $("#inp_confirm_passWord").val();
            let select_qx = $("#select_qx").val();
            let inp_realName = $("#inp_realName").val();
            let sexVal = $('input[name="sex"]:checked').val();
            let province = $("#province").val();
            let city = $("#city").val();
            let certType = $("#certType").val();
            let inp_certNum = $("#inp_certNum").val();
            let inp_birthday = $("#inp_birthday").val();
            let passengerType = $("#passengerType").val();//非必填
            let txtarea_txt = $("#txtarea_txt").val();//非必填

            console.log("inp_userName: " + inp_userName);
            console.log("inp_passWord: " + inp_passWord);
            console.log("inp_confirm_passWord: "  + inp_confirm_passWord);
            console.log("select_qx: " + select_qx);
            console.log("inp_realName: " + inp_realName);
            console.log("sexVal: " + sexVal);
            console.log("province: " + province);
            console.log("city: " + city);
            console.log("certType: " + certType);
            console.log("inp_certNum: " + inp_certNum);
            console.log("inp_birthday: " + inp_birthday);
            console.log("passengerType: " + passengerType);
            console.log("txtarea_txt: " + txtarea_txt);
            // 1. 校验必填信息非空判断
            if(
                !$.trim(inp_userName) || !$.trim(inp_passWord) || !$.trim(inp_confirm_passWord) || !$.trim(select_qx) ||
                !$.trim(inp_realName) || !$.trim(sexVal) || !$.trim(province) || !$.trim(city) ||
                !$.trim(certType) || !$.trim(inp_certNum) || !$.trim(inp_birthday)
            )
            {
                $("#mess").text("必填信息不能为空");
                return;
            }
            // 2. 用户名判断 由字母、数字或“_”组成，长度不少于6位，不多于30位

            // 3. 用户名重复判断 需要ajax

            // 4. 密码复杂度判断

            // 5. 两次密码不一致判断

            // 6. 证件号码判断

            // 7. 一切校验都通过则提交

            $("#form_addUser").submit();
        })
    })
</script>
</body>
</html>
