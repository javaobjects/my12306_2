package net.tencent.my12306.service;

import java.util.List;

import net.tencent.my12306.dao.ProvinceDao;
import net.tencent.my12306.entity.Province;

public class ProvinceService {
	
	private ProvinceDao provinceDao=ProvinceDao.getInstance();
	
	/**
	 * 
	 * <p>Title: getAllProvince</p>  
	 * <p>
	 *	Description: 
	 *	获取所有省份的方法
	 * </p> 
	 * @return
	 */
	public List<Province> getAllProvince()
	{
		return provinceDao.queryAllProvince();
	}
	
	private ProvinceService()
	{
		
	}
	
	public static ProvinceService provinceService;
	
	public static ProvinceService getInstance()
	{
		if(provinceService==null)
		{
			provinceService=new ProvinceService();
		}
		return provinceService;
	}
}
