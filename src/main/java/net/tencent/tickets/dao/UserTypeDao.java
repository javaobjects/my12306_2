package net.tencent.tickets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.tencent.tickets.entity.UserType;
import net.tencent.tickets.util.DBUtils_pool;

public class UserTypeDao {
	
	/** 根据userTypeId 查询userType **/
	private static final String QUERY_USERTYPE_BY_ID = "SELECT USERTYPE_ID,USERTYPE_CONTENT FROM tickets_usertype WHERE USERTYPE_ID = ?";
	
	
	/**
	 * <p>Title: queryUserTypeById</p>
	 * <p>
	 *    Description:
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param userTypeId
	 * @return
	 * @author xianxian
	 * @date 2023年3月2日下午7:19:34
	 * @version 1.0
	 */
	public UserType queryUserTypeById(String userTypeId) {
		UserType userType = new UserType();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_USERTYPE_BY_ID);
			stmt.setString(1, userTypeId);
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				
				userType.setId(Integer.parseInt(rs.getString("USERTYPE_ID")));
				userType.setContent(rs.getString("USERTYPE_CONTENT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}
		return userType;
	}
	
	//	 单例模式实现步骤：
//	 1.构造器私有
//	 2.提供私有的静态的当前类类型的变量
//	 3.提供一个公共的静态方法，返回刚才定义的变量，如果这个变量为null，那么给他赋值
	private UserTypeDao() {};
	private static UserTypeDao userTypeDao;
	public static UserTypeDao getInstance() {
		if(userTypeDao == null) {
			userTypeDao = new UserTypeDao();
		}
		return userTypeDao;
	}


}
