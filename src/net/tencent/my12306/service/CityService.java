package net.tencent.my12306.service;

import java.util.List;

import net.tencent.my12306.dao.CityDao;
import net.tencent.my12306.entity.City;

public class CityService {
	
	//属性依赖cityDao
	private CityDao cityDao=CityDao.getInstance();
	
	/**
	 * 获取指定省份的城市信息的业务方法
	 */
	public List<City> getCityByProvinceid(String provinceid)
	{
		return cityDao.queryCityByProvinceid(provinceid);
	}
	
	
	
	private CityService(){}
	
	private static CityService cityService;
	
	public static CityService getInstance()
	{
		if(cityService==null)
		{
			cityService=new CityService();
		}
		return cityService;
	}

}
