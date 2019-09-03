<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%


Integer number=(Integer)application.getAttribute("count");

if(number==null||number==0)
{
	number=1;
	application.setAttribute("count", number);
}else
{
	number++;
	application.setAttribute("count", number);
}
%>

当前在线人数：<%=number%>
</body>
</html>