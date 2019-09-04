package net.tencent.my12306.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tencent.my12306.entity.Users;
import net.tencent.my12306.service.UserService;

/**
 * 
* <p>Title: ToUpdateUserServlet</p>  
* <p>
*	Description: 
* 去往用户修改信息页面的servlet
* 需要获取以下信息
* 1.用户本人信息
* 2.所有省份信息
* 3.获取当前用户所在省份的所有城市信息
* </p> 
* @author xianxian 
* @date 2019年9月4日
 */
@WebServlet("/ToUpdateUserServlet")
public class ToUpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//先拿用户信息
		
		//跳转到编辑页面修改用户信息
		
		//1.借助session，拿username和password，然后访问数据库获取用户的完整信息
				HttpSession session=request.getSession();
				Users user=(Users)session.getAttribute("user");
				
				Users result=UserService.getInstance().login(user.getUsername(), user.getPassword());
				
				System.out.println(result);
				
				
				//2.把用户信息传给页面，并跳转到目标页面
				request.setAttribute("userinfo", result);
				request.getRequestDispatcher("/user/userinfo_edit.jsp").forward(request, response);
	}
	
	

}
