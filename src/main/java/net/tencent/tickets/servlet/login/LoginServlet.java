package net.tencent.tickets.servlet.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.tencent.tickets.entity.Users;
import net.tencent.tickets.service.UserService;
import net.tencent.tickets.util.Md5Utils;

@WebServlet("/login/LoginServlet")
public class LoginServlet extends HttpServlet {

	/**
	 * serialVersionUID
	*/
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		//0 先判断是否有cookie
		String cookieStr = request.getParameter("cookie");
		Boolean haveCookie = cookieStr.equals("true");
		
		
		
		System.out.println("cookie: " + cookieStr);
		System.out.println("cookie equals(true): " + (cookieStr.equals("true")));
		
		
		//1.获取参数
		String username = request.getParameter("userName");
		String password = haveCookie ? request.getParameter("passWord") :
				Md5Utils.md5(request.getParameter("passWord"));
		String userCode = request.getParameter("code");//用户输入的验证码
		String autoLogin = request.getParameter("autoLogin");//是否自动登录
		
		System.out.println(username + "  " + password + " " + userCode + " " + autoLogin);
		
		/**
		 * 服务端校验：
		 * 		① 用户名是否符合规则：必须由英文、数字、字母、_组成，长度在6-30位之间
		 * 		② 密码是否符合规则：长度不能小于6位
		 *      ③ 验证码校验：用户输入验证码与服务器生成的验证码是否匹配  
		 *      ④ 用户名与密码是否匹配  
		 */
		
		//服务端验证码
		String serverCode = (String) session.getAttribute("code");
		
		Map map = new HashMap<>();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		
		// ③ 验证码校验：用户输入验证码与服务器生成的验证码是否匹配
		if(!haveCookie) {//如果有存cookie就不用验证 验证码
			if (userCode == null || !userCode.equalsIgnoreCase(serverCode)) {
				// 保存登陆的错误信息-----------------------------request:在一次请求中保存数据
				map.put("result", false);
				map.put("titleTex", "验证码输入错误");
				
				JSONArray JsonArray = JSONArray.fromObject(map);
				writer.write(JsonArray.toString());
				writer.flush();
				writer.close();
				
				
				// 【请求转发】到【登陆Login.jsp】界面，显示错误信息
				request.getRequestDispatcher("/login.jsp").forward(request, response);

				return;// 保证后续代码不再执行
			}
		}
	
		
		
		// 2.调用service层方法登陆
		UserService userService = UserService.getInstance();
		Users user = userService.login(username, password);

		System.out.println("登陆用户：" + user);

		// 3.校验
		// 用户名密码合法
		if (user != null && user.getId() > 0) {
			
			System.out.println("true.equals(autoLogin):  " + ("true".equals(autoLogin)));
			
			/**
			 * 判断是否需要记住密码
			 */
			if ("auto".equals(autoLogin)) {
				System.out.println("需要记住密码");
				
				
				// 1.创建Cookie
				Cookie cookie_userName = new Cookie("c_username", username);
				Cookie cookie_passWord = new Cookie("c_password", password);

				// 2.设置有效期，默认为临时cookie（即浏览器关闭即失效）
				cookie_userName.setMaxAge(5 * 60); // 秒为单位
				cookie_passWord.setMaxAge(5 * 60);// 秒为单位

				// 3.设置保存路径
				cookie_userName.setPath(request.getContextPath() + "/");
				cookie_passWord.setPath(request.getContextPath() + "/");

				// 4.将cookie添加到响应头
				response.addCookie(cookie_userName);
				response.addCookie(cookie_passWord);
			}

			// 保存用户登陆信息-----------------------------session:在一次会话中保存数据
			session.setAttribute("user", user);

			// 统计上线人数 +1-----------------------------application:在应用服务器中保存数据
			online(request);

			System.out.println("user.getUserRule(): " + ("1".equals(user.getUserRule())));
			
			
			// 【请求重定向】根据角色权限到指定的页面【首页Index.html】，显示用户登陆信息
			// 1、管理员
			if ("1".equals(user.getUserRule())) {
				
				response.sendRedirect(request.getContextPath() + "/admin/index.jsp");

			}
			// 2、普通用户
			else {
				
				response.sendRedirect(request.getContextPath() + "/user/index.jsp");
			}

		}
		// 用户名密码不合法
		else {
			// 保存登陆的错误信息-----------------------------request:在一次请求中保存数据
			map.put("result", false);
			map.put("titleTex", "用户名或密码不匹配");
			
			JSONArray JsonArray = JSONArray.fromObject(map);
			writer.write(JsonArray.toString());
			writer.flush();
			writer.close();

			// 【请求转发】到【登陆Login.jsp】界面，显示错误信息
			request.getRequestDispatcher("/login.jsp").forward(request, response);
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
