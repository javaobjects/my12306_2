package net.tencent.tickets.servlet.other;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.tickets.entity.Province;

/**
 * 省份管理-Servlet
 */
@WebServlet("/ProvinceServlet")
public class ProvinceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.调用service方法，获取所有的省份信息
//		IProvinceService provinceService = ProvinceServiceImpl.getInstance();
//		List<Province>  provinceList = provinceService.selectProvinces();
		
		@SuppressWarnings("unchecked")
		List<Province>  provinceList = (List<Province>) new Province();
		
		//2.保存省份List集合
		request.getSession().setAttribute("provinceList", provinceList);
		
		//3.跳转到注册页面，并且显示所有的省份
		request.getRequestDispatcher("/UserRegistration.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
