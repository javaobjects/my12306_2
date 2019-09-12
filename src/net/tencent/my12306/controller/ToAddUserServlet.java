package net.tencent.my12306.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tencent.my12306.entity.Users;
import net.tencent.my12306.service.CityService;
import net.tencent.my12306.service.ProvinceService;
import net.tencent.my12306.service.UserService;

/**
 * Servlet implementation class ToAddUserServlet
 */
@WebServlet("/ToAddUserServlet")
public class ToAddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/**
		 * 1. 先拿用户信息
		 * 2. 跳转新增用户页面
		 * 3. 借助session，拿username和password，然后访问数据库获取用户的完整信息
		 */
//		HttpSession session=request.getSession();
//		Users user = (Users)session.getAttribute("user");
//		
//		Users result = UserService.getInstance().login(user.getUsername(), user.getPassword());
//		
//		
//		
//		//2.把用户信息传给页面，并跳转到目标页面
//		request.setAttribute("userinfo", result);
//		//获取所有省份并传给页面
//		request.setAttribute("provinces", ProvinceService.getInstance().getAllProvince());
//		//获取当前用户所在省份的所有城市信息并传给页面
//		request.setAttribute("cities", CityService.getInstance().getCityByProvinceid(result.getCity().getProvince().getProvinceId()));
//		
//		request.getRequestDispatcher("/admin/userinfo_add.jsp").forward(request, response);
	}
}
