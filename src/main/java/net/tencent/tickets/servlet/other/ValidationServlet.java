package net.tencent.tickets.servlet.other;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 校验Servlet
 */
@WebServlet("/ValidationServlet")
public class ValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet.............");
		
		//1.获取参数
		String username = request.getParameter("username");
		
		//2.调用service方法，判断用户名是否重复
//		IUserService userService = UserServiceImpl.getInstance();
//		boolean result = userService.isUserNameExit(username);
		
		boolean result = false;
		
		
		
		//3.处理结果
		PrintWriter writer = response.getWriter();
		if(result)
		{
			writer.write("true");
		}
		else
		{
			writer.write("false");
		}
		writer.flush();
		writer.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost.............");
		//1.获取参数
		String username = request.getParameter("username");
		
		//2.调用service方法，判断用户名是否重复
//		IUserService userService = UserServiceImpl.getInstance();
//		boolean result = userService.isUserNameExit(username);
		
		boolean result = false;
		
		//3.处理结果
		PrintWriter writer = response.getWriter();
		if(result)
		{
			writer.write("true");
		}
		else
		{
			writer.write("false");
		}
		writer.flush();
		writer.close();
	}

}
