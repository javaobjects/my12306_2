package net.tencent.tickets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.tencent.tickets.entity.City;
import net.tencent.tickets.entity.Province;
import net.tencent.tickets.util.DBUtils_pool;

public class CityDao {
	
	/** 根据省份编号查询所有城市的sql语句 **/
	private static final String QUERY_CITY_BY_PROVINCENUM = 
			"SELECT CITY_ID,CITY_NUM,CITY_NAME,CITY_FATHER from tickets_city where CITY_FATHER=?";
	
	
	
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
	public List<City> queryCityByProvinceid(String provinceNum) {
		List<City> cities = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_CITY_BY_PROVINCENUM);
			stmt.setString(1, provinceNum);
			rs = stmt.executeQuery();
			while (rs.next()) {
				City c = new City();

				c.setCityNum(rs.getString("CITY_NUM"));
				c.setId(rs.getInt("CITY_ID"));
				c.setCityName(rs.getString("CITY_NAME"));
				c.setProvince(new Province(null,rs.getString("CITY_FATHER"),null));

				cities.add(c);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}
		return cities;
	}

//	 单例模式实现步骤：
//	 1.构造器私有
//	 2.提供私有的静态的当前类类型的变量
//	 3.提供一个公共的静态方法，返回刚才定义的变量，如果这个变量为null，那么给他赋值
	private CityDao() {};
	private static CityDao cityDao;
	public static CityDao getInstance() {
		if(cityDao == null) {
			cityDao = new CityDao();
		}
		return cityDao;
	}
}
