package net.tencent.my12306.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.my12306.entity.Users;
import net.tencent.my12306.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getPassword());
		stmt.setString(3, user.getSex() + "");
		stmt.setDate(4, new java.sql.Date(user.getBirthday().getTime()));
		stmt.setString(5, user.getLoginIp());
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		/*
		 stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getSex() + "");
			stmt.setDate(4, new java.sql.Date(user.getBirthday().getTime()));
			stmt.setString(5, user.getLoginIp());
		 */
		
		//1.调用底层service的注册方法添加用户到数据库
		Date birthday=null;
		try {
			birthday=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthday"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		UserService userService=UserService.getInstance();
		
		Users user=new Users(request.getParameter("username"), request.getParameter("password"), 
				request.getParameter("sex").charAt(0), birthday);
		user.setLoginIp(request.getRemoteAddr());
		if(userService.register(user))
		{
			System.out.println("register success");
		}else
		{
			System.out.println("register fail");
		}
	}
	

}
