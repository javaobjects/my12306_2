package net.tencent.tickets.dao.test;

import java.util.List;

import net.tencent.tickets.dao.factory.LocationDaoFactory;
import net.tencent.tickets.dao.ifac.CityDaoIfac;
import net.tencent.tickets.entity.City;

public class TestCityDao {
	
	private CityDaoIfac cityDao = LocationDaoFactory.getCityDaoInstance();
	
	
	public static void main(String[] args) {
		TestCityDao testCityDao = new TestCityDao();
		List<City> citys = testCityDao.cityDao.queryCityByProvinceid("130000");
		System.out.println(citys.size());
		for (City city : citys) {
			System.out.println("city.getId(): " + city.getId());
			System.out.println("city.getCityNum(): " + city.getCityNum());
			System.out.println("city.getCityName(): " + city.getCityName());
		}
	}
}
