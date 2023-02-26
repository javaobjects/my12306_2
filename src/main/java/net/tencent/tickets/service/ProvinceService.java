package net.tencent.tickets.service;

import java.util.List;

import net.tencent.tickets.dao.factory.LocationDaoFactory;
import net.tencent.tickets.dao.ifac.ProvinceDaoIfac;
import net.tencent.tickets.entity.Province;

public class ProvinceService {
	
//	private ProvinceDao provinceDao = ProvinceDao.getInstance();
	private ProvinceDaoIfac provinceDao = LocationDaoFactory.getProvinceDaoInstance();
	
	/**
	 * 
	 * <p>Title: getAllProvince</p>  
	 * <p>
	 *	Description: 
	 *	获取所有省份的方法
	 * </p> 
	 * @return
	 */
	public List<Province> getAllProvince() {
		return provinceDao.queryAllProvince();
	}

	private ProvinceService() {

	}

	public static ProvinceService provinceService;

	public static ProvinceService getInstance() {
		if (provinceService == null) {
			provinceService = new ProvinceService();
		}
		return provinceService;
	}
}
