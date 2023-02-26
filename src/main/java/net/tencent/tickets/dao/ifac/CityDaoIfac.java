package net.tencent.tickets.dao.ifac;

import java.util.List;

import net.tencent.tickets.entity.City;

public interface CityDaoIfac {

	/**
	 * <p>Title: queryCityByProvinceid</p>
	 * <p>
	 *    Description:根据省份编号查询该省所有城市
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param provinceNum
	 * @return
	 * @author xianxian
	 * @date 2023年2月25日下午6:24:41
	 * @version 1.0
	 */
	public abstract List<City> queryCityByProvinceid(String provinceNum);
}
