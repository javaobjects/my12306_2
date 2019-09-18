package net.tencent.my12306.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tencent.my12306.entity.Users;
import net.tencent.my12306.service.UserService;
import net.tencent.my12306.util.Md5Utils;

/**
 * 去往修改密码页面的servlet
 */
@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String p_old = request.getParameter("password_old");
		String p_new = request.getParameter("password_new");
		String p_new_confirm = request.getParameter("password_new_confirm");
		
		HttpSession session=request.getSession();
		Users user = (Users) session.getAttribute("user");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		
		//请大家把服务端校验补全，明天早上检查
		if(p_new_confirm.equals(p_new) == true) {
			/*
			 * 更新密码的思路：
			 * 1.查看原密码是否正确
			 * 2.如果正确，那么更新密码
			 */
		
			
			//3.写三行代码ok
			//user.getPassword().equals(Md5Utils.md5(p_old))
			
			if(UserService.getInstance().updatePassword(user.getId(), Md5Utils.md5(p_old), Md5Utils.md5(p_new)))
			{
				pw.println("<script>alert('更新密码成功,请重新登录');window.open('ExitServlet','_parent');</script>");
				
				//response.sendRedirect("ExitServlet");
			}else
			{
				pw.println("<script>alert('更新密码失败');</script>");
			}
		}else {
			request.setAttribute("mes_alert", "确认新密码与新密码不一至,请重新输入");
			request.getRequestDispatcher("/user/user_password_edit.jsp").forward(request, response);
		}
		
	}
   
}
