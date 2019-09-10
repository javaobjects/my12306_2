package net.tencent.my12306.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.my12306.entity.CertType;
import net.tencent.my12306.entity.City;
import net.tencent.my12306.entity.Province;
import net.tencent.my12306.entity.UserType;
import net.tencent.my12306.entity.Users;
import net.tencent.my12306.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * stmt.setString(1, user.getUsername()); stmt.setString(2, user.getPassword());
	 * stmt.setString(3, user.getSex() + ""); stmt.setDate(4, new
	 * java.sql.Date(user.getBirthday().getTime())); stmt.setString(5,
	 * user.getLoginIp());
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 1.获取数据
		String username = request.getParameter("username");//用户名
		String password = request.getParameter("password");//密码
		String confirm_password = request.getParameter("confirm_password");//确认密码
		String real_name = request.getParameter("real_name");//真实姓名
		String sex = request.getParameter("sex");//性别
		String province = request.getParameter("province");//省份
		String city = request.getParameter("province");//城市 
		String cert_type = request.getParameter("cert_type");//证件类型
		String cert = request.getParameter("cert");//证件号码
		String birthday_date = request.getParameter("birthday");//出生日期
		String usertype = request.getParameter("usertype");//旅客类型
		String content = request.getParameter("content");//备注
		String agree = request.getParameter("agree");//是否同意 on/null 被选中/非选


//		String operator = request.getParameter("operator");
//
//		if ("checkUsername".equals(operator)) {
//			checkUsername(request, response);
//		}

		// 2.数据的非空校验和合法性校验
		StringBuffer sb = validateRegisterForm(username, password, confirm_password,agree);

		if (sb.length() > 0) {
			// 如果校验不通过，那么返回注册页面，让用户再注册一次
			request.setAttribute("message", "必填信息为空，请重新注册");
			request.getRequestDispatcher("/user_register.jsp").forward(request, response);
		} else {
			// 3.调用底层service的注册方法添加用户到数据库
			Date birthday = null;
			try {
				birthday = new SimpleDateFormat("yyyy-MM-dd").parse(birthday_date);
			} catch (Exception e) {
				e.printStackTrace();
			}

			UserService userService = UserService.getInstance();
			

			/*
			 * 转换方法 需要牢记！！！
			 * 
			 * City c = new City(); c.setCityId(city); user.setCity(c);//获取城市 String 转 引用类型
			 * 
			 * user.setCerttype(new CertType(Integer.parseInt(cert_type), null));//证件类型
			 * String 转 引用类型
			 */			
			
			Users user = new Users(null,username,password,"2",real_name,sex.charAt(0),
					new City(null,city,null,new Province(null,province,null)),
					new CertType(Integer.parseInt(cert_type),null),
					cert,
					birthday,
					new UserType(Integer.parseInt(usertype),null),content,'1',request.getRemoteAddr(),"");
			
			
			// 服务端校验通过之后，注册方法调用之前，应该先判断用户名是否经存在
			/**
			 * 则需要定义判断用户名是否已经存在的方法，如果存在则返回注册页面， 提示用户名已经存在，如果不存在则继续注册
			 */

			if (userService.isExistsUserName(username)) {
				// 用户名已存在，回到注册页面
				request.setAttribute("message", "用户名已被占用");
				request.getRequestDispatcher("/user_register.jsp").forward(request, response);
			} else {
				if (userService.register(user)) {
//					System.out.println("register success");
					// 注册成功，去到登录页面
//					request.getRequestDispatcher("/login.jsp").forward(request, response);

					// 弹窗效果:技术实现，对响应进行设置，响应就是response
//						response.setContentType("text/html;charset=utf-8");
//						//获取输出流，输出一段script代码
//						PrintWriter pw=response.getWriter();
//						pw.println("<script>alert('"+"注册成功"+"');location.href='login.jsp';</script>");
					// 生产环境不用挨骂的代码：需求,既要有弹窗又要重定向登录页面

					response.sendRedirect(request.getContextPath() + "/login.jsp?message=注册成功");

//					response.sendRedirect(request.getContextPath()+ "/login.jsp");//request.getContextPath() === /my12306_user_register
				} else {
//					System.out.println("register fail");
					// 注册失败，回到注册页面
					request.setAttribute("message", "注册失败");
					request.getRequestDispatcher("/user_register.jsp").forward(request, response);
				}
			}
		}
		
		
		
	}

	/**
	 * 
	 * <p>
	 * Title: validateRegisterForm
	 * </p>
	 * <p>
	 * Description: 对表单进行服务端校验的方法
	 * </p>
	 * 
	 * @param username
	 * @param password
	 * @param confirm_password
	 */
	private StringBuffer validateRegisterForm(String username, String password, String confirm_password,String agree) {
		StringBuffer validate_message = new StringBuffer();
		if (username == null || "".equals(username)) {
			validate_message.append("用户名为空");
		}
		if (password == null || "".equals(password) || confirm_password == null || "".equals(confirm_password)) {
			validate_message.append("密码或者确认密码为空");
		}
		if (!password.equals(confirm_password)) {
			validate_message.append("两次密码输入不一致");
		}
		if(agree == null) {
			validate_message.append("请阅读《中国铁路客户服务中心网站服务条款》并勾选");
		}
		if (validate_message.length() > 0) {
			System.out.println(validate_message.toString());
			return validate_message;
		}
		return validate_message;
	}

	/**
	 * 
	 * <p>
	 * Title: checkUsername
	 * </p>
	 * <p>
	 * Description: 校验用户名是否可用的后台方法
	 * </p>
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private void checkUsername(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		if (username == null || "".equals(username)) {
			response.getWriter().println("用户名为空");
		}else {
			// 调用底层service，到数据库查询用户名，判断用户名是否可用
			UserService userService = UserService.getInstance();
			response.setContentType("text/plain;charset=utf-8");

			if (!userService.isExistsUserName(username)) {
				response.getWriter().println("可用");
			} else {
				response.getWriter().println("不可用");
			}
		}
	}
}
