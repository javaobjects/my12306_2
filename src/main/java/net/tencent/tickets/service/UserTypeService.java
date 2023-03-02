package net.tencent.tickets.service;

import net.tencent.tickets.dao.UserTypeDao;
import net.tencent.tickets.entity.UserType;

public class UserTypeService {

	//属性依赖cityDao
	private UserTypeDao userTypeDao = UserTypeDao.getInstance();

	public UserType queryUserTypeById(String userTypeId) {
		return userTypeDao.queryUserTypeById(userTypeId);

	}

	private UserTypeService() {}

	private static UserTypeService UserTypeService;

	public static UserTypeService getInstance() {
		if (UserTypeService == null) {
			UserTypeService = new UserTypeService();
		}
		return UserTypeService;
	}

}
