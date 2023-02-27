package net.tencent.tickets.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 自定义过滤器---统一设置编码格式：（过滤指定的请求）
 * 		1.自定义类实现javax.servlet.Filter接口
 * 
 * 		2.实现Filter接口中的doFilter() 方法
 * 
 *      3.注册过滤器
 *      	方式一：【注解方式】在类定义处配置
 *      		
 *      		@WebFilter("/SetCharsetFilter")
				public class SetCharsetFilter implements Filter {}
				
				
			方式二：【非注解方式】在web.xml中配置
				
			   <filter>
				  	<filter-name>SetCharsetFilter</filter-name>
				  	<filter-class>com.neuedu.filter.SetCharsetFilter</filter-class>
			   </filter>
			   <filter-mapping>
			  		<filter-name>SetCharsetFilter</filter-name>
			  		<url-pattern>/*</url-pattern>
			   </filter-mapping>
 */
//@WebFilter("/*")//匹配过滤路径
public class SetCharsetFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//System.out.println("SetCharsetFilter.......初始化");
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("SetCharsetFilter.............过滤开始");
		
		//设置request请求的字符集编码格式
		request.setCharacterEncoding("utf-8");
		
		//设置response响应的字符集编码格式
		response.setCharacterEncoding("utf-8");//设置响应的内容为utf-8的编码格式
	    response.setContentType("text/html;charset=utf-8");//告诉浏览器使用指定的编码解析响应内容  text/html 表示一个HTML文档   text/plain 纯文本   text/xml XML文档
	
	    //放行-------------继续执行registerServlet
	    chain.doFilter(request, response);
	    
	   // System.out.println("SetCharsetFilter.............过滤结束");
	    
	}

	@Override
	public void destroy() {
		//System.out.println("SetCharsetFilter.......销毁");
		
	}


}
