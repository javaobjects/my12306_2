package net.tencent.tickets.service;

import java.util.List;

import net.tencent.tickets.dao.CityDao;
import net.tencent.tickets.entity.City;

public class CityService {
	
	//属性依赖cityDao
	private CityDao cityDao = CityDao.getInstance();
	
	/**
	 * 
	 * <p>Title: getCityByProvinceid</p>  
	 * <p>
	 *	Description: 
	 *	获取指定省份的城市信息的业务方法
	 * </p> 
	 * @param provinceid
	 * @return
	 */
	public List<City> getCityByProvinceid(String provinceid) {
		return cityDao.queryCityByProvinceid(provinceid);
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
