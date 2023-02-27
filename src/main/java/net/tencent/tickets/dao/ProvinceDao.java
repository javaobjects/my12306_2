package net.tencent.tickets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.tencent.tickets.entity.Province;
import net.tencent.tickets.util.DBUtils_pool;

public class ProvinceDao {

	/** 查询所有省份的sql语句   ***/
	private static final String QUERY_ALL_PROVINCE = "SELECT PROVINCE_ID,PROVINCE_NUM,PROVINCE_NAME FROM tickets_province";
	
	
	/**
	 * (non-Javadoc)
	 * <p>Title: queryAllProvince</p>
	 * <p>
	 *    Description:查询所有省份的方法
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @return
	 * @see net.tencent.tickets.dao.ifac.ProvinceDaoIfac#queryAllProvince()
	 * @author xianxian
	 * @date 2023年2月26日下午12:21:35
	 * @version 1.0
	 */
	public List<Province> queryAllProvince() {
		List<Province> provinces=new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs=null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_ALL_PROVINCE);
			rs=stmt.executeQuery();
			while(rs.next())
			{
				Province p=new Province();
				p.setId(rs.getInt("PROVINCE_ID"));
				p.setProvinceNum(rs.getString("PROVINCE_NUM"));
				p.setProvinceName(rs.getString("PROVINCE_NAME"));
				
				provinces.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}
		return provinces;
	}
	
//	 单例模式实现步骤：
//	 1.构造器私有
//	 2.提供私有的静态的当前类类型的变量
//	 3.提供一个公共的静态方法，返回刚才定义的变量，如果这个变量为null，那么给他赋值
	
	private ProvinceDao() {};
	private static ProvinceDao provinceDao;
	public static ProvinceDao getInstance() {
		if(provinceDao == null) {
			provinceDao = new ProvinceDao();
		}
		return provinceDao;
	}
}
