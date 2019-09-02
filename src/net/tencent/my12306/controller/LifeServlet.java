package net.tencent.my12306.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeServlet
 */
@WebServlet("/LifeServlet")
public class LifeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LifeServlet() {
    	System.out.println("构造方法");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()方法。。。");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()方法。。。");
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.service(request, response);
//		String method = request.getMethod();
//		System.out.println("method:" + method);
//		
//		if("GET".equals(method)) {
//			doGet(request, response);
//		}else {
//			doPost(request, response);
//		}
		
		System.out.println("service()方法。。。。");
		
	}

	@Override
	public void destroy() {
//		super.destroy();
		System.out.println("destory()方法。。。。。111");
		for (int i = 0; i < 100; i++) {
			System.out.println(i);
		}
		System.out.println("destory()方法。。。。。222");
	}

	@Override
	public void init() throws ServletException {
//		super.init();
		System.out.println("init()方法。。。。。");
	}
	
	
}
