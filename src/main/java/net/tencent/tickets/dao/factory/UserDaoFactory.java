package net.tencent.tickets.dao.factory;

import net.tencent.tickets.dao.ifac.UserDaoIfac;
import net.tencent.tickets.dao.impl.UserDaoImpl;

public class UserDaoFactory {
	public static UserDaoIfac getUserDaoInstance() {
		return new UserDaoImpl();
	}
}
