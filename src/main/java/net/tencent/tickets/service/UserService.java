package net.tencent.tickets.service;

import java.util.List;

import net.tencent.tickets.dao.UsersDao;
import net.tencent.tickets.entity.Users;

public class UserService {
	
	/**
	 * 属性依赖UserDao
	 */
	private UsersDao userDao = UsersDao.getInstance();
	
	
	
	
	/**
	 * <p>Title: updatePassword</p>  
	 * <p>
	 *	Description: 
	 * </p> 
	 * @param id
	 * @param password_old
	 * @param password_new
	 * @return
	 */
	public boolean updatePassword(Integer id,String password_old,String password_new)
	{
		boolean tmp = false;// 默认更新失败
		if (userDao.find(id, password_old)) {
			userDao.updatePassword(id, password_new);
			tmp = true;
		}
		return tmp;
	}
	
	/**
	 * 
	 * <p>Title: updateUser</p>  
	 * <p>
	 *	Description: 
	 * 更新用户信息的方法
	 * </p> 
	 * @param user
	 * @return
	 */
	public boolean updateUser(Users user)
	{
		return userDao.updateUser(user) > 0;
	}

	
	/**
	 * 注册方法
	 */
	public boolean register(Users user)
	{
		return userDao.addUser(user) > 0;
	}
	
	/**
	 * 
	 * <p>Title: isExistsUserName</p>  
	 * <p>
	 *	Description: 
	 *	判断用户名是否已经存在
	 * </p> 
	 * @param username
	 * @return
	 */
	public boolean isExistsUserName(String username) {
		return userDao.queryUsername(username);
	}
	
	/**
	 * 
	 * <p>Title: login</p>  
	 * <p>
	 *	Description: 
	 *	登录方法
	 * </p> 
	 * @param username
	 * @param password
	 * @return
	 */
	public Users login(String username,String password) {
		return userDao.queryUserByUsernameAndPassword(username,password);
	}
	
	
	public List<Users> getUserByCondition(String username, int certtype,
			String cert, int usertype, char sex) {
		
		return userDao.queryUserByCondition(username,certtype,cert,usertype,sex);
	}
	public void saveImage(Integer id, String fileName) {
		userDao.insertImage(id,fileName);
	}
	
	
	
	
	private UserService() {

	}

	public static UserService userService;

	public static UserService getInstance() {
		if (userService == null) {
			userService = new UserService();
		}
		return userService;
	}

}
