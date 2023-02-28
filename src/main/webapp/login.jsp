<%@page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="net.tencent.tickets.entity.Users" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>12306购票系统</title>
    <link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
    </style>
    <script language="javascript">
        /**
         * 跳转到注册页面
         */
        function UserRegistration() {
            location.href = "<%=request.getContextPath()%>/ToRegisterViewServlet";
        }

        /**
         * 提交
         */
        function UserLogin() {
            document.querySelector("#loginForm").submit();
        }
    </script>
</head>
<%
    //如果用户前面登录时勾选了自动登录，那么访问登录页面时需要先获取cookie中的内容，如果有，就说明上次写cookie写成功了，
//那么根据cookie的内容自动跳转到对应的首页面
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        String username = null;
        String password = null;
        String rule = null;
        Users user = null;
        for (Cookie c : cookies) {
            if ("username".equals(c.getName())) {
                username = c.getValue();
            }
            if ("password".equals(c.getName())) {
                password = c.getValue();
            }
            if ("rule".equals(c.getName())) {
                rule = c.getValue();
            }
        }
        if (username != null && password != null && rule != null && !"".equals(username)) {
            user = new Users();
            user.setUserName(username);
            user.setUserPassword(password);
            user.setUserRule(rule);

            session.setAttribute("user", user);

            //跳转到对应权限页面
            if ("1".equals(rule)) {
                response.sendRedirect("admin/index.jsp");
            } else if ("2".equals(rule)) {
                response.sendRedirect("user/index.jsp");
            }
        }
    }

%>
<%

    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");


    String message = request.getParameter("message");

    if (message != null) {
        message = URLDecoder.decode(message, "utf-8");
%>
<script>
    window.onload = function () {
        alert('<%=message%>');
    }</script>

<% }%>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="<%=request.getContextPath()%>/LoginServlet" id="loginForm">
    <table width="933" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:120px;">
        <tr>
            <td height="412" valign="top" background="images/bg_img1.jpg">
                <table height="300" border="0" cellspacing="0">
                    <tr>
                        <td width="538">&nbsp;</td>
                        <td height="130" colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="9">&nbsp;</td>
                        <td width="98" height="20" align="right"><img src="images/text_yh.gif" width="60" height="18">
                        </td>
                        <td width="16">&nbsp;</td>
                        <td width="136"><input name="username" type="text" id="text_userName" size="18"/>
                            ${login_message}
                            <span id="alert_title" style="color: brown;"></span>
                        </td>
                        <td width="55">&nbsp;</td>
                        <td width="44">&nbsp;</td>
                        <td width="32">&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20" align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20" align="right"><img src="images/text_password.gif" width="60" height="18"></td>
                        <td>&nbsp;</td>
                        <td><input name="password" type="text" id="text_password" size="18"/></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20" align="right">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20" align="right"><img src="images/text_yzm.gif" width="60" height="18"></td>
                        <td>&nbsp;</td>
                        <td><input name="code" type="text" id="text_code" size="18"/></td>
                        <td>
                            <span class="text_cray1">
        	                <img src="" alt="" height="20" id="yzm"/>
                            </span>
                        </td>
                        <td>
                            <img src="images/text_sx.gif" width="32" height="18" style="cursor:pointer;" id="yzm_cursor">
                        </td>
                        <td align="left">

                        </td>
                    </tr>
                    <tr>
                        <td height="30">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td valign="bottom">
                            <table width="100%" border="0" cellspacing="0">
                                <tr>
                                    <td width="26" align="left"><input name="auto_login" type="checkbox" value="auto"
                                                                       style=" margin:0 auto;"/></td>
                                    <td width="170"><img src="images/text_zddl.gif" width="60" height="18"></td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <table width="200" border="0" cellspacing="0">
                                <tr>
                                    <td width="78"><input name="button" type="button" class="butlogin" id="button"
                                                          value="" onClick="UserLogin()"></td>
                                    <td>&nbsp;</td>
                                    <td width="78"><input name="button2" type="button" class="butzc" id="button2"
                                                          value="" onClick="UserRegistration()"></td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<script src="js/jquery-3.4.1.js"></script>
<script>
    $(function () {

        let loginObj = {
            _refurbish:function (){
                $("#yzm").attr("src","/tickets/login/CreateCodeServlet?date=" + new Date())//验证码图片地址生成
            },
            _ajax:function (url,data,titleText){
                $.ajax({
                    url: url,
                    method: "POST",
                    data: data,
                    dataType: "json",
                    beforeSend: function (XMLHttpRequest) {
                    },
                    success: function (data, textStatus, XMLHttpRequest) {
                        if(!data[0].result){
                            // 验证不通过给出提示
                            $("#alert_title").text(titleText);
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
            }
        }
        loginObj._refurbish();//给验证码设置一个默认地址

        $("#yzm_cursor").click(function (){
            loginObj._refurbish();
        })
        $("#yzm").click(function (){
            loginObj._refurbish();
        })

        //用户名输入框获取焦点时
        $("#text_userName").focus(function (){
            $("#alert_title").text("");
        });

        //用户名输入框失去焦点时
        $("#text_userName").blur(function (){
            let url = "/tickets/login/ValidateUserNameServlet";
            let data = {userName:$("#text_userName").val()};
            let titleText = "用户名不存在";
            loginObj._ajax(url,data,titleText);
        });
        //密码输入框获取焦点时
        $("#text_password").focus(function (){
            $("#alert_title").text("");
        });


        // 密码输入框失去焦点时
        $("#text_password").blur(function (){
            let url = "/tickets/login/ValidateUserNameAndPassWordServlet";
            let data = {
                userName:$("#text_userName").val(),
                passWord:$("#text_password").val()
            };
            let titleText = "用户名或密码错误";
            loginObj._ajax(url,data,titleText);
        });

        //验证码输入框获取焦点时
        $("#text_code").focus(function (){
            $("#alert_title").text("");
        });
        //验证码输入框失去焦点时触发
        $("#text_code").blur(function (){
            let url = "/tickets//login/ValidateUserCodeServlet";
            let data = {code: $("#text_code").val()};
            let titleText = "验证码输入错误";
            loginObj._ajax(url,data,titleText);
        })
    })
</script>
</body>
</html>
