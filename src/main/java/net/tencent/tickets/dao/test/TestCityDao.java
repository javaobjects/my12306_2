package net.tencent.tickets.dao.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tencent.tickets.dao.factory.LocationDaoFactory;
import net.tencent.tickets.dao.ifac.CityDaoIfac;
import net.tencent.tickets.entity.City;

@WebServlet("/TestCityDao")
public class TestCityDao extends HttpServlet{
	
	/**
	 * serialVersionUID
	*/
	private static final long serialVersionUID = 1L;
	
	
	private CityDaoIfac cityDao = LocationDaoFactory.getCityDaoInstance();
	
	/**
	 * (non-Javadoc)
	 * <p>Title: doGet</p>
	 * <p>
	 *    Description:
	 *    2023年2月26日下午5:31:51 测试成功
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * @author xianxian
	 * @date 2023年2月26日下午5:31:51
	 * @version 1.0
	 * @return 
	 */
//	protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		TestCityDao testCityDao = new TestCityDao();
//		List<City> citys = testCityDao.cityDao.queryCityByProvinceid("130000");
		
		
//		List<City> citys = testCityDao.cityDao.queryCityByProvinceid("130000");
//		System.out.println(citys.size());
//		for (City city : citys) {
//			System.out.println("city.getId(): " + city.getId());
//			System.out.println("city.getCityNum(): " + city.getCityNum());
//			System.out.println("city.getCityName(): " + city.getCityName());
//		}
//	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
}
