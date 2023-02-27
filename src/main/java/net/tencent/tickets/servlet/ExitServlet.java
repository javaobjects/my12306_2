package net.tencent.tickets.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 退出到登陆界面的Servlet
 */
@WebServlet("/ExitServlet")
public class ExitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.清除cookie
		Cookie[] cookies = request.getCookies();
		if(cookies != null)
		{
			for (Cookie cookie : cookies) {
				//1.清空value值
				cookie.setValue(null);
				
				//2.清空有效时间
				cookie.setMaxAge(0);
				
				//3.设置有效路径
				cookie.setPath(request.getContextPath() + "/");
				
				//4.添加到response响应
				response.addCookie(cookie);
			}
		}
		
		//2.清除session
		request.getSession().invalidate();
		
		//3.跳转到登陆界面【Login.jsp】
		response.sendRedirect(request.getContextPath() + "/Login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
