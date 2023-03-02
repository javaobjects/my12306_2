package net.tencent.tickets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.tencent.tickets.entity.CertType;
import net.tencent.tickets.util.DBUtils_pool;

public class CertTypeDao {
	/** 根据id查询CertType**/
	private static final String QUERY_CERTTYPE_BY_ID = 
			"SELECT CERTTYPE_ID,CERTTYPE_CONTENT FROM tickets_certtype WHERE CERTTYPE_ID = ?";
	
	
	public CertType queryCeryTypeById(String certTypeId) {
		CertType certType = new CertType();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_CERTTYPE_BY_ID);
			stmt.setString(1, certTypeId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				
				certType.setId(Integer.parseInt(rs.getString("CERTTYPE_ID")));
				certType.setContent(rs.getString("CERTTYPE_CONTENT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}
		return certType;
	}
	
	
	//	 单例模式实现步骤：
//	 1.构造器私有
//	 2.提供私有的静态的当前类类型的变量
//	 3.提供一个公共的静态方法，返回刚才定义的变量，如果这个变量为null，那么给他赋值
	private CertTypeDao() {
	};

	private static CertTypeDao cerTypeDao;

	public static CertTypeDao getInstance() {
		if (cerTypeDao == null) {
			cerTypeDao = new CertTypeDao();
		}
		return cerTypeDao;
	}
}
