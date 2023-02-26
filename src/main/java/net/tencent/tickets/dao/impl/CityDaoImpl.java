package net.tencent.tickets.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.tencent.tickets.dao.ifac.CityDaoIfac;
import net.tencent.tickets.entity.City;
import net.tencent.tickets.util.DBUtils_pool;

public class CityDaoImpl implements CityDaoIfac {
	
	/** 根据省份编号查询所有城市的sql语句 **/
	private static final String QUERY_CITY_BY_PROVINCENUM = 
			"SELECT CITY_ID,CITY_NUM,CITY_NAME from tickets_city where CITY_FATHER=?";
	

	/**
	 * (non-Javadoc)
	 * <p>Title: queryCityByProvinceid</p>
	 * <p>
	 *    Description:获取指定省份的所有城市信息
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param provinceNum
	 * @return
	 * @see net.tencent.tickets.dao.ifac.CityDaoIfac#queryCityByProvinceid(java.lang.String)
	 * @author xianxian
	 * @date 2023年2月25日下午9:10:45
	 * @version 1.0
	 */
	@Override
	public List<City> queryCityByProvinceid(String provinceNum) {
		List<City> cities = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_CITY_BY_PROVINCENUM);
			stmt.setString(1,provinceNum);
			rs=stmt.executeQuery();
			while(rs.next())
			{
				City c=new City();
				
				c.setCityNum(rs.getString("CITY_NUM"));
				c.setId(rs.getInt("CITY_ID"));
				c.setCityName(rs.getString("CITY_NAME"));
				
				cities.add(c);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}
		return cities;
	}
}
