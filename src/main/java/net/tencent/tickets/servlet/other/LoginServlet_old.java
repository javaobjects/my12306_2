package net.tencent.tickets.servlet.other;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tencent.tickets.entity.Users;
import net.tencent.tickets.util.Md5Utils;

/**
 * 登陆Servlet
 */
@WebServlet("/LoginServlet_old")
public class LoginServlet_old extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 自动登录（获取cookie中的用户名、密码进行登陆）
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("自动登陆......................");
	
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		
		//1.获取参数
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		
		System.out.println(username + "  " + password);
		
		/**
		 * 服务端校验：
		 * 		① 用户名是否符合规则：必须由英文、数字、字母、_组成，长度在6-30位之间
		 * 		② 密码是否符合规则：长度不能小于6位
		 *      ④ 用户名与密码是否匹配                                                                       ---已完成
		 */
		//2.调用service层方法登陆
//		IUserService userService = UserServiceImpl.getInstance();
//		Users user = userService.login(username,password);
		
		Users user = new Users();
		
		System.out.println("自动登陆用户：" + user);
		
		//3.校验
		//用户名密码合法
		if(user != null && user.getId() > 0)
		{
			//保存用户登陆信息-----------------------------session:在一次会话中保存数据
			session.setAttribute("user", user);
			
			//统计上线人数 +1-----------------------------application:在应用服务器中保存数据
			online(request);
			
			//【请求重定向】根据角色权限到指定的页面【首页Index.html】，显示用户登陆信息
			//1、管理员
			if("1".equals(user.getUserRule()))
			{
				response.sendRedirect(request.getContextPath() + "/Admin/Index.html");
				
			}
			//2、普通用户
			else
			{
				response.sendRedirect(request.getContextPath() + "/User/Index.html");
			}
			
		}
		//用户名密码不合法
		else 
		{
			//保存登陆的错误信息-----------------------------request:在一次请求中保存数据
			request.setAttribute("errorMsg", "用户名或密码不匹配");
			
			//【请求转发】到【退出系统的功能】界面，显示错误信息
			request.getRequestDispatcher("/ExitServlet").forward(request, response);
		}
	}
	
	/**
	 * 手动登陆（点击【登陆】按钮登陆）
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("手动登陆......................");
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		
		//1.获取参数
		String username = request.getParameter("username");
		String password = Md5Utils.md5(request.getParameter("password"));
		String userCode = request.getParameter("code");//用户输入的验证码
		String autoLogin = request.getParameter("autoLogin");//是否自动登录
		
		System.out.println(username + "  " + password + " " + userCode + " " + autoLogin);
		
		/**
		 * 服务端校验：
		 * 		① 用户名是否符合规则：必须由英文、数字、字母、_组成，长度在6-30位之间
		 * 		② 密码是否符合规则：长度不能小于6位
		 *      ③ 验证码校验：用户输入验证码与服务器生成的验证码是否匹配   ---已完成
		 *      ④ 用户名与密码是否匹配                                                                       ---已完成
		 */
		//服务端验证码
		String serverCode = (String)session.getAttribute("code");
		//③ 验证码校验：用户输入验证码与服务器生成的验证码是否匹配
		if(userCode == null || !userCode.equalsIgnoreCase(serverCode))
		{
			//保存登陆的错误信息-----------------------------request:在一次请求中保存数据
			request.setAttribute("errorMsg", "验证码输入错误");
			
			//【请求转发】到【登陆Login.jsp】界面，显示错误信息
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
			
			return;//保证后续代码不再执行
		}
		
		
		//2.调用service层方法登陆
//		IUserService userService = UserServiceImpl.getInstance();
//		User user = userService.login(username,password);
		
		Users user = new Users();
		
		System.out.println("登陆用户：" + user);
		
		//3.校验
		//用户名密码合法
		if(user != null && user.getId() > 0)
		{
			/**
			 * 判断是否需要记住密码
			 */
			if("autoLogin".equals(autoLogin))
			{
				//1.创建Cookie
				Cookie cookie = new Cookie("c_username", username);
				Cookie cookie2 = new Cookie("c_password", password);
				
				//2.设置有效期，默认为临时cookie（即浏览器关闭即失效）
				cookie.setMaxAge(7*24*60*60); //秒为单位    一周之内有效
				cookie2.setMaxAge(7*24*60*60);//秒为单位    一周之内有效
				
				//3.设置保存路径
				cookie.setPath(request.getContextPath() + "/");
				cookie2.setPath(request.getContextPath() + "/");
				
				//4.将cookie添加到响应头
				response.addCookie(cookie);
				response.addCookie(cookie2);
			}
			
			//保存用户登陆信息-----------------------------session:在一次会话中保存数据
			session.setAttribute("user", user);
			
			//统计上线人数 +1-----------------------------application:在应用服务器中保存数据
			online(request);
			
			//【请求重定向】根据角色权限到指定的页面【首页Index.html】，显示用户登陆信息
			//1、管理员
			if("1".equals(user.getUserRule()))
			{
				response.sendRedirect(request.getContextPath() + "/Admin/Index.html");
				
			}
			//2、普通用户
			else
			{
				response.sendRedirect(request.getContextPath() + "/User/Index.html");
			}
			
		}
		//用户名密码不合法
		else 
		{
			//保存登陆的错误信息-----------------------------request:在一次请求中保存数据
			request.setAttribute("errorMsg", "用户名或密码不匹配");
			
			//【请求转发】到【登陆Login.jsp】界面，显示错误信息
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}

	/**
	 * 统计上线人数
	 * @param request
	 */
	private void online(HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		Object obj = application.getAttribute("onlineCount");
		//第一次进来
		if(obj == null)
		{
			application.setAttribute("onlineCount", 1);
		}
		//下一次进来
		else
		{
			application.setAttribute("onlineCount", (Integer)obj + 1);
		}
	}
}
