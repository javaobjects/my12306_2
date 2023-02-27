package net.tencent.tickets.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tencent.tickets.entity.Users;
/**
 * 自定义过滤器---权限控制：（过滤指定的请求）
 * 
 * 		1.用户未登录
 * 			直接跳转回Login.jsp
 * 
 *      2.用户已登录
 *      	如果用户为普通用户，只允许访问普通用户的界面
 *      	如果用户为管理员，允许访问普通用户 & 管理员的界面
 *
 */
@WebFilter(urlPatterns={"/Admin/*","/User/*"})
public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		//父类 -> 子类
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		
		//获取登陆的用户信息
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("user");
		
		//1.用户未登录，直接跳转回Login.jsp
		if(user == null || user.getId() <= 0)
		{
			System.out.println("您好，未登录哦！！");
			response.sendRedirect(request.getContextPath() + "/Login.jsp");
		}
		//2.用户已登录
		else
		{
			System.out.println("恭喜你，登陆成功过了！！");
			//如果用户为普通用户，只允许访问普通用户的界面
			//如果用户为管理员，允许访问普通用户 & 管理员的界面
			
			//只有普通用户，尝试访问管理员界面时，拦截，其他均可放行  (1、管理员 2、普通用户)
			String url = request.getRequestURI();
			if("2".equals(user.getUserRule()) && url.contains("Admin"))
			{
				System.out.println("您好，您是普通用户，不具备访问管理员界面的权限！！");
				response.sendRedirect(request.getContextPath() + "/ExitServlet");
			}
			else
			{ 
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void destroy() {}

}
