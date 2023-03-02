package net.tencent.tickets.service;

import java.util.List;

import net.tencent.tickets.dao.CityDao;
import net.tencent.tickets.entity.City;

public class CityService {
	
	//属性依赖cityDao
	private CityDao cityDao = CityDao.getInstance();
	
	/**
	 * 
	 * <p>Title: getCityByProvinceNum</p>  
	 * <p>
	 *	Description: 
	 *	获取指定省份的城市信息的业务方法
	 * </p> 
	 * @param provinceNum
	 * @return
	 */
	public List<City> getCityByProvinceNum(String provinceNum) {
		return cityDao.queryCityByProvinceNum(provinceNum);
	}
	
	/**
	 * <p>Title: queryCityByCityNum</p>
	 * <p>
	 *    Description:
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param cityNum
	 * @return
	 * @author xianxian
	 * @date 2023年3月2日下午6:08:03
	 * @version 1.0
	 */
	public City queryCityByCityNum(String cityNum) {
		return cityDao.queryCityByCityNum(cityNum);
	}
	
	private CityService(){}
	
	private static CityService cityService;
	
	public static CityService getInstance() {
		if (cityService == null) {
			cityService = new CityService();
		}
		return cityService;
	}

}
