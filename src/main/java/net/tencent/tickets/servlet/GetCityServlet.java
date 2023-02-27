package net.tencent.tickets.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.tencent.tickets.dao.CityDao;
import net.tencent.tickets.entity.City;

/**
 * 根据省份编号获取城市列表Servlet
 */
@WebServlet("/GetCityServlet")
public class GetCityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 响应xml格式的字符串
	 */
	protected void doGet_xml(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取省份编号provinceId
		String provinceId = request.getParameter("provinceId");
		System.out.println("省份编号：" + provinceId);
		
		//2.调用service方法，获取城市列表
//		ICityService cityService = CityServiceImpl.getInstance();
//		List<City> cityList = cityService.selectCities(provinceId);
		
		List<City> cityList = null;
		
		/*
		 	<?xml version="1.0" encoding="UTF-8"?>
			<cities>
				<city>
					<id>138</id>
					<cityId>370100</cityId>
					<cityName>济南市</cityName>
				</city>
				<city>
					<id>139</id>
					<cityId>370200</cityId>
					<cityName>青岛市</cityName>
				</city>
				<city>
					<id>140</id>
					<cityId>370300</cityId>
					<cityName>淄博市</cityName>
				</city>
			</cities>
		 */
		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		xml.append("<cities>");
		for (City city : cityList) {
			xml.append("<city>");
				xml.append("<id>" + city.getId() + "</id>");
				xml.append("<cityId>" + city.getId() + "</cityId>");
				xml.append("<cityName>" + city.getCityName() + "</cityName>");
			xml.append("</city>");
		}
		xml.append("</cities>");
		
		System.out.println("xml格式的字符串：" + xml);
		
		//3.处理结果
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.write(xml.toString());
		writer.flush();
		writer.close();
	}

	/**
	 * 响应json格式的字符串 130000
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取省份编号provinceId
		String provinceId = request.getParameter("provinceId");
		System.out.println("Get 省份编号：" + provinceId);
		
		getCitysByProvinceId(provinceId, request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.获取省份编号provinceNum
		String provinceNum = request.getParameter("provinceNum");
		System.out.println("Post 省份编号：" + provinceNum);
		
		getCitysByProvinceId(provinceNum, request, response);
	}
	
	/**
	 * <p>Title: getCitysByProvinceId</p>
	 * <p>
	 *    Description:通过省份id获取城市
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param provinceId
	 * @param request
	 * @param response
	 * @author xianxian
	 * @date 2023年2月27日下午3:34:14
	 * @version 1.0
	 * @throws IOException 
	 */
	private void getCitysByProvinceId(String provinceNum,HttpServletRequest request, HttpServletResponse response) throws IOException {
		//2.调用service方法，获取城市列表
		CityDao cityDao = CityDao.getInstance();
		List<City> cityList = cityDao.queryCityByProvinceid(provinceNum);
		
		/*
			JSON格式字符串:
			[
				{"id":138;"cityId":"370100","cityName":"济南市"},
				{"id":139;"cityId":"370200","cityName":"青岛市"},
				{"id":140;"cityId":"370300","cityName":"淄博市"},
			]
			
			[]表示一个数组，{}表示一个对象
		 */
		JSONArray JsonArray = JSONArray.fromObject(cityList);
		System.out.println("json格式的字符串：" + JsonArray.toString());
		
		//3.处理结果
		response.setContentType("application/json;charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.write(JsonArray.toString());
		writer.flush();
		writer.close();
	}
	
}
