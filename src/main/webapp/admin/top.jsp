<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="net.tencent.tickets.entity.Users" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通用户</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="topbody" style="background-image: url(../images/bg_point_write.gif)">
<form action="" method="get">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1411" colspan="2" background="../images/ny_top_img_bg.gif">
    	<img src="../images/ny_top_img.gif" width="650" height="108">
    </td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="75" height="25" bgcolor="#deedf8"></td>
    <td width="1122" align="left" valign="top" bgcolor="#deedf8">
        <span class="text_cray1">当前位置: 所有用户管理</span>
    </td>
    <td width="200" valign="top" bgcolor="#deedf8" class="text_cray1">
    欢迎您，${sessionScope.user.userName}，
      当前在线人数:${onlineCount }
    </td>
    <td width="64" align="left" valign="top" bgcolor="#deedf8">
    	<a href="<%=request.getContextPath()%>/ExitServlet" target="_parent" class="cray">退出</a>
   	</td>
  </tr>
</table>
</form>
</body>
</html>
