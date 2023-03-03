<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户密码修改</title>
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
</head>

<body class="write_bg">
<form name="form1" method="post" action="<%=request.getContextPath()%>/UpdatePasswordServlet" id="updat_password_form">

    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="30"></td>
        </tr>
    </table>
    <table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="20" colspan="2"></td>
        </tr>
        <tr>
            <td width="64" height="12"></td>
            <td width="744" height="30" align="left" class="text_blod_title">密码修改</td>
        </tr>
        <tr>
            <td height="15" colspan="2">
                <img src="<%=request.getContextPath()%>/images/line1.jpg" width="835" height="6">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="700" border="0" align="center" cellspacing="0">
                    <tr>
                        <td width="20"></td>
                        <td width="100" height="40" class="text_cray1">用户名：</td>
                        <td align="left" class="text_cray1">
                            <input name="userName" type="text" disabled="true" class="text_cray"
                                   id="userName" value="${sessionScope.user.userName}" size="30" readonly="reasonly"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" >*</td>
                        <td width="100" height="40" class="text_cray1">原密码：</td>
                        <td align="left" class="text_cray1">
                            <input name="password_old" type="text" class="text_cray" id="password_old" size="30"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" >*</td>
                        <td width="100" height="40" class="text_cray1">新密码：</td>
                        <td align="left" class="text_cray1">
                            <input name="password_new" type="text" class="text_cray" id="password_new" size="30"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="20" align="center" >*</td>
                        <td width="100" height="40" class="text_cray1">确认新密码：</td>
                        <td align="left" class="text_cray1">
                            <input name="password_new_confirm" type="text" class="text_cray" id="password_new_confirm" size="30"/>
                            <span class="text_red">${mes_alert }</span>
                        </td>
                    </tr>
                </table>
                <br></td>
        </tr>
    </table>
    <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="124" height="30"></td>
            <td width="78" align="left">
                <input name="button" type="button" class="buttj" id="btn_submit" value="">
            </td>
            <td width="39" align="center"></td>
            <td align="left">
                <input name="button2" type="reset" class="butqx"  value="">
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td height="275"></td>
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
        $("#btn_submit").click(function (){
            //password_old password_new password_new_confirm
            //0. 获取对应的值
            // let password_old = $("#password_old").val();
            let password_new = $("#password_new").val();
            let password_new_confirm = $("#password_new_confirm").val();

            //1. 前端判断两次密码是否一致若不一致不让提交 也可不判断 后端有写判断

            if(password_new_confirm != password_new){
                // 为提示赋值
                $(".text_red").text("两次密码不一致!");
                return;
            }
            //2. 提交
            $("#updat_password_form").submit();
        })
        //password_old 获取焦点时 清空提示
        $("#password_old").focus(function (){
            $(".text_red").text("");
        })
        $("#password_new").focus(function (){
            $(".text_red").text("");
        })
        $("#password_new_confirm").focus(function (){
            $(".text_red").text("");
        })
    })
</script>

</body>
</html>
