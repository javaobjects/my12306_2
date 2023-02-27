package net.tencent.tickets.util.test;

import java.sql.Connection;

import net.tencent.tickets.util.other.DBUtil;

public class TestDBUtil {

	public static void main(String[] args) {
		Connection conn = DBUtil.getConnection();
		System.out.println(conn.toString());
	}

}
