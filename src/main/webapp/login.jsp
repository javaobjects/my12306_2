<%@page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="net.tencent.tickets.entity.Users" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html、、>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>12306购票系统</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="/tickets/login/LoginServlet" id="loginForm">
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
                        <td width="136"><input name="userName" type="text" id="text_userName" size="18"/>
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
                        <td><input name="passWord" type="text" id="text_password" size="18"/></td>
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
                                    <td width="26" align="left"><input name="autoLogin" type="checkbox" value="auto"
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
                        <td colspan="2">&nbsp;
                            <input type="text" name="cookie" id="btn_cookie" style="display: none">
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <table width="200" border="0" cellspacing="0">
                                <tr>
                                    <td width="78">
                                        <input name="button" type="button" class="butlogin" id="bun_login" value="" >
                                    </td>
                                    <td>&nbsp;</td>
                                    <td width="78">
                                        <input name="button2" type="button" class="butzc" id="btn_Regist" value="">
                                    </td>
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
        //进入页面先看浏览器地址有没有给提示
        let tip_message = location.href.split("?")[1].split("=");
        if(tip_message[0] == "message"){
            // tip_message[1] 乱码暂时无法解决
            $("#alert_title").text("注册成功！")
        }else {
            $("#alert_title").text("")
        }
        // 先从cookie中取数据看看用户是否有保存cookie c_username=xx; c_password=e10adc3949ba59abbe56e057f20f883e'
        let cookieStr = document.cookie;
        if(document.cookie){
            //用户有保存cookie
            let cookieArray = document.cookie.split(";");

            $("#text_userName").val(cookieArray[0].split("=")[1]);
            $("#text_password").val(cookieArray[1].split("=")[1]);
            $("#btn_cookie").val("true");
            $("#loginForm").submit();
        }else {
            //清空 cookie标识
            $("#btn_cookie").val("");
        }

        let loginObj = {
            _refurbish:function (){
                $("#yzm").attr("src","/tickets/login/CreateCodeServlet?date=" + new Date())//验证码图片地址生成
            },
            _ajax:function (url,data,titleText){
                $.ajax({
                    url: url,
                    method: "POST",
                    data: data,
                    async: true,//异步
                    dataType: "json",
                    beforeSend: function (XMLHttpRequest) {
                    },
                    success: function (data, textStatus, XMLHttpRequest) {
                        if(!data[0].result){
                            // 验证不通过给出提示
                            if(!data[0].titleTex){
                                $("#alert_title").text(titleText);
                            }else {
                                $("#alert_title").text(data[0].titleTex);
                            }
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
            let url = "/tickets/login/ValidateUserCodeServlet";
            let data = {code: $("#text_code").val()};
            let titleText = "验证码输入错误";
            loginObj._ajax(url,data,titleText);
        })

        // 点击登录按钮时
        $("#bun_login").click(function (){
            $("#loginForm").submit();
        })
        // 点击注册按钮
        $("#btn_Regist").click(function (){
            location.href = "/tickets/ToRegisterViewServlet";
        })
    })
</script>
</body>
</html>
