package net.tencent.tickets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.tencent.tickets.entity.CertType;
import net.tencent.tickets.entity.City;
import net.tencent.tickets.entity.Province;
import net.tencent.tickets.entity.UserType;
import net.tencent.tickets.entity.Users;
import net.tencent.tickets.util.DBUtils_pool;
import net.tencent.tickets.util.Md5Utils;

public class UsersDao {

	private static final String ADD_USER = "INSERT INTO tickets_user(tickets_user.USER_ID,tickets_user.USER_NAME,tickets_user.USER_PASSWORD,tickets_user.USER_RULE,\r\n"
			+ "tickets_user.USER_REAL_NAME,tickets_user.USER_SEX,tickets_user.USER_CITY_ID,tickets_user.USER_CERTTYPE_ID,\r\n"
			+ "tickets_user.USER_CERT,tickets_user.USER_BIRTHDAY,tickets_user.USER_USERTYPE_ID,tickets_user.USER_CONTENT,tickets_user.USER_STATUS,tickets_user.USER_LOGIN_IP,tickets_user.USER_IMAGE_PATH)\r\n"
			+ "values (NULL,?,?,?,?,?,?,?,?,?,?,?,'1',?,'')";
	private static final String QUERY_USERNAME = "SELECT COUNT(1) AS COL_COUNT FROM tickets_user WHERE tickets_user.USER_NAME = ?";
	private static final String QUERY_USER_BY_USERNAME_AND_PASSWORD = "SELECT\r\n"
			+ "	tickets_user.USER_ID,\r\n"
			+ "	tickets_user.USER_NAME,\r\n"
			+ "	tickets_user.USER_PASSWORD,\r\n"
			+ "	tickets_user.USER_RULE,\r\n"
			+ "	tickets_user.USER_REAL_NAME,\r\n"
			+ "	tickets_user.USER_SEX,\r\n"
			+ "	tickets_user.USER_CITY_ID,\r\n"
			+ "	tickets_user.USER_CERTTYPE_ID,\r\n"
			+ "	tickets_user.USER_CERT,\r\n"
			+ "	tickets_user.USER_BIRTHDAY,\r\n"
			+ "	tickets_user.USER_USERTYPE_ID,\r\n"
			+ "	tickets_user.USER_CONTENT,\r\n"
			+ "	tickets_user.USER_STATUS,\r\n"
			+ "	tickets_user.USER_LOGIN_IP,\r\n"
			+ "	tickets_user.USER_IMAGE_PATH,\r\n"
			+ "	tickets_city.CITY_ID,\r\n"
			+ "	tickets_city.CITY_NUM,\r\n"
			+ "	tickets_city.CITY_NAME,\r\n"
			+ "	tickets_city.CITY_FATHER,\r\n"
			+ "	tickets_province.PROVINCE_ID,\r\n"
			+ "	tickets_province.PROVINCE_NUM,\r\n"
			+ "	tickets_province.PROVINCE_NAME,\r\n"
			+ "	tickets_certtype.CERTTYPE_CONTENT,\r\n"
			+ "	tickets_usertype.USERTYPE_CONTENT\r\n"
			+ "FROM\r\n"
			+ "	tickets_user,\r\n"
			+ "	tickets_city,\r\n"
			+ "	tickets_province,\r\n"
			+ "	tickets_certtype,\r\n"
			+ "	tickets_usertype\r\n"
			+ "WHERE\r\n"
			+ "	tickets_user.USER_CITY_ID = tickets_city.CITY_ID \r\n"
			+ "	AND tickets_user.USER_USERTYPE_ID = tickets_usertype.USERTYPE_ID\r\n"
			+ "	AND tickets_user.USER_CERTTYPE_ID = tickets_certtype.CERTTYPE_ID\r\n"
			+ "	AND tickets_city.CITY_FATHER = tickets_province.PROVINCE_NUM\r\n"
			+ "	AND tickets_user.USER_NAME = ? "
			+ "	AND tickets_user.USER_PASSWORD = ? ";
	
	public int addUser(Users user) {
		int rows = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(ADD_USER);
			
			stmt.setString(1, user.getUserName());//用户名
			stmt.setString(2, Md5Utils.md5(user.getUserPassword()));//密码
			stmt.setString(3, user.getUserRule());//权限
			stmt.setString(4, user.getUserRealName());//真实姓名
			stmt.setString(5, user.getUserSex() + "");//性别
			
			stmt.setInt(6, user.getCity().getId());//城市 
			stmt.setString(7, user.getCertType().getId().toString());//证件类型
			stmt.setString(8, user.getUserCert());//证件号码
			stmt.setDate(9, new java.sql.Date(user.getUserBirthday().getTime()));//生日
			stmt.setInt(10, user.getUserType().getId());//旅客类型
			stmt.setString(11, user.getUserContent());//备注
			stmt.setString(12, user.getUserLoginIp());//Ip地址
			
			rows=stmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, null);
		}
		return rows;
	}

	/**
	 * 查询用户名是否存在
	 * @param username
	 * @return
	 */
	public boolean queryUsername(String username) {
	Boolean result = false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_USERNAME);
			stmt.setString(1,username);

			rs = stmt.executeQuery();
			if(rs.next()) {
				int tmp = rs.getInt("col_count");
				if(tmp > 0) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, null);
		}
		return result;
	}

	/**
	 * 根据用户名和密码查询用户信息
	 * @param username
	 * @param password
	 * @return
	 */
	public Users queryUserByUsernameAndPassword(String username, String password) {

		Users user = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs=null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(QUERY_USER_BY_USERNAME_AND_PASSWORD);
			stmt.setString(1,username);
			stmt.setString(2,password);
			rs = stmt.executeQuery();
			if(rs.next())
			{
				user = new Users();
				/*
				 * id,username,password,rule,realname,sex,city,cert_type"
			+ ",cert,birthday,user_type,content,status,login_ip,image_path
				 */
				user.setId(rs.getInt("USER_ID"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setUserPassword(rs.getString("USER_PASSWORD"));
				user.setUserRule(rs.getString("USER_RULE"));
				user.setUserRealName(rs.getString("USER_REAL_NAME"));
				//补全另外10个数据
				user.setUserSex(rs.getString("USER_SEX").charAt(0));
				
				
				user.setCity(new City(rs.getInt("CITY_ID"),rs.getString("CITY_NUM"), rs.getString("CITY_NAME"), 
						new Province(rs.getInt("PROVINCE_ID"), rs.getString("PROVINCE_NUM"), rs.getString("PROVINCE_NAME"))));
				
				
				
				user.setCertType(new CertType(rs.getInt("USER_CERTTYPE_ID"), rs.getString("CERTTYPE_CONTENT")));
				user.setUserCert(rs.getString("USER_CERT"));
				user.setUserBirthday(rs.getDate("USER_BIRTHDAY"));
				user.setUserType(new UserType(rs.getInt("USER_USERTYPE_ID"),rs.getString("USERTYPE_CONTENT")));
				user.setUserContent(rs.getString("USER_CONTENT"));
				user.setUserStatus(rs.getString("USER_STATUS").charAt(0));
				user.setUserLoginIp(rs.getString("USER_LOGIN_IP"));
				user.setUserImagePath(rs.getString("USER_IMAGE_PATH"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}
		
		return user;
	}

	
	
	
	public int updateUser(Users user) {
		int rows = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			//这些待更新的数据：真实姓名 性 别   城市 证件类型 证件号码 出生日期 旅客类型 备注
			String update_user_sql="UPDATE tickets_user \r\n"
					+ "SET tickets_user.USER_REAL_NAME =?,\r\n"
					+ "tickets_user.USER_SEX =?,\r\n"
					+ "tickets_user.USER_CITY_ID =?,\r\n"
					+ "tickets_user.USER_CERTTYPE_ID =?,\r\n"
					+ "tickets_user.USER_CERT =?,\r\n"
					+ "tickets_user.USER_BIRTHDAY =?,\r\n"
					+ "tickets_user.USER_USERTYPE_ID =?,\r\n"
					+ "tickets_user.USER_CONTENT =? \r\n"
					+ "WHERE\r\n"
					+ "	tickets_user.USER_ID =?";
			
			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(update_user_sql);
			
			stmt.setString(1, user.getUserRealName());
			stmt.setString(2, user.getUserSex() + "");
			stmt.setInt(3, user.getCity().getId());
			stmt.setInt(4,user.getCertType().getId());
			stmt.setString(5,user.getUserCert());
			stmt.setDate(6, new java.sql.Date(user.getUserBirthday().getTime()));
			stmt.setInt(7,user.getUserType().getId());
			stmt.setString(8,user.getUserContent());
			stmt.setInt(9, user.getId());
			
			rows = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtils_pool.release(conn, stmt, null);
		}
		return rows;
	}
	/**
	 * 根据id和旧的密码查询数据库，看能否找到用户，找到则旧密码输入正确
	 * @param id
	 * @param password_old
	 * @return
	 */
	public boolean find(Integer id, String password_old) {
		Boolean result=false;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs=null;
		try {

			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM	tickets_user WHERE USER_ID =? AND USER_PASSWORD =?");
			stmt.setInt(1,id);
			stmt.setString(2, password_old);
			rs=stmt.executeQuery();
			if(rs.next())
			{
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}

		return result;
	}
	
	public Integer updatePassword(Integer id, String password_new) {
		Connection conn = null;
		PreparedStatement stmt = null;
		int rows = 0;
		
		try {
			//这些待更新的数据：真实姓名 性 别   城市 证件类型 证件号码 出生日期 旅客类型 备注
			String update_user_sql="UPDATE tickets_user SET USER_PASSWORD =? WHERE	USER_ID =?";
			conn = DBUtils_pool.getConnection();
			stmt = conn.prepareStatement(update_user_sql);
			stmt.setString(1,password_new);
			stmt.setInt(2,id);
			
			rows = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtils_pool.release(conn, stmt, null);
		}
		
		return rows;
	}

	/**
	 * 根据给定条件查询用户信息：组合查询
	 * @param username
	 * @param certtype
	 * @param cert
	 * @param usertype
	 * @param sex
	 * @return
	 */
	public List<Users> queryUserByCondition(String username, int certtype, String cert, int usertype, char sex) {
		List<Users> users = new ArrayList<>();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {

			conn = DBUtils_pool.getConnection();

//			StringBuffer query_user = new StringBuffer("select u.id,u.username,u.sex,u.cert,"
//					+ "ct.id ct_id,ct.content ct_content," + "ut.id ut_id,ut.content ut_content "
//					+ "from tickets_user u,tickets_usertype ut,tickets_certtype ct "
//					+ "where ut.id=u.user_type and ct.id=u.cert_type and sex='" + sex + "' and cert_type=" + certtype
//					+ " and user_type=" + usertype);
			
			
			StringBuffer query_user = new StringBuffer("SELECT\r\n"
					+ "	u.USER_ID,\r\n"
					+ "	u.USER_NAME,\r\n"
					+ "	u.USER_SEX,\r\n"
					+ "	u.USER_CERTTYPE_ID,\r\n"
					+ "	u.USER_CERT,\r\n"
					+ "	ct.CERTTYPE_CONTENT,\r\n"
					+ "	u.USER_USERTYPE_ID,\r\n"
					+ "	ut.USERTYPE_CONTENT \r\n"
					+ "FROM\r\n"
					+ "	tickets_user u,\r\n"
					+ "	tickets_certtype ct,\r\n"
					+ "	tickets_usertype ut \r\n"
					+ "WHERE\r\n"
					+ "	u.USER_CERTTYPE_ID = ct.CERTTYPE_ID \r\n"
					+ "	AND u.USER_USERTYPE_ID = ut.USERTYPE_ID \r\n"
					+ "	AND u.USER_SEX = " + sex + "\r\n"
					+ "	AND u.USER_CERTTYPE_ID = " + certtype + "\r\n"
					+ "	AND u.USER_USERTYPE_ID = " + usertype);
			
			
			
			
			if (username != null && !"".equals(username.trim())) {
				query_user.append(" AND USER_NAME like '%" + username.trim() + "%'");
			}
			if (cert != null && !"".equals(cert.trim())) {
				query_user.append(" AND USER_CERT = '" + cert + "'");
			}

			stmt = conn.prepareStatement(query_user.toString());
			
			rs = stmt.executeQuery();
			Users user = null;
			while (rs.next()) {
				user = new Users();

				user.setId(rs.getInt("USER_ID"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setUserSex(rs.getString("USER_SEX").charAt(0));
				user.setUserCert(rs.getString("USER_CERT"));
				user.setCertType(new CertType(rs.getInt("USER_CERTTYPE_ID"), rs.getString("CERTTYPE_CONTENT")));
				user.setUserType(new UserType(rs.getInt("USER_USERTYPE_ID"), rs.getString("USERTYPE_CONTENT")));

				users.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils_pool.release(conn, stmt, rs);
		}

		return users;
		}

	
	
	public Integer insertImage(Integer id, String fileName) {
		Connection conn = null;
		PreparedStatement stmt = null;
		int rows = 0;
		
		try {
			//这些待更新的数据：真实姓名 性 别   城市 证件类型 证件号码 出生日期 旅客类型 备注
			String update_user_sql="UPDATE tickets_user SET USER_IMAGE_PATH =? WHERE USER_ID =?";
			conn=DBUtils_pool.getConnection();
			stmt=conn.prepareStatement(update_user_sql);
			stmt.setString(1, fileName);
			stmt.setInt(2, id);
			
			rows = stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtils_pool.release(conn, stmt, null);
		}
		return rows;
	}
	
//	 单例模式实现步骤：
//	 1.构造器私有
//	 2.提供私有的静态的当前类类型的变量
//	 3.提供一个公共的静态方法，返回刚才定义的变量，如果这个变量为null，那么给他赋值
	private UsersDao() {

	}

	public static UsersDao userDao;

	public static UsersDao getInstance() {
		if (userDao == null) {
			userDao = new UsersDao();
		}
		return userDao;
	}
	
}
