package net.tencent.tickets.dao.ifac;

import java.util.List;

import net.tencent.tickets.entity.Users;

public interface UserDaoIfac {

	public abstract int addUser(Users user);
	
	public abstract boolean queryUsername(String username);
	
	public abstract Users queryUserByUsernameAndPassword(String username, String password);
	
	public abstract int updateUser(Users user);
	
	public abstract boolean find(Integer id, String password_old);
	
	public abstract void updatePassword(Integer id, String password_new);
	
	public abstract List<Users> queryUserByCondition(String username, int certtype,
			String cert, int usertype, char sex);
	
	public abstract void insertImage(Integer id, String fileName);
}
