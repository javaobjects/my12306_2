package net.tencent.tickets.dao.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.tickets.dao.factory.LocationDaoFactory;
import net.tencent.tickets.dao.ifac.ProvinceDaoIfac;
import net.tencent.tickets.entity.Province;

@WebServlet("/TestProvinceDao")
public class TestProvinceDao extends HttpServlet {

	/**
	 * serialVersionUID
	*/
	private static final long serialVersionUID = 1L;

	private ProvinceDaoIfac provinceDao = new LocationDaoFactory().getProvinceDaoInstance();
	
	/**
	 * (non-Javadoc)
	 * <p>Title: doGet</p>
	 * <p>
	 *    Description:
	 *    2023年2月26日下午5:31:29 测试成功
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * @author xianxian
	 * @date 2023年2月26日下午5:31:29
	 * @version 1.0
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Province> provinces = provinceDao.queryAllProvince();
		for (Province province : provinces) {
			System.out.println("province.getId(): " + province.getId());
			System.out.println("province.getProvinceNum(): " + province.getProvinceNum());
			System.out.println("province.getProvinceName(): " + province.getProvinceName());
		}
	}
}
