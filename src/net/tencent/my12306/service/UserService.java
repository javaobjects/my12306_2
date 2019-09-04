package net.tencent.my12306.service;

import net.tencent.my12306.dao.UsersDao;
import net.tencent.my12306.entity.Users;

public class UserService {
	
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
		return userDao.updateUser(user)>0;
	}
	/**
	 * 属性依赖UserDao
	 */
	private UsersDao userDao=UsersDao.getInstance();
	
	/**
	 * 注册方法
	 */
	public boolean register(Users user)
	{
		return userDao.addUser(user)>0;
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
	
	private UserService()
	{
		
	}
	
	public static UserService userService;
	
	public static UserService getInstance()
	{
		if(userService==null)
		{
			userService=new UserService();
		}
		return userService;
	}
}
