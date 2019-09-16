package net.tencent.my12306.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateAdminServlet
 */
@WebServlet(description = "新增管理员用户", urlPatterns = { "/UpdateAdminServlet" })
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.处理乱码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//2. 获取数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");//密码
		String confirm_password = request.getParameter("confirm_password");//确认密码
		String rule = request.getParameter("rule");
		String realname = request.getParameter("realName");
		String sex = request.getParameter("sex");//性别
		String cityId = request.getParameter("city");//cityid
		String certtype = request.getParameter("certtype");//证件类型
		String cert = request.getParameter("cert");//证件号码
		String birthday = request.getParameter("birthday");//出生日期
		String usertype = request.getParameter("user_type");//旅客类型
		String content = request.getParameter("content");//备注
		
		//3. 数据的非空校验和合法性校验
		StringBuffer sb = UserServlet.validateRegisterForm(username, password, confirm_password,"on");
		
		if(sb.length() > 0) {
			//校验不通过
			request.setAttribute("message", "必填信息为空，请重新注册");
			request.getRequestDispatcher("/userinfo_add.jsp").forward(request, response);
		}else {
			//4. 校验通过,调用底层service的注册方法添加用户到数据库
			
		}
		
		
		
		//3.把数据封装到User对象中
//		Date birth = null;
//		try{
//			birth = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
//		}catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//		CertType cert_type = new CertType(Integer.parseInt(certtype), null);
//		UserType user_type = new UserType(Integer.parseInt(usertype), null);
//		
//		
//		Users user = new Users(null, username, null, null,
//				realname, sex.charAt(0), new City(Integer.parseInt(cityId)), 
//				cert_type, cert, birth, user_type, content, null, null, null);
//		
//		//4.调用底层UserService中的更新方法更新用户信息
//		UserService userService = UserService.getInstance();
//		boolean result = userService.updateUser(user);
//		
//		
//		if(result)
//		{
//			//重定向到ToUpdateUserServlet即可:再次获取更新后的用户信息然后去往更新页面展示，让用户看到更新后的效果
//			//同步更新session中的用户信息
//			HttpSession session = request.getSession();
//			Users session_user = (Users)session.getAttribute("user");
//			
//			session.setAttribute("user", userService.login(session_user.getUsername(), 
//					session_user.getPassword()));
//
//			response.sendRedirect("ToUpdateUserServlet");
//		}else
//		{
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter pw=response.getWriter();
//			pw.println("<script>alert('更新失败');</script>");
//		}
	}

       
}
