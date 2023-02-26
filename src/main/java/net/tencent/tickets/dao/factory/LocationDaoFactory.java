package net.tencent.tickets.dao.factory;
/**
 * <p>Title: LocationFactory</p>
 * <p>
 *    Description:获城城市或省份的工厂dao
 * </p>
 * @author xianxian
 * @date 2023年2月25日下午6:45:22
 */

import net.tencent.tickets.dao.ifac.CityDaoIfac;
import net.tencent.tickets.dao.ifac.ProvinceDaoIfac;
import net.tencent.tickets.dao.impl.CityDaoImpl;
import net.tencent.tickets.dao.impl.ProvinceDaoImpl;

public class LocationDaoFactory {

	public static CityDaoIfac getCityDaoInstance() {
		return new CityDaoImpl();
	}
	
	public static ProvinceDaoIfac getProvinceDaoInstance() {
		return new ProvinceDaoImpl();
	}
}
