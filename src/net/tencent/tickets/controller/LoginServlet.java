package net.tencent.tickets.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tencent.tickets.entity.Users;
import net.tencent.tickets.service.UserService;
import net.tencent.tickets.util.Md5Utils;

/**
 * Servlet implementation class LoginServlet
 * 
 * insert into tickets_2_user values(tickets_2_user_seq.nextval,'bbb',
'e10adc3949ba59abbe56e057f20f883e','1',
'bbb','2',200,'1','123456789',sysdate,'1','bbb','1','0:0:0:0:0:0:0:1','7.png');
 * 
 * 
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID  =  1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//解决乱码问题
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				//1.获取登录页面的数据
				String username = request.getParameter("username").trim();
				String password = request.getParameter("password").trim();
				String code = request.getParameter("code");
				String auto = request.getParameter("auto_login");// 获取用户是否自动登录的复选框的值

				//2.服务端非空校验
				StringBuffer sb = new StringBuffer();
				if(username == null||"".equals(username.trim()))
						{
					      sb.append("用户名为空");
						}
				if(password == null||"".equals(password.trim()))
						{
					sb.append("密码为空");
						}
				
				if(code == null||"".equals(code.trim()))
				{
					sb.append("验证码为空");
				}
				if(sb.length()>0)
				{
					request.setAttribute("login_message", sb.toString());
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}else
				{

					//3.验证码合法性校验
					String session_code = (String) request.getSession().getAttribute("code");
					if(session_code.equalsIgnoreCase(code))
					{
						/* 怎么写登录？
						 * 4.调用底层service的login方法，返回一条用户数据，这是一种用户体验
						 * 
						 * 如果用户信息不为空，则登录成功，跳转到用户模块的主页面
						 * 如果用户信息为空，则登录失败，提示失败信息并返回登录页面
						 */
						UserService service = UserService.getInstance();
						
						Users user = service.login(username, Md5Utils.md5(password));
						
						if(user == null)
						{
							//登录失败
							request.setAttribute("login_message", "用户名或者密码错误");
							request.getRequestDispatcher("/login.jsp").forward(request, response);
						}else
						{
							//登录成功
							//在主页面中显示用户信息,
							//1.把用户信息放入一个地方，这个地方各个页面都可以从这里拿数据，那么这个地方是HttpSession
							HttpSession session = request.getSession();
							session.setAttribute("user", user);
							
							// 统计上线人数 +1 --------application:在应用服务器中保存数据
							ServletContext application = request.getServletContext();
							Object obj = application.getAttribute("onlineCount");
							// 第一次进来
							if(obj == null) {
								application.setAttribute("onlineCount", 1);
							}else {
								//下一次进来
								application.setAttribute("onlineCount", (Integer)obj + 1);
							}
							
							//根据用户是否自动登录，来写cookie
							if("auto".equals(auto))
							{
								//写Cookie的套路：先new一个cookie，然后调用response的addCookie方法就可以写cookie了
								Cookie username_cookie = new Cookie("username", URLEncoder.encode(username, "utf-8"));
								
								
								username_cookie.setMaxAge(7*24*60*60);
								username_cookie.setPath(request.getContextPath()+"/");
								
								Cookie password_cookie = new Cookie("password",Md5Utils.md5(password));
								password_cookie.setMaxAge(7*24*60*60);
								password_cookie.setPath(request.getContextPath()+"/");
								
								Cookie rule_cookie = new Cookie("rule",user.getUserRule());
								rule_cookie.setMaxAge(7*24*60*60);
								rule_cookie.setPath(request.getContextPath()+"/");
								
								response.addCookie(username_cookie);
								response.addCookie(password_cookie);
								response.addCookie(rule_cookie);
								
							}
							
							//成功后跳转到哪？要看用户的rule：如果是管理员，
							//去往管理员主页面；如果是普通用户，去往普通用户主页面
							if("2".equals(user.getUserRule()))
							{
								//普通用户
								request.getRequestDispatcher("/user/index.jsp").forward(request, response);
							}else
							{
								//管理员
								request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
							}
						}
					}else
					{
						//验证码输入错误
						request.setAttribute("login_message", "验证码输入错误");
						request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				}
		
		
	}
	
	

}
