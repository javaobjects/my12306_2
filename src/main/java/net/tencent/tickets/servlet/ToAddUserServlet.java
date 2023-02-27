package net.tencent.tickets.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.tickets.service.ProvinceService;

/**
 * Servlet implementation class ToAddUserServlet
 */
@WebServlet("/ToAddUserServlet")
public class ToAddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取所有省份并传给页面
		request.setAttribute("provinces", ProvinceService.getInstance().getAllProvince());
		request.getRequestDispatcher("/admin/userinfo_add.jsp").forward(request, response);
	}
}
