package net.tencent.tickets.servlet.other;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.tickets.entity.Users;
import net.tencent.tickets.util.Md5Utils;

/**
 * 注册Servlet（单例模式）
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * doGet
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * doPost
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置请求的字符集编码格式
		//request.setCharacterEncoding("utf-8");
		
		//1.获取页面请求参数
		//登陆名
		String username = request.getParameter("username");
		//密码
		String password = request.getParameter("password");
		//真实姓名
		String realname = request.getParameter("realname");
		//性别
		String sex = request.getParameter("sex");//获取选中的性别
		//省份
		String province = request.getParameter("province");//获取选中的省份
		//城市
		String city = request.getParameter("city");//获取选中的城市
		//证件类型
		String cardType = request.getParameter("cardType");//获取选中的证件类型
		//证件号码
		String cardNo = request.getParameter("cardNo");
		//出生日期
		String birthday = request.getParameter("birthday");
		//旅客类型
		String passengerType = request.getParameter("passengerType");
		//备注
		String demo = request.getParameter("demo");
		//客户端ip
		String loginIp = request.getRemoteAddr();
		
		System.out.println(username + " " + Md5Utils.md5(password) + " " + realname + "  " + sex + "  " + province + " " + city + " " + cardType + " " +cardNo + " " + birthday + " " + passengerType + " " + demo);
		
		//2.将用户提交的参数封装到User对象中
//		Users user = new Users(0, username, Md5Utils.md5(password),
//				"2", realname, sex, Integer.parseInt(city), 
//				Integer.parseInt(cardType), cardNo, DateUtil.stringToUtilDate(birthday), 
//				Integer.parseInt(passengerType), demo, "1", loginIp, "");
		
		Users user = new Users();
		
		/*
		 * 3.调用service方法，完成注册
		 * 		1.创建用户[sys]
				create user my12306 identified by 123456;
				
				2.授权[sys]
				grant connect,resource to my12306;
				
				3.导入表结构db.sql[my12306]
				
				select u.*,rowid from tab_user u;--用户表
				select * from tab_province;--省份表
				select * from tab_city; --城市表
				select * from tab_certtype;-- 证件类型
				select * from tab_usertype;--旅客类型

		 */
//		IUserService userService = UserServiceImpl.getInstance();
//		boolean result = userService.register(user);
		boolean result = false;
		
		System.out.println("注册结果：" + result);
		
		//4.0 处理响应结果的乱码
		//response.setCharacterEncoding("utf-8");//设置响应的内容为utf-8的编码格式
		//response.setContentType("text/html;charset=utf-8");//告诉浏览器使用指定的编码解析响应内容  text/html 表示一个HTML文档   text/plain 纯文本   text/xml XML文档
		
		//4.1 响应结果
		PrintWriter writer = response.getWriter();
		writer.write("注册结果：" + result);
		writer.flush();
		writer.close();
	}
}
