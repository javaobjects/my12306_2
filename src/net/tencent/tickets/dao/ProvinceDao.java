package net.tencent.tickets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.tencent.tickets.entity.Province;
import net.tencent.tickets.util.DBUtils_pool;

public class ProvinceDao {
	
	private static final String QUERY_ALL_PROVINCE = "SELECT id,provinceid,province from tickets_2_province";

	/**
	 * 
	 * <p>Title: queryAllProvince</p>  
	 * <p>
	 *	Description: 
	 *	查询所有省份的方法
	 * </p> 
	 * @return
	 */
	public List<Province> queryAllProvince()
	{
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
				p.setId(rs.getInt("id"));
				p.setProvinceId(rs.getString("provinceid"));
				p.setProvinceName(rs.getString("province"));
				
				provinces.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}
		return provinces;
	}

	private ProvinceDao()
	{
		
	}
	
	private static ProvinceDao provinceDao;
	
	public static ProvinceDao getInstance()
	{
		if(provinceDao==null)
		{
			provinceDao=new ProvinceDao();
		}
		return provinceDao;
	}
	
}
