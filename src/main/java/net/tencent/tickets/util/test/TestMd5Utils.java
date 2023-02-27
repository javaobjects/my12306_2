package net.tencent.tickets.util.test;

import net.tencent.tickets.util.Md5Utils;

public class TestMd5Utils {
	
	/**
	 * <p>Title: main</p>
	 * <p>
	 *    Description:
	 *    023年2月26日下午5:13:22 测试通过
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param args
	 * @author xianxian
	 * @date 2023年2月26日下午5:13:22
	 * @version 1.0
	 */
	public static void main(String[] args) {
		String passWord = "123456";
		Md5Utils md5Utils = new Md5Utils();
		System.out.println(passWord + " 经md5转换后为： " + md5Utils.md5(passWord));
	}
}
