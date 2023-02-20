package net.tencent.tickets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.tencent.tickets.entity.City;
import net.tencent.tickets.util.DBUtils_pool;

public class CityDao {
	
	private static final String QUERY_CITY_BY_PROVINCEID = "SELECT tickets_city.CITY_ID,tickets_city.CITY_NUM,tickets_city.CITY_NAME from tickets_city where tickets_city.CITY_FATHER=?";

	/**
	 * 获取指定省份的所有城市信息
	 */
	public List<City> queryCityByProvinceid(String provinceId)
	{
		List<City> cities = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_CITY_BY_PROVINCEID);
			stmt.setString(1,provinceId);
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
	
	private CityDao(){}
	
	private static CityDao cityDao;
	
	public static CityDao getInstance()
	{
		if(cityDao==null)
		{
			cityDao=new CityDao();
		}
		return cityDao;
	}

}
